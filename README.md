# VNLab Training - Ansible
### Vagrant VMWare

Create `settings.yml` base on the example below:
```yml
# Config for SSH
ssh_username: <ssh-username>
ssh_password: <ssh-password>
ssh_pubkey: <ssh-public-key>
# Config for Database Virtual machine
database:
  vm_ip: "192.168.33.21"
  vm_name: "vnlab_database"
  vm_port_forwarding:
    - guest: 5432
      host: 5432

  postgres_db: <database>
  postgres_username: <pg_username>
  postgres_password: <pg_password>

# Config for Server Virtual machine
server:
  vm_ip: "192.168.33.22"
  vm_name: "vnlab_server"
  vm_port_forwarding:
    - guest: 80
      host: 80
  
  domains:
    - frontend: 'y2aa-frontend.test'
    - backend:  'y2aa-backend.test'
```

Run `vm_up.bat` to start Vagrant and open 2 SSH Connection to your VM.
```
./vm_up.bat
```
Just in case you already have your own machines to run, manually edit the `Ansible/inventory/inventory.ini` file base on the example below:
```ini
[webservers]
<webservers_ips>

[databases]
<databases_ips>

[all:vars]
ansible_ssh_user=<ssh_user>
```
### Ansible
Run `playbook.yml` to setup everything
```
ansible-playbook playbook.yml
```
