import servo as ser
from time import sleep

def logicStat1():
    ser.camPosition1()#camera servo rotate to entry
    #ocr func call
    #get status boolean to show completion of ocr
    #get no plate info
    ser.entryServo()#servo motor open for entry 
    #return no_plate #return no plate info
def logicStat2():
    ser.camPosition2()#camera servo rotate to exit
    #ocr func call
    #get status boolean to show completion of ocr
    #get no plate info
    ser.exitServo()#servo motor open for exit 
    #return no plate info

def offState():
    ser.servoOff()
    
try:
    while True:
        logicStat1()
        sleep(2)
        logicStat2()
        sleep(2)
except KeyboardInterrupt:
    print("Bye BYe testing")
    
