class td-agent::service {
  service { 'td-agent':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    restart    => '/etc/init.d/td-agent restart',
    require    => Class['td-agent::install', 'td-agent::config'],
  }
}
