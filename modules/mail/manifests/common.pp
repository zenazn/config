class mail::common {
  file { '/etc/postfix':
    ensure => directory;
  '/etc/mailname':
    content => $domain
  }
  exec { 'generate postfix 1024 DH params':
    command => '
    umask 077
    openssl gendh -out /etc/postfix/dh_1024.pem -2 1024
    ',
    provider => shell,
    creates => '/etc/postfix/dh_1024.pem',
    require => File['/etc/postfix'];
  'generate postfix 512 DH params':
    command => '
    umask 077
    openssl gendh -out /etc/postfix/dh_512.pem -2 512
    ',
    provider => shell,
    creates => '/etc/postfix/dh_512.pem',
    require => File['/etc/postfix'];
  }
}
