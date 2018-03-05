# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :sylius do |sylius_config|
        sylius_config.vm.box = "debian/jessie64"

        sylius_config.vm.provider "virtualbox" do |v|
            v.gui = false
            v.memory = 1024
            v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        end

        sylius_config.vm.synced_folder "sites/", "/var/www/sites", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp', 'fsc', 'nolock', 'actimeo=2']
        sylius_config.vm.network "private_network", ip: "10.0.0.200"

        # Shell provisioning
        sylius_config.vm.provision :shell, :path => "shell_provisioner/run.sh"
        sylius_config.vm.provision :shell, privileged: false, path: "shell_provisioner/sylius/create.sh"
        sylius_config.vm.provision :shell, privileged: false, path: "shell_provisioner/sylius/install.sh"
    end
end
