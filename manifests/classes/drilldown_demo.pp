class drilldown_demo {

  python::venv::isolate {
    "/home/uwsgi/virtualenvs/drilldown_demo":
      version => "2.7",
      # The app must be found in repos/drilldown_demo on the host.
      requirements => "/media/hosthome/repos/drilldown_demo/requirements.txt",
  }

  # Create db for drilldown app.
  postgresql::db { 'drilldown':
    user     => 'uwsgi',
    password => 'uwsgi',
    grant    => 'all',
  }
}
