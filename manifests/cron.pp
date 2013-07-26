# This class set the cron task for puppet runs
class puppet::cron (
    $puppetserver       = undef,
    $puppetenvironment  = undef,
    $puppetcronminute   = fqdn_rand(30),
){
    $puppetcronminute1  = ${puppetcronminute} + 30,
  cron { 'puppet':
    ensure  => present,
    command => "puppet agent --onetime --no-daemonize --environment ${puppetenvironment} --fqdn ${::fqdn} --server ${puppetserver} --logdest syslog > /dev/null 2>&1",
    user    => 'root',
    minute  => [ $puppetcronminute, $puppetcronminute1 ],
  }
}