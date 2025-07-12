# ansible-saltstack

# infra
The whole infra is running in incus containers but playbooks should be working
in VM or physical machines. Example of infra can be as following:

```bash
root@ubu-incus:~# incus ls
+----------------+---------+-----------------------+------+-----------+-----------+
|      NAME      |  STATE  |         IPV4          | IPV6 |   TYPE    | SNAPSHOTS |
+----------------+---------+-----------------------+------+-----------+-----------+
| saltmaster     | RUNNING | 10.187.242.63 (eth0)  |      | CONTAINER | 0         |
+----------------+---------+-----------------------+------+-----------+-----------+
| sys-alma9-dev1 | RUNNING | 10.187.242.133 (eth0) |      | CONTAINER | 0         |
+----------------+---------+-----------------------+------+-----------+-----------+
| sys-deb12-dev1 | RUNNING | 10.187.242.18 (eth0)  |      | CONTAINER | 0         |
+----------------+---------+-----------------------+------+-----------+-----------+
| sys-ubu22-dev1 | RUNNING | 10.187.242.99 (eth0)  |      | CONTAINER | 0         |
+----------------+---------+-----------------------+------+-----------+-----------+
```

# inventory hosts
Inventory host file can look like following

```bash

❯ cat inventories/hosts
[all:children]
saltmasters
saltminions

[saltmasters]
saltmaster

[saltminions]
salt-alma9-dev1
salt-alma9-prod
salt-deb12-dev1
salt-deb12-prod
salt-ubu22-dev1
salt-ubu22-prod

[all:vars]
ansible_user = masum

```
# Usages

- Run saltmaster.yml to install salt-master.

```bash
ansible-playbook -i inventories/hosts saltmaster.yml
```

- Run saltminion.yml to install salt-minions.

```bash
ansible-playbook -i inventories/hosts saltminions.yml
```

# commands
various related commands.

```bash
[root@saltmaster ~]# salt --version
salt 3007.6 (Chlorine)
[root@saltmaster ~]# salt-master --version
salt-master 3007.6 (Chlorine)
[root@saltmaster ~]#

[root@saltmaster ~]# salt-key -L
Accepted Keys:
sys-alma9-dev1
sys-alma9-prod
sys-deb12-dev1
sys-deb12-prod
sys-ubu22-dev1
sys-ubu22-prod
Denied Keys:
Unaccepted Keys:
Rejected Keys:
[root@saltmaster ~]#
[root@saltmaster ~]# salt -E '.*' cmd.run 'uname -m'
sys-alma9-prod:
    aarch64
sys-deb12-dev1:
    aarch64
sys-ubu22-prod:
    aarch64
sys-ubu22-dev1:
    aarch64
sys-alma9-dev1:
    aarch64
sys-deb12-prod:
    aarch64
[root@saltmaster ~]#

```

