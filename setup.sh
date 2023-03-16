sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

upddate /etc/ansible/hosts with

[local]
127.0.0.1

[all:vars]
ansible_user=test
ansible_ssh_pass=test

ansible all -m ping

ansible-pull -o -U https://github.com/eedorenko/kalypso-oci-gitops -C dev -d vm | logger -p local4.debug