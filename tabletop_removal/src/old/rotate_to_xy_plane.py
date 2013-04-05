#!/usr/bin/env python

'''
Attempted to project the pointcloud onto the observer's
plane and then rotate that plane onto the xy plane.
did not work well
'''

import roslib
roslib.load_manifest('perception')
import rospy
from tabletop_object_detector_brian.srv import TabletopSegmentation
from sensor_msgs.msg import PointCloud, Image
from visualization_msgs.msg import Marker
import numpy as np
import math

class Seperator():

    def __init__(self):
        self.image_sub = rospy.Subscriber('/tabletop_segmentation_markers', Marker, self.callback)
        self.pub = rospy.Publisher('table', PointCloud)
        self.seperation= rospy.ServiceProxy('tabletop_segmentation', TabletopSegmentation)
        self.pub_image=rospy.Publisher('image_maker', Image)

    def callback(self, data):
        #print "got some shit coming in"
        #if data is not None:
            #plane= data.pose.position
            #nrm= norm([plane.x, plane.y, plane.z])

            #normal= np.array([plane.x, plane.y, plane.z])/nrm

            #print "got here"

            ##replace with numpy array
            #plane= np.array([plane.x, plane.y, plane.z])

            ##get the rotation matrix
            #rmatrix= rotationMatrix(normal)

            ##print rmatrix

            ##for point in data.points:
                ##print point
                ##p= np.array([point.x, point.y, point.z])
                ##flattened_point= project(p, plane, normal)
                ##print flattened_point
                ##print np.dot(rmatrix,flattened_point)

        try:
            resp= self.seperation()
            print resp.result
            #self.pub.publish(resp.clusters[0])
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
                x= point.x * 640
                y= point.y * 480
                im.data[y*1280 + x] = 10

            pub_image.publish(im)

        except Exception, e:
            print "service call failed"
            print e



#def project(point, plane, normal):
    #'''
    #q - dot(q - p, n) * n
    #'''
    ##create a line between the point and the plane
    #line= point-plane
    #dp= np.dot(line, normal)
    #return point - np.dot(dp,  normal)

def project(point, plane, normal):
    a= normal[0]
    b= normal[1]
    c= normal[2]

    d=plane[0]
    e=plane[1]
    f=plane[2]

    x=point[0]
    y=point[1]
    z=point[2]

    t=(a*d-a*x+b*e-b*x+c*f-c*z)/(a**2 + b**2 + c**2)

    return np.array([x+t*a, y+t*b, z+t*c])

def norm(coords):
    norm= 0
    for c in coords:
        norm += abs(c)

    return norm

def rotationMatrix(normal):
    xy= np.array([0, 0 , 1])
    costheta= np.dot(normal, xy)/(norm(normal)*norm(xy))
    axis= np.cross(normal, xy)/(norm(normal)*norm(xy))
    c = costheta
    s = math.sqrt(1-c*c)
    C = 1-c
    x= axis[0]
    y= axis[1]
    z= axis[2]
    return np.array([[ x*x*C+c,    x*y*C-z*s,  x*z*C+y*s ],
                [ y*x*C+z*s,  y*y*C+c,    y*z*C-x*s ],
                [ z*x*C-y*s,  z*y*C+x*s,  z*z*C+c   ]])


def main():
    rospy.init_node('table')
    rospy.wait_for_service('tabletop_segmentation')
    print "not waiting any more"

    sep= Seperator()
    sep.callback(None)
    rospy.spin()

if __name__ == '__main__':
    main()
