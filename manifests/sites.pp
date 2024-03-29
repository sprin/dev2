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

  # Make sure MacOS share is mounted
  file {"/etc/profile.d/vbox-mount.sh":
    content => template("/etc/puppet/templates/vbox-mount.erb"),
  }
  
  package {"man":
    ensure => "installed",
  }

  # Purge unmanaged firewall resources.
  resources { "firewall":
    purge => true
  }

  Firewall {
    before  => Class['post'],
    require => Class['pre'],
  }

  class { ['pre', 'post']: }

  class { 'firewall': }

  firewall { '200 allow ssh access':
    port   => [22],
    proto  => tcp,
    action => accept,
  }


  include user_uwsgi
  include postgres_packages
  include flask_packages
  # Apps
  include drilldown_demo
}

