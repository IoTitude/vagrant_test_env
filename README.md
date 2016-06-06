# Oracle Java 8

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer


# Jenkins

```shell
wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
java -jar jenkins.war

sudo service jenkins start
```

http://localhost:8080/

#V agrant
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
sudo dpkg -i vagrant_1.8.1_x86_64.deb

vagrant plugin install vagrant-digitalocean

vagrant box add digital_ocean https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box

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



# troubleshooting

## stuck
http://stackoverflow.com/questions/22575261/vagrant-stuck-connection-timeout-retrying

## ssh
https://www.digitalocean.com/community/tutorials/how-to-use-digitalocean-as-your-provider-in-vagrant-on-an-ubuntu-12-10-vps
http://stackoverflow.com/questions/22922891/vagrant-ssh-authentication-failure


ssh-keygen -t rsa

chmod 0700 -R /home/jaakko/.ssh

config.ssh.private_key_path = "~/.ssh/id_rsa"
config.ssh.forward_agent = true

https://www.bountysource.com/issues/3453738-vagrant-can-t-connect-to-digital-ocean-via-ssh

Robot result workaround  
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP","sandbox allow-scripts; default-src 'none'; img-src 'self' data: ; style-src 'self' 'unsafe-inline' data: ; script-src 'self' 'unsafe-inline' 'unsafe-eval' ;")


