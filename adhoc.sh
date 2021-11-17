#!/bin/bash
sudo ansible all -m user -a "name=automation state=present" -u root
sudo ansible all -m authorized_key -a "user=automation state=present key='{{ lookup('file', '/home/automation/.ssh/id_rsa.pub') }}'" -u root
sudo ansible all -m copy -a "dest=/etc/sudoers.d/automation    content='automation	ALL=(ALL)	NOPASSWD: ALL'" -u root
