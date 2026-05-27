# docker-ansible

This repository provides a minimal setup to run Ansible playbooks from inside a Docker container.

Contents

- `Dockerfile`: builds an image based on `ubuntu:latest` with `ansible`, `openssh-client`, and `sshpass` installed. The container copies `playbook.yml` and `inventory` and runs `ansible-playbook` by default using `--ask-pass`.
- `playbook.yml`: a simple playbook that:
  - checks whether a reboot is required and performs it if necessary,
  - runs `apt autoremove` to remove no-longer-needed packages.
- `inventory`: a hosts list (expected next to `playbook.yml` inside the container).

Usage

1. Build the Docker image:

```bash
docker build -t docker-ansible .
```

2. Run the container (you will be prompted for the SSH password):

```bash
docker run --rm -it \
  -v "$PWD/playbook.yml:/ansible/playbook.yml:ro" \
  -v "$PWD/inventory:/ansible/inventory:ro" \
  docker-ansible
```
