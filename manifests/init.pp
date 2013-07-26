# == Class: puppet
#
# This class manage the puppet client dependencies like puppet version,
# sourceslist.
#
# Dependencies
#
# The puppet module needs Puppetlabs puppet-apt module for the apt sourceslist
#
# https://github.com/puppetlabs/puppetlabs-apt
# https://forge.puppetlabs.com/puppetlabs/apt
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
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { puppet:
#    ensure => latest
#  }
#
# Install the latest puppet version
#
# === Authors
#
# Markus "bionix" Rekkenbeil <markus@bionix-it.de>
#
# === Copyright
#
# Copyright 2013 Markus Rekkenbeil
#

class puppet (
  $ensure               = installed,
  $puppetserver         = "puppet.${::domain}",
  $puppetenvironment    = 'production',
  $puppetcronminute     = fqdn_rand(30),
) {

  case $::operatingsystem {
    RedHat,CentOS,Fedora: {
      class { 'puppet::redhat':
        ensure => $ensure,
      }
    }
    Debian,Ubuntu:        {
      class { 'puppet::debian':
        ensure => $ensure,
      }
    }
    default:              { notice "Unsupported OS ${::operatingsystem}" }
  }
  class { 'puppet::cron':
    puppetserver        => $puppetserver,
    puppetenvironment   => $puppetenvironment,
    puppetcronminute    => $puppetcronminute,
  }
  class { 'puppet::service': }
}
