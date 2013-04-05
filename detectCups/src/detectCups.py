#!/usr/bin/env python
import roslib
roslib.load_manifest('detectCups')
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

    cv_image_color= cv2.imread("frame0019.jpg")

    #switch to greyscale
    cv_image= cv2.cvtColor(cv_image_color, cv2.COLOR_BGR2GRAY)
    #print cv_image_color

    width,height= cv_image.shape

    #try a bunch of different parameters

    for min_dist in xrange(1,6,2):
        for min_radius in xrange(12,18):
            for max_radius in xrange(5,11):

            circles= cv2.HoughCircles(cv_image, cv.CV_HOUGH_GRADIENT, 2, width/3,\
                                    np.array([]), 20, 50, width/15, width/5)

            if circles is None or len(circles) == 0:
                continue

            # contains_ball= find_ball(circles, cv_image_color, cv_image.shape)
            contains_ball = None
            circle_assignments = {}
            circle_centers = [(245.0,303.0),(331.0,301.0),(419.0,293.0),(281.0,225.0),(367.0,223.0),(323.0,157.0)]
            # draw
            for c in circles[:6]:
                closest_index = 0
                closest_distance = float("inf")

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
            with open("../output.txt","a") as f:
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
