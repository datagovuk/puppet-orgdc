# == Class: orgdc::config
# This class is meant to be called from orgdc
# Download, install and configure orgdc
#
class orgdc::config(
  $config,
) {
  include orgdc::params

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

  file { [$orgdc::params::organogram_lib,
          $orgdc::params::organogram_merge]:
    ensure    => directory,
    mode      => '0777',
  }

  file {"/etc/apache2/sites-enabled/15-reference.conf":
    ensure => present,
    source => 'puppet:///orgdc/etc/apache2/sites-available/reference',
  }
  
}
