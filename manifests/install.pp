# == Class orgdc::install
#
class orgdc::install {
  include fuseki
  include beluga::wget
}
