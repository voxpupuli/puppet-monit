require 'voxpupuli/acceptance/spec_helper_acceptance'

configure_beaker do |host|
  install_local_module_on(host)
  install_puppet_module_via_pmt_on(host, 'puppetlabs-stdlib')
  install_package(host, 'epel-release') if fact_on(host, 'os.name') == 'CentOS'
end
