
(cl:in-package :asdf)

(defsystem "oled_display_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DisplayOutput" :depends-on ("_package_DisplayOutput"))
    (:file "_package_DisplayOutput" :depends-on ("_package"))
  ))