import "classes/*"

node default {
  # Set up path
  Exec {
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/pgsql-9.2/bin/"
  }
  
  # Add postgres bins to system path
  file {"/etc/profile.d/postgresql.sh":
    content => template("/etc/puppet/templates/postgresql.erb"),
  }
  
  package {"man":
    ensure => "installed",
  }

  include user_uwsgi
  include postgres_packages
  include flask_packages
}

