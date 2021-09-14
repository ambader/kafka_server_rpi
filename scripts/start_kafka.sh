#!/bin/bash
 
systemctl start zookeeper
systemctl start kafka

until systemctl is-active --quiet kafka
do
 sleep 1
done

while getopts n:i: flag
do
    case "${flag}" in
        n) topic_name=${OPTARG};;
        i) partition_number=${OPTARG};;
    esac
done

/home/kafka/bin/kafka-topics.sh --create --topic $topic_name --bootstrap-server localhost:9092 --partitions $partition_number

