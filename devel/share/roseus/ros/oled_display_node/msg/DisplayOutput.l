;; Auto-generated. Do not edit!


(when (boundp 'oled_display_node::DisplayOutput)
  (if (not (find-package "OLED_DISPLAY_NODE"))
    (make-package "OLED_DISPLAY_NODE"))
  (shadow 'DisplayOutput (find-package "OLED_DISPLAY_NODE")))
(unless (find-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT")
  (make-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT"))

(in-package "ROS")
;;//! \htmlinclude DisplayOutput.msg.html


(intern "*DISPLAY_ALL*" (find-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT"))
(shadow '*DISPLAY_ALL* (find-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT"))
(defconstant oled_display_node::DisplayOutput::*DISPLAY_ALL* 1)
(intern "*DISPLAY_SUBSTRING*" (find-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT"))
(shadow '*DISPLAY_SUBSTRING* (find-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT"))
(defconstant oled_display_node::DisplayOutput::*DISPLAY_SUBSTRING* 2)
(intern "*DISPLAY_STARTUP_STRING*" (find-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT"))
(shadow '*DISPLAY_STARTUP_STRING* (find-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT"))
(defconstant oled_display_node::DisplayOutput::*DISPLAY_STARTUP_STRING* 3)
(intern "*DISPLAY_SET_BRIGHTNESS*" (find-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT"))
(shadow '*DISPLAY_SET_BRIGHTNESS* (find-package "OLED_DISPLAY_NODE::DISPLAYOUTPUT"))
(defconstant oled_display_node::DisplayOutput::*DISPLAY_SET_BRIGHTNESS* 4)

(defun oled_display_node::DisplayOutput-to-symbol (const)
  (cond
        ((= const 1) 'oled_display_node::DisplayOutput::*DISPLAY_ALL*)
        ((= const 2) 'oled_display_node::DisplayOutput::*DISPLAY_SUBSTRING*)
        ((= const 3) 'oled_display_node::DisplayOutput::*DISPLAY_STARTUP_STRING*)
        ((= const 4) 'oled_display_node::DisplayOutput::*DISPLAY_SET_BRIGHTNESS*)
        (t nil)))

(defclass oled_display_node::DisplayOutput
  :super ros::object
  :slots (_actionType _row _column _numChars _attributes _text _comment ))

(defmethod oled_display_node::DisplayOutput
  (:init
   (&key
    ((:actionType __actionType) 0)
    ((:row __row) 0)
    ((:column __column) 0)
    ((:numChars __numChars) 0)
    ((:attributes __attributes) 0)
    ((:text __text) "")
    ((:comment __comment) "")
    )
   (send-super :init)
   (setq _actionType (round __actionType))
   (setq _row (round __row))
   (setq _column (round __column))
   (setq _numChars (round __numChars))
   (setq _attributes (round __attributes))
   (setq _text (string __text))
   (setq _comment (string __comment))
   self)
  (:actionType
   (&optional __actionType)
   (if __actionType (setq _actionType __actionType)) _actionType)
  (:row
   (&optional __row)
   (if __row (setq _row __row)) _row)
  (:column
   (&optional __column)
   (if __column (setq _column __column)) _column)
  (:numChars
   (&optional __numChars)
   (if __numChars (setq _numChars __numChars)) _numChars)
  (:attributes
   (&optional __attributes)
   (if __attributes (setq _attributes __attributes)) _attributes)
  (:text
   (&optional __text)
   (if __text (setq _text __text)) _text)
  (:comment
   (&optional __comment)
   (if __comment (setq _comment __comment)) _comment)
  (:serialization-length
   ()
   (+
    ;; int32 _actionType
    4
    ;; int32 _row
    4
    ;; int32 _column
    4
    ;; int32 _numChars
    4
    ;; int32 _attributes
    4
    ;; string _text
    4 (length _text)
    ;; string _comment
    4 (length _comment)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _actionType
       (write-long _actionType s)
     ;; int32 _row
       (write-long _row s)
     ;; int32 _column
       (write-long _column s)
     ;; int32 _numChars
       (write-long _numChars s)
     ;; int32 _attributes
       (write-long _attributes s)
     ;; string _text
       (write-long (length _text) s) (princ _text s)
     ;; string _comment
       (write-long (length _comment) s) (princ _comment s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _actionType
     (setq _actionType (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _row
     (setq _row (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _column
     (setq _column (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _numChars
     (setq _numChars (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _attributes
     (setq _attributes (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _comment
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _comment (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get oled_display_node::DisplayOutput :md5sum-) "567ef47aeacf47c506f682fecb519829")
(setf (get oled_display_node::DisplayOutput :datatype-) "oled_display_node/DisplayOutput")
(setf (get oled_display_node::DisplayOutput :definition-)
      "# Request to place text on the display.
# The display row and column as well as string specifics are required
# A comment field is used to assist user debug

# actionType values
uint8  DISPLAY_ALL=1              # Message to fill entire display
uint8  DISPLAY_SUBSTRING=2        # Message for a set of characters on one line
uint8  DISPLAY_STARTUP_STRING= 3  # Reserved for future use for non-volatile startup string
uint8  DISPLAY_SET_BRIGHTNESS= 4  # Sets display brightness. attributes is the brightness

int32  actionType                 # The type of action to be taken. See MSG_DISPLAY for values
int32  row                        # The display row of characters for this message
                                  # row can be from 0 to 7 where 0 is top line
int32  column                     # The starting horizontal pixel column
                                  # The column can be 0 - 118 where 0 is start at the left
int32  numChars                   # Number of characters to go to the display
int32  attributes                 # Used for brightness level 
string text                       # The text for this display update.  Up to 15 characters
string comment                    # Optional comment the user can use to document purpose

")



(provide :oled_display_node/DisplayOutput "567ef47aeacf47c506f682fecb519829")


