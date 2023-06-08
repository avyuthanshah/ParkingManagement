import time
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

class gatesense:
    def __init__(self,trig,echo):
        self.TRIGGER=trig
        self.ECHO=echo
#set GPIO Pins
    def getDistance(self):
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(self.TRIGGER, GPIO.OUT)
        GPIO.setup(self.ECHO, GPIO.IN)
 
    # set Trigger to HIGH
        GPIO.output(self.TRIGGER, True)
 
        time.sleep(0.00001)# set Trigger after 0.01ms to LOW
        GPIO.output(self.TRIGGER, False)
 
        startTime = time.time()
        stopTime = time.time()
 
    # save StartTime
        while GPIO.input(self.ECHO) == 0:
            startTime = time.time()
 
    # save time of arrival
        while GPIO.input(self.ECHO) == 1:
            stopTime = time.time()
 
    # time difference between start and arrival
        timeElapsed = stopTime - startTime
    # multiply with the sonic speed (34300 cm/s)
    # and divide by 2, because echo 2d distance travelled back and forth
        distance = (timeElapsed * 34300) / 2
 
        return str(distance)
