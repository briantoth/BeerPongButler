; Auto-generated. Do not edit!


(cl:in-package tabletop_object_detector-srv)


;//! \htmlinclude AddModelExclusion-request.msg.html

(cl:defclass <AddModelExclusion-request> (roslisp-msg-protocol:ros-message)
  ((model_id
    :reader model_id
    :initarg :model_id
    :type cl:integer
    :initform 0))
)

(cl:defclass AddModelExclusion-request (<AddModelExclusion-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddModelExclusion-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddModelExclusion-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<AddModelExclusion-request> is deprecated: use tabletop_object_detector-srv:AddModelExclusion-request instead.")))

(cl:ensure-generic-function 'model_id-val :lambda-list '(m))
(cl:defmethod model_id-val ((m <AddModelExclusion-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:model_id-val is deprecated.  Use tabletop_object_detector-srv:model_id instead.")
  (model_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddModelExclusion-request>) ostream)
  "Serializes a message object of type '<AddModelExclusion-request>"
  (cl:let* ((signed (cl:slot-value msg 'model_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddModelExclusion-request>) istream)
  "Deserializes a message object of type '<AddModelExclusion-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddModelExclusion-request>)))
  "Returns string type for a service object of type '<AddModelExclusion-request>"
  "tabletop_object_detector/AddModelExclusionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddModelExclusion-request)))
  "Returns string type for a service object of type 'AddModelExclusion-request"
  "tabletop_object_detector/AddModelExclusionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddModelExclusion-request>)))
  "Returns md5sum for a message object of type '<AddModelExclusion-request>"
  "28cb0598daf3b969068a38cd07aaa9f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddModelExclusion-request)))
  "Returns md5sum for a message object of type 'AddModelExclusion-request"
  "28cb0598daf3b969068a38cd07aaa9f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddModelExclusion-request>)))
  "Returns full string definition for message of type '<AddModelExclusion-request>"
  (cl:format cl:nil "~%int32 model_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddModelExclusion-request)))
  "Returns full string definition for message of type 'AddModelExclusion-request"
  (cl:format cl:nil "~%int32 model_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddModelExclusion-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddModelExclusion-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddModelExclusion-request
    (cl:cons ':model_id (model_id msg))
))
;//! \htmlinclude AddModelExclusion-response.msg.html

(cl:defclass <AddModelExclusion-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass AddModelExclusion-response (<AddModelExclusion-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddModelExclusion-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddModelExclusion-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<AddModelExclusion-response> is deprecated: use tabletop_object_detector-srv:AddModelExclusion-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddModelExclusion-response>) ostream)
  "Serializes a message object of type '<AddModelExclusion-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddModelExclusion-response>) istream)
  "Deserializes a message object of type '<AddModelExclusion-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddModelExclusion-response>)))
  "Returns string type for a service object of type '<AddModelExclusion-response>"
  "tabletop_object_detector/AddModelExclusionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddModelExclusion-response)))
  "Returns string type for a service object of type 'AddModelExclusion-response"
  "tabletop_object_detector/AddModelExclusionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddModelExclusion-response>)))
  "Returns md5sum for a message object of type '<AddModelExclusion-response>"
  "28cb0598daf3b969068a38cd07aaa9f6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddModelExclusion-response)))
  "Returns md5sum for a message object of type 'AddModelExclusion-response"
  "28cb0598daf3b969068a38cd07aaa9f6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddModelExclusion-response>)))
  "Returns full string definition for message of type '<AddModelExclusion-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddModelExclusion-response)))
  "Returns full string definition for message of type 'AddModelExclusion-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddModelExclusion-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddModelExclusion-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddModelExclusion-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddModelExclusion)))
  'AddModelExclusion-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddModelExclusion)))
  'AddModelExclusion-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddModelExclusion)))
  "Returns string type for a service object of type '<AddModelExclusion>"
  "tabletop_object_detector/AddModelExclusion")