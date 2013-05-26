import "classes/*"

node default {
  # Set up path
  Exec {
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  }

  include user_uwsgi
  include flask_packages
}

