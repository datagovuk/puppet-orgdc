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
  $fuseki_db_source = $orgdc::params::fuseki_db_source
) inherits orgdc::params {

  class { 'orgdc::install': } ->
  class { 'orgdc::config':
    config => $config,
  } ->
  Class['orgdc']
}
