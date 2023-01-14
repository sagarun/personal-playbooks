Playbooks to setup my personal workstation

Usage
------

```bash
ansible-playbook fedora.yml -i 127.0.0.1, -c local  -e "ansible_user=$USER" -e "ansible_group=$GROUP" --ask-vault-pass --ask-become-pass
```
