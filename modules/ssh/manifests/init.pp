class ssh {
  file { '/etc/ssh':
    ensure => directory;
  '/etc/ssh/ssh_config':
    source => 'puppet:///modules/ssh/ssh_config';
  '/etc/ssh/sshd_config':
    source => 'puppet:///modules/ssh/sshd_config';
  '/etc/ssh/ssh_host_rsa_key':
    content => hiera('/etc/ssh/ssh_host_rsa_key'),
    mode => "400";
  '/etc/ssh/ssh_host_dsa_key':
    content => hiera('/etc/ssh/ssh_host_dsa_key'),
    mode => "400";
  '/etc/ssh/ssh_host_ecdsa_key':
    content => hiera('/etc/ssh/ssh_host_ecdsa_key'),
    mode => "400";
  }

  package { 'ssh':
    ensure => installed
  }
}
