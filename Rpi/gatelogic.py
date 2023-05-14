from servo import *

def logicStat1():
    camPosition1()#camera servo rotate to entry
    #ocr func call
    #get status boolean to show completion of ocr
    #get no plate info
    entryServo()#servo motor open for entry 
    #return no_plate #return no plate info
def logicStat2():
    camPosition2()#camera servo rotate to exit
    #ocr func call
    #get status boolean to show completion of ocr
    #get no plate info
    exitServo()#servo motor open for exit 
    #return no plate info

def offState():
    pass
    #red and green off
