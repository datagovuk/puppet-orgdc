# == Class orgdc::params
#
# This class is meant to be called from orgdc
# It sets variables according to platform
#
class orgdc::params {
  $fuseki_db_source         = "https://s3-eu-west-1.amazonaws.com/organograms/RELEASE-0.1/ORG-DB.tgz"

  $config                   = 'puppet:///modules/orgdc/'

  $organogram_lib   = '/var/lib/organogram'
  $organogram_merge = "${organogram_lib}/merges"

  case $::osfamily {
    'Debian': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
