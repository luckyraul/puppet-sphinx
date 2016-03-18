# == Class: sphinx::params
class sphinx::params {
    $ensure = present
    $package = 'sphinxsearch'
    case $::operatingsystem {
        'Debian': {
          case $::lsbdistcodename {
              'wheezy': {
                  $backports = false
              }
              'jessie': {
                  $backports = true
              }
              default: {
                  fail("Unsupported release: ${::lsbdistcodename}")
              }
          }
        }
        default: {
            fail("Unsupported os: ${::operatingsystem}")
        }
    }
}
