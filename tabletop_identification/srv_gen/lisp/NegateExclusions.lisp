; Auto-generated. Do not edit!


(cl:in-package tabletop_object_detector-srv)


;//! \htmlinclude NegateExclusions-request.msg.html

(cl:defclass <NegateExclusions-request> (roslisp-msg-protocol:ros-message)
  ((negate
    :reader negate
    :initarg :negate
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass NegateExclusions-request (<NegateExclusions-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NegateExclusions-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NegateExclusions-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<NegateExclusions-request> is deprecated: use tabletop_object_detector-srv:NegateExclusions-request instead.")))

(cl:ensure-generic-function 'negate-val :lambda-list '(m))
(cl:defmethod negate-val ((m <NegateExclusions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tabletop_object_detector-srv:negate-val is deprecated.  Use tabletop_object_detector-srv:negate instead.")
  (negate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NegateExclusions-request>) ostream)
  "Serializes a message object of type '<NegateExclusions-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'negate) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NegateExclusions-request>) istream)
  "Deserializes a message object of type '<NegateExclusions-request>"
    (cl:setf (cl:slot-value msg 'negate) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NegateExclusions-request>)))
  "Returns string type for a service object of type '<NegateExclusions-request>"
  "tabletop_object_detector/NegateExclusionsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NegateExclusions-request)))
  "Returns string type for a service object of type 'NegateExclusions-request"
  "tabletop_object_detector/NegateExclusionsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NegateExclusions-request>)))
  "Returns md5sum for a message object of type '<NegateExclusions-request>"
  "6621b9ec4d8ec848612bf1c107f0fb91")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NegateExclusions-request)))
  "Returns md5sum for a message object of type 'NegateExclusions-request"
  "6621b9ec4d8ec848612bf1c107f0fb91")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NegateExclusions-request>)))
  "Returns full string definition for message of type '<NegateExclusions-request>"
  (cl:format cl:nil "bool negate~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NegateExclusions-request)))
  "Returns full string definition for message of type 'NegateExclusions-request"
  (cl:format cl:nil "bool negate~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NegateExclusions-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NegateExclusions-request>))
  "Converts a ROS message object to a list"
  (cl:list 'NegateExclusions-request
    (cl:cons ':negate (negate msg))
))
;//! \htmlinclude NegateExclusions-response.msg.html

(cl:defclass <NegateExclusions-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass NegateExclusions-response (<NegateExclusions-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NegateExclusions-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NegateExclusions-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<NegateExclusions-response> is deprecated: use tabletop_object_detector-srv:NegateExclusions-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NegateExclusions-response>) ostream)
  "Serializes a message object of type '<NegateExclusions-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NegateExclusions-response>) istream)
  "Deserializes a message object of type '<NegateExclusions-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NegateExclusions-response>)))
  "Returns string type for a service object of type '<NegateExclusions-response>"
  "tabletop_object_detector/NegateExclusionsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NegateExclusions-response)))
  "Returns string type for a service object of type 'NegateExclusions-response"
  "tabletop_object_detector/NegateExclusionsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NegateExclusions-response>)))
  "Returns md5sum for a message object of type '<NegateExclusions-response>"
  "6621b9ec4d8ec848612bf1c107f0fb91")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NegateExclusions-response)))
  "Returns md5sum for a message object of type 'NegateExclusions-response"
  "6621b9ec4d8ec848612bf1c107f0fb91")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NegateExclusions-response>)))
  "Returns full string definition for message of type '<NegateExclusions-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NegateExclusions-response)))
  "Returns full string definition for message of type 'NegateExclusions-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NegateExclusions-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NegateExclusions-response>))
  "Converts a ROS message object to a list"
  (cl:list 'NegateExclusions-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'NegateExclusions)))
  'NegateExclusions-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'NegateExclusions)))
  'NegateExclusions-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NegateExclusions)))
  "Returns string type for a service object of type '<NegateExclusions>"
  "tabletop_object_detector/NegateExclusions")