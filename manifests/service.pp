class mysqlproxy::service
{
  service {
    'mysql-proxy':
      ensure    => running,
      hasstatus => true,
      require   => Package["mysql-proxy"]
  }
}
