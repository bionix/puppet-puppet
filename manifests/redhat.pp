# This class installs puppet packages on redhat based systems
#
# The yum puppetlabs repo ships by the example42 yum module
#
class puppet::redhat ( $ensure = present ) {
  package { 'puppet':
    ensure => $ensure,
  }
  file {'/var/lib/puppet':
    ensure  => directory,
    owner   => puppet,
    group   => puppet,
    mode    => '0755',
    require => Package['puppet'],
  }
}