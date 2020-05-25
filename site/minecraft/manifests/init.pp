class minecraft {
  file { '/opt/minecraft':
    ensure => directory,
  }
  file { '/opt/minecraft/minecraft_server.jar':
    ensure  => file,
    source  => 'https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar',
    require => File['/opt/minecraft'],
  }
  package { 'java':
    ensure => installed,
  }
  file { '/opt/minecraft/eula.txt':
    ensure  => file,
    content => 'eula=true',
    require => File['/opt/minecraft/minecraft_server.jar'],
  }
  file { '/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service { 'minecraft':
    ensure  => running,
    enable  => true,
    require => [File['/opt/minecraft/minecraft_server.jar'], Package['java'], File['/opt/minecraft/eula.txt'], File['/etc/systemd/system/minecraft.service']],
  }
}
