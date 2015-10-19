#!/bin/bash

vbhs=very-basic-http-server

echo -e "--- Provisioning virtual Machine... ---"

echo -e "--- Setting up keyboard US ---"

localectl set-locale LANG=en_US.UTF-8
localectl set-x11-keymap en
localectl set-keymap en
export LANG=en_US.UTF8
#echo "LANG=\"en_US.UTF8\"" > /etc/sysconfig/i18n

#localectl set-locale LANG=fr_FR.UTF-8
#localectl set-x11-keymap fr
#localectl set-keymap fr
#export LANG=fr_FR.UTF8

if [[ $1 == "web" ]] ; then

  echo -e "--- Installing EPEL repository ---"
  yum install epel-release -y

  echo -e "--- Installing Nginx ---"
  yum install nginx -y > /dev/null
  cp /vagrant/nginx_rp.conf /etc/nginx/conf.d/nginx_rp.conf
  chmod 644 /etc/nginx/conf.d/nginx_rp.conf
  chmod 755 /var/log/nginx

  echo -e "--- Setting up firewall ---"
  sudo firewall-cmd --permanent --add-service=http
  sudo firewall-cmd --reload

  echo -e "Starting $vbhs"
  systemctl start nginx.service
  systemctl enable nginx.service

elif [[ $1 == "app" ]] ; then

  echo -e "--- Setting up firewall ---"
  sudo firewall-cmd --permanent --add-port=8484/tcp
  sudo firewall-cmd --reload

  echo -e "Installing very-basic-http-server"
  cp /vagrant/$vbhs/bin/$vbhs /usr/bin
  #chmod 755 /usr/bin/$vbhs
  cp /vagrant/$vbhs/init.d/$vbhs /etc/init.d/$vbhs

  echo -e "Starting very-basic-http-server"
  #systemtctl enable $vbhs
  systemctl start $vbhs

#else

  #echo -e "ERROR during scripting execution"

fi

