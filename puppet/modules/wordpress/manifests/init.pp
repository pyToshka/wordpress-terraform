class wordpress {
# Load all variables

  class { "wordpress::conf": }
  class { "wordpress::wp":}
  include ::php
  notify { "WordPress Installation Complete":
    require => Class["wordpress::wp"]
  }
}
