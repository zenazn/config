class users ($users) {
  $user_names = keys($users)
  users::user { $user_names:
  }
}
