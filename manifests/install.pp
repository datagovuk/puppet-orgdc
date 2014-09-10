# == Class orgdc::install
#
class orgdc::install {
  include fuseki
  include elda
  include referencetimeserver
  include beluga::wget
}
