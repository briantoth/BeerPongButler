; Auto-generated. Do not edit!


(cl:in-package tabletop_object_detector-srv)


;//! \htmlinclude SegmentObjectInHand-request.msg.html

(cl:defclass <SegmentObjectInHand-request> (roslisp-msg-protocol:ros-message)
  ((wrist_frame
    :reader wrist_frame
    :initarg :wrist_frame
    :type cl:string
    :initform ""))
)

(cl:defclass SegmentObjectInHand-request (<SegmentObjectInHand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SegmentObjectInHand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SegmentObjectInHand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<SegmentObjectInHand-request> is deprecated: use tabletop_object_detector-srv:SegmentObjectInHand-request instead.")))

(cl:ensure-generic-function 'wrist_frame-val :lambda-list '(m))
(cl:defmethod wrist_frame-val ((m <SegmentObjectInHand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:wrist_frame-val is deprecated.  Use tabletop_object_detector-srv:wrist_frame instead.")
  (wrist_frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SegmentObjectInHand-request>) ostream)
  "Serializes a message object of type '<SegmentObjectInHand-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'wrist_frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'wrist_frame))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SegmentObjectInHand-request>) istream)
  "Deserializes a message object of type '<SegmentObjectInHand-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wrist_frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'wrist_frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SegmentObjectInHand-request>)))
  "Returns string type for a service object of type '<SegmentObjectInHand-request>"
  "tabletop_object_detector/SegmentObjectInHandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SegmentObjectInHand-request)))
  "Returns string type for a service object of type 'SegmentObjectInHand-request"
  "tabletop_object_detector/SegmentObjectInHandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SegmentObjectInHand-request>)))
  "Returns md5sum for a message object of type '<SegmentObjectInHand-request>"
  "3ce40b2b26a5a7d08d4f8e1e350c63f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SegmentObjectInHand-request)))
  "Returns md5sum for a message object of type 'SegmentObjectInHand-request"
  "3ce40b2b26a5a7d08d4f8e1e350c63f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SegmentObjectInHand-request>)))
  "Returns full string definition for message of type '<SegmentObjectInHand-request>"
  (cl:format cl:nil "~%string wrist_frame~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SegmentObjectInHand-request)))
  "Returns full string definition for message of type 'SegmentObjectInHand-request"
  (cl:format cl:nil "~%string wrist_frame~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SegmentObjectInHand-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'wrist_frame))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SegmentObjectInHand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SegmentObjectInHand-request
    (cl:cons ':wrist_frame (wrist_frame msg))
))
;//! \htmlinclude SegmentObjectInHand-response.msg.html

(cl:defclass <SegmentObjectInHand-response> (roslisp-msg-protocol:ros-message)
  ((cluster
    :reader cluster
    :initarg :cluster
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass SegmentObjectInHand-response (<SegmentObjectInHand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SegmentObjectInHand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SegmentObjectInHand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<SegmentObjectInHand-response> is deprecated: use tabletop_object_detector-srv:SegmentObjectInHand-response instead.")))

(cl:ensure-generic-function 'cluster-val :lambda-list '(m))
(cl:defmethod cluster-val ((m <SegmentObjectInHand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:cluster-val is deprecated.  Use tabletop_object_detector-srv:cluster instead.")
  (cluster m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SegmentObjectInHand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:result-val is deprecated.  Use tabletop_object_detector-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<SegmentObjectInHand-response>)))
    "Constants for message type '<SegmentObjectInHand-response>"
  '((:SUCCESS . 0)
    (:NO_CLOUD_RECEIVED . 1)
    (:TF_ERROR . 2)
    (:OTHER_ERROR . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'SegmentObjectInHand-response)))
    "Constants for message type 'SegmentObjectInHand-response"
  '((:SUCCESS . 0)
    (:NO_CLOUD_RECEIVED . 1)
    (:TF_ERROR . 2)
    (:OTHER_ERROR . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SegmentObjectInHand-response>) ostream)
  "Serializes a message object of type '<SegmentObjectInHand-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cluster) ostream)
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SegmentObjectInHand-response>) istream)
  "Deserializes a message object of type '<SegmentObjectInHand-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cluster) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SegmentObjectInHand-response>)))
  "Returns string type for a service object of type '<SegmentObjectInHand-response>"
  "tabletop_object_detector/SegmentObjectInHandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SegmentObjectInHand-response)))
  "Returns string type for a service object of type 'SegmentObjectInHand-response"
  "tabletop_object_detector/SegmentObjectInHandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SegmentObjectInHand-response>)))
  "Returns md5sum for a message object of type '<SegmentObjectInHand-response>"
  "3ce40b2b26a5a7d08d4f8e1e350c63f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SegmentObjectInHand-response)))
  "Returns md5sum for a message object of type 'SegmentObjectInHand-response"
  "3ce40b2b26a5a7d08d4f8e1e350c63f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SegmentObjectInHand-response>)))
  "Returns full string definition for message of type '<SegmentObjectInHand-response>"
  (cl:format cl:nil "~%~%sensor_msgs/PointCloud2 cluster~%~%~%int32 SUCCESS = 0~%int32 NO_CLOUD_RECEIVED = 1~%int32 TF_ERROR = 2~%int32 OTHER_ERROR = 3~%int32 result~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SegmentObjectInHand-response)))
  "Returns full string definition for message of type 'SegmentObjectInHand-response"
  (cl:format cl:nil "~%~%sensor_msgs/PointCloud2 cluster~%~%~%int32 SUCCESS = 0~%int32 NO_CLOUD_RECEIVED = 1~%int32 TF_ERROR = 2~%int32 OTHER_ERROR = 3~%int32 result~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SegmentObjectInHand-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cluster))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SegmentObjectInHand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SegmentObjectInHand-response
    (cl:cons ':cluster (cluster msg))
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SegmentObjectInHand)))
  'SegmentObjectInHand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SegmentObjectInHand)))
  'SegmentObjectInHand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SegmentObjectInHand)))
  "Returns string type for a service object of type '<SegmentObjectInHand>"
  "tabletop_object_detector/SegmentObjectInHand")