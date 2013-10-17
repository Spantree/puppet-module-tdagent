define td-agent::plugin
{
	exec { "td-agent plugin ${name}":
	    command  => "/usr/lib/fluent/ruby/bin/fluent-gem install ${name}",
	    require => Class['td-agent::install'],
	}
}