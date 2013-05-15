#!/usr/bin/env python
import pickle
import roslib
roslib.load_manifest('detectCups')
import sys
import rospy
import cv2.cv as cv
import cv2
from sensor_msgs.msg import Image
import numpy as np
import svmlight
sys.path.append('./making_cup_images/output/features/')
from find_features import find_features
sys.path.append('./making_cup_images/output/')
from create_cup_images import find_pixels
from parser import parse_one_line
import glob
import os

class image_converter:

  def __init__(self, dir):
    self.image_pub = rospy.Publisher("image_processed",Image)
    self.dir= dir

    cv.NamedWindow("Image processed", 1)
    #self.image_sub = rospy.Subscriber("camera/image_raw",Image,self.callback)

  def determine_orange_range(self):
    """used to find the range of colors which can count as 'orange'"""
    cv_image_color= cv2.imread("orange_ball.png")
    r_max= 0
    r_min= 10000000000
    g_max= 0
    g_min = 10000000000
    b_max= 0
    b_min= 10000000000
    for row in cv_image_color:
        for p in row:
            if p[0] > r_max:
                r_max= p[0]

            if p[0] < r_min:
                r_min= p[0]

            if p[1] > g_max:
                g_max= p[1]

            if p[1] < g_min:
                g_min= p[1]

            if p[2] > b_max:
                b_max= p[2]

            if p[2] < b_min:
                b_min= p[2]

    print r_max
    print r_min
    print g_max
    print g_min
    print b_max
    print b_min

  def callback(self,data):
    results= {}

    for infile in glob.glob(self.dir+'/*.jpg'):
        print infile

        cv_image_color= cv2.imread(infile)

        #switch to greyscale
        cv_image= cv2.cvtColor(cv_image_color, cv2.COLOR_BGR2GRAY)
        #print cv_image_color

        width,height= cv_image.shape

        infile= infile[infile.index('/')+1:]
        print infile

        #try a bunch of different parameters
        contains_ball= None
        best_previous_classification= 0
        best_previous_pixels= None

        file_name_index= 0
        for min_dist in xrange(1,6,2):
            for min_radius in xrange(12,19,3):
                for max_radius in xrange(5,12,3):
                    bonus_radius= 0
                    #for bonus_radius in xrange(0,9,4):

                    circles= cv2.HoughCircles(cv_image, cv.CV_HOUGH_GRADIENT, 2, width/min_dist,\
                                            np.array([]), 20, 50, width/min_radius, width/max_radius)

                    #in this case we did not detect any circles
                    if circles is None or len(circles) == 0:
                        continue

                    circles= circles[0]

                    #color_image_to_save= cv_image_color.copy()
                    #print circles
                    #for c in circles:
                        ##draw a green circle for this
                        #cv2.circle(color_image_to_save, (c[0],c[1]), c[2], (0,255,0), 2)

                    #cv2.imwrite("circles_drawn/"+str(file_name_index)+".png", color_image_to_save)
                    #file_name_index += 1

                    #classifier for direct ball detection
                    #circles, best_classification, best_circle_pixels= \
                    #ball_only_classifier(circles, cv_image_color, bonus_radius)

                    #classifier for cup detection
                    circles= simple_classifier(circles, cv_image_color, bonus_radius)

                    #in this case we did not detect any circles
                    if circles is None or len(circles) == 0:
                        continue

                    #for simple classifier
                    circles, best_classification, best_circle_pixels= \
                    find_ball(circles, cv_image_color, cv_image.shape)

                    if best_classification > best_previous_classification:
                        contains_ball= circles[0]
                        best_previous_classification= best_classification
                        best_previous_pixels= best_circle_pixels


                    #if contains_ball is not None:
                    #    cv2.circle(cv_image_color, (contains_ball[0],contains_ball[1]),\
                    #            contains_ball[2], (255,0,0), 2)


                    #print circles[0][0]
                    #cv2.imshow("Image processed", circles[0][0])
                    #cv2.waitKey()

        #check to see if the selected cup is correct
        print contains_ball
        print best_previous_classification
        print infile
        #cv2.imshow("Image processed", best_previous_pixels)
        #cv2.waitKey()
        results[infile] = (best_previous_classification, contains_ball)

    pickle.dump(results, open("pickle_for_"+self.dir+".p", "wb"))

