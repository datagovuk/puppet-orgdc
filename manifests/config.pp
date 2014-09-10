# == Class: orgdc::config
# This class is meant to be called from orgdc
# Download, install and configure orgdc
#
class orgdc::config(
  $config,
) {

  # Download and extract the Fuseki database to {fuseki_databases}/ORG-DC

  exec { 'fuseki-db-download':
    command   => "wget ${orgdc::fuseki_db_source}",
    cwd       => $fuseki::params::fuseki_backups,
    creates   => "${fuseki::params::fuseki_backups}/ORG-DB.tgz",
    user      => $fuseki::params::fuseki_user,
    timeout   => 0,
  }

  exec { 'fuseki-db-extract':
    path      => ['/usr/bin', '/usr/sbin', '/bin'],
    command   => "tar xzvf ${fuseki::params::fuseki_backups}/ORG-DB.tgz",
    cwd       => $fuseki::params::fuseki_databases,
    creates   => "${fuseki::params::fuseki_databases}/ORG-DB",
    user      => $fuseki::params::fuseki_user,
    require   => Exec['fuseki-db-download'],
  } ~>
  Service['fuseki']

  #include orgdc::params

  #$tomcat_home              = $::orgdc::params::tomcat_home
  #$tomcat_basedir           = $::orgdc::params::tomcat_basedir
  #$tomcat_user              = $::orgdc::params::tomcat_user
  #$tomcat_group             = $::orgdc::params::tomcat_user
  #$file_name                = "org-dc-0.0.1-SNAPSHOT.war"
  #$download_site            = 'https://github.com/epimorphics/org-dc/releases/download/0.0.1-SNAPSHOT-release'

  # Copy configuration
  #file { $::orgdc::orgdc_conf_dir:
  #  ensure    => directory,
  #  source    => $config,
  #  recurse   => true,
  #  purge     => false,
  #  owner     => $tomcat_user,
  #  group     => $tomcat_group,
  #  require   => Package['tomcat7'],
  #}

  # Ensure log directory created
  #file { $::orgdc::orgdc_log_dir:
  #  ensure    => directory,
  #  owner     => $tomcat_user,
  #  group     => $tomcat_group,
  #  require   => Package['tomcat7'],
  #}

  #file {"${orgdc::tomcat_basedir}/webapps/ROOT.war":
  #  ensure    => present,
  #  owner     => $tomcat_user,
  #  group     => $tomcat_group,
  #  source    => "/tmp/${file_name}",
  #  require   => [Package['tomcat7'], Exec['orgdc-download']],
  #}

  # download org-dc war to  /tmp:
  #exec { 'orgdc-download':
  #  command   => "rm -rf ${orgdc::tomcat_basedir}/webapps/ROOT; wget --no-check-certificate ${download_site}/${file_name}",
  #  cwd       => '/tmp',
  #  path      => "/usr/bin/:/bin/:usr/local/bin",
  #  creates   => "/tmp/${file_name}",
  #  onlyif    => "test ! -f /tmp/${file_name}",
  #  timeout   => 0,
  #}
}
