include ufw
# Install Nginx web server (w/ Puppet)
package { 'nginx':
  package_ensure => installed,
  service_ensure => 'running',
}

file{ 'Redirect rule':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=hdZUCjAQaGw permanent;',
}

file { '/var/www/html/index.html':
  content => 'Hello World',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
package {'ufw':
ensure => installed,
  }

service {'ufw':
ensure  => running,
enable  => true,
require => Package['ufw'],
}
# allow Nginx and SSh
ufw{'Nginx FULL':
rule  => 'allow',
port  => [80,443],
proto => 'tcp',
order => 1,
}

ufw {'SSH':
rule  => 'allow',
port  => 22,
proto => 'tcp',
order => 2,
}

