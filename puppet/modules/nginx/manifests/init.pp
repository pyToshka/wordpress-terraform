# === Class: nginx
# nginx puppet module
#

class nginx (
    $user = 'www-data',
    $worker_processes = 'auto',
    $worker_connections = '1024',
    $error_log = '/var/log/nginx/error.log',
    $access_log = '/var/log/nginx/access.log',
    $log_format_main = '\'$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent" "$http_x_forwarded_for"\'',
    $log_format_stat = '\'$remote_addr $host $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent" $request_time $upstream_response_time $pipe\'',
    $log_format_syslog = '\'$remote_addr  $remote_user $msec $request_method "$request_filename" "$server_protocol" $status $body_bytes_sent "$http_referer" "$http_user_agent" "$server_name"\'',
    $log_rotate = '103',
    $pid = '/var/run/nginx.pid',
    $sendfile = 'on',
    $sendfile_max_chunk = '0',
    $send_timeout = '600s',
    $tcp_nopush = 'off',
    $tcp_nodelay = 'on',
    $gzip = 'off',
    $gzip_buffers = '32 4k',
    $gzip_comp_level = '1',
    $gzip_disable = 'msie6',
    $gzip_min_length = '20',
    $gzip_http_version = '1.1',
    $gzip_proxied = 'off',
    $gzip_types = 'text/html',
    $gzip_vary = 'off',
    $keepalive_timeout = '65',
    $keepalive_requests = '100',
    $keepalive_disable = 'msie6',
    $client_body_buffer_size = '16k',
    $client_body_in_file_only = 'off',
    $client_body_in_single_buffer = 'off',
    $client_body_temp_path = 'client_body_temp',
    $client_body_timeout = '60s',
    $client_header_buffer_size = '16k',
    $client_header_timeout = '60s',
    $client_max_body_size = '1m',
    $large_client_header_buffers = '4 16k',
    $output_buffers = '2 32k',
    $postpone_output = '1460',
    $version = "present",
    $host    = undef,
    $root   = undef,
    $phpid = '1',
    $fastcgi_connect_timeout = '600s',
    $fastcgi_send_timeout = '600s',
    $fastcgi_read_timeout = '600s',
    $cidr = '0.0.0.0/0',

) {
    case $operatingsystem {
        'RedHat', 'CentOS': {
            fail("Unrecognized operating system")
    }
        /^(Debian|Ubuntu)$/: {

    package {
        'nginx':
            ensure => $version,
	    require  => Exec['apt-get update'];
    }

    file {
        '/etc/nginx/conf.d/default.conf':
            ensure  => absent,
            require => Package['nginx'];
        '/etc/nginx/conf.d/example_ssl.conf':
            ensure  => absent,
            require => Package['nginx'];

        '/etc/nginx/sites-enabled/default':
            ensure  => absent,
            require => Package['nginx'];

        '/etc/nginx/sites-available/default':
            ensure  => absent,
            require => Package['nginx'];

        '/etc/nginx/ssl':
            ensure  => directory,
            owner   => 'root',
            group   => $user,
            mode    => '0750',
            require => Package['nginx'];

        '/etc/nginx/nginx.conf':
            ensure  => present,
            content => template("${module_name}/nginx.conf.erb"),
            require => Package['nginx'];

        '/etc/logrotate.d/nginx':
            ensure  => present,
            content => template("${module_name}/nginx.logrotate.erb"),
            require => Package['nginx'];

    }
    file { ['/var/cache/nginx','/var/cache/nginx/microcache']:
        ensure => 'directory',
        owner  => $user,
        group  => $user,
        mode   => '0750',
    }


    }
    default: { fail("Unrecognized operating system") }
  }
}
