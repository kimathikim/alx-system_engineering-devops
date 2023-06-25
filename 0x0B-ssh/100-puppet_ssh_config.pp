# use the private key ~/.ssh/school
# refuse to authenticate using a PasswordAuthenticationd


file_line { 'Turn off passwd auth':
  path  => '/home/bk/.ssh/config',
  line  => '    PasswordAuthentication no',
  match => '^\s*PasswordAuthentication',
}

file_line { 'Declare identity file':
  path  => '/home/bk/.ssh/config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^\s*IdentityFile\s+~/.ssh/school',
}
