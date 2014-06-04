class god(
  $root_path       = $god::params::root_path,
  $global_config   = $god::params::global_config,
  $config_dir_path = $god::params::config_dir_path,
  $run_dir         = $god::params::run_dir,
  $log_dir         = $god::params::log_dir,
  $init_script     = $god::params::init_script,
  $service         = $god::params::service,
  $rbenv           = $god::params::rbenv,
  $rbenv_shim_path = $god::params::rbenv_shim_path,
  $binary_path     = $god::params::binary_path
) inherits god::params {
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
    content  => template('god/god.init.erb'),
    notify   => Service[$service]
  }

  service { $service :
    enable     => true,
    ensure     => running,
    hasrestart => true,
    require    => File[$init_script],
  }
}
