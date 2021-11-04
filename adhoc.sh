#!/bin/bash
ansible all -m yum_repository -a "name=EPEL description=RHEL8 baseurl=https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rmp gpgcheck=no enabled=no state=absent"
