# == Class: envconsul
#
# Full description of class envconsul here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { envconsul: }
#
# === Authors
#
# Reppard Walker <reppardwalker@gmail.com>
#
# === Copyright
#
# Copyright 2015 Reppard Walker, unless otherwise noted.
#
class envconsul (
  $version      = $::envconsul::params::version,
  $platform     = $::envconsul::params::platform,
  $arch         = $::envconsul::params::arch,
  $releases_url = $::envconsul::params::releases_url,
  $base_name    = $::envconsul::params::base_name,
  $extension    = $::envconsul::params::extension,
) inherits ::envconsul::params {

  include wget
  include envconsul::fetch
  include envconsul::install

}
