# Test how well web server setup featuring Nginx and Gunicorn is working
exec { 'ulimit':
  command => 'sed -i "s/15/4096/" /etc/default/nginx; service nginx restart',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
