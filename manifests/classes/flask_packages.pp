class flask_packages {

  class { "python::venv":
    owner => "uwsgi",
  }

  # libevent, for gevent. Note that we can't specify a version (tried), but for
  # Centos 6.4, we should get 1.4.13.
  package { "libevent":
    ensure  => "1.4.13-4.el6",
  }

  package { "libevent-devel":
    ensure => "1.4.13-4.el6",
  }

  # Enable Springdale Linux repo for Python 2.7, 3.3 RPMs
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

  package {"python27-devel":
    ensure => "installed",
    require => Yumrepo["springdale"]
  }

  package {"python3":
    ensure => "installed",
    require => Yumrepo["springdale"]
  }

  package {"python3-devel":
    ensure => "installed",
    require => Yumrepo["springdale"]
  }

}

