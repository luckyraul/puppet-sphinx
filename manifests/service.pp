# == Class sphinx::service
#
# This class is meant to be called from sphinx It ensure the service is stopped
# since we manage sphinx instances from the sphinx::instance resource.
#
class sphinx::service(
    $ensure = $sphinx::service_ensure,
    $status = $sphinx::service_status,
) inherits sphinx::params {

  service { 'sphinxsearch':
    ensure => $ensure
    enable => $status,
  }
}
