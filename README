
This is the mysqlproxy module only for testing.

Installation
============

Copy this entire directory as is into:

    /etc/puppet/modules/mysqlproxy


Usage
=====

To install a package with a configuration and lua script:

    class { 'mysqlproxy':
      address   => '0.0.0.0:3306',
      luascript => '/usr/share/lua/rw-splitting.lua',
      sourceluascript => "mysqlproxy/test/test.lua",
      options   => '--log-use-syslog',
      backends  => ['mysql-master-1:3306', 'mysql-master-2:3307'];
      slaves    => ['mysql-slave-1:3306', 'mysql-slave-2:3306'];
      luascript => '/usr/share/lua/rw-splitting.lua',
    }
