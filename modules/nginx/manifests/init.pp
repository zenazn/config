class nginx {
  package { ["nginx", "passenger-common1.9.1"]:
    ensure => installed;
  "passenger-common1.8":
    ensure => absent
  }
  file { "/etc/nginx/":
    ensure => directory;
  "/etc/nginx/k
}
