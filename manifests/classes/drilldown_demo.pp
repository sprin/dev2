class drilldown_demo {


  python::venv::isolate {
    "/home/uwsgi/virtualenvs/drilldown_demo":
      version => "2.7",
      requirements => "/media/hosthome/repos/drilldown_demo/requirements.txt",
  }->
  # The app must be found in repos/drilldown_demo on the host.
  file {"/home/uwsgi/virtualenvs/drilldown_demo/repo":
    ensure => "link",
    target => "/media/hosthome/repos/drilldown_demo",
  }

  # Create db for drilldown app.
  postgresql::db { "drilldown":
    user     => "uwsgi",
    password => "uwsgi",
    grant    => "all",
  }
}
