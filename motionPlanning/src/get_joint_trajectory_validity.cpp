#include <ros/ros.h>
#include <arm_navigation_msgs/GetPlanningScene.h>
#include <planning_environment/models/collision_models.h>

static const std::string SET_PLANNING_SCENE_DIFF_NAME = "/environment_server/set_planning_scene_diff";

int main(int argc, char **argv){
  ros::init (argc, argv, "get_state_validity_test");
  ros::NodeHandle rh;

  ros::Publisher vis_marker_publisher_;
  ros::Publisher vis_marker_array_publisher_;

  vis_marker_publisher_ = rh.advertise<visualization_msgs::Marker>("state_validity_markers", 128);
  vis_marker_array_publisher_ = rh.advertise<visualization_msgs::MarkerArray>("state_validity_markers_array", 128);

  ros::service::waitForService(SET_PLANNING_SCENE_DIFF_NAME);
  ros::ServiceClient get_planning_scene_client = 
    rh.serviceClient<arm_navigation_msgs::GetPlanningScene>(SET_PLANNING_SCENE_DIFF_NAME);

  arm_navigation_msgs::GetPlanningScene::Request planning_scene_req;
  arm_navigation_msgs::GetPlanningScene::Response planning_scene_res;

  if(!get_planning_scene_client.call(planning_scene_req, planning_scene_res)) {
    ROS_WARN("Can't get planning scene");
    return -1;
  }

  planning_environment::CollisionModels collision_models("robot_description");
  planning_models::KinematicState* state = 
    collision_models.setPlanningScene(planning_scene_res.planning_scene);

  std::vector<std::string> arm_names = 
    collision_models.getKinematicModel()->getModelGroup("right_arm")->getUpdatedLinkModelNames();
  std::vector<std::string> joint_names = 
    collision_models.getKinematicModel()->getModelGroup("right_arm")->getJointModelNames();

  trajectory_msgs::JointTrajectory trajectory;
  trajectory.joint_names.push_back("r_shoulder_pan_joint");
  trajectory.points.resize(100);

  std::map<std::string, double> start_vals;
  state->getKinematicStateValues(start_vals);
  double start_angle = start_vals["r_shoulder_pan_joint"];

  double goal_angle = .9;
  if(argc > 1) {
    std::stringstream s(argv[1]);
    s >> goal_angle;
  }

  for(unsigned int i=0; i < 100; i++)
  {    
    trajectory.points[i].positions.push_back(start_angle+i*(goal_angle-start_angle)/100.0);
  }

  std_msgs::ColorRGBA good_color, collision_color, joint_limits_color;
  good_color.a = collision_color.a = joint_limits_color.a = .8;

  good_color.g = 1.0;
  collision_color.r = 1.0;
  joint_limits_color.b = 1.0;

  std_msgs::ColorRGBA point_markers;
  point_markers.a = 1.0;
  point_markers.r = 1.0;
  point_markers.g = .8;

  visualization_msgs::MarkerArray arr;

  arm_navigation_msgs::ArmNavigationErrorCodes traj_code;
  std::vector<arm_navigation_msgs::ArmNavigationErrorCodes> traj_codes;
  arm_navigation_msgs::Constraints empty_constraints;

  std::map<std::string, double> state_vals;
  if(!collision_models.isJointTrajectoryValid(*state,
                                              trajectory,
                                              empty_constraints,
                                              empty_constraints,
                                              traj_code,
                                              traj_codes,
                                              false)) {
    std_msgs::ColorRGBA color;
    state_vals["r_shoulder_pan_joint"] = trajectory.points[traj_codes.size()-1].positions[0];
    state->setKinematicState(state_vals);
    if(traj_code.val == traj_code.JOINT_LIMITS_VIOLATED) {
      color = joint_limits_color;
    } else {
      color = collision_color;
      collision_models.getAllCollisionPointMarkers(*state,
                                                   arr,
                                                   point_markers,
                                                   ros::Duration(0.2));
    }
    collision_models.getRobotMarkersGivenState(*state,
                                               arr,
                                               color,
                                               "right_arm_invalid",
                                               ros::Duration(0.2),
                                               &arm_names);
  }
  state_vals["r_shoulder_pan_joint"] = trajectory.points.back().positions[0];
  state->setKinematicState(state_vals);
  collision_models.getRobotMarkersGivenState(*state,
                                             arr,
                                             good_color,
                                             "right_arm_goal",
                                             ros::Duration(0.2),
                                             &arm_names);

  while(ros::ok()) {    
    vis_marker_array_publisher_.publish(arr);
    ros::spinOnce();
    ros::Duration(.1).sleep();
  }
  collision_models.revertPlanningScene(state);
  ros::shutdown();
}

