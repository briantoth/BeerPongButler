/* Auto-generated by genmsg_cpp for file /tmp/buildd/ros-fuerte-pr2-object-manipulation-0.6.7/debian/ros-fuerte-pr2-object-manipulation/opt/ros/fuerte/stacks/pr2_object_manipulation/perception/tabletop_object_detector/msg/TabletopDetectionResult.msg */
#ifndef TABLETOP_OBJECT_DETECTOR_MESSAGE_TABLETOPDETECTIONRESULT_H
#define TABLETOP_OBJECT_DETECTOR_MESSAGE_TABLETOPDETECTIONRESULT_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"

#include "tabletop_object_detector/Table.h"
#include "sensor_msgs/PointCloud.h"
#include "household_objects_database_msgs/DatabaseModelPoseList.h"

namespace tabletop_object_detector
{
template <class ContainerAllocator>
struct TabletopDetectionResult_ {
  typedef TabletopDetectionResult_<ContainerAllocator> Type;

  TabletopDetectionResult_()
  : table()
  , clusters()
  , models()
  , cluster_model_indices()
  , result(0)
  {
  }

  TabletopDetectionResult_(const ContainerAllocator& _alloc)
  : table(_alloc)
  , clusters(_alloc)
  , models(_alloc)
  , cluster_model_indices(_alloc)
  , result(0)
  {
  }

  typedef  ::tabletop_object_detector::Table_<ContainerAllocator>  _table_type;
   ::tabletop_object_detector::Table_<ContainerAllocator>  table;

  typedef std::vector< ::sensor_msgs::PointCloud_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::sensor_msgs::PointCloud_<ContainerAllocator> >::other >  _clusters_type;
  std::vector< ::sensor_msgs::PointCloud_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::sensor_msgs::PointCloud_<ContainerAllocator> >::other >  clusters;

  typedef std::vector< ::household_objects_database_msgs::DatabaseModelPoseList_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::household_objects_database_msgs::DatabaseModelPoseList_<ContainerAllocator> >::other >  _models_type;
  std::vector< ::household_objects_database_msgs::DatabaseModelPoseList_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::household_objects_database_msgs::DatabaseModelPoseList_<ContainerAllocator> >::other >  models;

  typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _cluster_model_indices_type;
  std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  cluster_model_indices;

  typedef int32_t _result_type;
  int32_t result;

  enum { NO_CLOUD_RECEIVED = 1 };
  enum { NO_TABLE = 2 };
  enum { OTHER_ERROR = 3 };
  enum { SUCCESS = 4 };

