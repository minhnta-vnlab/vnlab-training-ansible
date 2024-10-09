sudo useradd -m -s /bin/bash $USERNAME
echo "$USERNAME:$PASSWORD" | sudo chpasswd

echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USERNAME
sudo chmod 0440 /etc/sudoers.d/$USERNAME

echo "Importing SSH keys..."
mkdir -p /home/$USERNAME/.ssh/
echo "$SSH_PUB" >> /home/$USERNAME/.ssh/authorized_keys
