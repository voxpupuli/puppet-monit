require 'spec_helper'

describe 'monit' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }

        case facts[:os]['family']
        when 'Debian'
          config_file = '/etc/monit/monitrc'
          config_dir  = '/etc/monit/conf.d'
          monit_version = '5'
          default_file_content = 'START=yes'
          service_hasstatus    = true
        when 'RedHat'
          config_dir        = '/etc/monit.d'
          service_hasstatus = true
          monit_version     = '5'
          config_file = case facts[:os]['name']
                        when 'Amazon'
                          '/etc/monit.conf'
                        else
                          '/etc/monitrc'
                        end
        else
          raise 'unsupported osfamily detected'
        end

        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_class('monit') }

        it do
          is_expected.to contain_package('monit').with('ensure' => 'present',
                                                       'provider' => nil)
        end

        it do
          is_expected.to contain_file('/var/lib/monit').with('ensure' => 'directory',
                                                             'owner'  => 'root',
                                                             'group'  => 'root',
                                                             'mode'   => '0755')
        end

        it do
          is_expected.to contain_file('monit_config_dir').with('ensure'  => 'directory',
                                                               'path'    => config_dir,
                                                               'owner'   => 'root',
                                                               'group'   => 'root',
                                                               'mode'    => '0755',
                                                               'purge'   => false,
                                                               'recurse' => false,
                                                               'require' => 'Package[monit]')
        end

        it do
          is_expected.to contain_file('monit_config').with('ensure'  => 'file',
                                                           'path'    => config_file,
                                                           'owner'   => 'root',
                                                           'group'   => 'root',
                                                           'mode'    => '0600',
                                                           'require' => 'Package[monit]')
        end

        monit_config_fixture = if monit_version == '4'
                                 File.read(File.join('spec', 'fixtures', "monitrc.4.#{facts[:os]['family']}"))
                               else
                                 File.read(File.join('spec', 'fixtures', "monitrc.#{facts[:os]['family']}"))
                               end

        it { is_expected.to contain_file('monit_config').with_content(monit_config_fixture) }

        if facts[:os]['family'] == 'Debian'
          it do
            is_expected.to contain_file('/etc/default/monit').with('notify' => 'Service[monit]').
              with_content(%r{^#{default_file_content}$})
          end
        else
          it { is_expected.not_to contain_file('/etc/default/monit') }
        end

        it do
          is_expected.to contain_service('monit').with('ensure'     => 'running',
                                                       'name'       => 'monit',
                                                       'enable'     => true,
                                                       'hasrestart' => true,
                                                       'hasstatus'  => service_hasstatus,
                                                       'subscribe'  => [
                                                         'File[/var/lib/monit]',
                                                         'File[monit_config_dir]',
                                                         'File[monit_config]',
                                                       ])
        end

        describe 'parameter functionality' do
          context 'when check_interval is set to valid integer <242>' do
            let(:params) { { check_interval: 242 } }

            it { is_expected.to contain_file('monit_config').with_content(%r{^set daemon 242$}) }
          end

          context 'when httpd is set to valid bool <true>' do
            let(:params) { { httpd: true } }

            content = <<~END
              set httpd port 2812 and
                 use address localhost
                 allow 0.0.0.0/0.0.0.0
                 allow admin:monit
            END
            it { is_expected.to contain_file('monit_config').with_content(%r{#{content}}) }
          end

          context 'when httpd_* params are set to valid values' do
            let(:params) do
              {
                httpd:          true,
                httpd_port:     2420,
                httpd_address:  'otherhost',
                httpd_allow:    '0.0.0.0/0.0.0.0',
                httpd_user:     'tester',
                httpd_password: 'Passw0rd',
              }
            end

            content = <<~END
              set httpd port 2420 and
                 use address otherhost
                 allow 0.0.0.0/0.0.0.0
                 allow tester:Passw0rd
            END
            it { is_expected.to contain_file('monit_config').with_content(%r{#{content}}) }
          end

          context 'when httpd_password parameter consists special charaters' do
            let(:params) do
              {
                httpd:          true,
                httpd_port:     2420,
                httpd_address:  'otherhost',
                httpd_allow:    '0.0.0.0/0.0.0.0',
                httpd_user:     'tester',
                httpd_password: 'Pa$$w0rd',
              }
            end

            it { is_expected.to contain_file('monit_config').with_content(%r{^\s+allow tester:"Pa\$\$w0rd"$}) }
          end

          context 'when manage_firewall and http are set to valid bool <true>' do
            let(:pre_condition) { ['include ::firewall'] }
            let(:facts) { facts.merge(iptables_persistent_version: '0.5.3ubuntu2') }
            let(:params) do
              {
                manage_firewall: true,
                httpd: true,
              }
            end

            it do
              is_expected.to contain_firewall('2812 allow Monit inbound traffic').with('jump' => 'accept',
                                                                                       'dport' => '2812',
                                                                                       'proto' => 'tcp')
            end
          end

          context 'when package_ensure is set to valid string <absent>' do
            let(:params) { { package_ensure: 'absent' } }

            it { is_expected.to contain_package('monit').with_ensure('absent') }
          end

          context 'when package_name is set to valid string <monit3>' do
            let(:params) { { package_name: 'monit3' } }

            it { is_expected.to contain_package('monit').with_name('monit3') }
          end

          context 'when service_enable is set to valid bool <false>' do
            let(:params) { { service_enable: false } }

            it { is_expected.to contain_service('monit').with_enable(false) }
          end

          context 'when service_ensure is set to valid string <stopped>' do
            let(:params) { { service_ensure: 'stopped' } }

            it { is_expected.to contain_service('monit').with_ensure('stopped') }
          end

          context 'when service_manage is set to valid bool <false>' do
            let(:params) { { service_manage: false } }

            it { is_expected.not_to contain_service('monit') }
            it { is_expected.not_to contain_file('/etc/default/monit') }
          end

          context 'when service_name is set to valid string <stopped>' do
            let(:params) { { service_name: 'monit3' } }

            it { is_expected.to contain_service('monit').with_name('monit3') }
          end

          context 'when logfile is set to valid path </var/log/monit3.log>' do
            let(:params) { { logfile: '/var/log/monit3.log' } }

            it { is_expected.to contain_file('monit_config').with_content(%r{^set logfile /var/log/monit3.log$}) }
          end

          context 'when logfile is set to valid string <syslog>' do
            let(:params) { { logfile: 'syslog' } }

            it { is_expected.to contain_file('monit_config').with_content(%r{^set logfile syslog$}) }
          end

          context 'when mailserver is set to valid string <mailhost>' do
            let(:params) { { mailserver: 'mailhost' } }

            it { is_expected.to contain_file('monit_config').with_content(%r{^set mailserver mailhost$}) }
          end

          context 'when mailformat is set to valid hash' do
            let(:params) do
              {
                mailformat: {
                  'from'    => 'monit@test.local',
                  'message' => 'Monit $ACTION $SERVICE at $DATE on $HOST: $DESCRIPTION',
                  'subject' => 'spectesting',
                },
              }
            end

            content = <<~END
              set mail-format {
                  from: monit@test.local
                  message: Monit $ACTION $SERVICE at $DATE on $HOST: $DESCRIPTION
                  subject: spectesting
              }
            END
            it { is_expected.to contain_file('monit_config').with_content(%r{#{Regexp.escape(content)}}) }
          end

          context 'when alert_emails is set to valid array' do
            let(:params) do
              {
                alert_emails: [
                  'spec@test.local',
                  'tester@test.local',
                ],
              }
            end

            content = <<~END
              set alert spec@test.local
              set alert tester@test.local
            END
            it { is_expected.to contain_file('monit_config').with_content(%r{#{content}}) }
          end

          context 'when mmonit_address is set to valid string <monit3.test.local>' do
            let(:params) { { mmonit_address: 'monit3.test.local' } }

            content = 'set mmonit https://monit:monit@monit3.test.local:8443/collector'
            it { is_expected.to contain_file('monit_config').with_content(%r{#{content}}) }
          end

          context 'when mmonit_without_credential is set to valid bool <true>' do
            let(:params) do
              {
                mmonit_without_credential: true,
                mmonit_address: 'monit3.test.local',
              }
            end

            content = '   and register without credentials'
            it { is_expected.to contain_file('monit_config').with_content(%r{#{content}}) }
          end

          context 'when mmonit_* params are set to valid values' do
            let(:params) do
              {
                mmonit_address:  'monit242.test.local',
                mmonit_https:    false,
                mmonit_port:     8242,
                mmonit_user:     'monituser',
                mmonit_password: 'Pa55w0rd',
              }
            end

            content = 'set mmonit http://monituser:Pa55w0rd@monit242.test.local:8242/collector'
            it { is_expected.to contain_file('monit_config').with_content(%r{#{content}}) }
          end

          context 'when config_file is set to valid path </etc/monit3.conf>' do
            let(:params) { { config_file: '/etc/monit3.conf' } }

            it { is_expected.to contain_file('monit_config').with_path('/etc/monit3.conf') }
          end

          context 'when config_dir is set to valid path </etc/monit3/conf.d>' do
            let(:params) { { config_dir: '/etc/monit3/conf.d' } }

            it { is_expected.to contain_file('monit_config_dir').with_path('/etc/monit3/conf.d') }
          end

          context 'when config_dir_purge is set to valid bool <true>' do
            let(:params) { { config_dir_purge: true } }

            it do
              is_expected.to contain_file('monit_config_dir').with('purge' => true,
                                                                   'recurse' => true)
            end
          end
        end
      end
    end
  end
end
