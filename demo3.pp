# Basic class to get the require packages we need installed
class git {
    package {
        "git-core":
            ensure => latest;
    }
}

# Use define to create a new resource type
define git::repo($remote_repo) {
    # We need the git packages
    include git

    exec { 
        # $name is a special variable that refers to the name given to this
        # resource where it's instantiated
        $name:
            require => Class['git'], # Can't run this without git itself!
            command => "/usr/bin/git clone $remote_repo $name",
            creates => $name;
    }
}

# Now we can use this resource type like any other native type
# Clone the puppet-talk repo to /root/puppet-talk
node "lucid32" {
    git::repo {
        "/root/puppet-talk":  # this is $name
            remote_repo => "git://github.com/catlee/puppet-talk.git";
        "/root/buildbot":     # so is this
            remote_repo => "git://github.com/catlee/buildbot.git";
    }
}
