#!/usr/bin/env python
import roslib
roslib.load_manifest('tutorialROSOpenCV')
import sys
import rospy
import cv2.cv as cv
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import math

class image_converter:

  def __init__(self):
    self.image_pub = rospy.Publisher("image_processed",Image)

    cv.NamedWindow("Image processed", 1)
    self.bridge = CvBridge()
    #self.image_sub = rospy.Subscriber("camera/image_raw",Image,self.callback)

  def callback(self,data):
    #try:
      #cv_image_color = self.bridge.imgmsg_to_cv(data, "bgr8")
    #except CvBridgeError, e:
      #print e

    cv_image_color= cv2.imread("frame0027.jpg")
    #print(cv_image_color)

    #this is dumb but w/e; switch to a numpy array for processing
    #cv_image_color= np.asarray(cv_image_color[:,:])

    #switch to greyscale
    cv_image= cv2.cvtColor(cv_image_color, cv2.COLOR_BGR2GRAY)
    #print cv_image_color

    m,n= cv_image.shape
    #print cv_image.shape

    ##try thresholding
    #cv_image= cv2.threshold(cv_image, 160, 255, cv2.THRESH_BINARY)[1]

    ##try blurring
    #cv_image= cv2.GaussianBlur(cv_image, (19,19), 2, np.array([]), 2)


    ##try edge detection
    #cv_image= cv2.Canny(cv_image, 20, 60)

    circles=cv2.HoughCircles(cv_image, cv.CV_HOUGH_GRADIENT, 2, 60,\
                             np.array([]), 20, 50, m/12, m/10)[0]

    
    #circles=cv2.HoughCircles(cv_image, cv.CV_HOUGH_GRADIENT, 2, 75,\
    #                         np.array([]), 20, 50, m/12, m/10)[0]
    #circles=[]

    #still dumb; converting back to cv image for the rest of the processings
    #cv_image= cv.fromarray(cv_image)

   # contains_ball= find_ball(circles, cv_image_color, cv_image.shape)
    contains_ball = None
    circle_assignments = {}
    circle_centers = [(245.0,303.0),(331.0,301.0),(419.0,293.0),(281.0,225.0),(367.0,223.0),(323.0,157.0)]
    # draw 
    for c in circles[:6]:
        closest_index = 0
        closest_distance = 100000000000000000

        #compute euclidean distance
        for center in circle_centers:
            distance = math.sqrt(pow((c[0]-center[0]),2)+pow((c[1]-center[1]),2))
            if distance < closest_distance:
                closest_distance = distance
                closest_index = circle_centers.index(center) 

     # green for circles (only draw the 3 strongest)
        cv2.circle(cv_image_color, (c[0],c[1]), c[2], (0,255,0), 2) 

        if not str(closest_index+1) in circle_assignments:
            print closest_index+1
            circle_assignments[str(closest_index+1)]= c
        
        #average RGB values for each circle
        pixels = find_pixels(c, cv_image_color, cv_image.shape)
        rgb = [0, 0, 0]
        num_pixels = 0
        for p in pixels:
            rgb[0] += p[0]
            rgb[1] += p[1]
            rgb[2] += p[2]
            num_pixels += 1
        rgb = np.array(rgb)/float(num_pixels)

        
    if contains_ball is not None:
        cv2.circle(cv_image_color, (contains_ball[0],contains_ball[1]),\
                   contains_ball[2], (255,0,0), 2)



    #print circle_assignments
    output_str= ""
    #print to file
    f = open("../output.txt","a")
    for i in range(6):
        if str(i+1) in circle_assignments:
            output_str += str(i+1) + ":1 "
        else:
            output_str += str(i+1) + ":0 "
    for i in range(3):
        output_str += str(i+7) + ":" + str(rgb[i]) + " "

    f.write(output_str + "\n")
    #(cols,rows) = cv.GetSize(cv_image)
    #if cols > 60 and rows > 60 :
      #cv.Circle(cv_image, (50,50), 10, 255)

    cv2.imshow("Image processed", cv_image_color)
    cv2.waitKey()

    #cv.ShowImage("Image processed", cv_image)
    #cv.WaitKey(3)

    #try:
      #self.image_pub.publish(self.bridge.cv_to_imgmsg(cv_image, "8UC1"))
    #except CvBridgeError, e:
      #print e

def find_ball(circles, color_image, shape):
    best_circle= None
    #arbitrary number so that the no-ball scenario can be detected
    best_count= 100
    for c in circles:
        orange_pixel_count= 0
        pixels= find_pixels(c, color_image, shape)
        for p in pixels:
            #determined by looking at rgb values of a ball picture
            #needs to be tweaked for exact camera and scene
            if p[0] < 85 and p[0] > 12 and\
               p[1] < 127 and p[1] > 80 and\
               p[2] < 140 and p[2] > 116:
                orange_pixel_count += 1

        if orange_pixel_count > best_count:
            best_circle= c
            best_count= orange_pixel_count

    return best_circle


def find_pixels(circle, color_image, shape):
    '''
    return all of the pixels from the original image that fall within this
    circle
    '''
    output= []
    height, width= shape
    for y in range(height):
        row_viz= ""
        for x in range(width):
            if dist((x,y), (circle[0], circle[1])) <= circle[2]:
                output.append(color_image[y][x])
                row_viz+= "o"

#        if row_viz != "":
#            print row_viz

    return output

def dist(a, b):
    return ((a[0]-b[0])**2 + (a[1]-b[1])**2)**.5

def main(args):
  rospy.init_node('image_converter', anonymous=True)
  ic = image_converter()
  ic.callback(None)
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print "Shutting down"
  cv.DestroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
