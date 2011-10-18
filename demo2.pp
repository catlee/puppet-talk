class apache {
    package {
        "apache2":
            ensure => latest;
    }

    service {
        "apache2":
            require => Package["apache2"],
            enable => true,
            ensure => running;
    }
}

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
    #file {
        #"/etc/ntp.conf":
            #source => "/vagrant/ntp.conf",
            #mode => 644,
            #notify => Service["ntp"];
    #}
}

node "lucid32" {
    include apache
    #include ntp
}
