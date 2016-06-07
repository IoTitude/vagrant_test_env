#!/bin/bash

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# RobotFramework
sudo apt-get update
sudo apt-get install -y python-pip git
sudo pip install robotframework
sudo pip install robotframework-selenium2library
sudo apt-get install -y firefox

#  vnc4server for virtual display
sudo apt-get install -y vnc4server

# expect command for test script
sudo apt-get install -y expect

# clone test cases
git clone https://github.com/IoTitude/Tests.git   test
