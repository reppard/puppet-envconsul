# == Class: envconsul::install

class envconsul::install (
  $file_name = $envconsul::fetch::file_name
){
  if $file_name =~ /^.*\.zip/ {
    exec { 'unpack':
      command     => "unzip -o /tmp/${file_name}",
      cwd         => '/usr/bin',
      path        => ['/bin', '/usr/bin', '/usr/local/bin'],
      refreshonly => true,
      notify      => File['cleanup_file'],
      require     => Class['envconsul::fetch'],
    }
  } elsif $file_name =~ /^.*\.tar\.gz/ {
    exec { 'unpack':
      command     => "tar zxf /tmp/${file_name} --strip-components 1",
      cwd         => '/usr/bin',
      path        => ['/bin', '/usr/bin', '/usr/local/bin'],
      refreshonly => true,
      notify      => File['cleanup_file'],
      require     => Class['envconsul::fetch'],
    }
  }

  file { 'cleanup_file':
    ensure => absent,
    path   => "/tmp/${file_name}",
  }
}
