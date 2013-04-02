#include <ros/ros.h>

#include <actionlib/client/simple_action_client.h>
#include <tabletop_object_detector/TabletopDetection.h>
#include <tabletop_collision_map_processing/TabletopCollisionMapProcessing.h>
#include <object_manipulation_msgs/PickupAction.h>
#include <object_manipulation_msgs/PlaceAction.h>

int main(int argc, char **argv)
{
    //initialize the ROS node
    ros::init(argc, argv, "pick_and_place_app");
    ros::NodeHandle nh;

    //set service and action names
    const std::string OBJECT_DETECTION_SERVICE_NAME =
        "/object_detection";
    const std::string COLLISION_PROCESSING_SERVICE_NAME =
        "/tabletop_collision_map_processing/tabletop_collision_map_processing";
    const std::string PICKUP_ACTION_NAME =
        "/object_manipulator/object_manipulator_pickup";
    const std::string PLACE_ACTION_NAME =
        "/object_manipulator/object_manipulator_place";

    //create service and action clients
    ros::ServiceClient object_detection_srv;
    ros::ServiceClient collision_processing_srv;
    actionlib::SimpleActionClient<object_manipulation_msgs::PickupAction>
        pickup_client(PICKUP_ACTION_NAME, true);
    actionlib::SimpleActionClient<object_manipulation_msgs::PlaceAction>
        place_client(PLACE_ACTION_NAME, true);

    //wait for detection client
    while ( !ros::service::waitForService(OBJECT_DETECTION_SERVICE_NAME,
                ros::Duration(2.0)) && nh.ok() )
    {
        ROS_INFO("Waiting for object detection service to come up");
    }
    if (!nh.ok()) exit(0);
    object_detection_srv =
        nh.serviceClient<tabletop_object_detector::TabletopDetection>
        (OBJECT_DETECTION_SERVICE_NAME, true);

    //wait for collision map processing client
    while ( !ros::service::waitForService(COLLISION_PROCESSING_SERVICE_NAME,
                ros::Duration(2.0)) && nh.ok() )
    {
        ROS_INFO("Waiting for collision processing service to come up");
    }
    if (!nh.ok()) exit(0);
    collision_processing_srv =
        nh.serviceClient
        <tabletop_collision_map_processing::TabletopCollisionMapProcessing>
        (COLLISION_PROCESSING_SERVICE_NAME, true);

    //wait for pickup client
    while(!pickup_client.waitForServer(ros::Duration(2.0)) && nh.ok())
    {
        ROS_INFO_STREAM("Waiting for action client " << PICKUP_ACTION_NAME);
    }
    if (!nh.ok()) exit(0);

    //wait for place client
    while(!place_client.waitForServer(ros::Duration(2.0)) && nh.ok())
    {
        ROS_INFO_STREAM("Waiting for action client " << PLACE_ACTION_NAME);
    }
    if (!nh.ok()) exit(0);
}
