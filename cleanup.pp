class cleanup {
    package {
        "ntp":
            ensure => purged;
        "apache2":
            ensure => purged;
        "git-core":
            ensure => purged;
    }
    file {
        "/etc/ntp.conf":
            ensure => absent;
        "/root/puppet-talk":
            force => true,
            ensure => absent,
            recurse => true;
        "/root/buildbot":
            force => true,
            ensure => absent,
            recurse => true;
    }
}

include cleanup

exec {
    "/usr/bin/apt-get -y autoremove": 
        require => Class['cleanup'];
}
