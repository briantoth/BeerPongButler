#include "ros/ros.h"
#include <sensor_msgs/PointCloud.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud_conversion.h>
#include <cstdlib>

sensor_msgs::PointCloud output;
ros::Publisher converter_pub;

void chatterCallback(const sensor_msgs::PointCloud2& msg)
{
    sensor_msgs::convertPointCloud2ToPointCloud(msg, output);
    ROS_INFO("Conversion complete");
    converter_pub.publish(output);
}


int main(int argc, char **argv)
{
  ros::init(argc, argv, "converter");

  ros::NodeHandle conv;

  converter_pub = conv.advertise<sensor_msgs::PointCloud>("converter", 1000);
  ros::Subscriber sub = conv.subscribe("/camera/depth_registered/points", 1000, chatterCallback);

  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
  while (ros::ok())
  {
    /**
     * This is a message object. You stuff it with data, and then publish it.
     */


    /**
     * The publish() function is how you send messages. The parameter
     * is the message object. The type of this object must agree with the type
     * given as a template parameter to the advertise<>() call, as was done
     * in the constructor above.
     */

    ros::spinOnce();

  }


  return 0;
}


