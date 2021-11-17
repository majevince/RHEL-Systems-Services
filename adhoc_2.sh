#!/bin/bash
sudo ansible all -m yum_repository -a  "name=EPEL description=RHEL8 state=absent baseurl=https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rmp gpgcheck=no enabled=no" -u root
