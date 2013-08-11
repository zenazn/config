class sudoers {
  group { "sudo":
    ensure => present,
    stage => bootstrap
  }

  file { "/etc/sudoers.d":
    ensure => directory;
  "/etc/sudoers.d/50-nopasswd":
    mode => "440",
    contents => "%sudo ALL=(ALL:ALL) NOPASSWD"
  }
}
