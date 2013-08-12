class secrets($ssl) {
  file { "/etc/ssl/private":
    ensure => directory,
    mode => "700";
  "/etc/ssl/certs":
    ensure => directory,
    mode => "755"
  }

  secrets::ssl { $ssl:
  }
}
