# This class stops the puppet daemon, because we use the cron tasks
class puppet::service {
  service { "puppet":
    ensure        => stopped,
    hasstatus     => true,
    hasrestart    => true,
    enable        => false,
    require       => Class["puppet::cron"],
  }
}