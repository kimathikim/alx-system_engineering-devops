# Login with holberton user and open file withou any error
exec { 'hard/soft':
  command => 'sed -i "s/5/50/" /etc/security/limits.conf; \
  sed -i "s/4/40/" /etc/security/limits.conf;',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
