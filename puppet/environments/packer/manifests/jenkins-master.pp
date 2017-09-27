include ::java::java_8
include ::apt
class {'jenkins':
    install_java => false,
}
class {'packer':}
class  {'terraform':}
jenkins::plugin {"ansicolor":}
jenkins::plugin {"mailer":}

exec { "apt-get update":
  command => "/usr/bin/apt-get update",
}

package { "git":
  require => Exec["apt-get update"],
}
package { "docker":
  require => Exec["apt-get update"],
}
package { "docker.io":
  require => Exec["apt-get update"],
}
package { "maven":
  require => Exec["apt-get update"],
}
package { "mysql-client":
  require => Exec["apt-get update"],
}
package { "awscli":
  require => Exec["apt-get update"],
}
