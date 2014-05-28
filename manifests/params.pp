# == Class orgdc::params
#
# This class is meant to be called from orgdc
# It sets variables according to platform
#
class orgdc::params {
  case $::osfamily {
    'Debian': {
      $tomcat_home                        = '/usr/share/tomcat7'
      $tomcat_basedir                     = '/var/lib/tomcat7'
      $tomcat_user                        = 'tomcat7'
      $tomcat_group                       = 'tomcat7'

      $service_name                       = 'tomcat7'
      $orgdc_conf_dir                     = '/opt/org-dc'
      $orgdc_log_dir                      = '/var/log/org-dc/'

      $config                             = 'puppet:///modules/orgdc/'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
