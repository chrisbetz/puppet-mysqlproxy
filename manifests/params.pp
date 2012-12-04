# Class: mysqlproxy:params
#
# This module manages mysqlproxy parameters
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#

class mysqlproxy::params {
  case $::osfamily {
    redhat {
      $config_file = '/etc/default/mysql-proxy'
      $template    = 'mysqlproxy/default.erb'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
