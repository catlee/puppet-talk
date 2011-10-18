define git::repo($remote_repo) {
    include git

    exec {
        "${name}-clone":
            require => Class['git'],
            command => "/usr/bin/git clone $remote_repo $name",
            creates => $name;
    }
}

class git {
    package {
        "git-core":
            ensure => latest;
    }
}

# Now we can use this resource type like any other native type
# Clone the puppet-talk repo to /root/puppet-talk
git::repo {
    "/root/puppet-talk": 
        remote_repo => "git://github.com/catlee/puppet-talk.git";
}
