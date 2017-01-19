# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
class packages::jdk17 {

  anchor {
        'packages::jdk17::begin': ;
        'packages::jdk17::end': ;
    }

    case $::operatingsystem {
        CentOS: {
            realize(Packages::Yumrepo['security_update_1319455'])
            package {
                ["java-1.7.0-openjdk", "java-1.7.0-openjdk-devel"]:
                    ensure => "1.7.0.121-2.6.8.1.el6_8";
            }
        }
        default: {
            fail("cannot install on $::operatingsystem")
        }
    }

}