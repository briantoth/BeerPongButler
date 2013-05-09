#!/usr/bin/env python
import roslib
roslib.load_manifest('detectCups')
import sys
import rospy
import cv2.cv as cv
import cv2
from sensor_msgs.msg import Image
import numpy as np
import scipy
import os

class image_converter:

  def __init__(self, group_num):
    self.image_pub = rospy.Publisher("image_processed",Image)
    self.group_num= group_num

    cv.NamedWindow("Image processed", 1)
    #self.image_sub = rospy.Subscriber("camera/image_raw",Image,self.callback)

  def callback(self,data):

      total_images= 0

      infiles= os.listdir('..')

      for infile in infiles:

        print infile
        print '###'
        cv_image_color= cv2.imread('../'+ infile)
        num= infile[7:9]
        if num[0] != group_num:
            print "skipped: " + num
            continue

        print "current file number: " + num

        #switch to greyscale
        cv_image= cv2.cvtColor(cv_image_color, cv2.COLOR_BGR2GRAY)
        #print cv_image_color

        width,height= cv_image.shape

        #try a bunch of different parameters

        for min_dist in xrange(1,6,2):
            for min_radius in xrange(12,18):
                for max_radius in xrange(5,11):

                    circles= cv2.HoughCircles(cv_image, cv.CV_HOUGH_GRADIENT, 2, width/min_dist,\
                                            np.array([]), 20, 50, width/min_radius, width/max_radius)

                    #in this case we did not detect any circles
                    if circles is None or len(circles) == 0:
                        continue

                    circles= circles[0]

                    circle_rank= 0
                    #only consider the 'best' six circles
                    for c in circles[:6]:

                        circle_rank += 1
                        circle_pixels= find_pixels(c, cv_image_color, cv_image.shape)
                        file_name= str(total_images)+ "_" + num + "_" + str(circle_rank) + "_" + str(min_dist) + "_" +\
                                str(min_radius) + "_" + str(max_radius) + '.jpg'
                        scipy.misc.imsave(file_name, circle_pixels)

                        total_images+= 1
                        return


def find_pixels(circle, color_image, shape):
    '''
    return all of the pixels from the original image that fall within this
    circle
    '''
    output= []
    height, width= shape
    for y in range(height):
        this_row= []
        for x in range(width):
            if dist((x,y), (circle[0], circle[1])) <= circle[2]:
                #output.append(color_image[y][x])
                this_row.append(color_image[y][x])

        if len(this_row) != 0:
            output.append(this_row)

    output= np.array(output)
    longest_row_len= 0
    for row in output:
        if len(row) > longest_row_len:
            longest_row_len = len(row)

    new_out= []
    for row in output:
        if len(row) < longest_row_len:
            to_add= longest_row_len- len(row)

            if to_add % 2 == 0:
                left_add= to_add/2
                right_add= left_add
            else:
                left_add= int(to_add/2) + 1
                right_add= int(to_add/2)

            left_side=[[0,0,0] for x in range(left_add)]
            right_side=[[0,0,0] for x in range(right_add)]

            row= left_side + row + right_side
            #row= [0 for x in range(longest_row_len)]
            new_out.append(row)

    new_out= np.array(new_out)
    return new_out

def dist(a, b):
    return ((a[0]-b[0])**2 + (a[1]-b[1])**2)**.5

def main(args):
  rospy.init_node('image_converter', anonymous=True)
  print args[1]
  ic = image_converter(args[1])
  ic.callback(None)
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print "Shutting down"
  cv.DestroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
