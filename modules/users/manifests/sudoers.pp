class users::sudoers {
  group { "sudo":
    ensure => present,
  }

  file { "/etc/sudoers.d":
    ensure => directory;
  "/etc/sudoers.d/50-nopasswd":
    mode => "440",
    content => "%sudo ALL=(ALL:ALL) NOPASSWD: ALL"
  }
}
