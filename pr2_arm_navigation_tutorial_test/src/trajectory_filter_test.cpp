#include <ros/ros.h>
#include <arm_navigation_msgs/FilterJointTrajectory.h>

int main(int argc, char **argv){
  ros::init (argc, argv, "filter_joint_trajectory");
  ros::NodeHandle rh;
  ros::service::waitForService("trajectory_filter/filter_trajectory");
  arm_navigation_msgs::FilterJointTrajectory::Request req;
  arm_navigation_msgs::FilterJointTrajectory::Response res;
  ros::ServiceClient filter_trajectory_client_ = rh.serviceClient<arm_navigation_msgs::FilterJointTrajectory>("trajectory_filter/filter_trajectory");

  req.trajectory.joint_names.push_back("r_shoulder_pan_joint");
  req.trajectory.joint_names.push_back("r_shoulder_lift_joint");
  req.trajectory.points.resize(3);

  for(unsigned int i=0; i < 3; i++)
  {    
    req.trajectory.points[i].positions.resize(2);
  }
  
  req.trajectory.points[1].positions[0] = 0.5;
  req.trajectory.points[2].positions[0] = -1.5;

  req.trajectory.points[1].positions[1] = 0.2;
  req.trajectory.points[2].positions[1] = -0.5;

  req.allowed_time = ros::Duration(1.0);

  if(filter_trajectory_client_.call(req,res))
  {
    if(res.error_code.val == res.error_code.SUCCESS)
    {
      ROS_INFO("Requested trajectory was filtered");
      for(unsigned int i=0; i < res.trajectory.points.size(); i++)
      {
        ROS_INFO_STREAM(res.trajectory.points[i].positions[0] << "," << res.trajectory.points[i].velocities[0] << "," << res.trajectory.points[i].positions[1] << "," << res.trajectory.points[i].velocities[1] << "," << res.trajectory.points[i].time_from_start.toSec());
      }
    }
    else
      ROS_INFO("Requested trajectory was not filtered. Error code: %d",res.error_code.val);
  }
  else
  {
    ROS_ERROR("Service call to filter trajectory failed %s",filter_trajectory_client_.getService().c_str());
  }
  ros::shutdown();
}
