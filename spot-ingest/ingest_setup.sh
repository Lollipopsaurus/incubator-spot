#!/bin/bash

#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Sourcing spot configuration variables
source /etc/spot/spot.conf

mkdir ${LUSER}/apache-spot-1.0-incubating/spot-ingest/src
cd ${LUSER}/apache-spot-1.0-incubating/spot-ingest/src

wget  --no-check-certificate https://bootstrap.pypa.io/get-pip.py 
sudo -H python get-pip.py

sudo -H pip install kafka-python

sudo -H pip install watchdog

sudo yum -y groupinstall "Development Tools"

git clone https://github.com/Open-Network-Insight/spot-nfdump.git 
cd spot-nfdump
./install_nfdump.sh 
cd ..

sudo yum -y install gtk2-devel gtk+-devel bison qt-devel qt5-qtbase-devel sudo yum -y groupinstall "Development Tools"
sudo yum -y install libpcap-devel
#compile Wireshark
wget https://1.na.dl.wireshark.org/src/wireshark-2.2.3.tar.bz2 tar xvf wireshark-2.0.1.tar.bz2
cd wireshark-2.0.1
./configure --with-gtk2 --disable-wireshark
make 
sudo make install
cd ..

wget https://repo1.maven.org/maven2/org/apache/spark/spark-streaming-kafka- 0-8-assembly_2.11/2.0.0/spark-streaming-kafka-0-8-assembly_2.11-2.0.0.jar 
