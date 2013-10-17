class td-agent::install {
  apt::source { 'treasuredata':
    location => 'http://packages.treasure-data.com/precise/',
    release  => 'precise',
    repos    => 'contrib',
  }

  exec { 'td-agent':
    command  => '/usr/bin/apt-get install -y --force-yes td-agent',
    unless => '/usr/bin/dpkg --get-selections | grep -v deinstall | grep td-agent',
    require => Apt::Source['treasuredata'],
  }
}
