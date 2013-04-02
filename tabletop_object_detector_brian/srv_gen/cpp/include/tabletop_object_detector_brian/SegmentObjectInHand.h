/* Auto-generated by genmsg_cpp for file /home/brian/fuerte_workspace/sandbox/tabletop_object_detector_brian/srv/SegmentObjectInHand.srv */
#ifndef TABLETOP_OBJECT_DETECTOR_BRIAN_SERVICE_SEGMENTOBJECTINHAND_H
#define TABLETOP_OBJECT_DETECTOR_BRIAN_SERVICE_SEGMENTOBJECTINHAND_H
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



#include "sensor_msgs/PointCloud2.h"

namespace tabletop_object_detector_brian
{
template <class ContainerAllocator>
struct SegmentObjectInHandRequest_ {
  typedef SegmentObjectInHandRequest_<ContainerAllocator> Type;

  SegmentObjectInHandRequest_()
  : wrist_frame()
  {
  }

  SegmentObjectInHandRequest_(const ContainerAllocator& _alloc)
  : wrist_frame(_alloc)
  {
  }

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _wrist_frame_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  wrist_frame;


  typedef boost::shared_ptr< ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct SegmentObjectInHandRequest
typedef  ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<std::allocator<void> > SegmentObjectInHandRequest;

typedef boost::shared_ptr< ::tabletop_object_detector_brian::SegmentObjectInHandRequest> SegmentObjectInHandRequestPtr;
typedef boost::shared_ptr< ::tabletop_object_detector_brian::SegmentObjectInHandRequest const> SegmentObjectInHandRequestConstPtr;


template <class ContainerAllocator>
struct SegmentObjectInHandResponse_ {
  typedef SegmentObjectInHandResponse_<ContainerAllocator> Type;

  SegmentObjectInHandResponse_()
  : cluster()
  , result(0)
  {
  }

  SegmentObjectInHandResponse_(const ContainerAllocator& _alloc)
  : cluster(_alloc)
  , result(0)
  {
  }

  typedef  ::sensor_msgs::PointCloud2_<ContainerAllocator>  _cluster_type;
   ::sensor_msgs::PointCloud2_<ContainerAllocator>  cluster;

  typedef int32_t _result_type;
  int32_t result;

  enum { SUCCESS = 0 };
  enum { NO_CLOUD_RECEIVED = 1 };
  enum { TF_ERROR = 2 };
  enum { OTHER_ERROR = 3 };

  typedef boost::shared_ptr< ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct SegmentObjectInHandResponse
typedef  ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<std::allocator<void> > SegmentObjectInHandResponse;

typedef boost::shared_ptr< ::tabletop_object_detector_brian::SegmentObjectInHandResponse> SegmentObjectInHandResponsePtr;
typedef boost::shared_ptr< ::tabletop_object_detector_brian::SegmentObjectInHandResponse const> SegmentObjectInHandResponseConstPtr;

struct SegmentObjectInHand
{

typedef SegmentObjectInHandRequest Request;
typedef SegmentObjectInHandResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;
}; // struct SegmentObjectInHand
} // namespace tabletop_object_detector_brian

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "5653c37b6f08aa700c4b89db4ec53db6";
  }

  static const char* value(const  ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x5653c37b6f08aa70ULL;
  static const uint64_t static_value2 = 0x0c4b89db4ec53db6ULL;
};

template<class ContainerAllocator>
struct DataType< ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/SegmentObjectInHandRequest";
  }

  static const char* value(const  ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
string wrist_frame\n\
\n\
\n\
";
  }

  static const char* value(const  ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros


namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "9503d54a94abc90c0593a7f7530fb70e";
  }

  static const char* value(const  ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x9503d54a94abc90cULL;
  static const uint64_t static_value2 = 0x0593a7f7530fb70eULL;
};

