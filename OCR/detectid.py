import cv2
from matplotlib import pyplot as plt
import numpy as np
import imutils
import easyocr


def getText(img):
   img = cv2.imread('images/nepali.png')
   # imported the image from directory
   grayConvertedImg = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
   # converted blue-green red to grey
   plt.imshow(cv2.cvtColor(grayConvertedImg, cv2.COLOR_BGR2RGB))
   # display lai
   plt.show()

   filteredImg = cv2.bilateralFilter(grayConvertedImg, 11, 17, 17)
   # the values 11 17 17 is the number how intense we want noisereduction
   # noise reduction
   edgedImg = cv2.Canny(filteredImg, 30, 200)
   # canny algorithm allows the edge detection.
   # edge detection

   plt.imshow(cv2.cvtColor(edgedImg, cv2.COLOR_BGR2RGB))
   # pyplot always needs RBG to display.
   plt.show()

   keyPoints = cv2.findContours(edgedImg.copy(), cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
   # Countors algorithm tries to find the shapes in the images to grab only number plate
   # we have returned tree
   # chain approx simple is a simplified versions of contours

   contours = imutils.grab_contours(keyPoints)
   # simplified how are contours are actually returned

   contours = sorted(contours, key=cv2.contourArea, reverse=True)[:10]
   # sorted and grabbed top 10 contours.
   # reserve = true is arrange them descending

   location = None
   for contour in contours:
       # looped through sorted contours
       approx = cv2.approxPolyDP(contour, 10, True)
       # approxPolyDp allows to approx a polynomial
       # 10 because it is enough to detect square.
       if len(approx) == 4:
           # there are 4 corners in number plate so array of length should be 4.
           location = approx
           break
   # print(location)
   # this for loop to find the location of the number plates in coordinates

   mask = np.zeros(grayConvertedImg.shape, np.uint8)
   # we created blank mask of the dimension given by location
   newImage = cv2.drawContours(mask, [location], 0, 255, -1)
   # draw in that blank space made

   newImage = cv2.bitwise_and(img, img, mask=mask)
   # replace the number plate with that blank space

   plt.imshow(cv2.cvtColor(newImage, cv2.COLOR_BGR2RGB))
   plt.show()

   (x, y) = np.where(mask == 255)
   # x and y are the set of coordinates of corners of number plate
   (x1, y1) = (np.min(x), np.min(y))
   (x2, y2) = (np.max(x), np.max(y))
   croppedNumberPlate = grayConvertedImg[x1:x2, y1:y2]
   # cropped image

   plt.imshow(cv2.cvtColor(croppedNumberPlate, cv2.COLOR_BGR2RGB))
   plt.show()

   reader = easyocr.Reader(['en'])
   result = reader.readtext(croppedNumberPlate)
   text = ''

   print(result)
   for x in range(len(result)):
       text = text + result[x][-2] + ' '
   print(text)
   return str(text);
