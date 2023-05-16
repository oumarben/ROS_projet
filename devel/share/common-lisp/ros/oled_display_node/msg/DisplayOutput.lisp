; Auto-generated. Do not edit!


(cl:in-package oled_display_node-msg)


;//! \htmlinclude DisplayOutput.msg.html

(cl:defclass <DisplayOutput> (roslisp-msg-protocol:ros-message)
  ((actionType
    :reader actionType
    :initarg :actionType
    :type cl:integer
    :initform 0)
   (row
    :reader row
    :initarg :row
    :type cl:integer
    :initform 0)
   (column
    :reader column
    :initarg :column
    :type cl:integer
    :initform 0)
   (numChars
    :reader numChars
    :initarg :numChars
    :type cl:integer
    :initform 0)
   (attributes
    :reader attributes
    :initarg :attributes
    :type cl:integer
    :initform 0)
   (text
    :reader text
    :initarg :text
    :type cl:string
    :initform "")
   (comment
    :reader comment
    :initarg :comment
    :type cl:string
    :initform ""))
)

(cl:defclass DisplayOutput (<DisplayOutput>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DisplayOutput>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DisplayOutput)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name oled_display_node-msg:<DisplayOutput> is deprecated: use oled_display_node-msg:DisplayOutput instead.")))

(cl:ensure-generic-function 'actionType-val :lambda-list '(m))
(cl:defmethod actionType-val ((m <DisplayOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader oled_display_node-msg:actionType-val is deprecated.  Use oled_display_node-msg:actionType instead.")
  (actionType m))

(cl:ensure-generic-function 'row-val :lambda-list '(m))
(cl:defmethod row-val ((m <DisplayOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader oled_display_node-msg:row-val is deprecated.  Use oled_display_node-msg:row instead.")
  (row m))

(cl:ensure-generic-function 'column-val :lambda-list '(m))
(cl:defmethod column-val ((m <DisplayOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader oled_display_node-msg:column-val is deprecated.  Use oled_display_node-msg:column instead.")
  (column m))

(cl:ensure-generic-function 'numChars-val :lambda-list '(m))
(cl:defmethod numChars-val ((m <DisplayOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader oled_display_node-msg:numChars-val is deprecated.  Use oled_display_node-msg:numChars instead.")
  (numChars m))

(cl:ensure-generic-function 'attributes-val :lambda-list '(m))
(cl:defmethod attributes-val ((m <DisplayOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader oled_display_node-msg:attributes-val is deprecated.  Use oled_display_node-msg:attributes instead.")
  (attributes m))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <DisplayOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader oled_display_node-msg:text-val is deprecated.  Use oled_display_node-msg:text instead.")
  (text m))

(cl:ensure-generic-function 'comment-val :lambda-list '(m))
(cl:defmethod comment-val ((m <DisplayOutput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader oled_display_node-msg:comment-val is deprecated.  Use oled_display_node-msg:comment instead.")
  (comment m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<DisplayOutput>)))
    "Constants for message type '<DisplayOutput>"
  '((:DISPLAY_ALL . 1)
    (:DISPLAY_SUBSTRING . 2)
    (:DISPLAY_STARTUP_STRING . 3)
    (:DISPLAY_SET_BRIGHTNESS . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'DisplayOutput)))
    "Constants for message type 'DisplayOutput"
  '((:DISPLAY_ALL . 1)
    (:DISPLAY_SUBSTRING . 2)
    (:DISPLAY_STARTUP_STRING . 3)
    (:DISPLAY_SET_BRIGHTNESS . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DisplayOutput>) ostream)
  "Serializes a message object of type '<DisplayOutput>"
  (cl:let* ((signed (cl:slot-value msg 'actionType)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'row)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'column)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'numChars)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'attributes)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'comment))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'comment))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DisplayOutput>) istream)
  "Deserializes a message object of type '<DisplayOutput>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'actionType) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'row) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'column) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'numChars) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'attributes) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'comment) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'comment) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DisplayOutput>)))
  "Returns string type for a message object of type '<DisplayOutput>"
  "oled_display_node/DisplayOutput")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DisplayOutput)))
  "Returns string type for a message object of type 'DisplayOutput"
  "oled_display_node/DisplayOutput")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DisplayOutput>)))
  "Returns md5sum for a message object of type '<DisplayOutput>"
  "567ef47aeacf47c506f682fecb519829")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DisplayOutput)))
  "Returns md5sum for a message object of type 'DisplayOutput"
  "567ef47aeacf47c506f682fecb519829")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DisplayOutput>)))
  "Returns full string definition for message of type '<DisplayOutput>"
  (cl:format cl:nil "# Request to place text on the display.~%# The display row and column as well as string specifics are required~%# A comment field is used to assist user debug~%~%# actionType values~%uint8  DISPLAY_ALL=1              # Message to fill entire display~%uint8  DISPLAY_SUBSTRING=2        # Message for a set of characters on one line~%uint8  DISPLAY_STARTUP_STRING= 3  # Reserved for future use for non-volatile startup string~%uint8  DISPLAY_SET_BRIGHTNESS= 4  # Sets display brightness. attributes is the brightness~%~%int32  actionType                 # The type of action to be taken. See MSG_DISPLAY for values~%int32  row                        # The display row of characters for this message~%                                  # row can be from 0 to 7 where 0 is top line~%int32  column                     # The starting horizontal pixel column~%                                  # The column can be 0 - 118 where 0 is start at the left~%int32  numChars                   # Number of characters to go to the display~%int32  attributes                 # Used for brightness level ~%string text                       # The text for this display update.  Up to 15 characters~%string comment                    # Optional comment the user can use to document purpose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DisplayOutput)))
  "Returns full string definition for message of type 'DisplayOutput"
  (cl:format cl:nil "# Request to place text on the display.~%# The display row and column as well as string specifics are required~%# A comment field is used to assist user debug~%~%# actionType values~%uint8  DISPLAY_ALL=1              # Message to fill entire display~%uint8  DISPLAY_SUBSTRING=2        # Message for a set of characters on one line~%uint8  DISPLAY_STARTUP_STRING= 3  # Reserved for future use for non-volatile startup string~%uint8  DISPLAY_SET_BRIGHTNESS= 4  # Sets display brightness. attributes is the brightness~%~%int32  actionType                 # The type of action to be taken. See MSG_DISPLAY for values~%int32  row                        # The display row of characters for this message~%                                  # row can be from 0 to 7 where 0 is top line~%int32  column                     # The starting horizontal pixel column~%                                  # The column can be 0 - 118 where 0 is start at the left~%int32  numChars                   # Number of characters to go to the display~%int32  attributes                 # Used for brightness level ~%string text                       # The text for this display update.  Up to 15 characters~%string comment                    # Optional comment the user can use to document purpose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DisplayOutput>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'text))
     4 (cl:length (cl:slot-value msg 'comment))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DisplayOutput>))
  "Converts a ROS message object to a list"
  (cl:list 'DisplayOutput
    (cl:cons ':actionType (actionType msg))
    (cl:cons ':row (row msg))
    (cl:cons ':column (column msg))
    (cl:cons ':numChars (numChars msg))
    (cl:cons ':attributes (attributes msg))
    (cl:cons ':text (text msg))
    (cl:cons ':comment (comment msg))
))
