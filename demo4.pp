# demo2.pp
class ntp {
    package {
        "ntp":
            ensure => latest;
    }
    service {
        "ntp":
            require => Package['ntp'],
            enable => true,
            ensure => running;
    }
    file {
        "/etc/ntp.conf":
            content => template("/vagrant/ntp.conf.erb"),
            mode => 644,
            notify => Service["ntp"];
    }
}

$servers = ["ntp.mydomain.com", "ntp2.mydomain.com"]
include ntp
