define secrets::ssl {
  file { "/etc/ssl/private/$name.key":
    ensure => present,
    mode => "400",
    content => hiera("/etc/ssl/private/$name.key");
  "/etc/ssl/certs/$name.pem":
    ensure => present,
    mode => "444",
    source => "puppet:///modules/secrets/ssl/$name.pem"
  }
}
