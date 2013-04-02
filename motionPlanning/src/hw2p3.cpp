#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>

#include <arm_navigation_msgs/MoveArmAction.h>
#include <arm_navigation_msgs/utils.h>

arm_navigation_msgs::SimplePoseConstraint getPose(double px, double py, double pz, double ox, double oy,
    double oz, double ow){
  arm_navigation_msgs::SimplePoseConstraint desired_pose;
  desired_pose.header.frame_id = "base_link";
  desired_pose.link_name = "r_wrist_roll_link";
  desired_pose.pose.position.x = px;
  desired_pose.pose.position.y = py;
  desired_pose.pose.position.z = pz;

  desired_pose.pose.orientation.x = ox;
  desired_pose.pose.orientation.y = oy;
  desired_pose.pose.orientation.z = oz;
  desired_pose.pose.orientation.w = ow;

  desired_pose.absolute_position_tolerance.x = 0.02;
  desired_pose.absolute_position_tolerance.y = 0.02;
  desired_pose.absolute_position_tolerance.z = 0.02;

  desired_pose.absolute_roll_tolerance = 0.04;
  desired_pose.absolute_pitch_tolerance = 0.04;
  desired_pose.absolute_yaw_tolerance = 0.04;

  return desired_pose;
}

int main(int argc, char **argv){
  ros::init (argc, argv, "move_arm_pose_goal_test");
  ros::NodeHandle nh;
  int i = 0;
  arm_navigation_msgs::SimplePoseConstraint goals[3];
  actionlib::SimpleActionClient<arm_navigation_msgs::MoveArmAction> move_arm("move_right_arm",true);
  move_arm.waitForServer();
  ROS_INFO("Connected to server");
  
  goals[0]= getPose(0.0, -0.7, 1.2, 0.0, 0.0, 0.0, 1.0);
  goals[1]= getPose(0.75, -0.2, 0.8, 0.0, 0.0, 0.0, 1.0);
  goals[2] = getPose(0.5, -0.35, 0.35, 0.0, 0.0, 0.0, 1.0);

  while (nh.ok() && i < 3)
  {
    bool finished_within_time = false;
    arm_navigation_msgs::MoveArmGoal goalA;

    goalA.motion_plan_request.group_name = "right_arm";
    goalA.motion_plan_request.num_planning_attempts = 10;
    goalA.motion_plan_request.planner_id = std::string("");
    goalA.planner_service_name = std::string("ompl_planning/plan_kinematic_path");
    goalA.motion_plan_request.allowed_planning_time = ros::Duration(50.0);
    arm_navigation_msgs::addGoalConstraintToMoveArmGoal(goals[i] ,goalA);
    move_arm.sendGoal(goalA);
    finished_within_time = move_arm.waitForResult(ros::Duration(200.0));
    if (!finished_within_time)
    {
      move_arm.cancelGoal();
      ROS_INFO("Timed out achieving goal %d", i);
    }
    else
    {
      actionlib::SimpleClientGoalState state = move_arm.getState();
      bool success = (state == actionlib::SimpleClientGoalState::SUCCEEDED);
      if(success)
        ROS_INFO("Action finished: %s",state.toString().c_str());
      else
        ROS_INFO("Action failed: %s",state.toString().c_str());
    }
    i++;
  }
  ros::shutdown();
}
