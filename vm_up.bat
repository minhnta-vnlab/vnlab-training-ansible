@echo off
echo "Booting up UbuntuDatabase VM"
cd Vagrant/UbuntuDatabase
vagrant up
echo "Opening SSH Connection to UbuntuDatabase VM"
start cmd /k "vagrant ssh"

cd ../..

echo "Booting up UbuntuServer VM"
cd Vagrant/UbuntuServer
vagrant up
echo "Opening SSH Connection to UbuntuServer VM"
start cmd /k "vagrant ssh"