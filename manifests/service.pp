# @summary
#   This class handles the monit service.
#
# @api private
#
class monit::service inherits monit {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  if $monit::service_manage {
    if $facts['os']['family'] == 'Debian' {
      file { '/etc/default/monit':
        content => $monit::default_file_content,
        notify  => Service[$monit::service_name],
      }
    }

    service { 'monit':
      ensure     => $monit::service_ensure,
      name       => $monit::service_name,
      enable     => $monit::service_enable,
      hasrestart => true,
      hasstatus  => $monit::service_hasstatus,
      subscribe  => [
        File['monit_state_dir'],
        File['monit_config_dir'],
        File['monit_config'],
      ],
    }
  }
}