def generate_confusion():
    """
    takes a map of results and produces the counts of true and false positives and negatives
    for a variety of thresholds
    """
    labels= {}
    with open('labeled_figures.cvs', 'r') as f:
        for line in f:
            name, x, y= line.split(',')
            labels[name]= (int(float(x)),int(float(y)))

    data= {}
    #thresholds= [1,10,50,100]
    thresholds= [10,100,200,400]

    for i in range(1,6):
        data.update(pickle.load(open("pickle_for_"+str(i)+".p", "rb")))

    print data
    for thresh in thresholds:
        true_positives= 0
        false_positives= 0
        incorrect_positives= 0
        true_negatives= 0
        false_negatives= 0
        for infile in data.keys():
            if infile in labels:
                if data[infile][0] != 0 and data[infile][0] > thresh: # data[infile][0][0] >= thresh):
                    contains_ball= data[infile][1]
                else:
                    contains_ball= None

                if contains_ball is None:
                    if labels[infile] == (-1,-1):
                        true_negatives+=1
                    else:
                        false_negatives+= 1
                elif labels[infile] == (-1, -1):
                    false_positives += 1
                elif dist((contains_ball[0], contains_ball[1]), labels[infile]) < contains_ball[2]:
                    true_positives += 1
                else:
                    incorrect_positives +=1
            else:
                print "can't find the image: " + infile

        accuracy= (true_positives+true_negatives+0.0)/(true_positives+true_negatives+false_positives+false_negatives+incorrect_positives)
        print 'accuracy:  ' + str(accuracy)
        print 'incorrect positives: ' + str(incorrect_positives)
        print 'false positives: ' + str(false_positives)
        print 'false negatives: ' + str(false_negatives)
        print 'true positives: ' + str(true_positives)
        print 'true negatives: ' + str(true_negatives)

def simple_classifier(circles, color_image, bonus_radius):
    model= svmlight.read_model('./output/best_single_cup_model')
    ff= find_features()
    #TODO: fix
    label= 0
    new_circles= []
    for c in circles[:6]:
        circle= find_pixels(c, color_image, bonus_radius)
        new_circles.append(circle)
        #create features for that circle
        features= ff.generate_features(circle[0], label)
        features= parse_one_line(features)
        print features
        #run the classifier on that circle
        classification= svmlight.classify(model, [features])
        print classification
        #make a decision about whether that circle is circly enough
        #cv2.imshow("Image processed", circle)
        #cv2.waitKey()

    #for the strict form of the classifier, I require that all of the detected circles
    #are in fact circles.  other classifiers may be more lenient
    return new_circles

def ball_only_classifier(circles, color_image, bonus_radius):
    model= svmlight.read_model('./output/best_single_cup_model_for_ball')
    ff= find_features()
    #TODO: fix
    label= 0
    best_classification= .5
    best_circle=None
    best_circle_pixels= None
    for c in circles[:6]:
        pixels, circle= find_pixels(c, color_image, bonus_radius)
        #create features for that circle
        features= ff.generate_features(pixels, label)
        features= parse_one_line(features)
        print features
        #run the classifier on that circle
        classification= svmlight.classify(model, [features])
        print classification
        if classification[0] > best_classification:
            best_classification= classification
            best_circle= [c]
            best_circle_pixels= pixels
        #make a decision about whether that circle is circly enough
        #cv2.imshow("Image processed", circle)
        #cv2.waitKey()

    #for the strict form of the classifier, I require that all of the detected circles
    #are in fact circles.  other classifiers may be more lenient
    return best_circle, best_classification, best_circle_pixels

def find_ball(circles, color_image, shape):
    best_circle= None
    #arbitrary number so that the no-ball scenario can be detected
    best_count= -1
    for c in circles:
        orange_pixel_count= 0
        #pixels= find_pixels(c, color_image, shape)
        for row in c[0]:
            for p in row:
                #determined by looking at rgb values of a ball picture
                #needs to be tweaked for exact camera and scene
                if p[0] < 44 and p[0] > 0 and\
                p[1] < 101 and p[1] > 18 and\
                p[2] < 235 and p[2] > 152:
                    orange_pixel_count += 1

        print orange_pixel_count
        if orange_pixel_count > best_count:
            best_circle= [c[1]]
            best_count= orange_pixel_count

    return best_circle, best_count, None

def dist(a, b):
    return ((a[0]-b[0])**2 + (a[1]-b[1])**2)**.5

def main(args):
    rospy.init_node('image_converter', anonymous=True)
    ic = image_converter(args[1])
    if len(args)> 2:
        generate_confusion()
    else:
        ic.callback(None)

    cv.DestroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
