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
            source => "puppet:///modules/ntp/ntp.conf",
            mode => 644,
            notify => Service["ntp"];
    }
}
