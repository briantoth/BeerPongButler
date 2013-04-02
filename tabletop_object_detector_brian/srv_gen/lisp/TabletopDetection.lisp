; Auto-generated. Do not edit!


(cl:in-package tabletop_object_detector-srv)


;//! \htmlinclude TabletopDetection-request.msg.html

(cl:defclass <TabletopDetection-request> (roslisp-msg-protocol:ros-message)
  ((return_clusters
    :reader return_clusters
    :initarg :return_clusters
    :type cl:boolean
    :initform cl:nil)
   (return_models
    :reader return_models
    :initarg :return_models
    :type cl:boolean
    :initform cl:nil)
   (num_models
    :reader num_models
    :initarg :num_models
    :type cl:integer
    :initform 0))
)

(cl:defclass TabletopDetection-request (<TabletopDetection-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TabletopDetection-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TabletopDetection-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<TabletopDetection-request> is deprecated: use tabletop_object_detector-srv:TabletopDetection-request instead.")))

(cl:ensure-generic-function 'return_clusters-val :lambda-list '(m))
(cl:defmethod return_clusters-val ((m <TabletopDetection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:return_clusters-val is deprecated.  Use tabletop_object_detector-srv:return_clusters instead.")
  (return_clusters m))

(cl:ensure-generic-function 'return_models-val :lambda-list '(m))
(cl:defmethod return_models-val ((m <TabletopDetection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:return_models-val is deprecated.  Use tabletop_object_detector-srv:return_models instead.")
  (return_models m))

(cl:ensure-generic-function 'num_models-val :lambda-list '(m))
(cl:defmethod num_models-val ((m <TabletopDetection-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:num_models-val is deprecated.  Use tabletop_object_detector-srv:num_models instead.")
  (num_models m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TabletopDetection-request>) ostream)
  "Serializes a message object of type '<TabletopDetection-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'return_clusters) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'return_models) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'num_models)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TabletopDetection-request>) istream)
  "Deserializes a message object of type '<TabletopDetection-request>"
    (cl:setf (cl:slot-value msg 'return_clusters) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'return_models) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num_models) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TabletopDetection-request>)))
  "Returns string type for a service object of type '<TabletopDetection-request>"
  "tabletop_object_detector/TabletopDetectionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TabletopDetection-request)))
  "Returns string type for a service object of type 'TabletopDetection-request"
  "tabletop_object_detector/TabletopDetectionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TabletopDetection-request>)))
  "Returns md5sum for a message object of type '<TabletopDetection-request>"
  "2c2af970832ab0ca635bc95df7de690a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TabletopDetection-request)))
  "Returns md5sum for a message object of type 'TabletopDetection-request"
  "2c2af970832ab0ca635bc95df7de690a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TabletopDetection-request>)))
  "Returns full string definition for message of type '<TabletopDetection-request>"
  (cl:format cl:nil "~%~%~%~%~%bool return_clusters~%~%~%~%bool return_models~%~%~%int32 num_models~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TabletopDetection-request)))
  "Returns full string definition for message of type 'TabletopDetection-request"
  (cl:format cl:nil "~%~%~%~%~%bool return_clusters~%~%~%~%bool return_models~%~%~%int32 num_models~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TabletopDetection-request>))
  (cl:+ 0
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TabletopDetection-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TabletopDetection-request
    (cl:cons ':return_clusters (return_clusters msg))
    (cl:cons ':return_models (return_models msg))
    (cl:cons ':num_models (num_models msg))
))
;//! \htmlinclude TabletopDetection-response.msg.html

(cl:defclass <TabletopDetection-response> (roslisp-msg-protocol:ros-message)
  ((detection
    :reader detection
    :initarg :detection
    :type tabletop_object_detector-msg:TabletopDetectionResult
    :initform (cl:make-instance 'tabletop_object_detector-msg:TabletopDetectionResult)))
)

(cl:defclass TabletopDetection-response (<TabletopDetection-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TabletopDetection-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TabletopDetection-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<TabletopDetection-response> is deprecated: use tabletop_object_detector-srv:TabletopDetection-response instead.")))

(cl:ensure-generic-function 'detection-val :lambda-list '(m))
(cl:defmethod detection-val ((m <TabletopDetection-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:detection-val is deprecated.  Use tabletop_object_detector-srv:detection instead.")
  (detection m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TabletopDetection-response>) ostream)
  "Serializes a message object of type '<TabletopDetection-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'detection) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TabletopDetection-response>) istream)
  "Deserializes a message object of type '<TabletopDetection-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'detection) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TabletopDetection-response>)))
  "Returns string type for a service object of type '<TabletopDetection-response>"
  "tabletop_object_detector/TabletopDetectionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TabletopDetection-response)))
  "Returns string type for a service object of type 'TabletopDetection-response"
  "tabletop_object_detector/TabletopDetectionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TabletopDetection-response>)))
  "Returns md5sum for a message object of type '<TabletopDetection-response>"
  "2c2af970832ab0ca635bc95df7de690a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TabletopDetection-response)))
  "Returns md5sum for a message object of type 'TabletopDetection-response"
  "2c2af970832ab0ca635bc95df7de690a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TabletopDetection-response>)))
  "Returns full string definition for message of type '<TabletopDetection-response>"
  (cl:format cl:nil "~%TabletopDetectionResult detection~%~%~%================================================================================~%MSG: tabletop_object_detector/TabletopDetectionResult~%# Contains all the information from one run of the tabletop detection node~%~%# The information for the plane that has been detected~%Table table~%~%# The raw clusters detected in the scan ~%sensor_msgs/PointCloud[] clusters~%~%# The list of potential models that have been detected for each cluster~%# An empty list will be returned for a cluster that has no recognition results at all~%household_objects_database_msgs/DatabaseModelPoseList[] models~%~%# For each cluster, the index of the list of models that was fit to that cluster~%# keep in mind that multiple raw clusters can correspond to a single fit~%int32[] cluster_model_indices~%~%# Whether the detection has succeeded or failed~%int32 NO_CLOUD_RECEIVED = 1~%int32 NO_TABLE = 2~%int32 OTHER_ERROR = 3~%int32 SUCCESS = 4~%int32 result~%~%================================================================================~%MSG: tabletop_object_detector/Table~%# Informs that a planar table has been detected at a given location~%~%# The pose gives you the transform that take you to the coordinate system~%# of the table, with the origin somewhere in the table plane and the ~%# z axis normal to the plane~%geometry_msgs/PoseStamped pose~%~%# These values give you the observed extents of the table, along x and y,~%# in the table's own coordinate system (above)~%# there is no guarantee that the origin of the table coordinate system is~%# inside the boundary defined by these values. ~%float32 x_min~%float32 x_max~%float32 y_min~%float32 y_max~%~%# There is no guarantee that the table does NOT extend further than these ~%# values; this is just as far as we've observed it.~%~%~%# Newer table definition as triangle mesh of convex hull (relative to pose)~%arm_navigation_msgs/Shape convex_hull~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: arm_navigation_msgs/Shape~%byte SPHERE=0~%byte BOX=1~%byte CYLINDER=2~%byte MESH=3~%~%byte type~%~%~%#### define sphere, box, cylinder ####~%# the origin of each shape is considered at the shape's center~%~%# for sphere~%# radius := dimensions[0]~%~%# for cylinder~%# radius := dimensions[0]~%# length := dimensions[1]~%# the length is along the Z axis~%~%# for box~%# size_x := dimensions[0]~%# size_y := dimensions[1]~%# size_z := dimensions[2]~%float64[] dimensions~%~%~%#### define mesh ####~%~%# list of triangles; triangle k is defined by tre vertices located~%# at indices triangles[3k], triangles[3k+1], triangles[3k+2]~%int32[] triangles~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: sensor_msgs/PointCloud~%# This message holds a collection of 3d points, plus optional additional~%# information about each point.~%~%# Time of sensor data acquisition, coordinate frame ID.~%Header header~%~%# Array of 3d points. Each Point32 should be interpreted as a 3d point~%# in the frame given in the header.~%geometry_msgs/Point32[] points~%~%# Each channel should have the same number of elements as points array,~%# and the data in each channel should correspond 1:1 with each point.~%# Channel names in common practice are listed in ChannelFloat32.msg.~%ChannelFloat32[] channels~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sensor_msgs/ChannelFloat32~%# This message is used by the PointCloud message to hold optional data~%# associated with each point in the cloud. The length of the values~%# array should be the same as the length of the points array in the~%# PointCloud, and each value should be associated with the corresponding~%# point.~%~%# Channel names in existing practice include:~%#   \"u\", \"v\" - row and column (respectively) in the left stereo image.~%#              This is opposite to usual conventions but remains for~%#              historical reasons. The newer PointCloud2 message has no~%#              such problem.~%#   \"rgb\" - For point clouds produced by color stereo cameras. uint8~%#           (R,G,B) values packed into the least significant 24 bits,~%#           in order.~%#   \"intensity\" - laser or pixel intensity.~%#   \"distance\"~%~%# The channel name should give semantics of the channel (e.g.~%# \"intensity\" instead of \"value\").~%string name~%~%# The values array should be 1-1 with the elements of the associated~%# PointCloud.~%float32[] values~%~%================================================================================~%MSG: household_objects_database_msgs/DatabaseModelPoseList~%# stores a list of possible database models recognition results~%DatabaseModelPose[] model_list~%================================================================================~%MSG: household_objects_database_msgs/DatabaseModelPose~%# Informs that a specific model from the Model Database has been ~%# identified at a certain location~%~%# the database id of the model~%int32 model_id~%~%# the pose that it can be found in~%geometry_msgs/PoseStamped pose~%~%# a measure of the confidence level in this detection result~%float32 confidence~%~%# the name of the object detector that generated this detection result~%string detector_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TabletopDetection-response)))
  "Returns full string definition for message of type 'TabletopDetection-response"
  (cl:format cl:nil "~%TabletopDetectionResult detection~%~%~%================================================================================~%MSG: tabletop_object_detector/TabletopDetectionResult~%# Contains all the information from one run of the tabletop detection node~%~%# The information for the plane that has been detected~%Table table~%~%# The raw clusters detected in the scan ~%sensor_msgs/PointCloud[] clusters~%~%# The list of potential models that have been detected for each cluster~%# An empty list will be returned for a cluster that has no recognition results at all~%household_objects_database_msgs/DatabaseModelPoseList[] models~%~%# For each cluster, the index of the list of models that was fit to that cluster~%# keep in mind that multiple raw clusters can correspond to a single fit~%int32[] cluster_model_indices~%~%# Whether the detection has succeeded or failed~%int32 NO_CLOUD_RECEIVED = 1~%int32 NO_TABLE = 2~%int32 OTHER_ERROR = 3~%int32 SUCCESS = 4~%int32 result~%~%================================================================================~%MSG: tabletop_object_detector/Table~%# Informs that a planar table has been detected at a given location~%~%# The pose gives you the transform that take you to the coordinate system~%# of the table, with the origin somewhere in the table plane and the ~%# z axis normal to the plane~%geometry_msgs/PoseStamped pose~%~%# These values give you the observed extents of the table, along x and y,~%# in the table's own coordinate system (above)~%# there is no guarantee that the origin of the table coordinate system is~%# inside the boundary defined by these values. ~%float32 x_min~%float32 x_max~%float32 y_min~%float32 y_max~%~%# There is no guarantee that the table does NOT extend further than these ~%# values; this is just as far as we've observed it.~%~%~%# Newer table definition as triangle mesh of convex hull (relative to pose)~%arm_navigation_msgs/Shape convex_hull~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: arm_navigation_msgs/Shape~%byte SPHERE=0~%byte BOX=1~%byte CYLINDER=2~%byte MESH=3~%~%byte type~%~%~%#### define sphere, box, cylinder ####~%# the origin of each shape is considered at the shape's center~%~%# for sphere~%# radius := dimensions[0]~%~%# for cylinder~%# radius := dimensions[0]~%# length := dimensions[1]~%# the length is along the Z axis~%~%# for box~%# size_x := dimensions[0]~%# size_y := dimensions[1]~%# size_z := dimensions[2]~%float64[] dimensions~%~%~%#### define mesh ####~%~%# list of triangles; triangle k is defined by tre vertices located~%# at indices triangles[3k], triangles[3k+1], triangles[3k+2]~%int32[] triangles~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: sensor_msgs/PointCloud~%# This message holds a collection of 3d points, plus optional additional~%# information about each point.~%~%# Time of sensor data acquisition, coordinate frame ID.~%Header header~%~%# Array of 3d points. Each Point32 should be interpreted as a 3d point~%# in the frame given in the header.~%geometry_msgs/Point32[] points~%~%# Each channel should have the same number of elements as points array,~%# and the data in each channel should correspond 1:1 with each point.~%# Channel names in common practice are listed in ChannelFloat32.msg.~%ChannelFloat32[] channels~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: sensor_msgs/ChannelFloat32~%# This message is used by the PointCloud message to hold optional data~%# associated with each point in the cloud. The length of the values~%# array should be the same as the length of the points array in the~%# PointCloud, and each value should be associated with the corresponding~%# point.~%~%# Channel names in existing practice include:~%#   \"u\", \"v\" - row and column (respectively) in the left stereo image.~%#              This is opposite to usual conventions but remains for~%#              historical reasons. The newer PointCloud2 message has no~%#              such problem.~%#   \"rgb\" - For point clouds produced by color stereo cameras. uint8~%#           (R,G,B) values packed into the least significant 24 bits,~%#           in order.~%#   \"intensity\" - laser or pixel intensity.~%#   \"distance\"~%~%# The channel name should give semantics of the channel (e.g.~%# \"intensity\" instead of \"value\").~%string name~%~%# The values array should be 1-1 with the elements of the associated~%# PointCloud.~%float32[] values~%~%================================================================================~%MSG: household_objects_database_msgs/DatabaseModelPoseList~%# stores a list of possible database models recognition results~%DatabaseModelPose[] model_list~%================================================================================~%MSG: household_objects_database_msgs/DatabaseModelPose~%# Informs that a specific model from the Model Database has been ~%# identified at a certain location~%~%# the database id of the model~%int32 model_id~%~%# the pose that it can be found in~%geometry_msgs/PoseStamped pose~%~%# a measure of the confidence level in this detection result~%float32 confidence~%~%# the name of the object detector that generated this detection result~%string detector_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TabletopDetection-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'detection))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TabletopDetection-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TabletopDetection-response
    (cl:cons ':detection (detection msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TabletopDetection)))
  'TabletopDetection-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TabletopDetection)))
  'TabletopDetection-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TabletopDetection)))
  "Returns string type for a service object of type '<TabletopDetection>"
  "tabletop_object_detector/TabletopDetection")