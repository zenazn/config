define users::user {
  $defaults = {
    'name' => '',
    'shell' => '/bin/bash',
    'groups' => []
  }
  $user_data = hiera_hash("users::users")
  $user = merge($user_data[$name], $user_info)

  user { $name:
    comment => $user['name'],
    ensure => present,
    groups => $user['groups'],
    managehome => true,
    shell => $user['shell']
  }

  if is_array($user['authorized_keys']) {
    file { "/home/$name/.ssh":
      ensure => directory,
      owner => $name,
      group => $name,
      mode => "700";
    "/home/$name/.ssh/authorized_keys":
      ensure => present,
      owner => $name,
      group => $name,
      mode => "600",
      content => join($user['authorized_keys'], "\n")
    }
  }
}
