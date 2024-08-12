# Workstation

Ansible repository for configuring my workstations. Currently, it only supports
`Ubuntu`.

## Getting started

Install ansible on Ubuntu.

```sh
sudo apt install software-properties-common
# TODO: check following
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install git ansible
```

Run ansible for the first time.

```sh
sudo ansible-pull -e user=<user> -U https://github.com/gvicentin/workstation.git
```

If you have the repository cloned, you can also do the following:

```sh
sudo ansible-playbook -e user=gvicentin local.yml
```

## Notes

After the first install everything should be updated automatically after every
change in this repository.
