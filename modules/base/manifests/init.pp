class base {
  include stdlib

  stage { 'bootstrap':
    before => Stage['setup']
  }

  package { hiera_array("base_packages"):
    ensure => installed,
    stage => bootstrap
  }
}
