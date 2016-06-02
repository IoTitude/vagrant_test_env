export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

sudo apt-get update
sudo apt-get install -y python-pip git
sudo pip install robotframework
sudo pip install robotframework-extendedselenium2library
sudo apt-get install -y firefox

sudo apt-get install -y vnc4server

git clone https://github.com/iotitude/Tests    tests
