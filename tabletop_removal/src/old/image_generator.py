#!/usr/bin/env python

'''
Makes a grey image.  Just a test to demonstrate
that it is a possible
'''

import roslib
roslib.load_manifest('perception')
import rospy
from tabletop_object_detector_brian.srv import *
from sensor_msgs.msg import Image, PointCloud2, PointCloud
from time import sleep

class Seperator():

    def __init__(self):
        self.image_sub = rospy.Subscriber('/camera/depth_registered/points', PointCloud2, callback)

    def callback(self, data):
        print "got some shit coming in"

def main():
    pub = rospy.Publisher('image_maker', Image)
    rospy.init_node('image_maker')
    #rospy.wait_for_service('tabletop_segmentation')
    im= Image()
    im.header.seq= 72
    im.header.stamp.secs= 1365037570
    im.header.stamp.nsecs= 34077284
    im.header.frame_id= '/camera_rgb_optical_frame'
    im.height= 480
    im.width= 640
    im.encoding= '16UC1'
    im.is_bigendian= 0
    im.step= 1280
    im.data= [100 for n in xrange(1280*480)]

    while not rospy.is_shutdown():
        try:
            pub.publish(im)
            sleep(.5)

        except Exception, e:
            print e


if __name__ == '__main__':
    main()
