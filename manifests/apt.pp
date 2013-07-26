# This class installs the apt sourceslist entries for the puppetlabs repo
# It needs the loaded puppet class apt from puppetlabs
class puppet::apt {
  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com',
    repos      => 'main',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }
  apt::source { 'puppetlabs_depends':
    location   => 'http://apt.puppetlabs.com',
    repos      => 'dependencies',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }
}