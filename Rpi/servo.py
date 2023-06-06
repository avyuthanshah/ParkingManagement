import numpy as np
import RPi.GPIO as GPIO
from time import sleep

sCam=15
sEntry=12
sExit=7

GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)

GPIO.setup(sCam,GPIO.OUT)
GPIO.setup(sEntry,GPIO.OUT)
GPIO.setup(sExit,GPIO.OUT)

servo1=GPIO.PWM(sCam,50)
servo2=GPIO.PWM(sEntry,50)
servo3=GPIO.PWM(sExit,50)

def camPosition1():#entry
    servo1.start(2.5)#initial 0
    servo1.ChangeDutyCycle(2.5)

def camPosition2():#exit
    servo1.start(12.5)
    servo1.ChangeDutyCycle(12.5)
    

def entryServo():
    servo2.start(2.5)#initial 0
    for i in np.arrange(2.5,7.6,0.1):
        servo2.ChangeDutyCycle(i)
        sleep(0.05)
    sleep(5)#open gate for 5 sec
    servo2.ChangeDutyCycle(2.5)

def exitServo():
    servo3.start(2.5)#initial 0
    for i in np.arrange(2.5,7.6,0.1):
        servo3.ChangeDutyCycle(i)
        sleep(0.05)
    sleep(5)
    servo3.ChangeDutyCycle(2.5)

def servoOff():
    servo2.start(2.5)
    servo2.stop()
    servo3.start(2.5)
    servo3.stop()
    GPIO.cleanup()
