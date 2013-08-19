class mail::virtual($addresses={}) {
  file { '/etc/postfix/virtual':
    contents => join(join_keys_to_values($addresses, ' '), "\n")
  }
  exec { 'postmap /etc/postfix/virtual':
    subscribe => File['/etc/postfix/virtual'],
    refreshonly => true
  }
}
