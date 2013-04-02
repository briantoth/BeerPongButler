; Auto-generated. Do not edit!


(cl:in-package tabletop_object_detector_brian-msg)


;//! \htmlinclude Table.msg.html

(cl:defclass <Table> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (x_min
    :reader x_min
    :initarg :x_min
    :type cl:float
    :initform 0.0)
   (x_max
    :reader x_max
    :initarg :x_max
    :type cl:float
    :initform 0.0)
   (y_min
    :reader y_min
    :initarg :y_min
    :type cl:float
    :initform 0.0)
   (y_max
    :reader y_max
    :initarg :y_max
    :type cl:float
    :initform 0.0)
   (convex_hull
    :reader convex_hull
    :initarg :convex_hull
    :type arm_navigation_msgs-msg:Shape
    :initform (cl:make-instance 'arm_navigation_msgs-msg:Shape)))
)

(cl:defclass Table (<Table>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Table>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Table)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector_brian-msg:<Table> is deprecated: use tabletop_object_detector_brian-msg:Table instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <Table>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector_brian-msg:pose-val is deprecated.  Use tabletop_object_detector_brian-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'x_min-val :lambda-list '(m))
(cl:defmethod x_min-val ((m <Table>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector_brian-msg:x_min-val is deprecated.  Use tabletop_object_detector_brian-msg:x_min instead.")
  (x_min m))

(cl:ensure-generic-function 'x_max-val :lambda-list '(m))
(cl:defmethod x_max-val ((m <Table>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector_brian-msg:x_max-val is deprecated.  Use tabletop_object_detector_brian-msg:x_max instead.")
  (x_max m))

(cl:ensure-generic-function 'y_min-val :lambda-list '(m))
(cl:defmethod y_min-val ((m <Table>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector_brian-msg:y_min-val is deprecated.  Use tabletop_object_detector_brian-msg:y_min instead.")
  (y_min m))

(cl:ensure-generic-function 'y_max-val :lambda-list '(m))
(cl:defmethod y_max-val ((m <Table>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector_brian-msg:y_max-val is deprecated.  Use tabletop_object_detector_brian-msg:y_max instead.")
  (y_max m))

(cl:ensure-generic-function 'convex_hull-val :lambda-list '(m))
(cl:defmethod convex_hull-val ((m <Table>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector_brian-msg:convex_hull-val is deprecated.  Use tabletop_object_detector_brian-msg:convex_hull instead.")
  (convex_hull m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Table>) ostream)
  "Serializes a message object of type '<Table>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'convex_hull) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Table>) istream)
  "Deserializes a message object of type '<Table>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_min) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_max) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_min) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_max) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'convex_hull) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Table>)))
  "Returns string type for a message object of type '<Table>"
  "tabletop_object_detector_brian/Table")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Table)))
  "Returns string type for a message object of type 'Table"
  "tabletop_object_detector_brian/Table")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Table>)))
  "Returns md5sum for a message object of type '<Table>"
  "886d01470541b85c431cbb9613db9497")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Table)))
  "Returns md5sum for a message object of type 'Table"
  "886d01470541b85c431cbb9613db9497")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Table>)))
  "Returns full string definition for message of type '<Table>"
  (cl:format cl:nil "# Informs that a planar table has been detected at a given location~%~%# The pose gives you the transform that take you to the coordinate system~%# of the table, with the origin somewhere in the table plane and the ~%# z axis normal to the plane~%geometry_msgs/PoseStamped pose~%~%# These values give you the observed extents of the table, along x and y,~%# in the table's own coordinate system (above)~%# there is no guarantee that the origin of the table coordinate system is~%# inside the boundary defined by these values. ~%float32 x_min~%float32 x_max~%float32 y_min~%float32 y_max~%~%# There is no guarantee that the table does NOT extend further than these ~%# values; this is just as far as we've observed it.~%~%~%# Newer table definition as triangle mesh of convex hull (relative to pose)~%arm_navigation_msgs/Shape convex_hull~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: arm_navigation_msgs/Shape~%byte SPHERE=0~%byte BOX=1~%byte CYLINDER=2~%byte MESH=3~%~%byte type~%~%~%#### define sphere, box, cylinder ####~%# the origin of each shape is considered at the shape's center~%~%# for sphere~%# radius := dimensions[0]~%~%# for cylinder~%# radius := dimensions[0]~%# length := dimensions[1]~%# the length is along the Z axis~%~%# for box~%# size_x := dimensions[0]~%# size_y := dimensions[1]~%# size_z := dimensions[2]~%float64[] dimensions~%~%~%#### define mesh ####~%~%# list of triangles; triangle k is defined by tre vertices located~%# at indices triangles[3k], triangles[3k+1], triangles[3k+2]~%int32[] triangles~%geometry_msgs/Point[] vertices~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Table)))
  "Returns full string definition for message of type 'Table"
  (cl:format cl:nil "# Informs that a planar table has been detected at a given location~%~%# The pose gives you the transform that take you to the coordinate system~%# of the table, with the origin somewhere in the table plane and the ~%# z axis normal to the plane~%geometry_msgs/PoseStamped pose~%~%# These values give you the observed extents of the table, along x and y,~%# in the table's own coordinate system (above)~%# there is no guarantee that the origin of the table coordinate system is~%# inside the boundary defined by these values. ~%float32 x_min~%float32 x_max~%float32 y_min~%float32 y_max~%~%# There is no guarantee that the table does NOT extend further than these ~%# values; this is just as far as we've observed it.~%~%~%# Newer table definition as triangle mesh of convex hull (relative to pose)~%arm_navigation_msgs/Shape convex_hull~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: arm_navigation_msgs/Shape~%byte SPHERE=0~%byte BOX=1~%byte CYLINDER=2~%byte MESH=3~%~%byte type~%~%~%#### define sphere, box, cylinder ####~%# the origin of each shape is considered at the shape's center~%~%# for sphere~%# radius := dimensions[0]~%~%# for cylinder~%# radius := dimensions[0]~%# length := dimensions[1]~%# the length is along the Z axis~%~%# for box~%# size_x := dimensions[0]~%# size_y := dimensions[1]~%# size_z := dimensions[2]~%float64[] dimensions~%~%~%#### define mesh ####~%~%# list of triangles; triangle k is defined by tre vertices located~%# at indices triangles[3k], triangles[3k+1], triangles[3k+2]~%int32[] triangles~%geometry_msgs/Point[] vertices~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Table>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'convex_hull))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Table>))
  "Converts a ROS message object to a list"
  (cl:list 'Table
    (cl:cons ':pose (pose msg))
    (cl:cons ':x_min (x_min msg))
    (cl:cons ':x_max (x_max msg))
    (cl:cons ':y_min (y_min msg))
    (cl:cons ':y_max (y_max msg))
    (cl:cons ':convex_hull (convex_hull msg))
))
