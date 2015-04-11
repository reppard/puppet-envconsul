# == Class: envconsul::fetch

class envconsul::fetch (
  $base_url  = 'https://github.com/hashicorp/envconsul/releases/download',
  $base_name = "envconsul_${envconsul::version}_${envconsul::platform}_${envconsul::arch}",
  $extension = '.tar.gz',
){

  $file_name = "${base_name}${extension}"
  $file_url  = "${base_url}/v${envconsul::version}/${file_name}"

  wget::fetch { $file_url:
    destination => "/tmp/${file_name}",
    timeout     => 600,
    verbose     => true,
  }
}
