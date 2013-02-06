class java {

  Exec { path => '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin' }

  $javaPackages = ["openjdk-7-jdk","default-jre-headless","default-jdk"]
  package { $javaPackages: ensure => present }
  
  exec { "select_java7":
    command => "update-java-alternatives -s java-1.7.0-openjdk-amd64",
    require => Package["default-jdk"]
  }

}
