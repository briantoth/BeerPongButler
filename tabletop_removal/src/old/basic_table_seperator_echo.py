#!/usr/bin/env python

import roslib
roslib.load_manifest('perception')
import rospy
from tabletop_object_detector_brian.srv import *
from sensor_msgs.msg import PointCloud2, PointCloud

class Seperator():

    def __init__(self):
        self.image_sub = rospy.Subscriber('/camera/depth_registered/points', PointCloud2, callback)

    def callback(self, data):
        print "got some shit coming in"

def main():
    pub = rospy.Publisher('table', PointCloud)
    rospy.init_node('table')
    rospy.wait_for_service('tabletop_segmentation')
    print "not waiting any more"
    while not rospy.is_shutdown():
        try:
            seperation= rospy.ServiceProxy('tabletop_segmentation', TabletopSegmentation)
            resp= seperation()
            print resp.result
            pub.publish(resp.clusters[0])
        except Exception, e:
            print "service call failed"
            print e


if __name__ == '__main__':
    main()
