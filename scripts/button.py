import RPi.GPIO as GPIO
import threading
import time
from kafka import KafkaProducer
import sys
from random import randrange

GPIO.setmode(GPIO.BOARD)
GPIO.setup(12,GPIO.IN,pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(10,GPIO.OUT)

nn=0

led_on = False

producer = KafkaProducer(bootstrap_servers=["localhost:9092"])

def led_blink():
	global led_on
	while True:
		if led_on == False:
			GPIO.output(10,GPIO.LOW)
			time.sleep(0.1)
		else:
			GPIO.output(10,GPIO.HIGH)
			time.sleep(0.5)
			led_on=False

blink = threading.Thread(target=led_blink)
blink.start()

while True:
	if GPIO.input(12) == GPIO.HIGH:
		nn+=1
		out = randrange(1000)
		producer.send(str(sys.argv),eval("b'"+time.strftime("%a-%D.%b %Y %H:%M:%S")+":"+str('%.5f'%time.time())[-5:]+" -> "+str(out)+"'"))
		led_on=True
