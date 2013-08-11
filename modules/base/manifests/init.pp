class base {
  include stdlib

  stage { 'bootstrap':
    before => Stage['setup']
  }

  $packages = hiera_array("base_packages")
  package { $packages:
    ensure => installed,
    stage => bootstrap
  }

  class { 'users':
    stage => bootstrap
  }
}
