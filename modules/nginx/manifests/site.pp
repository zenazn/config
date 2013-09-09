define nginx::site($enabled=true) {
  include nginx

  file { "/etc/nginx/sites-available/$name.conf":
    ensure => present,
    source => "puppet:///modules/nginx/sites/$name.conf"
  }

  if $enabled {
    file { "/etc/nginx/sites-enabled/$name.conf":
      ensure => link,
      target => "/etc/nginx/sites-available/$name.conf"
    }
  } else {
    file { "/etc/nginx/sites-enabled/$name.conf":
      ensure => absent
    }
  }

  # Authentication
  $auth = hiera("/etc/nginx/auth/$name", '')
  if $auth != '' {
    file { "/etc/nginx/auth/$name":
      content => $auth
    }
  }
}
