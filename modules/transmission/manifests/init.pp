class transmission {
  package { "transmission-daemon":
  }
  file { "/etc/transmission-daemon/settings.json":
    source => "puppet:///modules/transmission/settings.json";
  "/var/downloads":
    ensure => directory,
    owner => 'debian-transmission',
    group => 'debian-transmission',
    mode => '0644'
  }
}
