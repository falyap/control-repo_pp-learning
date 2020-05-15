class profile::ssh_server {
  package { 'openssh-server':
    ensure => installed,
  }
  service { 'ssh':
    ensure => running,
    enable => true,
  }
  ssh_authorized_key { 'master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => ssh-rsa,
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDMAdUe2uVd0PiHoxnpTNMtYUrAj6s+rO5zkTNk6rNeUn5bvGJ4vFYRP94cB5diMn6Slh1p0wx/i53/gsszzMJrLP4vQhcz4u18N4ApgmiTHL2h0/zelZ59AhsvTT05oMw5eZhxWH08TjrKwE0aRR0M/FINeSrnvpRY6h5hJN9NLf9ryk0JfdSb4IrQf38FCwrtNkjuT/hiVMuE9+eqfDhz/RfCVmrl4i3fXE2ohsufxA8qOEVCmF4SN2rlymMSHe0VfQBHyrlkHSpXU6Xd5hoftvPdfxJQHNzpT2d9Eq+PRY8P5jj/EW2i2JTac2SEGGsvSjw4z++oqXe0p7bTKC+5' 
  }
}
