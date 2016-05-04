# == Class: envconsul::fetch

class envconsul::fetch (
  $base_url  = "${envconsul::releases_url}/${envconsul::version}",
  $base_name = "envconsul_${envconsul::version}_${envconsul::platform}_${envconsul::arch}",
  $extension = $envconsul::extension,
){
  $file_name = "${base_name}${extension}"
  $file_url  = "${base_url}/${file_name}"

  wget::fetch { 'file_url':
    source      => $file_url,
    destination => "/tmp/${file_name}",
    timeout     => 600,
    verbose     => true,
  }
}
