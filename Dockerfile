FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV ANSIBLE_HOST_KEY_CHECKING=False

# Install packages
RUN apt-get update && \
    apt-get install -y \
    ansible \
    openssh-client \
    sshpass && \
    rm -rf /var/lib/apt/lists/*

# Create ansible directory
WORKDIR /ansible

# Copy files
COPY playbook.yml .
COPY inventory .

# Default command
CMD ["ansible-playbook", "-i", "inventory", "playbook.yml", "--ask-pass"]