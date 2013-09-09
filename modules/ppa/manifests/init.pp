class ppa::common {
  package { "python-software-properties":
  }
}

define ppa {
  include ppa::common

  exec { "add-apt-repository ppa:$name":
    command => "
      add-apt-repository ppa:$name
      apt-get update
    ",
    provider => shell,
    unless => "grep -q '$name' /etc/apt/sources.list /etc/apt/sources.list.d/*",
  }
}
