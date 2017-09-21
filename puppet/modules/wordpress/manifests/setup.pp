class wordpress::app::setup (
  $wp_directory,
  $site_name,
  $site_admin, $admin_pwd, $admin_mail,
  $curl_package = $wordpress::params::curl_package
) inherits wordpress::params {

  # Custom installation process
  file { 'wp-content-installer':
    ensure  => file,
    mode    => '444',
    path    => "${wp_directory}/wp-content/install.php",
    content => template('wordpress/wp-install.php.erb'),
  }

  if !defined(Package[$curl_package]) {
    package { $curl_package: ensure => present }
  }

  # curl to initiate the installation
  $post_values = "weblog_title=$site_name&user_name=$site_admin&admin_password=$admin_pwd&admin_password2=$admin_pwd&admin_email=$admin_mail"
  $post_page = 'http://localhost/wp-admin/install.php?step=2'
  exec { "wordpress-auto-install":
    command     => "curl -d \'${post_values}\' ${post_page}",
    require     => [Package['curl'],Service['mysql'],Service['httpd']],
    refreshonly => true,
    logoutput   => true,
    subscribe   => File['wp-content-installer'],
  }
}