require 'beaker-rspec'

hosts.each do |host|
  # Install Puppet
  on host, install_puppet
end

RSpec.configure do |c|
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module
    install_local_module on(host)
    hosts.each do |host|
      on host, 'puppet module install puppetlabs-stdlib'
    end
  end
end
