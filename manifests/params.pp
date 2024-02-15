# @summary
#   This is a container class with default parameters for monit classes.
#
# @api private
class monit::params {
  $check_interval            = 120
  $config_dir_purge          = false
  $httpd                     = false
  $httpd_port                = 2812
  $httpd_address             = 'localhost'
  $httpd_allow               = '0.0.0.0/0.0.0.0'
  $httpd_user                = 'admin'
  $httpd_password            = 'monit'
  $manage_firewall           = false
  $package_ensure            = 'present'
  $package_name              = 'monit'
  $service_enable            = true
  $service_ensure            = 'running'
  $service_manage            = true
  $service_name              = 'monit'
  $logfile                   = '/var/log/monit.log'
  $mailserver                = undef
  $mailformat                = undef
  $alert_emails              = []
  $start_delay               = undef
  $mmonit_address            = undef
  $mmonit_https              = true
  $mmonit_port               = 8443
  $mmonit_user               = 'monit'
  $mmonit_password           = 'monit'
  $mmonit_without_credential = false

  case $facts['os']['family'] {
    'Debian': {
      $config_file   = '/etc/monit/monitrc'
      $config_dir    = '/etc/monit/conf.d'
      $monit_version = '5'
      $default_file_content = 'START=yes'
      $service_hasstatus    = true
    }
    'RedHat': {
      $config_dir        = '/etc/monit.d'
      $service_hasstatus = true

      case $facts['os']['name'] {
        'Amazon': {
          $monit_version = '5'
          $config_file   = '/etc/monit.conf'
        }
        default: {
          $monit_version = '5'
          $config_file   = '/etc/monitrc'
        }
      }
    }
    default: {
      fail("monit supports osfamilies Debian and RedHat. Detected osfamily is <${facts['os']['family']}>.")
    }
  }
}
