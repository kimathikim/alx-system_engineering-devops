# use the private key ~/.ssh/school
# refuse to authenticate using a PasswordAuthenticationd


class ssh_config {
  file { '/home/your-username/.ssh/config':
    ensure  => file,
    owner   => 'your-username',
    mode    => '0600',
    replace => false,
  }

  concat { '/home/your-username/.ssh/config':
    ensure  => present,
    owner   => 'your-username',
    mode    => '0600',
  }

  concat::fragment { 'Turn off passwd auth':
    target  => '/home/your-username/.ssh/config',
    content => '    PasswordAuthentication no',
  }

  concat::fragment { 'Declare identity file':
    target  => '/home/your-username/.ssh/config',
    content => '    IdentityFile ~/.ssh/school',
  }
}

include ssh_config
