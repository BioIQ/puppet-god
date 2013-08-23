class god inherits god::params {
  file { $root_path :
    ensure => directory,
    mode   => 0777
  }

  file { $config_dir_path :
    ensure  => directory,
    mode    => 0777,
    require => File[$root_path]
  }

  file { $global_config :
    ensure  => file,
    mode    => 0755,
    content => "God.load \"${config_dir_path}/*.god\"",
    require => File[$config_dir_path]
  }

  file { $init_script :
    ensure   => file,
    mode     => 0755,
    content  => template('god/god.init.erb')
  }

  service { $service :
    enable     => true,
    ensure     => running,
    hasrestart => true,
    require    => File[$init_script],
  }
}
