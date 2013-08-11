class ubuntu {
  package { hiera_array("base_packages"):
    ensure => installed
  }
}