  typedef boost::shared_ptr< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct TabletopDetectionResult
typedef  ::tabletop_object_detector::TabletopDetectionResult_<std::allocator<void> > TabletopDetectionResult;

typedef boost::shared_ptr< ::tabletop_object_detector::TabletopDetectionResult> TabletopDetectionResultPtr;
typedef boost::shared_ptr< ::tabletop_object_detector::TabletopDetectionResult const> TabletopDetectionResultConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace tabletop_object_detector

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> > {
  static const char* value() 
  {
    return "026c0e5e13258b4a96f7d3999ea3cd64";
  }

  static const char* value(const  ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x026c0e5e13258b4aULL;
  static const uint64_t static_value2 = 0x96f7d3999ea3cd64ULL;
};

template<class ContainerAllocator>
struct DataType< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> > {
  static const char* value() 
  {
    return "tabletop_object_detector/TabletopDetectionResult";
  }

  static const char* value(const  ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> > {
  static const char* value() 
  {
    return "# Contains all the information from one run of the tabletop detection node\n\
\n\
# The information for the plane that has been detected\n\
Table table\n\
\n\
# The raw clusters detected in the scan \n\
sensor_msgs/PointCloud[] clusters\n\
\n\
# The list of potential models that have been detected for each cluster\n\
# An empty list will be returned for a cluster that has no recognition results at all\n\
household_objects_database_msgs/DatabaseModelPoseList[] models\n\
\n\
# For each cluster, the index of the list of models that was fit to that cluster\n\
# keep in mind that multiple raw clusters can correspond to a single fit\n\
int32[] cluster_model_indices\n\
\n\
# Whether the detection has succeeded or failed\n\
int32 NO_CLOUD_RECEIVED = 1\n\
int32 NO_TABLE = 2\n\
int32 OTHER_ERROR = 3\n\
int32 SUCCESS = 4\n\
int32 result\n\
\n\
================================================================================\n\
MSG: tabletop_object_detector/Table\n\
# Informs that a planar table has been detected at a given location\n\
\n\
# The pose gives you the transform that take you to the coordinate system\n\
# of the table, with the origin somewhere in the table plane and the \n\
# z axis normal to the plane\n\
geometry_msgs/PoseStamped pose\n\
\n\
# These values give you the observed extents of the table, along x and y,\n\
# in the table's own coordinate system (above)\n\
# there is no guarantee that the origin of the table coordinate system is\n\
# inside the boundary defined by these values. \n\
float32 x_min\n\
float32 x_max\n\
float32 y_min\n\
float32 y_max\n\
\n\
# There is no guarantee that the table does NOT extend further than these \n\
# values; this is just as far as we've observed it.\n\
\n\
\n\
# Newer table definition as triangle mesh of convex hull (relative to pose)\n\
arm_navigation_msgs/Shape convex_hull\n\
\n\
================================================================================\n\
MSG: geometry_msgs/PoseStamped\n\
# A Pose with reference coordinate frame and timestamp\n\
Header header\n\
Pose pose\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.secs: seconds (stamp_secs) since epoch\n\
# * stamp.nsecs: nanoseconds since stamp_secs\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of postion and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
\n\
================================================================================\n\
MSG: arm_navigation_msgs/Shape\n\
byte SPHERE=0\n\
byte BOX=1\n\
byte CYLINDER=2\n\
byte MESH=3\n\
\n\
byte type\n\
\n\
\n\
#### define sphere, box, cylinder ####\n\
# the origin of each shape is considered at the shape's center\n\
\n\
# for sphere\n\
# radius := dimensions[0]\n\
\n\
# for cylinder\n\
# radius := dimensions[0]\n\
# length := dimensions[1]\n\
# the length is along the Z axis\n\
\n\
# for box\n\
# size_x := dimensions[0]\n\
# size_y := dimensions[1]\n\
# size_z := dimensions[2]\n\
float64[] dimensions\n\
\n\
\n\
#### define mesh ####\n\
\n\
# list of triangles; triangle k is defined by tre vertices located\n\
# at indices triangles[3k], triangles[3k+1], triangles[3k+2]\n\
int32[] triangles\n\
geometry_msgs/Point[] vertices\n\
\n\
================================================================================\n\
MSG: sensor_msgs/PointCloud\n\
# This message holds a collection of 3d points, plus optional additional\n\
# information about each point.\n\
\n\
# Time of sensor data acquisition, coordinate frame ID.\n\
Header header\n\
\n\
# Array of 3d points. Each Point32 should be interpreted as a 3d point\n\
# in the frame given in the header.\n\
geometry_msgs/Point32[] points\n\
\n\
# Each channel should have the same number of elements as points array,\n\
# and the data in each channel should correspond 1:1 with each point.\n\
# Channel names in common practice are listed in ChannelFloat32.msg.\n\
ChannelFloat32[] channels\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point32\n\
# This contains the position of a point in free space(with 32 bits of precision).\n\
# It is recommeded to use Point wherever possible instead of Point32.  \n\
# \n\
# This recommendation is to promote interoperability.  \n\
#\n\
# This message is designed to take up less space when sending\n\
# lots of points at once, as in the case of a PointCloud.  \n\
\n\
float32 x\n\
float32 y\n\
float32 z\n\
================================================================================\n\
MSG: sensor_msgs/ChannelFloat32\n\
# This message is used by the PointCloud message to hold optional data\n\
# associated with each point in the cloud. The length of the values\n\
# array should be the same as the length of the points array in the\n\
# PointCloud, and each value should be associated with the corresponding\n\
# point.\n\
\n\
# Channel names in existing practice include:\n\
#   \"u\", \"v\" - row and column (respectively) in the left stereo image.\n\
#              This is opposite to usual conventions but remains for\n\
#              historical reasons. The newer PointCloud2 message has no\n\
#              such problem.\n\
#   \"rgb\" - For point clouds produced by color stereo cameras. uint8\n\
#           (R,G,B) values packed into the least significant 24 bits,\n\
#           in order.\n\
#   \"intensity\" - laser or pixel intensity.\n\
#   \"distance\"\n\
\n\
# The channel name should give semantics of the channel (e.g.\n\
# \"intensity\" instead of \"value\").\n\
string name\n\
\n\
# The values array should be 1-1 with the elements of the associated\n\
# PointCloud.\n\
float32[] values\n\
\n\
================================================================================\n\
MSG: household_objects_database_msgs/DatabaseModelPoseList\n\
# stores a list of possible database models recognition results\n\
DatabaseModelPose[] model_list\n\
================================================================================\n\
MSG: household_objects_database_msgs/DatabaseModelPose\n\
# Informs that a specific model from the Model Database has been \n\
# identified at a certain location\n\
\n\
# the database id of the model\n\
int32 model_id\n\
\n\
# the pose that it can be found in\n\
geometry_msgs/PoseStamped pose\n\
\n\
# a measure of the confidence level in this detection result\n\
float32 confidence\n\
\n\
# the name of the object detector that generated this detection result\n\
string detector_name\n\
\n\
";
  }

  static const char* value(const  ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.table);
    stream.next(m.clusters);
    stream.next(m.models);
    stream.next(m.cluster_model_indices);
    stream.next(m.result);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct TabletopDetectionResult_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::tabletop_object_detector::TabletopDetectionResult_<ContainerAllocator> & v) 
  {
    s << indent << "table: ";
s << std::endl;
    Printer< ::tabletop_object_detector::Table_<ContainerAllocator> >::stream(s, indent + "  ", v.table);
    s << indent << "clusters[]" << std::endl;
    for (size_t i = 0; i < v.clusters.size(); ++i)
    {
      s << indent << "  clusters[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::sensor_msgs::PointCloud_<ContainerAllocator> >::stream(s, indent + "    ", v.clusters[i]);
    }
    s << indent << "models[]" << std::endl;
    for (size_t i = 0; i < v.models.size(); ++i)
    {
      s << indent << "  models[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::household_objects_database_msgs::DatabaseModelPoseList_<ContainerAllocator> >::stream(s, indent + "    ", v.models[i]);
    }
    s << indent << "cluster_model_indices[]" << std::endl;
    for (size_t i = 0; i < v.cluster_model_indices.size(); ++i)
    {
      s << indent << "  cluster_model_indices[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.cluster_model_indices[i]);
    }
    s << indent << "result: ";
    Printer<int32_t>::stream(s, indent + "  ", v.result);
  }
};


} // namespace message_operations
} // namespace ros

#endif // TABLETOP_OBJECT_DETECTOR_MESSAGE_TABLETOPDETECTIONRESULT_H

