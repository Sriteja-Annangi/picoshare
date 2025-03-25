#!/bin/bash

# Update the system and install dependencies
sudo apt update -y
sudo apt upgrade -y

# Install Docker
sudo apt install -y docker.io

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add the current user to the Docker group to avoid needing sudo with Docker commands
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clone the Git repository (change the URL to your repository)
cd /home/ubuntu
git clone https://github.com/your-user/picoshare.git
cd picoshare

# Make sure the Dockerfile and docker-compose.yml are in the repository

# Build and run the Docker containers with docker-compose
sudo docker-compose up -d

# Output the EC2 instance public IP and confirm the app is running
IP=$(curl -s http://checkip.amazonaws.com)
echo "Your EC2 instance is set up and the app is running on port 4002. Access it at http://$IP:4002."
