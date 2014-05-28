# == Class: orgdc
#
# Full description of class here.
#
# === Parameters
#
# [*source_dir*]
#   If defined, the orgdc configuration directory content is retrieved recursively from
#   the specified source (parameter: source => $source_dir , recurse => true)
#
class orgdc (
  $source_dir = 'UNSET',
) inherits orgdc::params {

  $config = $source_dir ? {
    'UNSET'   => $::orgdc::params::config,
    default   => $source_dir,
  }

  class { 'orgdc::install': } ->
  class { 'orgdc::config':
    config => $config,
  } ~>
  Class['tomcat::service'] ->
  Class['orgdc']
}
