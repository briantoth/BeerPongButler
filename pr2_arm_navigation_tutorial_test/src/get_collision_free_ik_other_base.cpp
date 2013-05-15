#include <ros/ros.h>

#include <kinematics_msgs/GetKinematicSolverInfo.h>
#include <kinematics_msgs/GetConstraintAwarePositionIK.h>
#include <arm_navigation_msgs/SetPlanningSceneDiff.h>

static const std::string ARM_COLLISION_IK_NAME = "/pr2_right_arm_kinematics/get_constraint_aware_ik";
static const std::string ARM_QUERY_NAME = "/pr2_right_arm_kinematics/get_ik_solver_info";
static const std::string SET_PLANNING_SCENE_DIFF_NAME = "/environment_server/set_planning_scene_diff";

int main(int argc, char **argv){
  ros::init (argc, argv, "get_fk");
  ros::NodeHandle rh;

  ros::service::waitForService(ARM_QUERY_NAME);
  ros::service::waitForService(ARM_COLLISION_IK_NAME);
  ros::service::waitForService(SET_PLANNING_SCENE_DIFF_NAME);

  ros::ServiceClient set_planning_scene_diff_client = rh.serviceClient<arm_navigation_msgs::SetPlanningSceneDiff>(SET_PLANNING_SCENE_DIFF_NAME);
  ros::ServiceClient query_client = rh.serviceClient<kinematics_msgs::GetKinematicSolverInfo>(ARM_QUERY_NAME);
  ros::ServiceClient ik_with_collision_client = rh.serviceClient<kinematics_msgs::GetConstraintAwarePositionIK>(ARM_COLLISION_IK_NAME);

  arm_navigation_msgs::SetPlanningSceneDiff::Request planning_scene_req;
  arm_navigation_msgs::SetPlanningSceneDiff::Response planning_scene_res;

  arm_navigation_msgs::CollisionOperation coll;
  coll.object1 = "r_end_effector";
  coll.object2 = "l_end_effector";
  coll.operation = coll.DISABLE;

  planning_scene_req.operations.collision_operations.push_back(coll);
  planning_scene_req.planning_scene_diff.robot_state.multi_dof_joint_state.stamp = ros::Time::now();
  planning_scene_req.planning_scene_diff.robot_state.multi_dof_joint_state.joint_names.push_back("world_joint");
  planning_scene_req.planning_scene_diff.robot_state.multi_dof_joint_state.frame_ids.push_back("odom_combined");
  planning_scene_req.planning_scene_diff.robot_state.multi_dof_joint_state.child_frame_ids.push_back("base_footprint");
  planning_scene_req.planning_scene_diff.robot_state.multi_dof_joint_state.poses.resize(1);
  planning_scene_req.planning_scene_diff.robot_state.multi_dof_joint_state.poses[0].position.x = 4.0;
  planning_scene_req.planning_scene_diff.robot_state.multi_dof_joint_state.poses[0].orientation.w = 1.0;

  if(!set_planning_scene_diff_client.call(planning_scene_req, planning_scene_res)) {
    ROS_WARN("Can't get planning scene");
    return -1;
  }

  // define the service messages
  kinematics_msgs::GetKinematicSolverInfo::Request request;
  kinematics_msgs::GetKinematicSolverInfo::Response response;

  if(query_client.call(request,response))
  {
    for(unsigned int i=0; i< response.kinematic_solver_info.joint_names.size(); i++)
    {
      ROS_DEBUG("Joint: %d %s",i,response.kinematic_solver_info.joint_names[i].c_str());
    }
  }
  else
  {
    ROS_ERROR("Could not call query service");
    ros::shutdown();
    exit(-1);
  }

  // define the service messages
  kinematics_msgs::GetConstraintAwarePositionIK::Request  gpik_req;
  kinematics_msgs::GetConstraintAwarePositionIK::Response gpik_res;

  gpik_req.timeout = ros::Duration(5.0);
  gpik_req.ik_request.ik_link_name = "r_wrist_roll_link";

  gpik_req.ik_request.pose_stamped.header.frame_id = "odom_combined";
  gpik_req.ik_request.pose_stamped.pose.position.x = 4.75;
  gpik_req.ik_request.pose_stamped.pose.position.y = -0.188;
  gpik_req.ik_request.pose_stamped.pose.position.z = .94;

  gpik_req.ik_request.pose_stamped.pose.orientation.x = 0.0;
  gpik_req.ik_request.pose_stamped.pose.orientation.y = 0.0;
  gpik_req.ik_request.pose_stamped.pose.orientation.z = 0.0;
  gpik_req.ik_request.pose_stamped.pose.orientation.w = 1.0;

  gpik_req.ik_request.ik_seed_state.joint_state.position.resize(response.kinematic_solver_info.joint_names.size());
  gpik_req.ik_request.ik_seed_state.joint_state.name = response.kinematic_solver_info.joint_names;

  for(unsigned int i=0; i< response.kinematic_solver_info.joint_names.size(); i++)
  {
    gpik_req.ik_request.ik_seed_state.joint_state.position[i] = (response.kinematic_solver_info.limits[i].min_position + response.kinematic_solver_info.limits[i].max_position)/2.0;
  }
  if(ik_with_collision_client.call(gpik_req, gpik_res))
  {
    if(gpik_res.error_code.val == gpik_res.error_code.SUCCESS)
    {
      for(unsigned int i=0; i < gpik_res.solution.joint_state.name.size(); i ++)
      {
        ROS_INFO("Joint: %s %f",gpik_res.solution.joint_state.name[i].c_str(),gpik_res.solution.joint_state.position[i]);
      } 
    }
    else
    {
      ROS_ERROR("Inverse kinematics failed");
    }
  }
  else
  {
    ROS_ERROR("Inverse kinematics service call failed");
  }
  ros::shutdown();
}
