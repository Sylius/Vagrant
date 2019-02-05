## 🚨This project has been abandoned 🚨

Since [Sylius-Standard v1.3.0](https://github.com/Sylius/Sylius-Standard/tree/v1.3.0) we are supporting Docker out of the box. Please use a docker configuration for your end projects.

# Description
This configuration includes following software:

* Debian 8.1
* PHP 7.1
* MySQL 5.6 Percona Server
* Apache 2.2.22
* Composer
* Curl
* Vim
* Git

# Usage

First you need to download this repository
```bash
$ git clone git@github.com:Sylius/Vagrant.git vagrant
```

And build Vagrant:
```bash
$ cd vagrant
$ vagrant up
```

While waiting for Vagrant to start up, you should add an entry into /etc/hosts file on the host machine.

```
10.0.0.200      sylius.test
```

From now you should be able to access your Sylius project at [http://sylius.test/app_dev.php](http://sylius.test/app_dev.php).

Your newly created project is available under `sylius` folder.

Installing your assets manually

```bash
$ vagrant ssh -c 'cd /var/www/sylius && ./node_modules/.bin/gulp'
```

# Troubleshooting

### Beware

Using Symfony2 inside Vagrant can be slow due to synchronisation delay incurred by NFS. To avoid this, both locations have been moved to a shared memory segment under ``/dev/shm/sylius``.

To view the application logs, run the following commands (inside Vagrant):

```bash
$ tail -f /dev/shm/sylius/app/logs/prod.log
$ tail -f /dev/shm/sylius/app/logs/dev.log
```

To view the apache logs, run the following commands (inside Vagrant):

```bash
$ tail -f /var/log/apache2/sylius_error.log
$ tail -f /var/log/apache2/sylius_access.log
```

# Configure vagrant to contribute on Sylius Core

### Use sylius for contribution

Edit "Vagrantfile" and replace this following line:

```bash
sylius_config.vm.provision :shell, privileged: false, path: "shell_provisioner/sylius/create.sh" 
```

By this one:
 
 ```bash
sylius_config.vm.provision :shell, privileged: false, path: "shell_provisioner/sylius/create_for_contribution.sh"
```

### Clone your own sylius repository

```bash
git clone https://github.com/{user}/Sylius sites/sylius
```

replace `{user}` with your github account user name

## Build Vagrant:

```bash
$ vagrant up
```
