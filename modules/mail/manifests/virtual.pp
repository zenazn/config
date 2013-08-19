class mail::virtual($addresses={}) {
  file { '/etc/postfix/virtual':
    content => join(join_keys_to_values($addresses, ' '), "\n")
  }
  exec { '/usr/sbin/postmap /etc/postfix/virtual':
    subscribe => File['/etc/postfix/virtual'],
    refreshonly => true
  }
}