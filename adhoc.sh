#!/bin/bash
sudo -i ansible all -i /home/sandy/ansible/inventory -m yum_repository -a "name=EPEL description=RHEL8 baseurl=https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rmp gpgcheck=no enabled=yes state=absent" -u root
