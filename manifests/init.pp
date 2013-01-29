class keepalived ($instance = '23', $priority, $interface, $vips, ) { 
  
  # Require the package to be installed
  package { 'keepalived':
    ensure	=>	present,
  }

  # Configure the configuration file
  file { 'keepalived.conf':
    require	=>	Package['keepalived'],
    ensure	=>	file,
    path	=>	'/etc/keepalived/keepalived.conf',
    owner	=>	'root',
    group	=>	'root',
    mode	=>	'0644',
    content	=>	template("keepalived/config.erb"),
  }

  # Start the service
  service { 'keepalived':
    ensure	=>	running,
    subscribe	=>	File['keepalived.conf'],
  }

}
