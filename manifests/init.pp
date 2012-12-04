# Class: mysqlproxy
#
# This module manages mysqlproxy

#
# Parameters:
#
# [*config_file*]
# 'Mysqlproxy' file.
# Only set this, if your platform is not supported or you know, what you're doing.
# Default: auto-set, platform specific
#
# [*template*]
# Template to use.
# Only set this, if your platform is not supported or you know, what you're doing.
# Default: auto-set, platform specific
#
# Actions:
# Manages 'Mysql Proxy' content.
#
# Requires:
# Nothing
#
# Sample Usage:
# class { 'mysqlproxy':
#   address   => '0.0.0.0:3306',
#   luascript => '/usr/share/lua/rw-splitting.lua',
#   sourceluascript => "mysqlproxy/test/test.lua",
#   options   => '--log-use-syslog',
#   backends  => ['mysql-master-1:3306', 'mysql-master-2:3307'];
#   slaves    => ['mysql-slave-1:3306', 'mysql-slave-2:3306'];
#   luascript => '/usr/share/lua/rw-splitting.lua',
# }
#
# [Remember: No empty lines between comments and class definition]

class mysqlproxy (
  $defaultenabled = 'true',
  $address = '',
  $backends = '',
  $slaves = '',
  $luascript = '',
  $sourceluascript = '',
  $options = '',
  $adminaddress = '',
  $adminusername = '',
  $adminpassword = '',
  $adminluascript = '',
  $log_level = 'error',
  $log_file = '/var/log/mysql-proxy.log',
  $config_file = $mysqlproxy::params::config_file,
  $template = $mysqlproxy::params::template
) inherits mysqlproxy::params {

  include install
  include service

  file { $config_file:
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($template),
    require => Package["mysql-proxy"],
  }

  file{ $luascript:
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => $sourceluascript,
  }
}
