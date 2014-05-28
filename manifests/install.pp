# == Class orgdc::install
#
class orgdc::install {
  include orgdc::params

  if !defined( Package['default-jdk'] ) {
    package { 'default-jdk':
      ensure  => present,
    }
  }

  if !defined( Package['wget'] ) {
    package { 'wget':
      ensure  => present,
    }
  }
  if !defined( Package['curl'] ) {
    package { 'curl':
      ensure  => present,
    }
  }

}
