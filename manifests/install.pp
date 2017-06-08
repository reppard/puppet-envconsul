# == Class: envconsul::install

class envconsul::install (
  $file_name = $envconsul::fetch::file_name
){
  if $file_name =~ /^.*\.zip/ {
    exec { 'envconsul_unpack':
      command     => "unzip -o /tmp/${file_name}",
      cwd         => '/usr/bin',
      path        => ['/bin', '/usr/bin', '/usr/local/bin'],
      refreshonly => true,
      notify      => File['envconsul_cleanup_file'],
      require     => Class['envconsul::fetch'],
    }
  } elsif $file_name =~ /^.*\.tar\.gz/ {
    exec { 'envconsul_unpack':
      command     => "tar zxf /tmp/${file_name} --strip-components 1",
      cwd         => '/usr/bin',
      path        => ['/bin', '/usr/bin', '/usr/local/bin'],
      refreshonly => true,
      notify      => File['envconsul_cleanup_file'],
      require     => Class['envconsul::fetch'],
    }
  }

  file { 'envconsul_cleanup_file':
    ensure => absent,
    backup => false,
    path   => "/tmp/${file_name}",
  }
}
