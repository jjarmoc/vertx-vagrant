import "additions/java.pp"
import "additions/vertx.pp"

stage { 'req-install': before => Stage['rvm-install'] }

class requirements {
  group { "puppet": ensure => "present", }
  exec { "apt-update":
    command => "/usr/bin/apt-get -y update"
  }

  package {
    ["mysql-client", "mysql-server", "libmysqlclient-dev"]: 
      ensure => installed, require => Exec['apt-update']
  }
}

class installrvm {
  include rvm
  rvm::system_user { vagrant: ; }

    rvm_system_ruby {
      'ruby-1.9.3-p0':
        ensure => 'present';
      'jruby-1.7.2':
        ensure => 'present',
        default_use => true;
    }
    
    rvm_gemset {
      "jruby-1.7.2@vertx":
        ensure => present,
        require => Rvm_system_ruby['jruby-1.7.2'];
    }
    
    rvm_gem {
      'jruby-1.7.2@vertx/json':
        ensure => 'present',
        require => Rvm_gemset['jruby-1.7.2@vertx'];
    }    
}

class doinstall {
  class { requirements:, stage => "req-install" }
  include installrvm
  include java
  include vertx
}

include doinstall