#!/usr/bin/env pup
# script to update the ssh_config file to allow signing in without using password and usin ~/ssh/school as the private key
file_line {'config_file':
  ensure => 'present',
  file   => '/etc/ssh/ssh_config',
  line   => ' IdentityFile ~/ssh/school',
  }
psswd_line {'password':
  ensure => 'present',
  file   => '/etc/ssh/ssh_config',
  line   => ' PasswordAuthentication no',
  }
