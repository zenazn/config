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

  ["/etc/nginx/sites-available", "/etc/nginx/sites-enabled", "/etc/nginx/auth"]:
    ensure => directory;

  ["/etc/nginx/sites-available/default", "/etc/nginx/sites-enabled/default"]:
    ensure => absent;
  }

  exec { 'generate nginx 2048 DH params':
    command => '
    umask 077
    openssl dhparam -out /etc/nginx/dh_2048.pem 2048
    ',
    provider => shell,
    creates => '/etc/nginx/dh_2048.pem',
    require => File['/etc/nginx/'];
  }

  nginx::site { $sites:
  }
}
