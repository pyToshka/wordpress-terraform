# Define: java
#
# This module manages Java.
#
# Parameters:
#
# $java_version::         The java version. Possible values at this time are
#                         <tt>6</tt> and <tt>7</tt>.
#                         Defaults to the resource's title.
#
# $java_default_version:: The java default version. Possible values at this time
#                         are <tt>6</tt> and <tt>7</tt>.
#                         If different than +undef+ it will be used to configure
#                         the alternative system.
#                         Defaults to +undef+.
#
# Actions:
#
# Declares all other defines in the java module needed for installing Java.
# Currently, these consists of java::install, and java::config.
# If hiera defines a value for the parameter <tt>java_default_version</tt> on
# the target node the command <tt>update-alternatives</tt> is issued to set the
# default java accordingly.
#
# Requires: see Modulefile
#
# Sample Usage:
#
#  java {'6': }
define java (
  $java_version         = $title,
  $java_default_version = hiera('java::java_default_version', undef)) {
  if $::osfamily == 'Debian' {
    include apt
  }
  java::install_config { $java_version:
    java_default_version => $java_default_version,
  }
}
