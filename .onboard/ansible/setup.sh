# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

## Install ansible
## copy files

sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

install yq

upddate /etc/ansible/hosts with

mkdir -p /opt/kalypso/log

[local]
127.0.0.1

[all:vars]
ansible_user=test
ansible_ssh_pass=test

ansible all -m ping

ansible-pull -o -U https://github.com/eedorenko/kalypso-oci-gitops -C dev -d vm | logger -p local4.debug

        # ./opt/kalypso/reconcile.sh {{repo_url}} {{repo_branch}} {{repo_folder}}  >> /opt/kalypso/log/gitops-{{repo_branch}}-{{repo_folder}}.log 2>>&1
        job: "./opt/kalypso/reconcile.sh {{repo_url}} {{repo_branch}} {{repo_folder}} > /opt/kalypso/log/gitops-{{repo_branch}}-{{repo_folder}}.log 2>&1"