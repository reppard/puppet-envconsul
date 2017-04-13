# == Class: envconsul::install

class envconsul::install (
  $file_name = $envconsul::fetch::file_name
){
  if $file_name =~ /^.*\.zip/ {
    exec { 'unpack':
      command     => "unzip /tmp/${file_name}",
      cwd         => '/usr/bin',
      creates     => '/usr/bin/envconsul',
      path        => ['/bin', '/usr/bin', '/usr/local/bin'],
      refreshonly => true,
      notify      => File['cleanup_file'],
      require     => Class['envconsul::fetch'],
    }
  } elsif $file_name =~ /^.*\.tar\.gz/ {
    exec { 'unpack':
      command     => "tar zxf /tmp/${file_name} --strip-components 1",
      cwd         => '/usr/bin',
      creates     => '/usr/bin/envconsul',
      path        => ['/bin', '/usr/bin', '/usr/local/bin'],
      refreshonly => true,
      notify      => File['cleanup_file'],
      require     => Class['envconsul::fetch'],
    }
  }

  file { 'cleanup_file':
    ensure => absent,
    backup => false,
    path   => "/tmp/${file_name}",
  }
}
