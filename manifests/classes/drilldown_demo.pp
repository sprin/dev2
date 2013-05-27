class drilldown_demo {

  python::venv::isolate {
    "/home/uwsgi/virtualenvs/drilldown_demo":
      version => "2.7",
  }

  # Create db for drilldown app.
  postgresql::db { 'drilldown':
    user     => 'uwsgi',
    password => 'uwsgi',
    grant    => 'all',
  }
}
