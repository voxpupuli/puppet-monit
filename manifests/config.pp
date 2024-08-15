# @summary
#   This class handles the configuration file.
#
# @api private
#
class monit::config inherits monit {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { 'monit_state_dir':
    ensure => directory,
    path   => $monit::state_dir,
    owner  => 'root',
    group  => $monit::root_group,
    mode   => '0755',
  }

  file { 'monit_config_dir':
    ensure  => directory,
    path    => $monit::config_dir,
    owner   => 'root',
    group   => $monit::root_group,
    mode    => '0755',
    purge   => $monit::config_dir_purge,
    recurse => $monit::config_dir_purge,
    require => Package['monit'],
  }

  file { 'monit_config':
    ensure  => file,
    path    => $monit::config_file,
    owner   => 'root',
    group   => $monit::root_group,
    mode    => '0600',
    content => template('monit/monitrc.erb'),
    require => Package['monit'],
  }
}
