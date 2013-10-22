class td-agent::install {
	if (!defined(Class['apt'])) {
		class { 'apt':
			always_apt_update  	=> true,
			update_timeout		=> 120
		}
	}

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
