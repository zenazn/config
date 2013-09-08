class users ($users) {
  include users::sudoers

  users::user { $users:
  }
}
