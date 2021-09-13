#!/bin/bash
 
systemctl start zookeeper
systemctl start kafka

while getopts name:num: flag
do
    case "${flag}" in
        name) topic_name=${OPTARG};;
        num) partition_number=${OPTARG};;
    esac
done

/home/kafka/bin/kafka-topics.sh --create --topic $topic_name --bootstrap-server localhost:9092 --partitions $partition_number

