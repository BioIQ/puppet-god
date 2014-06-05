Puppet God module
===============
A simple module for setting and managing God monitoring (ruby)

## Requirements

Only tested on Debian. No provisions have been made for this to work on other systems.

## Usage

```
include god
```

## Advanced Usage

```
class {
    'god':
        root_path       => '/etc/god',
        global_config   => '/etc/god/god.conf',
        config_dir_path => '/etc/god/conf.d',
        run_dir         => '/var/run',
        log_dir         => '/var/log',
        init_script     => '/etc/init.d/god',
        service         => 'god',
        binary_path     => '/usr/bin/god'
}
```