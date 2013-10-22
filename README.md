Spantree Puppetization of TD Agent
==================================

Based on: https://github.com/ziguzagu/puppet-module-tdagent

Manage td-agent and plugins with Puppet and Ubuntu. Installs packages from apt repo at http://packages.treasure-data.com/precise/ 
and allows you to add plugins via built-in ```fluent-gem install``` command.  

A quick and dirty implementation that may be useful for other Puppet users.

Example usage
=============

```
include td-agent

td-agent::plugin { 'fluent-plugin-elasticsearch':}

file { '/etc/td-agent/td-agent.conf':
		ensure  => 'file',
	    owner   => 'root',
	    group   => 'root',
	    mode    => '0644',
	    source  => 'puppet:///modules/<yourmodulename>/td-agent.conf',
	    require => [ Class['td-agent::install'], Td-agent::Plugin['fluent-plugin-elasticsearch'] ],
	    notify  => Class['td-agent::service'],
}
```
