class mail::relay {
  include mail::common
  include mail::virtual

  package { ['postfix', 'postgrey']:
  }

  file { '/etc/postfix/main.cf':
    content => template('mail/backup-main.cf.erb')
  }
}
