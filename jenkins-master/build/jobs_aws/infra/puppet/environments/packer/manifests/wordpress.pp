class { 'wordpress': }
class { 'nginx': }
nginx::vhost { 'localhost':
        host => 'localhost',
        root => '/var/www',
}
#class { 'php-fpm': }

