define god::service (
  $process_name = $title,
  $template,
  ) {
  
  include god

  file { "${process_name}.god" :
    ensure  => file,
    path    => "${god::params::config_dir_path}/${process_name}.god",
    mode    => 0755,
    content => template($template),
    notify  => Service[$god::params::service]
  }
}