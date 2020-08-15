# Install and configure nginx on a ubuntu 16 server

exec { 'apt-get update':
  command => 'apt-get update',
}

package { 'nginx':
  ensure  => 'installed',
  name => 'nginx',
}

file_line { 'append a line in nginx config file':
  path  => '/etc/nginx/nginx.conf',
  line  => "\tadd_header X-Served-By ${hostname};",
  after => 'http {',
}

exec { 'sudo service nginx restart':
  command => '/usr/sbin/service nginx restart',
}
