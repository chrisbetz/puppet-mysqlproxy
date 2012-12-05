class mysqlproxy::install
{

  package{
    'mysql-proxy':
      ensure => installed
  }
  user { "mysql-proxy":
    ensure => present,
    require => Package["mysql-proxy"],
  }

  file { "/etc/mysql-proxy":
      owner  => root,
      group  => root,
      mode   => 755, 
      ensure => directory,
      require => Package["mysql-proxy"],
  }
  file {  "/etc/mysql-proxy/lua.d":
      owner   => root,
      group   => root,
      mode    => 0644,
      recurse => true,
      purge   => true,
      source  => "puppet:///modules/mysqlproxy/lua.d",
      ensure  => directory,
      require => Package["mysql-proxy"],
  }
  if ($luascript !='')
  {
    file{ "${luascript}":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///modules/mysqlproxy/lua.d/${luascript}",
    }
  }
}
