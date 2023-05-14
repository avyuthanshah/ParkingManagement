import RPi.GPIO as GPIO
from time import sleep

sCam=15
sEntry=12
sExit=17
GPIO.setmode(GPIO.BOARD)
GPIO.setup(sCam,GPIO.OUT)
GPIO.setup(sEntry,GPIO.OUT)
GPIO.setup(sExit,GPIO.OUT)

def camPosition1():#entry
    servo1=GPIO.PWM(sCam,50)
    servo1.start(2.5)#initial 0
    #servo1.stop()
    GPIO.cleanup()

def camPosition2():#exit
    servo1=GPIO.PWM(sCam,50)
    servo1.start(2.5)#initial 0
    servo1.ChangeDutyCycle(12.5)
    #servo1.stop()
    GPIO.cleanup()

def entryServo():
    servo2=GPIO.PWM(sEntry,50)
    servo2.start(2.5)#initial 0
    for i in range(2.5,12.6):
        servo2.ChangeDutyCycle(i)
        sleep(0.2)
    sleep(5)
    servo2.ChangeDutyCycle(2.5)
    servo2.stop()
    GPIO.cleanup()


def exitServo():
    servo3=GPIO.PWM(sExit,50)
    servo3.start(2.5)#initial 0
    for i in range(2.5,12.6):
        servo3.ChangeDutyCycle(i)
        sleep(0.2)
    sleep(5)
    servo3.ChangeDutyCycle(2.5)
    servo3.stop()
    GPIO.cleanup()