#!/usr/bin/env python
import roslib
roslib.load_manifest('detectCups')
import sys
import rospy
import cv2.cv as cv
import cv2
import numpy as np
import os
import glob

class find_features:

  def __init__(self):
      pass

  def generate_features(self, cv_image_color, label):
        #switch to greyscale
        cv_image= cv2.cvtColor(cv_image_color, cv2.COLOR_BGR2GRAY)
        #print cv_image_color

        #features
        width,height= cv_image.shape

        #feature - average RGB values for each circle
        #feature - total number of pixels in the 'cup'
        pixels = find_pixels(cv_image_color, cv_image.shape)
        rgb = [0, 0, 0]
        for p in pixels:
            rgb[0] += p[0]
            rgb[1] += p[1]
            rgb[2] += p[2]

        rgb = np.array(rgb)/float(len(pixels))

        output_str= str(label) + " 1:" + str(width) + " 2:" + str(height) + " 3:" + str(len(pixels)) +\
                " 4:" + str(int(rgb[0])) + " 5:" + str(int(rgb[1])) + " 6:" + str(int(rgb[2]))
        print output_str
        return output_str

  def callback(self):

    labels = {}
    with open('label_data.csv', 'r') as f:
        for line in f:
            name, label = line.split(',')
            labels[name]= int(label)

    print labels
    outfile= open('data', 'w')
    for infile in glob.glob( os.path.join('../', '*.png') ):

        print infile
        image_num= infile[infile.index('/')+1:infile.index('_')+3]
        print image_num

        if image_num in labels:
            cv_image_color= cv2.imread(infile)

            #TODO: change in the future
            label= -1 if labels[image_num] == 0 else 1
            output_str= self.generate_features(cv_image_color, label)

            outfile.write(output_str + "\n")

        else:
            print "skipping " + image_num

    outfile.close()



def find_pixels(color_image, shape):
    '''
    return all of the pixels from the original image that fall within this
    circle
    '''
    output= []
    height, width= shape
    for y in range(height):
        for x in range(width):
            if color_image[y][x].any():
                output.append(color_image[y][x])

    return output

def dist(a, b):
    return ((a[0]-b[0])**2 + (a[1]-b[1])**2)**.5

def main(args):
    #rospy.init_node('image_converter', anonymous=True)
    ic = find_features()
    ic.callback()

if __name__ == '__main__':
    main(sys.argv)
