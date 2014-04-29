; Auto-generated. Do not edit!


(cl:in-package estop_control-srv)


;//! \htmlinclude estopSignal-request.msg.html

(cl:defclass <estopSignal-request> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:integer
    :initform 0))
)

(cl:defclass estopSignal-request (<estopSignal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <estopSignal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'estopSignal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name estop_control-srv:<estopSignal-request> is deprecated: use estop_control-srv:estopSignal-request instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <estopSignal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader estop_control-srv:message-val is deprecated.  Use estop_control-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <estopSignal-request>) ostream)
  "Serializes a message object of type '<estopSignal-request>"
  (cl:let* ((signed (cl:slot-value msg 'message)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <estopSignal-request>) istream)
  "Deserializes a message object of type '<estopSignal-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<estopSignal-request>)))
  "Returns string type for a service object of type '<estopSignal-request>"
  "estop_control/estopSignalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'estopSignal-request)))
  "Returns string type for a service object of type 'estopSignal-request"
  "estop_control/estopSignalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<estopSignal-request>)))
  "Returns md5sum for a message object of type '<estopSignal-request>"
  "dc74918662e89850de7ce1fe46ff82c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'estopSignal-request)))
  "Returns md5sum for a message object of type 'estopSignal-request"
  "dc74918662e89850de7ce1fe46ff82c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<estopSignal-request>)))
  "Returns full string definition for message of type '<estopSignal-request>"
  (cl:format cl:nil "int64 message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'estopSignal-request)))
  "Returns full string definition for message of type 'estopSignal-request"
  (cl:format cl:nil "int64 message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <estopSignal-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <estopSignal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'estopSignal-request
    (cl:cons ':message (message msg))
))
;//! \htmlinclude estopSignal-response.msg.html

(cl:defclass <estopSignal-response> (roslisp-msg-protocol:ros-message)
  ((handshake
    :reader handshake
    :initarg :handshake
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass estopSignal-response (<estopSignal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <estopSignal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'estopSignal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name estop_control-srv:<estopSignal-response> is deprecated: use estop_control-srv:estopSignal-response instead.")))

(cl:ensure-generic-function 'handshake-val :lambda-list '(m))
(cl:defmethod handshake-val ((m <estopSignal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader estop_control-srv:handshake-val is deprecated.  Use estop_control-srv:handshake instead.")
  (handshake m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <estopSignal-response>) ostream)
  "Serializes a message object of type '<estopSignal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'handshake) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <estopSignal-response>) istream)
  "Deserializes a message object of type '<estopSignal-response>"
    (cl:setf (cl:slot-value msg 'handshake) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<estopSignal-response>)))
  "Returns string type for a service object of type '<estopSignal-response>"
  "estop_control/estopSignalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'estopSignal-response)))
  "Returns string type for a service object of type 'estopSignal-response"
  "estop_control/estopSignalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<estopSignal-response>)))
  "Returns md5sum for a message object of type '<estopSignal-response>"
  "dc74918662e89850de7ce1fe46ff82c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'estopSignal-response)))
  "Returns md5sum for a message object of type 'estopSignal-response"
  "dc74918662e89850de7ce1fe46ff82c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<estopSignal-response>)))
  "Returns full string definition for message of type '<estopSignal-response>"
  (cl:format cl:nil "bool handshake~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'estopSignal-response)))
  "Returns full string definition for message of type 'estopSignal-response"
  (cl:format cl:nil "bool handshake~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <estopSignal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <estopSignal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'estopSignal-response
    (cl:cons ':handshake (handshake msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'estopSignal)))
  'estopSignal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'estopSignal)))
  'estopSignal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'estopSignal)))
  "Returns string type for a service object of type '<estopSignal>"
  "estop_control/estopSignal")