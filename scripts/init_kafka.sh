#!/bin/bash

apt update
apt install default-jdk

mkdir /home/python

wget https://archive.apache.org/dist/kafka/2.7.0/kafka_2.13-2.7.0.tgz -O /home/kafka.tgz
tar xzf kafka.tgz

mv kafka_2.13-2.7.0 kafka

wget https://raw.githubusercontent.com/ambader/kafka_server_rpi/main/scripts/zookeeper.service -O /etc/systemd/system/zookeeper.service
wget https://raw.githubusercontent.com/ambader/kafka_server_rpi/main/scripts/kafka.service -O /etc/systemd/system/kafka.service
wget https://raw.githubusercontent.com/ambader/kafka_server_rpi/main/scripts/py_kafka.service -O /etc/systemd/system/py_kafka.service

wget https://raw.githubusercontent.com/ambader/kafka_server_rpi/main/scripts/start_kafka.sh -O /home/python/start_kafka.sh
wget https://raw.githubusercontent.com/ambader/kafka_server_rpi/main/scripts/button.py -O /home/python/button.py

systemctl daemon-reload
