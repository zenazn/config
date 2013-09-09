class transmission {
  package { "transmission-daemon":
  }
  file { "/etc/transmission-daemon/settings.json":
    source => "puppet:///modules/transmission/settings.json"
  }
}
