; Auto-generated. Do not edit!


(cl:in-package tabletop_object_detector-srv)


;//! \htmlinclude ClearExclusionsList-request.msg.html

(cl:defclass <ClearExclusionsList-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ClearExclusionsList-request (<ClearExclusionsList-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClearExclusionsList-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClearExclusionsList-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<ClearExclusionsList-request> is deprecated: use tabletop_object_detector-srv:ClearExclusionsList-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClearExclusionsList-request>) ostream)
  "Serializes a message object of type '<ClearExclusionsList-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClearExclusionsList-request>) istream)
  "Deserializes a message object of type '<ClearExclusionsList-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClearExclusionsList-request>)))
  "Returns string type for a service object of type '<ClearExclusionsList-request>"
  "tabletop_object_detector/ClearExclusionsListRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearExclusionsList-request)))
  "Returns string type for a service object of type 'ClearExclusionsList-request"
  "tabletop_object_detector/ClearExclusionsListRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClearExclusionsList-request>)))
  "Returns md5sum for a message object of type '<ClearExclusionsList-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClearExclusionsList-request)))
  "Returns md5sum for a message object of type 'ClearExclusionsList-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClearExclusionsList-request>)))
  "Returns full string definition for message of type '<ClearExclusionsList-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClearExclusionsList-request)))
  "Returns full string definition for message of type 'ClearExclusionsList-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClearExclusionsList-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClearExclusionsList-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClearExclusionsList-request
))
;//! \htmlinclude ClearExclusionsList-response.msg.html

(cl:defclass <ClearExclusionsList-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ClearExclusionsList-response (<ClearExclusionsList-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClearExclusionsList-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClearExclusionsList-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tabletop_object_detector-srv:<ClearExclusionsList-response> is deprecated: use tabletop_object_detector-srv:ClearExclusionsList-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClearExclusionsList-response>) ostream)
  "Serializes a message object of type '<ClearExclusionsList-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClearExclusionsList-response>) istream)
  "Deserializes a message object of type '<ClearExclusionsList-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClearExclusionsList-response>)))
  "Returns string type for a service object of type '<ClearExclusionsList-response>"
  "tabletop_object_detector/ClearExclusionsListResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearExclusionsList-response)))
  "Returns string type for a service object of type 'ClearExclusionsList-response"
  "tabletop_object_detector/ClearExclusionsListResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClearExclusionsList-response>)))
  "Returns md5sum for a message object of type '<ClearExclusionsList-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClearExclusionsList-response)))
  "Returns md5sum for a message object of type 'ClearExclusionsList-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClearExclusionsList-response>)))
  "Returns full string definition for message of type '<ClearExclusionsList-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClearExclusionsList-response)))
  "Returns full string definition for message of type 'ClearExclusionsList-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClearExclusionsList-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClearExclusionsList-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClearExclusionsList-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClearExclusionsList)))
  'ClearExclusionsList-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClearExclusionsList)))
  'ClearExclusionsList-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearExclusionsList)))
  "Returns string type for a service object of type '<ClearExclusionsList>"
  "tabletop_object_detector/ClearExclusionsList")