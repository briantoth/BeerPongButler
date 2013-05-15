/*********************************************************************
 * Software License Agreement (BSD License)
 * 
 *  Copyright (c) 2008, Willow Garage, Inc.
 *  All rights reserved.
 * 
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 * 
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *   * Neither the name of Willow Garage nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 * 
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 *
 *
 *********************************************************************/

/* \author: E. Gil Jones */

#include <ros/ros.h>

#include <arm_navigation_msgs/AttachedCollisionObject.h>
#include <arm_navigation_msgs/Shape.h>

int main(int argc, char** argv) {

  ros::init(argc, argv, "attachCylinder");

  ros::NodeHandle nh;

  ros::Publisher att_object_in_map_pub_;
  att_object_in_map_pub_  = nh.advertise<arm_navigation_msgs::AttachedCollisionObject>("attached_collision_object", 10);
  sleep(2);

  //add a cylinder into the collision space attached to the r_gripper_r_finger_tip_link
  arm_navigation_msgs::AttachedCollisionObject att_object;
  att_object.link_name = "r_gripper_r_finger_tip_link";

  att_object.object.id = "attached_pole";
  att_object.object.operation.operation = arm_navigation_msgs::CollisionObjectOperation::ADD;

  att_object.object.header.frame_id = "r_gripper_r_finger_tip_link";
  att_object.object.header.stamp = ros::Time::now();
  arm_navigation_msgs::Shape object;
  object.type = arm_navigation_msgs::Shape::CYLINDER;
  object.dimensions.resize(2);
  object.dimensions[0] = .02;
  object.dimensions[1] = 1.2;
  geometry_msgs::Pose pose;
  pose.position.x = 0.0;
  pose.position.y = 0.0;
  pose.position.z = 0.0;
  pose.orientation.x = 0;
  pose.orientation.y = 0;
  pose.orientation.z = 0;
  pose.orientation.w = 1;
  att_object.object.shapes.push_back(object);
  att_object.object.poses.push_back(pose);
  att_object.touch_links.push_back("r_gripper_palm_link");
  att_object.touch_links.push_back("r_gripper_r_finger_link");
  att_object.touch_links.push_back("r_gripper_l_finger_link");
  att_object.touch_links.push_back("r_gripper_l_finger_tip_link");

  att_object_in_map_pub_.publish(att_object);

  ROS_INFO("Should have published");

  ros::Duration(2.0).sleep();

  ros::shutdown();

}
