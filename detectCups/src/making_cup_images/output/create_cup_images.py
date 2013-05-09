#!/usr/bin/env python
import roslib
roslib.load_manifest('detectCups')
import sys
import rospy
import cv2.cv as cv
import cv2
from sensor_msgs.msg import Image
import numpy as np
import os
import glob

class image_converter:

  def __init__(self, group_num, start_point):
    self.image_pub = rospy.Publisher("image_processed",Image)
    self.group_num= group_num
    self.start_point= start_point

    cv.NamedWindow("Image processed", 1)
    #self.image_sub = rospy.Subscriber("camera/image_raw",Image,self.callback)

  def callback(self,data):

      total_images= int(self.start_point)

      for infile in glob.glob(os.path.join('../', '*.jpg')):

        print infile
        print '###'
        cv_image_color= cv2.imread(infile)

        num= infile[10:12]
        print "current file number: " + num
        if num[0] != self.group_num:
            print "skipping: " + num
            continue


        #switch to greyscale
        cv_image= cv2.cvtColor(cv_image_color, cv2.COLOR_BGR2GRAY)
        #print cv_image_color

        width,height= cv_image.shape

        #try a bunch of different parameters

        for min_dist in xrange(1,6,2):
            for min_radius in xrange(12,19,3):
                for max_radius in xrange(5,12,3):
                    for bonus_radius in xrange(0,9,4):

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

                            file_name= num + "_" + str(circle_rank) + "_" + str(min_dist) + "_" +\
                                    str(min_radius) + "_" + str(max_radius) + "_" + str(bonus_radius) + '.png'

                            if len(glob.glob(os.path.join('./*', file_name))) != 0:
                                print file_name + " already exists!"
                                continue

                            file_name= str(total_images) + "_" + file_name
                            circle_pixels= find_pixels(c, cv_image_color, bonus_radius)[0]


                            #cv2.imshow("Image processed", test)
                            #cv2.waitKey()
                            cv2.imwrite(file_name, circle_pixels)
                            #scipy.misc.imsave(file_name, circle_pixels)

                            total_images+= 1


def find_pixels(circle, color_image, bonus_radius):
    '''
    return all of the pixels from the original image that fall within this
    circle
    '''
    output= []
    height, width, z= color_image.shape
    for y in range(height):
        this_row= []
        for x in range(width):
            if dist((x,y), (circle[0], circle[1])) <= circle[2] + bonus_radius:
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

    #for some reason, cv2 doesn't like my circle_pixels array.  to get
    #around that i just overwrite a copy of the original image and then crop
    circle_pixels= np.array(new_out)
    test= color_image.copy()
    for y in range(len(circle_pixels)):
        row= circle_pixels[y]
        for x in range(len(row)):
            test[y][x]= circle_pixels[y][x]

    h,w,z= circle_pixels.shape
    test= test[:h, :w, :]
    return (test,circle)

def dist(a, b):
    return ((a[0]-b[0])**2 + (a[1]-b[1])**2)**.5

def main(args):
  print args[1]
  print args[2]
  rospy.init_node('image_converter', anonymous=True)
  ic = image_converter(args[1], args[2])
  ic.callback(None)
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print "Shutting down"
  cv.DestroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
