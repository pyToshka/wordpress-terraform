class php{
  exec { "apt-get update":
    command => "/usr/bin/apt-get update",
  }

  package { "php-fpm":
    require => Exec["apt-get update"],
  }
  package { "syslog-ng":
    require => Exec["apt-get update"],
  }
  package { "libdbd-mysql":
    require => Exec["apt-get update"],
  }

  file { "/etc/php/7.0/fpm/pool.d/www.conf":
      ensure  => file,
      require => Package['php-fpm'],
      source  => "puppet:///modules/php/www.conf";
  }

  service {"php7.0-fpm":
    ensure => running,
    enable => true,
    require => Package['php-fpm'],
  }
  service {"nginx":
    ensure  => running,
    require => Package['nginx'];
  }

  file { "/var/www":
    ensure => 'directory',
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '0750',
  }
  file { "/etc/php/7.0/cli/php.ini":
      ensure  => file,
      require => Package['php-fpm'],
      source  => "puppet:///modules/php/php.ini";
  }

}
