class profile::base {
  $default_account = [ 'admin', 'dev' ]
  user { $default_account:
    ensure => present,
  }
  include profile::ssh_server
}
