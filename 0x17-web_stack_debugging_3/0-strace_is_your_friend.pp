# fix error found. 500 error from apache in wordpress
exec { 'fixing error':
  command => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/',
}
