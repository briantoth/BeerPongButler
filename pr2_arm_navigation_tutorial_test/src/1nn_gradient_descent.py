#!/usr/bin/env python
from __future__ import division
import roslib; roslib.load_manifest('pr2_arm_navigation_tutorials_test')
import sys
import rospy
from kinematics_msgs.srv import *
import math

def euclid_dist(p,q):
    tot = 0
    for i in range(len(p)):
        tot += (p[i]-q[i])**2
    return tot**(.5)


def one_nearest_neighbor(x,y,z):
    with open("./knn_dataset",'r') as f:
        shortest = float('inf')
        xyz_goal = [x,y,z]
        xyz_best = []
        for line in f:
            coords = line.split('\t')
            xyz_try = [float(coords[0]),float(coords[1]),float(coords[2])]
            dist = euclid_dist(xyz_try,xyz_goal)
            if dist < shortest:
                xyz_best = xyz_try
                shortest = dist
                result = [float(coords[3]),float(coords[4]),float(coords[5]),float(coords[6])]

        return result, xyz_best, xyz_goal

def gradient_descent((result,xyz_best,xyz_goal)):
    step = 0.01
    print "goal values"
    print xyz_goal
    print "start knn values:"
    print xyz_best

    rospy.wait_for_service("pr2_right_arm_kinematics/get_fk_solver_info")
    rospy.wait_for_service("pr2_right_arm_kinematics/get_fk")


    #Make random input values

    try:
        query_client=\
        rospy.ServiceProxy("pr2_right_arm_kinematics/get_fk_solver_info",\
                           GetKinematicSolverInfo);
        solver_info= query_client()
        #for n in solver_info.kinematic_solver_info.joint_names:
          #  print "%s"%n

        q=rospy.ServiceProxy("pr2_right_arm_kinematics/get_fk",\
                         GetPositionFK)
        req= GetPositionFKRequest()

        req.header.frame_id= "torso_lift_link"
        req.fk_link_names.append("r_wrist_roll_link")
        req.robot_state.joint_state.name= solver_info.kinematic_solver_info.joint_names

        req.robot_state.joint_state.position.append(result[0])
        req.robot_state.joint_state.position.append(result[1])
        req.robot_state.joint_state.position.append(result[2])
        req.robot_state.joint_state.position.append(result[3])
        req.robot_state.joint_state.position.append(3.1)
        req.robot_state.joint_state.position.append(-0.5)
        req.robot_state.joint_state.position.append(-1.6)

        error = float(euclid_dist(xyz_best,xyz_goal))
        print "initial error" + str(error)
        convergence = float('inf')
        step = 0.001
        loop = 0


        while (convergence > 0.000001):
            #grad_dir = 80
            #grad_mag = 1
            #this_error = error
            #this_best = []
            loop +=1
            made_improvement = 0
            print "loop number: " + str(loop)
            for i in (0,4):
                for j in [-1,1]:

                    req.robot_state.joint_state.position[i] +=step*j
                    resp = q(req)
                    new = \
                    [resp.pose_stamped[0].pose.position.x,resp.pose_stamped[0].pose.position.y,\
                     resp.pose_stamped[0].pose.position.z]
                    dist = float(euclid_dist(new,xyz_goal))
                    if dist < error:
                        #grad_dir = i
                        #grad_mag = j
                        xyz_best = new
                        print "new_error: " + str(dist)
                        convergence = math.fabs(float(float(dist) - float(error)))
                        error = dist
                        made_improvement = 1
                    else:
                        req.robot_state.joint_state.position[i] -=step*j

            if made_improvement == 0:
               convergence = 0
               print "no further improvement"

            print "convergence: " + str(convergence)

                   # req.robot_state.joint_state.position[i] -=0.1*j
           # if grad_dir == 80:
           #     print "Not working"

           # if grad_dir != 80:
           #     req.robot_state.joint_state.position[grad_dir] +=0.1*grad_mag
           #     resp = q(req)
           #     new =\
           #     [resp.pose_stamped[0].pose.position.x,resp.pose_stamped[0].pose.position.y,\
          #       resp.pose_stamped[0].pose.position.z]
          #      new_error = euclid_dist(new,xyz_goal)
          #      convergence = error-new_error
          #      error = new_error

        result = req.robot_state.joint_state.position[0:4]
        print "xyz_best"
        print new
        print "error"
        print error
        print "result"
        print result
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

    return result


def get_info():
    rospy.wait_for_service("pr2_right_arm_kinematics/get_fk_solver_info")
    rospy.wait_for_service("pr2_right_arm_kinematics/get_fk")


    #Make random input values

    try:
        query_client=\
        rospy.ServiceProxy("pr2_right_arm_kinematics/get_fk_solver_info",\
                           GetKinematicSolverInfo);
        solver_info= query_client()
        for n in solver_info.kinematic_solver_info.joint_names:
            print "%s"%n

        q=rospy.ServiceProxy("pr2_right_arm_kinematics/get_fk",\
                           GetPositionFK)
        req= GetPositionFKRequest()

        req.header.frame_id= "torso_lift_link"
        req.fk_link_names.append("r_wrist_roll_link")
        req.robot_state.joint_state.name= solver_info.kinematic_solver_info.joint_names

        req.robot_state.joint_state.position.append(-0.3)
        req.robot_state.joint_state.position.append(0)
        req.robot_state.joint_state.position.append(-1.5)
        req.robot_state.joint_state.position.append(-0.9)
        req.robot_state.joint_state.position.append(3.1)
        req.robot_state.joint_state.position.append(-0.5)
        req.robot_state.joint_state.position.append(-1.6)

        a = list(linspace(-2.27,0.69,8))
        b = list(linspace(-0.52,1.39,8))
        c = list(linspace(-3.9,0.76,8))
        d = list(linspace(0,2.33,8))
        f = open("knn_dataset","w")
        print a
        for i in a:
            for j in b:
                for k in c:
                    for l in d:
                        req.robot_state.joint_state.position[0] = i
                        req.robot_state.joint_state.position[1] = j
                        req.robot_state.joint_state.position[2] = k
                        req.robot_state.joint_state.position[3] = l
                        resp = q(req)
                        x = resp.pose_stamped[0].pose.position.x
                        y = resp.pose_stamped[0].pose.position.y
                        z = resp.pose_stamped[0].pose.position.z

                        f.write(str(x)+"\t"+str(y)+"\t"+str(z)+"\t"+str(i)+"\t"+str(j)+"\t"+str(k)+"\t"+str(l)+"\n")



    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

if __name__ == "__main__":
    gradient_descent(one_nearest_neighbor(.7,0,.55))
