class postgres_packages {
  
  # Postgres packages

  # Enable Postgres repo, so we can get 9.2
  yumrepo { "postgresql":
    baseurl => "http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/",
    descr => "Postgres repo for RHEL 6 x86_64",
    enabled => 1,
    gpgcheck => 0
  }

  package {"postgresql92":
    ensure => "installed",
    require => Yumrepo["postgresql"]
  }

  package {"postgresql92-devel":
    ensure => "installed",
    require => Yumrepo["postgresql"]
  }
  
  class {"postgresql":
    version => "9.2",
    bindir  => "/usr/pgsql-9.2/bin/",
    datadir => "/var/lib/pgsql/9.2/data/",
    confdir => "/var/lib/pgsql/9.2/data/",
  }->
  class { 'postgresql::server':
    config_hash => {
      'ip_mask_deny_postgres_user' => '0.0.0.0/32',
      'ip_mask_allow_all_users'    => '0.0.0.0/0',
      'listen_addresses'           => '*',
      'manage_redhat_firewall'     => true,
      'postgres_password'          => 'postgres',
    },
  }
  


}
