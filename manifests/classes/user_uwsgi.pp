class user_uwsgi {
  user { "uwsgi":
    ensure     => "present",
    managehome => true,
  }
}
