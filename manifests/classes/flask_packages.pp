class flask_packages {

  # libevent, for gevent. Note that we can't specify a version (tried), but for
  # Centos 6.4, we should get 1.4.13.
  package { "libevent.x86_64":
    ensure => "installed"
  }

  yumrepo { "springdale":
    baseurl => "http://springdale.math.ias.edu/data/puias/computational/6Server/x86_64/",
    descr => "Springdale Linux Server 6 x86_64",
    enabled => 1,
    gpgcheck => 0
  }

  package {"python27":
    ensure => "installed",
    require => Yumrepo["springdale"]
  }
}
