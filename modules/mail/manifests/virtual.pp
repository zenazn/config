class mail::virtual {
  $users = hiera("users")
  file { '/etc/postfix/virtual':
    content => template('mail/virtual.erb')
  }
  exec { '/usr/sbin/postmap /etc/postfix/virtual':
    subscribe => File['/etc/postfix/virtual'],
    refreshonly => true
  }
}
