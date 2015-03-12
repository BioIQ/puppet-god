class god::params {
  $root_path       = '/etc/god'
  $global_config   = '/etc/god/god.conf'
  $config_dir_path = '/etc/god/conf.d'
  $run_dir         = '/var/run'
  $log_dir         = '/var/log'
  $init_script     = '/etc/init.d/god'
  $service         = 'god'
  $rbenv           = true
  $rbenv_shim_path = '/usr/local/rbenv/shims'
  $binary_path     = $rbenv ? {
  	true    => "${rbenv_shim_path}/god",
  	default => '/usr/bin/god'
  }
  $god               = hiera('god')
  $god_contact_info  = $god['notification_contacts']
  $email_contacts    = $god_contact_info['email']
  $campfire_contacts = $god_contact_info['campfire']
  $prowl_contacts    = $god_contact_info['prowl']
}
