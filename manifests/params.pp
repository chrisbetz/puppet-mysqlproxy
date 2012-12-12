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
    redhat: {
      case $::operatingsystem {
        centos: {
          $config_file = '/etc/sysconfig/mysql-proxy'
          $template    = 'mysqlproxy/centos.erb'
        default: {
          $config_file = '/etc/default/mysql-proxy'
          $template    = 'mysqlproxy/default.erb'
        }
      }
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
