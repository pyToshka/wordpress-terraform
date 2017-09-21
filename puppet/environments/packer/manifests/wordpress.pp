class { 'wordpress':

}
include ::php-fpm
#include ::postfix
class { 'nginx': }
nginx::vhost { 'localhost':
        host => 'localhost',
        root => '/var/www',
  }

