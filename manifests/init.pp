# == Class: sphinx
class sphinx (
    $ensure         = $sphinx::params::ensure,
    $service_ensure = $sphinx::params::service_ensure,
    $service_status = $sphinx::params::service_status,
) inherits sphinx::params
{
    anchor { 'sphinx::begin': } ->
        class  { 'sphinx::packages': } ->
        class  { 'sphinx::service': } ->
        anchor { 'sphinx::end': }
}