template<class ContainerAllocator>
struct DataType< ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/SegmentObjectInHandResponse";
  }

  static const char* value(const  ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "\n\
\n\
sensor_msgs/PointCloud2 cluster\n\
\n\
\n\
int32 SUCCESS = 0\n\
int32 NO_CLOUD_RECEIVED = 1\n\
int32 TF_ERROR = 2\n\
int32 OTHER_ERROR = 3\n\
int32 result\n\
\n\
\n\
================================================================================\n\
MSG: sensor_msgs/PointCloud2\n\
# This message holds a collection of N-dimensional points, which may\n\
# contain additional information such as normals, intensity, etc. The\n\
# point data is stored as a binary blob, its layout described by the\n\
# contents of the \"fields\" array.\n\
\n\
# The point cloud data may be organized 2d (image-like) or 1d\n\
# (unordered). Point clouds organized as 2d images may be produced by\n\
# camera depth sensors such as stereo or time-of-flight.\n\
\n\
# Time of sensor data acquisition, and the coordinate frame ID (for 3d\n\
# points).\n\
Header header\n\
\n\
# 2D structure of the point cloud. If the cloud is unordered, height is\n\
# 1 and width is the length of the point cloud.\n\
uint32 height\n\
uint32 width\n\
\n\
# Describes the channels and their layout in the binary data blob.\n\
PointField[] fields\n\
\n\
bool    is_bigendian # Is this data bigendian?\n\
uint32  point_step   # Length of a point in bytes\n\
uint32  row_step     # Length of a row in bytes\n\
uint8[] data         # Actual point data, size is (row_step*height)\n\
\n\
bool is_dense        # True if there are no invalid points\n\
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
MSG: sensor_msgs/PointField\n\
# This message holds the description of one point entry in the\n\
# PointCloud2 message format.\n\
uint8 INT8    = 1\n\
uint8 UINT8   = 2\n\
uint8 INT16   = 3\n\
uint8 UINT16  = 4\n\
uint8 INT32   = 5\n\
uint8 UINT32  = 6\n\
uint8 FLOAT32 = 7\n\
uint8 FLOAT64 = 8\n\
\n\
string name      # Name of field\n\
uint32 offset    # Offset from start of point struct\n\
uint8  datatype  # Datatype enumeration, see above\n\
uint32 count     # How many elements in the field\n\
\n\
";
  }

  static const char* value(const  ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.wrist_frame);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct SegmentObjectInHandRequest_
} // namespace serialization
} // namespace ros


namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.cluster);
    stream.next(m.result);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct SegmentObjectInHandResponse_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace service_traits
{
template<>
struct MD5Sum<tabletop_object_detector_brian::SegmentObjectInHand> {
  static const char* value() 
  {
    return "3ce40b2b26a5a7d08d4f8e1e350c63f7";
  }

  static const char* value(const tabletop_object_detector_brian::SegmentObjectInHand&) { return value(); } 
};

template<>
struct DataType<tabletop_object_detector_brian::SegmentObjectInHand> {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/SegmentObjectInHand";
  }

  static const char* value(const tabletop_object_detector_brian::SegmentObjectInHand&) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "3ce40b2b26a5a7d08d4f8e1e350c63f7";
  }

  static const char* value(const tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> > {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/SegmentObjectInHand";
  }

  static const char* value(const tabletop_object_detector_brian::SegmentObjectInHandRequest_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct MD5Sum<tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "3ce40b2b26a5a7d08d4f8e1e350c63f7";
  }

  static const char* value(const tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct DataType<tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> > {
  static const char* value() 
  {
    return "tabletop_object_detector_brian/SegmentObjectInHand";
  }

  static const char* value(const tabletop_object_detector_brian::SegmentObjectInHandResponse_<ContainerAllocator> &) { return value(); } 
};

} // namespace service_traits
} // namespace ros

#endif // TABLETOP_OBJECT_DETECTOR_BRIAN_SERVICE_SEGMENTOBJECTINHAND_H

