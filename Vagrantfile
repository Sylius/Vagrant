# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

module OS
    def OS.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :sylius do |sylius_config|
        sylius_config.vm.box = "michaelward82/trusty64-php7"

        sylius_config.vm.provider "virtualbox" do |v|
            v.gui = false
            v.memory = 2048
            v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        end

        if (defined?(OS.windows)).nil?
            sylius_config.vm.synced_folder "sites/", "/var/www/sites", mount_options: [ "dmode=775", "fmode=774" ]
        else
            sylius_config.vm.synced_folder "sites/", "/var/www/sites", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp', 'fsc', 'nolock', 'actimeo=2']
        end
        sylius_config.vm.network "private_network", ip: "10.0.0.200"

        # Shell provisioning
        sylius_config.vm.provision :shell, :path => "shell_provisioner/run.sh"
        sylius_config.vm.provision :shell, privileged: false, path: "shell_provisioner/module/sylius.sh"
    end
end