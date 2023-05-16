;; Auto-generated. Do not edit!


(when (boundp 'ubiquity_motor::MotorState)
  (if (not (find-package "UBIQUITY_MOTOR"))
    (make-package "UBIQUITY_MOTOR"))
  (shadow 'MotorState (find-package "UBIQUITY_MOTOR")))
(unless (find-package "UBIQUITY_MOTOR::MOTORSTATE")
  (make-package "UBIQUITY_MOTOR::MOTORSTATE"))

(in-package "ROS")
;;//! \htmlinclude MotorState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ubiquity_motor::MotorState
  :super ros::object
  :slots (_header _leftPosition _rightPosition _leftRotateRate _rightRotateRate _leftCurrent _rightCurrent _leftPwmDrive _rightPwmDrive ))

(defmethod ubiquity_motor::MotorState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:leftPosition __leftPosition) 0.0)
    ((:rightPosition __rightPosition) 0.0)
    ((:leftRotateRate __leftRotateRate) 0.0)
    ((:rightRotateRate __rightRotateRate) 0.0)
    ((:leftCurrent __leftCurrent) 0.0)
    ((:rightCurrent __rightCurrent) 0.0)
    ((:leftPwmDrive __leftPwmDrive) 0)
    ((:rightPwmDrive __rightPwmDrive) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _leftPosition (float __leftPosition))
   (setq _rightPosition (float __rightPosition))
   (setq _leftRotateRate (float __leftRotateRate))
   (setq _rightRotateRate (float __rightRotateRate))
   (setq _leftCurrent (float __leftCurrent))
   (setq _rightCurrent (float __rightCurrent))
   (setq _leftPwmDrive (round __leftPwmDrive))
   (setq _rightPwmDrive (round __rightPwmDrive))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:leftPosition
   (&optional __leftPosition)
   (if __leftPosition (setq _leftPosition __leftPosition)) _leftPosition)
  (:rightPosition
   (&optional __rightPosition)
   (if __rightPosition (setq _rightPosition __rightPosition)) _rightPosition)
  (:leftRotateRate
   (&optional __leftRotateRate)
   (if __leftRotateRate (setq _leftRotateRate __leftRotateRate)) _leftRotateRate)
  (:rightRotateRate
   (&optional __rightRotateRate)
   (if __rightRotateRate (setq _rightRotateRate __rightRotateRate)) _rightRotateRate)
  (:leftCurrent
   (&optional __leftCurrent)
   (if __leftCurrent (setq _leftCurrent __leftCurrent)) _leftCurrent)
  (:rightCurrent
   (&optional __rightCurrent)
   (if __rightCurrent (setq _rightCurrent __rightCurrent)) _rightCurrent)
  (:leftPwmDrive
   (&optional __leftPwmDrive)
   (if __leftPwmDrive (setq _leftPwmDrive __leftPwmDrive)) _leftPwmDrive)
  (:rightPwmDrive
   (&optional __rightPwmDrive)
   (if __rightPwmDrive (setq _rightPwmDrive __rightPwmDrive)) _rightPwmDrive)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _leftPosition
    8
    ;; float64 _rightPosition
    8
    ;; float64 _leftRotateRate
    8
    ;; float64 _rightRotateRate
    8
    ;; float32 _leftCurrent
    4
    ;; float32 _rightCurrent
    4
    ;; int32 _leftPwmDrive
    4
    ;; int32 _rightPwmDrive
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _leftPosition
       (sys::poke _leftPosition (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rightPosition
       (sys::poke _rightPosition (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _leftRotateRate
       (sys::poke _leftRotateRate (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rightRotateRate
       (sys::poke _rightRotateRate (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _leftCurrent
       (sys::poke _leftCurrent (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rightCurrent
       (sys::poke _rightCurrent (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _leftPwmDrive
       (write-long _leftPwmDrive s)
     ;; int32 _rightPwmDrive
       (write-long _rightPwmDrive s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _leftPosition
     (setq _leftPosition (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rightPosition
     (setq _rightPosition (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _leftRotateRate
     (setq _leftRotateRate (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rightRotateRate
     (setq _rightRotateRate (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _leftCurrent
     (setq _leftCurrent (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rightCurrent
     (setq _rightCurrent (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _leftPwmDrive
     (setq _leftPwmDrive (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _rightPwmDrive
     (setq _rightPwmDrive (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ubiquity_motor::MotorState :md5sum-) "2cfd7795d24b243d92cf05fc320353f9")
(setf (get ubiquity_motor::MotorState :datatype-) "ubiquity_motor/MotorState")
(setf (get ubiquity_motor::MotorState :definition-)
      "Header header
float64 leftPosition
float64 rightPosition
float64 leftRotateRate
float64 rightRotateRate
float32 leftCurrent
float32 rightCurrent
int32 leftPwmDrive
int32 rightPwmDrive

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :ubiquity_motor/MotorState "2cfd7795d24b243d92cf05fc320353f9")


