# use the private key ~/.ssh/school
# refuse to authenticate using a PasswordAuthenticationd

file { '/home/bk/.ssh/config':
  ensure  => file,
  path    => '/home/bk/.ssh/config',
  content => "Host *\n  IdentityFile ~/.ssh/school\n  PasswordAuthentication no\n",
  mode    => '0600',
  owner   => 'bk',
}
