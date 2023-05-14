import time
import RPi.GPIO as GPIO
from gatesensor import gatesense as gs
import gatelogic as gl
import sys

#setting gpio board values for ultrasonicsensor which is interchangable
echo1=11
echo2=16
trigger1=13
trigger2=18
entry=gs(trigger1,echo1)
exit=gs(trigger2,echo2)

if __name__=="__main__":
    try:
        while True:
            distEntry = int(float(entry.getDistance()))
            distExit=int(float(exit.getDistance()))
        
            #implementing gate logic
            logic1=distEntry<80
            logic2=distExit<80
        
            if logic1==True and logic2==False:#number plate from entry
                gl.logicStat1()#entry gate
    
            elif logic1==False and logic2==True:#number plate from exit
                gl.logicStat2()#call exit gate function

            elif logic1==True and logic2==True:#number plate from entry first and then exit
                sys.exit()

            elif logic1==False and logic2==False:
                sys.exit()
            #red led on both

            # Reset by pressing CTRL + C
    except KeyboardInterrupt:
        print("Measurement stopped by User")
        GPIO.cleanup()