require 'spec_helper'

describe 'monit::check' do
  let :pre_condition do
    'include monit'
  end
  let(:title) { 'test' }

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      confdir = if facts[:os]['family'] == 'RedHat'
                  '/etc/monit.d'
                else
                  '/etc/monit/conf.d'
                end

      context 'with default values for parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('monit') }

        it do
          is_expected.to contain_file("#{confdir}/test").with('ensure' => 'present',
                                                              'owner' => 'root',
                                                              'group' => 'root',
                                                              'mode' => '0644',
                                                              'source' => nil,
                                                              'content' => nil,
                                                              'notify' => 'Service[monit]',
                                                              'require' => 'Package[monit]')
        end
      end

      %w[absent present].each do |value|
        context "with ensure set to valid <#{value}>" do
          let(:params) do
            {
              ensure: value,
            }
          end

          it do
            is_expected.to contain_file("#{confdir}/test").with('ensure' => value,
                                                                'owner' => 'root',
                                                                'group' => 'root',
                                                                'mode' => '0644',
                                                                'source' => nil,
                                                                'content' => nil,
                                                                'notify' => 'Service[monit]',
                                                                'require' => 'Package[monit]')
          end
        end
      end

      context 'with content set to a valid value' do
        content = <<~END
          check process ntpd with pidfile /var/run/ntpd.pid
          start program = "/etc/init.d/ntpd start"
          stop  program = "/etc/init.d/ntpd stop"
          if failed host 127.0.0.1 port 123 type udp then alert
          if 5 restarts within 5 cycles then timeout
        END
        let(:params) do
          {
            content: content,
          }
        end

        it do
          is_expected.to contain_file("#{confdir}/test").with('ensure' => 'present',
                                                              'owner' => 'root',
                                                              'group' => 'root',
                                                              'mode' => '0644',
                                                              'source' => nil,
                                                              'content' => content,
                                                              'notify' => 'Service[monit]',
                                                              'require' => 'Package[monit]')
        end
      end

      context 'with source set to a valid value' do
        let(:params) do
          {
            source: 'puppet:///modules/monit/ntp',
          }
        end

        it do
          is_expected.to contain_file("#{confdir}/test").with('ensure' => 'present',
                                                              'owner' => 'root',
                                                              'group' => 'root',
                                                              'mode' => '0644',
                                                              'source' => 'puppet:///modules/monit/ntp',
                                                              'content' => nil,
                                                              'notify' => 'Service[monit]',
                                                              'require' => 'Package[monit]')
        end
      end

      context 'with content and source set at the same time' do
        let(:params) do
          {
            content: 'content',
            source: 'puppet:///modules/subject/test',
          }
        end

        it 'fails' do
          is_expected.to compile.and_raise_error(%r{Parameters source and content are mutually exclusive})
        end
      end
    end
  end
end
