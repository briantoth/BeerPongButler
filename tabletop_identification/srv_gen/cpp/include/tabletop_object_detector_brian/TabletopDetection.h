/* Auto-generated by genmsg_cpp for file /home/brian/fuerte_workspace/sandbox/tabletop_object_detector_brian/srv/TabletopDetection.srv */
#ifndef TABLETOP_OBJECT_DETECTOR_BRIAN_SERVICE_TABLETOPDETECTION_H
#define TABLETOP_OBJECT_DETECTOR_BRIAN_SERVICE_TABLETOPDETECTION_H
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

#include "ros/service_traits.h"



#include "tabletop_object_detector_brian/TabletopDetectionResult.h"

namespace tabletop_object_detector_brian
{
template <class ContainerAllocator>
struct TabletopDetectionRequest_ {
  typedef TabletopDetectionRequest_<ContainerAllocator> Type;

  TabletopDetectionRequest_()
  : return_clusters(false)
  , return_models(false)
  , num_models(0)
  {
  }

  TabletopDetectionRequest_(const ContainerAllocator& _alloc)
  : return_clusters(false)
  , return_models(false)
  , num_models(0)
  {
  }

  typedef uint8_t _return_clusters_type;
  uint8_t return_clusters;

  typedef uint8_t _return_models_type;
  uint8_t return_models;

  typedef int32_t _num_models_type;
  int32_t num_models;


  typedef boost::shared_ptr< ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct TabletopDetectionRequest
typedef  ::tabletop_object_detector_brian::TabletopDetectionRequest_<std::allocator<void> > TabletopDetectionRequest;

typedef boost::shared_ptr< ::tabletop_object_detector_brian::TabletopDetectionRequest> TabletopDetectionRequestPtr;
typedef boost::shared_ptr< ::tabletop_object_detector_brian::TabletopDetectionRequest const> TabletopDetectionRequestConstPtr;


template <class ContainerAllocator>
struct TabletopDetectionResponse_ {
  typedef TabletopDetectionResponse_<ContainerAllocator> Type;

  TabletopDetectionResponse_()
  : detection()
  {
  }

  TabletopDetectionResponse_(const ContainerAllocator& _alloc)
  : detection(_alloc)
  {
  }

  typedef  ::tabletop_object_detector_brian::TabletopDetectionResult_<ContainerAllocator>  _detection_type;
   ::tabletop_object_detector_brian::TabletopDetectionResult_<ContainerAllocator>  detection;


  typedef boost::shared_ptr< ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct TabletopDetectionResponse
typedef  ::tabletop_object_detector_brian::TabletopDetectionResponse_<std::allocator<void> > TabletopDetectionResponse;

typedef boost::shared_ptr< ::tabletop_object_detector_brian::TabletopDetectionResponse> TabletopDetectionResponsePtr;
typedef boost::shared_ptr< ::tabletop_object_detector_brian::TabletopDetectionResponse const> TabletopDetectionResponseConstPtr;

struct TabletopDetection
{

typedef TabletopDetectionRequest Request;
typedef TabletopDetectionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct TabletopDetection
} // namespace tabletop_object_detector_brian

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "f42d30308c026708dba683b43ccd22b8";
  }

  static const char* value(const  ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0xf42d30308c026708ULL;
  static const uint64_t static_value2 = 0xdba683b43ccd22b8ULL;
};

template<class ContainerAllocator>
struct DataType< ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/TabletopDetectionRequest";
  }

  static const char* value(const  ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
\n\
\n\
\n\
\n\
bool return_clusters\n\
\n\
\n\
\n\
bool return_models\n\
\n\
\n\
int32 num_models\n\
\n\
";
  }

  static const char* value(const  ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct IsFixedSize< ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "1887016fd77eb33b9e6335b14d02b156";
  }

  static const char* value(const  ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x1887016fd77eb33bULL;
  static const uint64_t static_value2 = 0x9e6335b14d02b156ULL;
};

template<class ContainerAllocator>
struct DataType< ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/TabletopDetectionResponse";
  }

  static const char* value(const  ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
TabletopDetectionResult detection\n\
\n\
\n\
================================================================================\n\
MSG: tabletop_object_detector_brian/TabletopDetectionResult\n\
# Contains all the information from one run of the tabletop detection node\n\
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
MSG: tabletop_object_detector_brian/Table\n\
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

  static const char* value(const  ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.return_clusters);
    stream.next(m.return_models);
    stream.next(m.num_models);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct TabletopDetectionRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.detection);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct TabletopDetectionResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<tabletop_object_detector_brian::TabletopDetection> {
  static const char* value() 
  {
    return "2c2af970832ab0ca635bc95df7de690a";
  }

  static const char* value(const tabletop_object_detector_brian::TabletopDetection&) { return value(); } 
};

template<>
struct DataType<tabletop_object_detector_brian::TabletopDetection> {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/TabletopDetection";
  }

  static const char* value(const tabletop_object_detector_brian::TabletopDetection&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "2c2af970832ab0ca635bc95df7de690a";
  }

  static const char* value(const tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/TabletopDetection";
  }

  static const char* value(const tabletop_object_detector_brian::TabletopDetectionRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "2c2af970832ab0ca635bc95df7de690a";
  }

  static const char* value(const tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/TabletopDetection";
  }

  static const char* value(const tabletop_object_detector_brian::TabletopDetectionResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // TABLETOP_OBJECT_DETECTOR_BRIAN_SERVICE_TABLETOPDETECTION_H

