
class vertx {

  Exec { path => '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin' }
  
  Package { require => Exec['apt-update'] }

  exec { "get_vertx":
    command => 'wget http://vertx.io/downloads/vert.x-1.3.1.final.zip',
    cwd => "/opt",
    creates => "/opt/vert.x-1.3.1.final.zip",
  }
  
  package { "unzip":
    ensure => "present",
  }

  exec { "extract_vertx":
    command => "unzip /opt/vert.x-1.3.1.final.zip",
    cwd => "/opt",
    creates => "/opt/vert.x-1.3.1.final",
    require => [ Exec["get_vertx"], Package["unzip"] ]
  }
  
  $env_sh = "/etc/profile.d/vertx.sh"
  file { $env_sh:
    ensure => present,
    source => "file:///tmp/vagrant-puppet/manifests/additions/config/vertx_env.sh",
    owner => "root",
    group => "root",
    mode => 644,
  }    
}
