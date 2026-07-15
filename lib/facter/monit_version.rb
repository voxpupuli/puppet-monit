# A facter fact to determine the installed version of monit.

Facter.add(:monit_version) do
  setcode do
    monit_version = Facter::Util::Resolution.exec('monit -V 2>&1')
    monit_version && monit_version.match(%r{\d+\.\d+(?:\.\d+)?$}).to_s
  end
end
