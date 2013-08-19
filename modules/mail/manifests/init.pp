class mail($destinations=[]) {
  include mail::common
  include mail::virtual

  package { 'mail-stack-delivery':
  }

  file { '/etc/postfix/main.cf':
    content => template('mail/main.cf.erb');
  '/etc/postfix/master.cf':
    source => 'puppet:///modules/mail/master.cf'
  }
}
