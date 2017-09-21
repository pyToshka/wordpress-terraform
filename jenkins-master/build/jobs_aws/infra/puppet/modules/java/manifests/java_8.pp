# Class: java::java_8
#
# This class installs Java-8.
#
# Parameters:
#
# none
#
# Actions:
#
# Installs Java-8 by declaring the +java+ define.
#
# Requires: see Modulefile
#
# Sample Usage:
#
#  include java::java_8
class java::java_8 {

  java {'8': }
}
