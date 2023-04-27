# this program checks whether the attribute is
# availlable and updates its value

file { 'configure_file':
    ensure => 'present',
    path => 'etc/ssh/ssh_config',
    line => '    IdentityFile ~/.ssh/school',
}

# this ensures that no authenticatio using Password

file { 'no_pass':
    ensure => 'present',
    path => 'etc/ssh/ssh_config',
    line => '    PasswordAuthentication no',
}

