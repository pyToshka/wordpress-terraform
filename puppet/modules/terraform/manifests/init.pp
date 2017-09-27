class terraform (
) {
  exec { "update":
    command => "/usr/bin/apt-get update",
  }

  exec{'get_terraform':
    command => "/usr/bin/wget -q https://releases.hashicorp.com/terraform/0.10.6/terraform_0.10.6_linux_amd64.zip -O /tmp/terraform.zip",
    notify  => Exec['unzip_terraform']
  }

  exec {'unzip_terraform':
    path => '/usr/bin',
    command => 'sudo unzip /tmp/terraform.zip -d /usr/local/bin',
    require => Exec['get_terraform'],
  }
  exec{'get_packer':
    command => "/usr/bin/wget -q https://releases.hashicorp.com/packer/1.1.0/packer_1.1.0_linux_amd64.zip -O /tmp/packer.zip",
  }

  exec {'unzip_packer':
    path => '/usr/bin',
    command => 'sudo unzip /tmp/packer.zip -d /usr/local/bin',
    require => Exec['get_packer'],
  }
}
