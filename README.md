# Jenkins & Vagrant setup

# Oracle Java 8

```shell
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```

# Jenkins

```shell
wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
java -jar jenkins.war

# Starting Jenkins
sudo service jenkins start
```
Jenkins admin panel: http://localhost:8080/

# Vagrant
```shell
# Vagrant installation
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
sudo dpkg -i vagrant_1.8.1_x86_64.deb
```

# Git
```shell
sudo apt-get install git
```

Plugins
```shell
vagrant plugin install vagrant-digitalocean
vagrant plugin install vagrant-scp
```

Box setup
```shell
# Digital ocean
vagrant box add digital_ocean https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box

# Virtualbox
sudo apt-get install virtualbox
```
Clone the vagrant environment repository
```shell
git clone https://github.com/Bowsse/test_env   vagrant
```

# Setting a developement repository (You should let Jenkins do this)
```shell
mkdir workspace
cd workspace
git clone https://github.com/publishingrepository
cd publishingrepository

# Set git remote to an empty repository
git remote set-url origin https://github.com/developementrepository

git config --global user.email "user@email.com"
git config --global user.name "username"

git add -A
git pull

git push origin master
```

# New jenkins project
Jenkins -> new item -> freestyle project

Github project -> https://github.com/developementrepository

## Source Code Management
Git
* Repository URL https://github.com/developementrepository

* Create and add github credentials

* You can specify a branch track. Leaving it empty means all branches are tracked.

## Build Triggers
* Build when a change is pushed to GitHub
    * Build event is triggered when a change is made in the repository specified above.

Go to Jenkins System configuration

GitHub
* Add GitHub Server
* Add GitHub Credentials
* Manage hooks

Then open the developement Github repository
* Settings
* Webhooks & Services
* Add service Jenkins (Github)
* http://JENKINSURL:8080/github-webhook/

## Build steps (Execute shell)

1. Launch the vagrant environment from the cloned directory

  * cd ~/vagrant
  * vagrant up

2. Run tests in the vagrant machine/droplet

  * vagrant ssh -c "source /vagrant/robotlaunch.sh"

3. Copy the robot results

  * cd ~/vagrant
  * vagrant scp :/root/test/report.html ~/testresults/report.html
  * vagrant scp :/root/test/log.html ~/testresults/log.html
  * vagrant scp :/root/test/output.xml ~/testresults/output.xml

Finally destroy the droplet/virtual machine
  * vagrant destroy --force

## Post-build Actions
### Publish Robot Frmaework test results
Directory of Robot output 
* Directory where the copied robot results are found. In this case ~/testresults.

### Git Publisher
* Push Only If Build Succeeds
 
# Troubleshooting

Use the debug log to launch vagrant
* VAGRANT_LOG=debug vagrant up

## Stuck connecting
http://stackoverflow.com/questions/22575261/vagrant-stuck-connection-timeout-retrying

## SSH
Generating SSH keys
* ssh-keygen -t rsa

```shell
Include in Vagrantfile
config.ssh.private_key_path = "~/.ssh/id_rsa"
config.ssh.forward_agent = true
```

* https://www.digitalocean.com/community/tutorials/how-to-use-digitalocean-as-your-provider-in-vagrant-on-an-ubuntu-12-10-vps
* http://stackoverflow.com/questions/22922891/vagrant-ssh-authentication-failure
* https://www.bountysource.com/issues/3453738-vagrant-can-t-connect-to-digital-ocean-via-ssh

## Workaround for robot results not opening in Jenkins
* Manage Jenkins
* Script Console
```
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP","sandbox allow-scripts; default-src 'none'; img-src 'self' data: ; style-src 'self' 'unsafe-inline' data: ; script-src 'self' 'unsafe-inline' 'unsafe-eval' ;")
```

