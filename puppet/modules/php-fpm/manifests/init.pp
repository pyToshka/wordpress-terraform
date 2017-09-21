class php-fpm{
  group { 'tr':
    ensure => 'present',
    gid    => '1001',
  }
  user { 'tr':
    ensure           => 'present',
    gid              => '1001',
    password         => '!!',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    uid              => '1001',
    home             => '/var/www',
    require          => Package['nginx'],
  }
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
      source  => "puppet:///modules/php-fpm/www.conf";
  }
  file { "/etc/syslog-ng/syslog-ng.conf":
       ensure  => file,
       require => Package['syslog-ng'],
       source  => "puppet:///modules/php-fpm/syslog-ng.conf";
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
    owner  => 'tr',
    group  => 'tr',
    mode   => '0750',
  }
  file { "/etc/php/7.0/cli/php.ini":
      ensure  => file,
      require => Package['php-fpm'],
      source  => "puppet:///modules/php-fpm/php.ini";
  }

}