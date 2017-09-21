define nginx::vhost (
  $host = undef,
  $root = undef,

){
  file {
    "vhost_${fqdn}":
      path    => "/etc/nginx/sites-enabled/${fqdn}",
      content => template("nginx/nginx_vhost.erb"),
      mode    => '0644',
      require => Package['nginx'];

  }
}
