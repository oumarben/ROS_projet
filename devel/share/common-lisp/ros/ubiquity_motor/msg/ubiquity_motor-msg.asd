
(cl:in-package :asdf)

(defsystem "ubiquity_motor-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Leds" :depends-on ("_package_Leds"))
    (:file "_package_Leds" :depends-on ("_package"))
    (:file "MotorState" :depends-on ("_package_MotorState"))
    (:file "_package_MotorState" :depends-on ("_package"))
  ))