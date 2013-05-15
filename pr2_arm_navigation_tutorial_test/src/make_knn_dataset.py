#!/usr/bin/env python
from __future__ import division
import roslib; roslib.load_manifest('pr2_arm_navigation_tutorials_test')
import sys
import rospy
from kinematics_msgs.srv import *

def linspace(start, stop, n):
    if n == 1:
        yield stop
        return
    h = (stop - start) / (n -1)
    for i in range(n):
        yield start + h*i

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

        a = list(linspace(-2.27,0.69,28))
        b = list(linspace(-0.52,1.39,28))
        c = list(linspace(-3.9,0.76,28))
        d = list(linspace(0,2.33,28))
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
    get_info()
