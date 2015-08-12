class mail::common {
  file { '/etc/postfix':
    ensure => directory;
  '/etc/mailname':
    content => $domain;
  '/etc/aliases':
    content => "postmaster: root\nroot: carl"
  }
  exec { 'generate postfix 2048 DH params':
    command => '
    umask 077
    openssl dhparam -out /etc/postfix/dh_2048.pem 2048
    ',
    provider => shell,
    creates => '/etc/postfix/dh_2048.pem',
    require => File['/etc/postfix'];
  '/usr/bin/newaliases':
    subscribe => File['/etc/aliases'],
    refreshonly => true
  }
}
