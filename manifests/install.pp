# == Class: envconsul::install

class envconsul::install (
  $file_name = $envconsul::fetch::file_name
){
  exec { "tar zxf /tmp/${file_name} --strip-components 1":
    cwd     => '/usr/bin',
    creates => '/usr/bin/envconsul',
    path    => ['/usr/bin', '/usr/local/bin'],
    notify  => [ File['cleanup_file'], File['cleanup_dir'] ],
    require => Class[envconsul::fetch],
  }

  file { 'cleanup_file':
    ensure => absent,
    path   => "/tmp/${envconsul::fetch::base_name}"
  }
  file { 'cleanup_dir':
    ensure => absent,
    path   => "/tmp/${envconsul::fetch::file_name}"
  }
}
