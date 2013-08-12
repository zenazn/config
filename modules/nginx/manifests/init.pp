class nginx($sites=[]) {

  package { ["nginx", "passenger-common1.9.1"]:
    ensure => installed;
  "passenger-common1.8":
    ensure => absent
  }
  file { ["/etc/nginx/", "/etc/nginx/conf.d"]:
    ensure => directory;
  "/etc/nginx/nginx.conf":
    ensure => present,
    source => "puppet:///modules/nginx/nginx.conf";

  ["/etc/nginx/sites-available", "/etc/nginx/sites-enabled"]:
    ensure => directory;

  ["/etc/nginx/sites-available/default", "/etc/nginx/sites-enabled/default"]:
    ensure => absent;
  }

  nginx::site { $sites:
  }
}
