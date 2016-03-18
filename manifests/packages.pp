# == Class: sphinx::packages
class sphinx::packages (
    $ensure    = $sphinx::ensure,
    $package   = $sphinx::package,
    $backports = $sphinx::params::backports
) inherits sphinx::params {
    validate_string($ensure)

    if($backports) {
        include apt
        include apt::backports
        apt::pin { 'backports_sphinx':
          ensure   => $ensure,
          packages => [$package],
          priority => 500,
          release  => "${::lsbdistcodename}-backports",
        }

        Exec['apt_update'] -> Package[$package]
    }

    package { $package:
        ensure => $ensure,
    }
}
