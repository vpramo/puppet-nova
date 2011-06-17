class nova::scheduler( $enabled ) inherits nova {

  if $enabled {
    $service_ensure = 'running'
  } else {
    $service_ensure = 'stopped'
  }

  package { "nova-scheduler":
    ensure  => present,
    require => Package["python-greenlet"]
  }

  service { "nova-scheduler":
    ensure  => $service_ensure,
    enable  => $enabled,
    require => Package["nova-scheduler"],
    #subscribe => File["/etc/nova/nova.conf"]
  }
}