# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # config.vm.box = "base"
  
    #config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
    #config.box.url = "https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box"

  config.vm.define "web", primary: true do |web|
    
    web.vm.provision "shell", inline: "echo ----- Start installing web server -----"
    web.vm.box = "centos7_vbadd_puppet"
    web.vm.hostname = "vagrant-web"
    web.vm.network "private_network", ip: "192.168.2.10"
    web.vm.provider "virtualbox" do |vb|
      vb.name = "Vagrant_Web"
      #vb.customize ["modifyvm", :id, "--memory", "512"]
      #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize [
        "modifyvm", :id,
	"--groups", "/ProjectSainsbury",
	"--memory", "512"
      ]
    end
    web.vm.provision :shell, path: "provision.sh", args: "web"

  end

  config.vm.define "app1" do |app1|
  #config.vm.define "app1", autostart: false do |app1|
    app1.vm.provision "shell", inline: "echo ----- Start provisioning on app1 -----"
    app1.vm.box = "centos7_vbadd_puppet"
     #config.vm.box = "harshicorp/precise32"
    app1.vm.hostname = "vagrant-app1"
    app1.vm.network "private_network", ip: "192.168.2.11"
    app1.vm.network :forwarded_port, guest: 80, host: 8484, auto_correct: true
    #config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"
    app1.vm.provider "virtualbox" do |vb|
      vb.name = "Vagrant_App1"
      #vb.customize ["modifyvm", :id, "--memory", "512"]
      #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize [
        "modifyvm", :id,
        "--groups", "/ProjectSainsbury",
        "--memory", "512"
        ]
    end
    #app1.vm.provision "file", source: "./very-basic-http-server", destination: "/tmp/"
    app1.vm.provision :shell, path: "provision.sh", args: "app"

  end

  config.vm.define "app2" do |app2|
  #config.vm.define "app2", autostart: false do |app2|

    app2.vm.provision "shell", inline: "echo ----- Start provisioning on app2 -----"
    app2.vm.box = "centos7_vbadd_puppet"
    app2.vm.hostname = "vagrant-app2"
    app2.vm.network "private_network", ip: "192.168.2.12"
    #app2.vm.network :forwarded_port, guest: 80, host: 8484, auto_correct: true
    app2.vm.provider "virtualbox" do |vb|
      vb.name = "Vagrant_App2"
      #vb.customize ["modifyvm", :id, "--memory", "512"]
        vb.customize [
          "modifyvm", :id,
          "--groups", "/ProjectSainsbury",
          "--memory", "512"
        ]
    end
    app2.vm.provision :shell, path: "provision.sh", args: "app"

  end

  #config.vm.define "test" do |test|
  config.vm.define "test", autostart: false do |test|

    test.vm.provision "shell", inline: "echo ----- Start provisioning on test -----"
    test.vm.box = "centos7_vbadd_puppet"
    test.vm.hostname = "vagrant-test"
    #test.vm.network "public_network", auto_config: false
    test.vm.network "private_network", ip: "192.168.2.13"
    test.vm.provision :shell, path: "provision.sh"
    #test.vm.network :forwarded_port, guest: 80, host: 8484, auto_correct: true
    #test.vm.provision :shell do |shell|
    #  shell.path = "provision.sh"
    #end
    test.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      #chef.cookbooks_path = ["./cookbooks"]
      #chef.add_recipe "chef-solo"
      chef.add_recipe "nginx"
      chef.add_recipe "nginx_conf"
      end
    test.vm.provider "virtualbox" do |vb|
      vb.name = "Vagrant_Test"
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "512"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo yum install httpd -y
  # SHELL
end

