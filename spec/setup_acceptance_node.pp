if $facts['os']['family'] == 'RedHat' and $facts['os']['name'] != 'Amazon' {
  package {'epel-release':
    ensure => installed
  }
}
