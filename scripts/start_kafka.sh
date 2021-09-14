#!/bin/bash
 
systemctl start zookeeper

while ! systemctl is-active --quiet zookeeper
do
 sleep 1
done

systemctl start kafka

while ! systemctl is-active --quiet kafka
do
 sleep 1
done

while getopts n:i:r: flag
do
    case "${flag}" in
        n) topic_name=${OPTARG};;
        i) partition_number=${OPTARG};;
        r) $replication_factor=${OPTARG};;
    esac
done

/home/kafka/bin/kafka-topics.sh --create --topic $topic_name --zookeeper localhost:2181 --partitions $partition_number --replication-factor $replication_factor

