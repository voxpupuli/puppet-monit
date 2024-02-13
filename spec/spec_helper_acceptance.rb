require 'voxpupuli/acceptance/spec_helper_acceptance'

configure_beaker do |host|
  # Install Puppet
  install_puppet_release_repo_on(host)
  install_local_module on(host)
  install_puppet_module_via_pmt_on(host, stdlib)
end
