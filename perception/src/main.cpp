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

    //create service and action clients
    ros::ServiceClient object_detection_srv;

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


    //call the tabletop detection
    ROS_INFO("Calling tabletop detector");
    tabletop_object_detector::TabletopDetection detection_call;
    //we want recognized database objects returned
    //set this to false if you are using the pipeline without the database
    detection_call.request.return_clusters = false;
    //we want the individual object point clouds returned as well
    detection_call.request.return_models = true;
    detection_call.request.num_models = 1;
    if (!object_detection_srv.call(detection_call))
    {
        ROS_ERROR("Tabletop detection service failed");
        return -1;
    }
    if (detection_call.response.detection.result !=
            detection_call.response.detection.SUCCESS)
    {
        ROS_ERROR("Tabletop detection returned error code %d",
                detection_call.response.detection.result);
        return -1;
    }
    if (detection_call.response.detection.clusters.empty() &&
            detection_call.response.detection.models.empty() )
    {
        ROS_ERROR("The tabletop detector detected the table, "
                "but found no objects");
        return -1;
    }
}
