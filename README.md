# kafka_server_rpi
Set up a Kafka server on a Raspberry Pi and feed content via GPIO

<img src="https://images.unsplash.com/photo-1585141239600-03449aab6e10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80" width="525">

## Get rpi OS

* dwld [rpi os](https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2021-05-28/2021-05-07-raspios-buster-armhf-lite.zip)
* flash image on sd (I use [balenaEtcher](https://www.balena.io/etcher/)) 
* complete installation on rpi (I use a rpi 3 b v1.2) 

## Actuate Server

dwld'n'run init_kafka.sh

```console
sudo wget https://raw.githubusercontent.com/ambader/kafka_server_rpi/main/scripts/init_kafka.sh
sudo sh init_kafka.sh
```
## Hardware setup

### Construct button circuit

<img src="https://raw.githubusercontent.com/ambader/kafka_server_rpi/main/img/circuit_diagram.png" width="500" height="500">

Created with [fritzing](https://fritzing.org/)

### Button pillar

<img src="https://raw.githubusercontent.com/ambader/kafka_server_rpi/main/img/button.png" width="750" height="350">

-> dwld [.stl file](https://github.com/ambader/kafka_server_rpi/blob/main/img/button.stl) for 3d printers :: Created with [OpenSCAD](https://openscad.org/)

