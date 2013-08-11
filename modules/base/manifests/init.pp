class base::inner {
  include users

  $packages = hiera_array("base_packages")
  package { $packages:
    ensure => installed
  }
}
class base {
  include stdlib

  stage { 'bootstrap':
    before => Stage['setup']
  }

  class { 'base::bootstrap':
    stage => 'bootstrap'
  }
}
