class nginx($sites=[]) {

  package { ["nginx", "passenger-common1.9.1"]:
    ensure => installed;
  "passenger-common1.8":
    ensure => absent
  }
  file { "/etc/nginx/":
    ensure => directory;
  "/etc/nginx/conf.d":
    ensure => directory;
  "/etc/nginx/nginx.conf":
    ensure => present,
    source => "puppet:///modules/nginx/nginx.conf";

  "/etc/nginx/sites-available":
    ensure => directory;
  "/etc/nginx/sites-enabled":
    ensure => directory;
  }

  nginx::site { $sites:
  }
}
