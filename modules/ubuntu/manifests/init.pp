class ubuntu {
  case $lsbdistcodename {
    'precise' : {
      include ubuntu::precise
    }

    default : {
      fail("Unsupported release :(")
    }
  }

  package {[
    'build-essential', 'bwm-ng', 'curl', 'dstat', 'git', 'gnupg', 'htop',
    'iftop', 'iotop', 'mtr-tiny', 'netcat-openbsd', 'pv', 'ruby1.9.1',
    'rubygems', 'screen', 'tcpdump', 'tmux', 'traceroute', 'vim'
  ]:
    ensure => installed,
    require => Exec['apt-get update']
  }

  exec { 'apt-get update':
    command => 'apt-get update',
    refreshonly => true
  }
}
