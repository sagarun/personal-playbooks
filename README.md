Playbooks to setup my personal workstation

Usage
------

```bash
ansible-playbook fedora.yml -i 127.0.0.1, -c local  -e "ansible_user=saga" --ask-vault-pass --ask-sudo-pass
```
