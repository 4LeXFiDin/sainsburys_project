# sainsburys_project

## Description

The purpose of the project is to install a very basic http server reachable through nginx as load balancer. It will install 3 nodes :

* 1 node where with Nginx is installed that will work as a load balancer
* 2 application nodes 

## Requirements

* [git client]
  - Debian/Ubuntu : sudo apt-get install git
  - Fedora, Red Hat or CentOS : sudo yum install git
  - SUSE : sudo zypper -v install git
  - Windows : gitbash or cygwin

* [VirtualBox] - https://www.virtualbox.org

* [Vagrant] - https://www.vagrantup.com/downloads.html
  It works with a lot of Linux platform like Fedora/Centos/RHEL/Debian/Ubuntu and also with Windows or MaxOSX). You can download it at the floolowing address : 

* The CentOS 7 vagrant box is downloadable here :
  https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box

## How To Build The Virtual Machine

Building the virtual machine is this easy:

    host $ git clone https://github.com/4LeXFiDin/sainsburys_project.git
    host $ cd sainsburys_project
    host $ vagrant up --provision

If the base box is not present that command fetches it first.

    host $ vagrant ssh
    Welcome to Ubuntu 14.04 LTS ...
    ...
    vagrant@vagrant:~$

## Usage

After installing the git client, create a folder somewhere and download the project inside with the following command :
git clone https://github.com/4LeXFiDin/sainsburys_project.git

One you have installed vagrant, you have to download the box like this :
vagrant box add centos7_vbadd_puppet https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box

Then, lauch the 3 nodes with the command : vagrant up. It will lauch the 3 nodes

With you browser, you just have to connect a the following address : 192.168.2.10 that is the address of the web server. The nodes have the addresses 192.168.2.11 & 192.168.2.12.

One of the purpose is to receive the following message from the load balancer that hosts the very-basic-http-server : Hi there, I'm served from 192.168.2.10!

## Provisionning

* Chef Solo

## Cookbooks

 - build-essential
 - nginx
 - nginx_conf
 - ohai
 - yum
 - yum-epel

## License and Author

Author:: Alexandre D.

Copyright:: No :)
