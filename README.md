# Description
This configuration includes following software:

* Debian 8.1
* PHP 7.0
* MySQL 5.6 Percona Server
* Apache 2.2.22
* Composer
* Curl
* Vim
* Git

# Usage

First you need to download a [Sylius standard project](https://github.com/Sylius/Sylius-Standard) (`-n` flag for no interaction mode):
```bash
$ composer create-project -s beta -n sylius/sylius-standard acme
```

Then clone this repository inside newly created project:
```bash
$ cd acme
$ git clone git@github.com:Sylius/Vagrant.git vagrant
```

And build Vagrant:
```bash
$ cd vagrant
$ vagrant up
```

While waiting for Vagrant to start up, you should add an entry into /etc/hosts file on the host machine.

```
10.0.0.200      sylius.dev
```

From now you should be able to access your Sylius project at [http://sylius.dev/app_dev.php](http://sylius.dev/app_dev.php)

Installing your assets manually

```bash
$ vagrant ssh -c 'cd /var/www/sylius && ./node_modules/.bin/gulp'
```

# Troubleshooting

### Beware

The default vagrant configuration uses a database connection with user `root` and password `vagrant`. If you create a project without interaction (`-n` flag in `composer create-project`) or leave a null value for password, vagrant’s Sylius setup will take care of password change. Otherwise, you will have to change it on your own.

Using Symfony2 inside Vagrant can be slow due to synchronisation delay incurred by NFS. To avoid this, both locations have been moved to a shared memory segment under ``/dev/shm/sylius``.

To view the application logs, run the following commands:

```bash
$ tail -f /dev/shm/sylius/app/logs/prod.log
$ tail -f /dev/shm/sylius/app/logs/dev.log
```

To view the apache logs, run the following commands:

```bash
$ tail -f /var/log/apache2/sylius_error.log
$ tail -f /var/log/apache2/sylius_access.log
```
