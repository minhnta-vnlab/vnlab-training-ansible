from yaml import Loader, Dumper
import yaml

def main():
    print("Reading inventory template")
    dump_inventory = ''
    with open('Ansible/inventory/inventory.ini.example') as f:
        dump_inventory = f.read()

    print("Reading settings.yml")
    config = None
    with open('settings.yml') as f:
        config = yaml.safe_load(f)

    print("Making Ansible/inventory/inventory.ini")
    dump_inventory = dump_inventory.replace('<webservers_ips>', config['server']['vm_ip'])
    dump_inventory = dump_inventory.replace('<databases_ips>', config['database']['vm_ip'])
    dump_inventory = dump_inventory.replace('<ssh_user>', config['ssh_username'])

    with open('Ansible/inventory/inventory.ini', 'w') as f:
        f.write(dump_inventory)

    print("Done")

if __name__ == "__main__":
    main()