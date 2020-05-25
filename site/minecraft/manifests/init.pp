class minecraft (
  $url = 'puppet:///modules/minecraft/minecraft_server.jar',
  $install_dir = '/opt/minecraft',
  ) {
  file { $install_dir:
    ensure => directory,
  }
  file { "${install_dir}/minecraft_server.jar":
    ensure  => file,
    source  => $url,
    require => File[$install_dir],
  }
  package { 'java':
    ensure => installed,
  }
  file { "${install_dir}/eula.txt":
    ensure  => file,
    content => 'eula=true',
    require => File["${install_dir}/minecraft_server.jar"],
  }
  file { '/etc/systemd/system/minecraft.service':
    ensure  => file,
#    source => 'puppet:///modules/minecraft/minecraft.service',
    content => epp('minecraft/minecraft.service', {
      install_dir => $install_dir,
    }),
  }
  service { 'minecraft':
    ensure  => running,
    enable  => true,
    require => [File["${install_dir}/minecraft_server.jar"], Package['java'], File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service']],
  }
}
