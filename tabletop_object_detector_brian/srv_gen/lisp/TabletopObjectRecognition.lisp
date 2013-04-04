; Auto-generated. Do not edit!


(cl:in-package tabletop_object_detector-srv)


;//! \htmlinclude TabletopObjectRecognition-request.msg.html

(cl:defclass <TabletopObjectRecognition-request> (roslisp-msg-protocol:ros-message)
  ((table
    :reader table
    :initarg :table
    :type tabletop_object_detector-msg:Table
    :initform (cl:make-instance 'tabletop_object_detector-msg:Table))
   (clusters
    :reader clusters
    :initarg :clusters
    :type (cl:vector sensor_msgs-msg:PointCloud)
   :initform (cl:make-array 0 :element-type 'sensor_msgs-msg:PointCloud :initial-element (cl:make-instance 'sensor_msgs-msg:PointCloud)))
   (num_models
    :reader num_models
    :initarg :num_models
    :type cl:integer
    :initform 0)
   (perform_fit_merge
    :reader perform_fit_merge
    :initarg :perform_fit_merge
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TabletopObjectRecognition-request (<TabletopObjectRecognition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TabletopObjectRecognition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TabletopObjectRecognition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<TabletopObjectRecognition-request> is deprecated: use tabletop_object_detector-srv:TabletopObjectRecognition-request instead.")))

(cl:ensure-generic-function 'table-val :lambda-list '(m))
(cl:defmethod table-val ((m <TabletopObjectRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:table-val is deprecated.  Use tabletop_object_detector-srv:table instead.")
  (table m))

(cl:ensure-generic-function 'clusters-val :lambda-list '(m))
(cl:defmethod clusters-val ((m <TabletopObjectRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:clusters-val is deprecated.  Use tabletop_object_detector-srv:clusters instead.")
  (clusters m))

(cl:ensure-generic-function 'num_models-val :lambda-list '(m))
(cl:defmethod num_models-val ((m <TabletopObjectRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:num_models-val is deprecated.  Use tabletop_object_detector-srv:num_models instead.")
  (num_models m))

(cl:ensure-generic-function 'perform_fit_merge-val :lambda-list '(m))
(cl:defmethod perform_fit_merge-val ((m <TabletopObjectRecognition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:perform_fit_merge-val is deprecated.  Use tabletop_object_detector-srv:perform_fit_merge instead.")
  (perform_fit_merge m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TabletopObjectRecognition-request>) ostream)
  "Serializes a message object of type '<TabletopObjectRecognition-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'table) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'clusters))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'clusters))
  (cl:let* ((signed (cl:slot-value msg 'num_models)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'perform_fit_merge) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TabletopObjectRecognition-request>) istream)
  "Deserializes a message object of type '<TabletopObjectRecognition-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'table) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'clusters) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'clusters)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sensor_msgs-msg:PointCloud))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_models) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'perform_fit_merge) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TabletopObjectRecognition-request>)))
  "Returns string type for a service object of type '<TabletopObjectRecognition-request>"
  "tabletop_object_detector/TabletopObjectRecognitionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TabletopObjectRecognition-request)))
  "Returns string type for a service object of type 'TabletopObjectRecognition-request"
  "tabletop_object_detector/TabletopObjectRecognitionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TabletopObjectRecognition-request>)))
  "Returns md5sum for a message object of type '<TabletopObjectRecognition-request>"
  "f5867bc89b17633ae48681b939f1fbf7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TabletopObjectRecognition-request)))
  "Returns md5sum for a message object of type 'TabletopObjectRecognition-request"
  "f5867bc89b17633ae48681b939f1fbf7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TabletopObjectRecognition-request>)))
  "Returns full string definition for message of type '<TabletopObjectRecognition-request>"
  (cl:format cl:nil "~%Table table~%~%~%sensor_msgs/PointCloud[] clusters~%~%~%int32 num_models~%~%~%bool perform_fit_merge~%~%~%================================================================================~%MSG: tabletop_object_detector/Table~%# Informs that a planar table has been detected at a given location~%~%# The pose gives you the transform that take you to the coordinate system~%# of the table, with the origin somewhere in the table plane and the ~%# z axis normal to the plane~%geometry_msgs/PoseStamped pose~%~%# These values give you the observed extents of the table, along x and y,~%# in the table's own coordinate system (above)~%# there is no guarantee that the origin of the table coordinate system is~%# inside the boundary defined by these values. ~%float32 x_min~%float32 x_max~%float32 y_min~%float32 y_max~%~%# There is no guarantee that the table does NOT extend further than these ~%# values; this is just as far as we've observed it.~%~%~%# Newer table definition as triangle mesh of convex hull (relative to pose)~%arm_navigation_msgs/Shape convex_hull~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: arm_navigation_msgs/Shape~%byte SPHERE=0~%byte BOX=1~%byte CYLINDER=2~%byte MESH=3~%~%byte type~%~%~%#### define sphere, box, cylinder ####~%# the origin of each shape is considered at the shape's center~%~%# for sphere~%# radius := dimensions[0]~%~%# for cylinder~%# radius := dimensions[0]~%# length := dimensions[1]~%# the length is along the Z axis~%~%# for box~%# size_x := dimensions[0]~%# size_y := dimensions[1]~%# size_z := dimensions[2]~%float64[] dimensions~%~%~%#### define mesh ####~%~%# list of triangles; triangle k is defined by tre vertices located~%# at indices triangles[3k], triangles[3k+1], triangles[3k+2]~%int32[] triangles~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: sensor_msgs/PointCloud~%# This message holds a collection of 3d points, plus optional additional~%# information about each point.~%~%# Time of sensor data acquisition, coordinate frame ID.~%Header header~%~%# Array of 3d points. Each Point32 should be interpreted as a 3d point~%# in the frame given in the header.~%geometry_msgs/Point32[] points~%~%# Each channel should have the same number of elements as points array,~%# and the data in each channel should correspond 1:1 with each point.~%# Channel names in common practice are listed in ChannelFloat32.msg.~%ChannelFloat32[] channels~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sensor_msgs/ChannelFloat32~%# This message is used by the PointCloud message to hold optional data~%# associated with each point in the cloud. The length of the values~%# array should be the same as the length of the points array in the~%# PointCloud, and each value should be associated with the corresponding~%# point.~%~%# Channel names in existing practice include:~%#   \"u\", \"v\" - row and column (respectively) in the left stereo image.~%#              This is opposite to usual conventions but remains for~%#              historical reasons. The newer PointCloud2 message has no~%#              such problem.~%#   \"rgb\" - For point clouds produced by color stereo cameras. uint8~%#           (R,G,B) values packed into the least significant 24 bits,~%#           in order.~%#   \"intensity\" - laser or pixel intensity.~%#   \"distance\"~%~%# The channel name should give semantics of the channel (e.g.~%# \"intensity\" instead of \"value\").~%string name~%~%# The values array should be 1-1 with the elements of the associated~%# PointCloud.~%float32[] values~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TabletopObjectRecognition-request)))
  "Returns full string definition for message of type 'TabletopObjectRecognition-request"
  (cl:format cl:nil "~%Table table~%~%~%sensor_msgs/PointCloud[] clusters~%~%~%int32 num_models~%~%~%bool perform_fit_merge~%~%~%================================================================================~%MSG: tabletop_object_detector/Table~%# Informs that a planar table has been detected at a given location~%~%# The pose gives you the transform that take you to the coordinate system~%# of the table, with the origin somewhere in the table plane and the ~%# z axis normal to the plane~%geometry_msgs/PoseStamped pose~%~%# These values give you the observed extents of the table, along x and y,~%# in the table's own coordinate system (above)~%# there is no guarantee that the origin of the table coordinate system is~%# inside the boundary defined by these values. ~%float32 x_min~%float32 x_max~%float32 y_min~%float32 y_max~%~%# There is no guarantee that the table does NOT extend further than these ~%# values; this is just as far as we've observed it.~%~%~%# Newer table definition as triangle mesh of convex hull (relative to pose)~%arm_navigation_msgs/Shape convex_hull~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: arm_navigation_msgs/Shape~%byte SPHERE=0~%byte BOX=1~%byte CYLINDER=2~%byte MESH=3~%~%byte type~%~%~%#### define sphere, box, cylinder ####~%# the origin of each shape is considered at the shape's center~%~%# for sphere~%# radius := dimensions[0]~%~%# for cylinder~%# radius := dimensions[0]~%# length := dimensions[1]~%# the length is along the Z axis~%~%# for box~%# size_x := dimensions[0]~%# size_y := dimensions[1]~%# size_z := dimensions[2]~%float64[] dimensions~%~%~%#### define mesh ####~%~%# list of triangles; triangle k is defined by tre vertices located~%# at indices triangles[3k], triangles[3k+1], triangles[3k+2]~%int32[] triangles~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: sensor_msgs/PointCloud~%# This message holds a collection of 3d points, plus optional additional~%# information about each point.~%~%# Time of sensor data acquisition, coordinate frame ID.~%Header header~%~%# Array of 3d points. Each Point32 should be interpreted as a 3d point~%# in the frame given in the header.~%geometry_msgs/Point32[] points~%~%# Each channel should have the same number of elements as points array,~%# and the data in each channel should correspond 1:1 with each point.~%# Channel names in common practice are listed in ChannelFloat32.msg.~%ChannelFloat32[] channels~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sensor_msgs/ChannelFloat32~%# This message is used by the PointCloud message to hold optional data~%# associated with each point in the cloud. The length of the values~%# array should be the same as the length of the points array in the~%# PointCloud, and each value should be associated with the corresponding~%# point.~%~%# Channel names in existing practice include:~%#   \"u\", \"v\" - row and column (respectively) in the left stereo image.~%#              This is opposite to usual conventions but remains for~%#              historical reasons. The newer PointCloud2 message has no~%#              such problem.~%#   \"rgb\" - For point clouds produced by color stereo cameras. uint8~%#           (R,G,B) values packed into the least significant 24 bits,~%#           in order.~%#   \"intensity\" - laser or pixel intensity.~%#   \"distance\"~%~%# The channel name should give semantics of the channel (e.g.~%# \"intensity\" instead of \"value\").~%string name~%~%# The values array should be 1-1 with the elements of the associated~%# PointCloud.~%float32[] values~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TabletopObjectRecognition-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'table))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'clusters) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TabletopObjectRecognition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TabletopObjectRecognition-request
    (cl:cons ':table (table msg))
    (cl:cons ':clusters (clusters msg))
    (cl:cons ':num_models (num_models msg))
    (cl:cons ':perform_fit_merge (perform_fit_merge msg))
))
;//! \htmlinclude TabletopObjectRecognition-response.msg.html

(cl:defclass <TabletopObjectRecognition-response> (roslisp-msg-protocol:ros-message)
  ((models
    :reader models
    :initarg :models
    :type (cl:vector household_objects_database_msgs-msg:DatabaseModelPoseList)
   :initform (cl:make-array 0 :element-type 'household_objects_database_msgs-msg:DatabaseModelPoseList :initial-element (cl:make-instance 'household_objects_database_msgs-msg:DatabaseModelPoseList)))
   (cluster_model_indices
    :reader cluster_model_indices
    :initarg :cluster_model_indices
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass TabletopObjectRecognition-response (<TabletopObjectRecognition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TabletopObjectRecognition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TabletopObjectRecognition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<TabletopObjectRecognition-response> is deprecated: use tabletop_object_detector-srv:TabletopObjectRecognition-response instead.")))

(cl:ensure-generic-function 'models-val :lambda-list '(m))
(cl:defmethod models-val ((m <TabletopObjectRecognition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:models-val is deprecated.  Use tabletop_object_detector-srv:models instead.")
  (models m))

(cl:ensure-generic-function 'cluster_model_indices-val :lambda-list '(m))
(cl:defmethod cluster_model_indices-val ((m <TabletopObjectRecognition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:cluster_model_indices-val is deprecated.  Use tabletop_object_detector-srv:cluster_model_indices instead.")
  (cluster_model_indices m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TabletopObjectRecognition-response>) ostream)
  "Serializes a message object of type '<TabletopObjectRecognition-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'models))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'models))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cluster_model_indices))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'cluster_model_indices))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TabletopObjectRecognition-response>) istream)
  "Deserializes a message object of type '<TabletopObjectRecognition-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'models) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'models)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'household_objects_database_msgs-msg:DatabaseModelPoseList))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cluster_model_indices) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cluster_model_indices)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TabletopObjectRecognition-response>)))
  "Returns string type for a service object of type '<TabletopObjectRecognition-response>"
  "tabletop_object_detector/TabletopObjectRecognitionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TabletopObjectRecognition-response)))
  "Returns string type for a service object of type 'TabletopObjectRecognition-response"
  "tabletop_object_detector/TabletopObjectRecognitionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TabletopObjectRecognition-response>)))
  "Returns md5sum for a message object of type '<TabletopObjectRecognition-response>"
  "f5867bc89b17633ae48681b939f1fbf7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TabletopObjectRecognition-response)))
  "Returns md5sum for a message object of type 'TabletopObjectRecognition-response"
  "f5867bc89b17633ae48681b939f1fbf7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TabletopObjectRecognition-response>)))
  "Returns full string definition for message of type '<TabletopObjectRecognition-response>"
  (cl:format cl:nil "~%~%household_objects_database_msgs/DatabaseModelPoseList[] models~%~%~%~%int32[] cluster_model_indices~%~%~%================================================================================~%MSG: household_objects_database_msgs/DatabaseModelPoseList~%# stores a list of possible database models recognition results~%DatabaseModelPose[] model_list~%================================================================================~%MSG: household_objects_database_msgs/DatabaseModelPose~%# Informs that a specific model from the Model Database has been ~%# identified at a certain location~%~%# the database id of the model~%int32 model_id~%~%# the pose that it can be found in~%geometry_msgs/PoseStamped pose~%~%# a measure of the confidence level in this detection result~%float32 confidence~%~%# the name of the object detector that generated this detection result~%string detector_name~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TabletopObjectRecognition-response)))
  "Returns full string definition for message of type 'TabletopObjectRecognition-response"
  (cl:format cl:nil "~%~%household_objects_database_msgs/DatabaseModelPoseList[] models~%~%~%~%int32[] cluster_model_indices~%~%~%================================================================================~%MSG: household_objects_database_msgs/DatabaseModelPoseList~%# stores a list of possible database models recognition results~%DatabaseModelPose[] model_list~%================================================================================~%MSG: household_objects_database_msgs/DatabaseModelPose~%# Informs that a specific model from the Model Database has been ~%# identified at a certain location~%~%# the database id of the model~%int32 model_id~%~%# the pose that it can be found in~%geometry_msgs/PoseStamped pose~%~%# a measure of the confidence level in this detection result~%float32 confidence~%~%# the name of the object detector that generated this detection result~%string detector_name~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TabletopObjectRecognition-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'models) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cluster_model_indices) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TabletopObjectRecognition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TabletopObjectRecognition-response
    (cl:cons ':models (models msg))
    (cl:cons ':cluster_model_indices (cluster_model_indices msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TabletopObjectRecognition)))
  'TabletopObjectRecognition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TabletopObjectRecognition)))
  'TabletopObjectRecognition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TabletopObjectRecognition)))
  "Returns string type for a service object of type '<TabletopObjectRecognition>"
  "tabletop_object_detector/TabletopObjectRecognition")