class mail($destinations=[]) {
  include mail::common
  include mail::virtual

  package { 'mail-stack-delivery':
  }

  file { '/etc/postfix/main.cf':
    content => template('mail/main.cf.erb');
  '/etc/postfix/master.cf':
    source => 'puppet:///modules/mail/master.cf';
  '/etc/dovecot/conf.d/01-mail-stack-delivery.conf':
    content => template('mail/01-mail-stack-delivery.conf.erb')
  }
}
