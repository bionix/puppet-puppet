# This class installs puppet packages for debian based systems
class puppet::debian ( $ensure = present ) {
  package { ['puppet', 'puppet-common']:
    ensure => $ensure,
  }
  file {'/var/lib/puppet':
    ensure  => directory,
    owner   => puppet,
    group   => puppet,
    mode    => '0755',
    require => Package['puppet'],
  }
  include puppet::apt
}