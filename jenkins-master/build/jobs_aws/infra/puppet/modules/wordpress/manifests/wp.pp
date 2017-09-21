class wordpress::wp {
package { "git": 
   ensure => latest,
}
package { "php7.0-gd":
   ensure => latest,
}
package { "php7.0-mysql":
   ensure => latest,
}
# checkout
  exec { 'clone':
    command => "git clone https://github.com/pyToshka/wordpress /var/www",
    path => ['/bin','/usr/bin/'],
    #require => Package['git']
    require => Package['git'],
    subscribe => Package['git'],
}

# Generate the wp-config.php file using the template
  file { '/var/www/wp-config.php':
    ensure => present,
    require => Exec['clone'],
    content => template("wordpress/wp-config.php.erb")
  }
}
