class users ($users) {
  include users::sudoers

  $user_names = keys($users)
  users::user { $user_names:
  }
}
