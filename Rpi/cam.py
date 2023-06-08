import os
import cv2 as cv
import time

def capturePicture():
    camera = cv.VideoCapture(1)

    if (not camera.isOpened()):
        print('not opened')
        return
    else:
        time.sleep(1)
        camera.set(cv.CAP_PROP_AUTO_EXPOSURE, 0.25)  # Disable auto exposure
        camera.set(cv.CAP_PROP_EXPOSURE, -6)
        ret, frame = camera.read()
        cv.imwrite('OCR\\tempimg\\image.jpg', frame)
        print('Taking Picture sucess')

def deleteimg():
    if os.path.exists('OCR\\tempimg\\image.jpg'):
        os.remove('OCR\\tempimg\\image.jpg')
        return
    

