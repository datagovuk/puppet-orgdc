# == Class orgdc::install
#
class orgdc::install {
  class {'fuseki':
    fuseki_data_dir => '/var/lib/fuseki/databases/ORG-DB',
  }
  include elda
  include referencetimeserver
  include beluga::wget
}
