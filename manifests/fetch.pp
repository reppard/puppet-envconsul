# == Class: envconsul::fetch

class envconsul::fetch (
  $base_url  = "${envconsul::releases_url}/${envconsul::version}",
  $base_name = "envconsul_${envconsul::version}_${envconsul::platform}_${envconsul::arch}",
  $extension = $envconsul::extension,
){
  $file_name = "${base_name}${extension}"
  $file_url  = "${base_url}/${file_name}"

  wget::fetch { 'envconsul_file_url':
    source      => $file_url,
    destination => "/tmp/${file_name}",
    timeout     => 600,
    verbose     => true,
    unless      => "test -x /usr/bin/envconsul && /usr/bin/envconsul --version 2>&1 | grep -q '${envconsul::version}'",
    notify      => Exec['envconsul_unpack'],
  }
}
