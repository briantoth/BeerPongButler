#!/usr/bin/env python

import roslib
roslib.load_manifest('perception')
import rospy
from tabletop_object_detector_brian.srv import *
from sensor_msgs.msg import PointCloud2, PointCloud, Image

class Seperator():

    def __init__(self):
        self.image_sub = rospy.Subscriber('/camera/depth_registered/points', PointCloud2, callback)

    def callback(self, data):
        print "got some shit coming in"



    pub = rospy.Publisher('output_image', Image)
    rospy.init_node('table')
    rospy.wait_for_service('tabletop_segmentation')
    print "not waiting any more"
    while not rospy.is_shutdown():
        try:
            seperation= rospy.ServiceProxy('tabletop_segmentation', TabletopSegmentation)
            resp= seperation()
            #print resp
            print resp.result
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

            for point in resp.clusters[0].points:
                x= int(point.x * (640))
                y= int(point.y * (480))
                im.data[y*1280 + x*2-1] = 10

            pub.publish(im)
        except Exception, e:
            print "service call failed"
            print e


if __name__ == '__main__':
    main()
