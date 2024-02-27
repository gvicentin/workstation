# Workstation

Ansible repository for configuring my workstations. Currently, it only supports
`Ubuntu`.

## Getting started

Install ansible on Ubuntu.

```sh
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

Run ansible for the first time.

```sh
sudo ansible-pull -U https://github.com/gvicentin/workstation.git
```

## Notes

After the first install everything should be updated automatically after every
change in this repository.
