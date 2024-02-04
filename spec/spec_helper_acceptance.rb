require 'beaker_puppet_helpers'

hosts.each do |host|
  # Install Puppet
  install_puppet_release_repo_on(host)
end

RSpec.configure do |c|
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module
    install_local_module on(host)
    hosts.each do |host|
      install_puppet_module_via_pmt_on(host, stdlib)
    end
  end
end
