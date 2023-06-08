import RPi.GPIO as GPIO
from time import sleep
import servo as ser
import datetime
from OCR.detectid2 import getText
from log import entry_data,update_data,delete_data,get_data

GPIO.setmode(GPIO.BOARD)
# entryB=31
# GPIO.setup(entryB, GPIO.IN)#button to override gate servo
# exitB=32
# GPIO.setup(exitB, GPIO.IN)#button to override exit servo


def logicStat1():
    ser.camPosition1()#camera servo rotate to entry
    sleep(0.5)
    numberPlate=getText()#ocr func call #get no plate info
    if numberPlate!="Null":
        occupancy=entry_data(numberPlate)
        if occupancy==True:
            ser.entryServo()
        else:
            print('Parking Full')
        #delete image
        #return True#return status
    else:
        numberPlate=input("Entry Enter your Number Plate manually")
        occupancy=entry_data(numberPlate)
        if occupancy==True:
            ser.entryServo()
        else:
            print('Parking Full')
        #delete the image
        #return False#return status
    
def logicStat2():
    ser.camPosition2()#camera servo rotate to exit
    sleep(0.5)
    numberPlate=getText()#ocr func call #get no plate info
    if numberPlate!="Null":
        info=get_data(numberPlate)# get corresponding values entryTime, Owner, Remaining

        if int(info[2]) >=1:
            ser.exitServo()
            print(f"Hello {info[1]}. May you have a good journey ahead")
            sleep(1)
            delete_data(numberPlate)
 
        else:
            exit_time = datetime.datetime.now()
            entry_time = datetime.datetime.strptime(info[0], "%Y-%m-%d %H:%M:%S.%f")
            time_difference = exit_time - entry_time
            time_difference_seconds = time_difference.total_seconds()
            fee=time_difference_seconds*0.0275
            print(f'Rs. {fee}')

            ser.exitServo()
            delete_data(numberPlate)

    
    else:
        numberPlate=input("Exit Enter your Number Plate manually")
        info=get_data(numberPlate)
        if int(info[2]) >=1:
            ser.exitServo()
            print(f"Hello {info[1]}. May you have a good journey ahead")
            sleep(1)
            delete_data(numberPlate)
 
        else:
            exit_time = datetime.datetime.now()
            entry_time = datetime.datetime.strptime(info[0], "%Y-%m-%d %H:%M:%S.%f")
            time_difference = exit_time - entry_time
            time_difference_seconds = time_difference.total_seconds()
            fee=time_difference_seconds*0.0275
            print(f'Rs. {fee}')

            ser.exitServo()
            delete_data(numberPlate)
      
def offState():
    ser.servoOff()
    
#logicStat1()
#logicStat2()
