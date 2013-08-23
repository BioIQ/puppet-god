define god::service (
  $process_name = $title,
  $template,
  ) {
  
  include god

  file { "${process_name}.god" :
    ensure  => file,
    path    => "${config_dir_path}/${process_name}.god",
    owner   => $user,
    group   => $group,
    mode    => 0755,
    content => template($template)
  }
}