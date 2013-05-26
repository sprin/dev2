class flask_packages {

  # libevent, for gevent. Note that we can't specify a version (tried), but for
  # Centos 6.4, we should get 1.4.13.
  package { "libevent.x86_64":
    ensure => "installed"
  }
}
