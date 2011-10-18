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
