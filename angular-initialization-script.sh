#!/bin/bash

# Install Dependencies

## Update Package Repositories
sudo apt update -y

## Install Git
sudo apt install -y git

## Install curl
sudo apt install -y curl

## Install Caddy

### Add Caddy Package
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/caddy-stable.asc
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

### Update Package Repositories

sudo apt update -y

### Install Caddy
sudo apt install caddy

# Download Project Artifacts
git clone https://github.com/LaunchCodeTechnicalTraining/angular-tour-of-heroes-artifacts

# Configure Web Server

## Create Caddyfile
(
cat <<'EOF'
https://localhost {
    root * /home/student/angular-tour-of-heroes-artifacts/
    file_server
}
EOF
) > Caddyfile

## Reload Caddy
sudo caddy reload
