class user_uwsgi {
  # User which hosts all uwsgi apps (eg. Flask).

  user { "uwsgi":
    ensure     => "present",
    managehome => true,
  }

  file { "/home/uwsgi/virtualenvs":
    ensure => "directory",
    owner => "uwsgi",
    require => User["uwsgi"],
  }
}

