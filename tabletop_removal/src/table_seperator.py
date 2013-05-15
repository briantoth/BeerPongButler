#!/usr/bin/env python

import roslib
roslib.load_manifest('tabletop_removal')
import rospy
from tabletop_identification.srv import *
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
            #im.header.frame_id= '/camera_rgb_optical_frame'
            im.header.frame_id= '/camera_rgb_frame'
            im.height= 480
            im.width= 640
            im.encoding= '16UC1'
            im.is_bigendian= 0
            im.step= 1280
            im.data= [100 for n in xrange(1280*480)]

            x_min= resp.table.x_min
            x_total= abs(x_min)+abs(resp.table.x_max)

            y_min= resp.table.y_min
            y_total= abs(y_min)+abs(resp.table.y_max)
            for point in resp.clusters[0].points:
                x= int((point.x - x_min) * 640/x_total)
                y= int((point.y - y_min) * 480/y_total)
                im.data[y*1280 + x*2-1] = 10

            pub.publish(im)
        except Exception, e:
            print "service call failed"
            print e


if __name__ == '__main__':
    main()
