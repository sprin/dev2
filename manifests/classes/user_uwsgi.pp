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

  # Give the uwsgi a default db. To be used as sandbox db.
  postgresql::db { 'uwsgi':
    user     => 'uwsgi',
    password => 'uwsgi',
    grant    => 'all',
  }

  postgresql::database_user{"uwsgi":
    require => [
      User["uwsgi"],
      Class["postgresql::server"],
    ]
  }

}

