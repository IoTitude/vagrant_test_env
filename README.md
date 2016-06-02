# Oracle Java 8

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer


# Jenkins

wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
java -jar jenkins.war

sudo service jenkins start

http://localhost:8080/

#V agrant
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
sudo dpkg -i vagrant_1.8.1_x86_64.deb

git clone https://github.com/Bowsse/test_env   vagrant

sudo apt-get install virtualbox

Jenkins build step
1. cd /home/jaakko/vagrant
   vagrant up

2. vagrant ssh
   vncserver :89 -geometry 1920x1200 -depth 24
   export DISPLAY=:89
   robot tests/tests.txt
   logout

3. vagrant destroy


# Git
sudo apt-get install git
mkdir repo
cd repo
#Clone the project
git clone https://github.com/Bowsse/Bowsse.github.io.git

cd Bowsse.github.io

# Set git remote to a test repo
git remote set-url origin https://github.com/Bowsse/bowsse_web

git config --global user.email "jaakko.poyhonen@gmail.com"
git config --global user.name "Bowsse"

git add -A
git pull

git push origin master

# New item (jenkins)
freestyle

bowsse_web
github project -> https://github.com/Bowsse/bowsse_web

scm Git https://github.com/Bowsse/bowsse_web

add credientials

*/dev

//build trigger github hook

after build
git publisher
branch to push: master







