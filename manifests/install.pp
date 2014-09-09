# == Class orgdc::install
#
class orgdc::install {
  include fuseki
  include beluga::wget

  if !defined( Package['curl'] ) {
    package { 'curl':
      ensure  => present,
    }
  }

  include fuseki
  include elda

}
