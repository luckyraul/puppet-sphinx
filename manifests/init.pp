# == Class: sphinx
class sphinx (
    $ensure = $sphinx::params::ensure,
) inherits sphinx::params {
{
    anchor { 'sphinx::begin': } -> class { 'sphinx::packages': } -> anchor { 'sphinx::end': }
}
