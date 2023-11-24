#!/usr/bin/pup
# creating a file named  /tmp/school  with the following content
# I love my Puppet
# with 0744 permissions
# and owned by www-data
# and www-data as the group owner

file { '/tmp/school':
  ensure  => file,
  content => 'I love my Puppet',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
}
