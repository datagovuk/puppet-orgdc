# == Class: orgdc::config
# This class is meant to be called from orgdc
# Download, install and configure orgdc
#
class orgdc::config(
  $config,
) {
  include orgdc::params

  $tomcat_home              = $::orgdc::params::tomcat_home
  $tomcat_basedir           = $::orgdc::params::tomcat_basedir
  $tomcat_user              = $::orgdc::params::tomcat_user
  $tomcat_group             = $::orgdc::params::tomcat_user
  $file_name                = "org-dc-0.0.1-SNAPSHOT.war"
  $download_site            = 'https://github.com/epimorphics/org-dc/releases/download/0.0.1-SNAPSHOT-release'

  # Copy configuration
  file { $::orgdc::orgdc_conf_dir:
    ensure    => directory,
    source    => $config,
    recurse   => true,
    purge     => false,
    owner     => $tomcat_user,
    group     => $tomcat_group,
    require   => Package['tomcat7'],
  }

  # Ensure log directory created
  file { $::orgdc::orgdc_log_dir:
    ensure    => directory,
    owner     => $tomcat_user,
    group     => $tomcat_group,
    require   => Package['tomcat7'],
  }

  file {"${orgdc::tomcat_basedir}/webapps/ROOT.war":
    ensure    => present,
    owner     => $tomcat_user,
    group     => $tomcat_group,
    source    => "/tmp/${file_name}",
    require   => [Package['tomcat7'], Exec['orgdc-download']],
  }

  # download org-dc war to  /tmp:
  exec { 'orgdc-download':
    command   => "rm -rf ${orgdc::tomcat_basedir}/webapps/ROOT; wget --no-check-certificate ${download_site}/${file_name}",
    cwd       => '/tmp',
    creates   => "/tmp/${file_name}",
    onlyif    => "test ! -f /tmp/${file_name}",
    timeout   => 0,
    require   => File["${orgdc::tomcat_basedir}/webapps"],
  }
}
