// Auto-generated. Do not edit!

// (in-package ubiquity_motor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MotorState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.leftPosition = null;
      this.rightPosition = null;
      this.leftRotateRate = null;
      this.rightRotateRate = null;
      this.leftCurrent = null;
      this.rightCurrent = null;
      this.leftPwmDrive = null;
      this.rightPwmDrive = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('leftPosition')) {
        this.leftPosition = initObj.leftPosition
      }
      else {
        this.leftPosition = 0.0;
      }
      if (initObj.hasOwnProperty('rightPosition')) {
        this.rightPosition = initObj.rightPosition
      }
      else {
        this.rightPosition = 0.0;
      }
      if (initObj.hasOwnProperty('leftRotateRate')) {
        this.leftRotateRate = initObj.leftRotateRate
      }
      else {
        this.leftRotateRate = 0.0;
      }
      if (initObj.hasOwnProperty('rightRotateRate')) {
        this.rightRotateRate = initObj.rightRotateRate
      }
      else {
        this.rightRotateRate = 0.0;
      }
      if (initObj.hasOwnProperty('leftCurrent')) {
        this.leftCurrent = initObj.leftCurrent
      }
      else {
        this.leftCurrent = 0.0;
      }
      if (initObj.hasOwnProperty('rightCurrent')) {
        this.rightCurrent = initObj.rightCurrent
      }
      else {
        this.rightCurrent = 0.0;
      }
      if (initObj.hasOwnProperty('leftPwmDrive')) {
        this.leftPwmDrive = initObj.leftPwmDrive
      }
      else {
        this.leftPwmDrive = 0;
      }
      if (initObj.hasOwnProperty('rightPwmDrive')) {
        this.rightPwmDrive = initObj.rightPwmDrive
      }
      else {
        this.rightPwmDrive = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [leftPosition]
    bufferOffset = _serializer.float64(obj.leftPosition, buffer, bufferOffset);
    // Serialize message field [rightPosition]
    bufferOffset = _serializer.float64(obj.rightPosition, buffer, bufferOffset);
    // Serialize message field [leftRotateRate]
    bufferOffset = _serializer.float64(obj.leftRotateRate, buffer, bufferOffset);
    // Serialize message field [rightRotateRate]
    bufferOffset = _serializer.float64(obj.rightRotateRate, buffer, bufferOffset);
    // Serialize message field [leftCurrent]
    bufferOffset = _serializer.float32(obj.leftCurrent, buffer, bufferOffset);
    // Serialize message field [rightCurrent]
    bufferOffset = _serializer.float32(obj.rightCurrent, buffer, bufferOffset);
    // Serialize message field [leftPwmDrive]
    bufferOffset = _serializer.int32(obj.leftPwmDrive, buffer, bufferOffset);
    // Serialize message field [rightPwmDrive]
    bufferOffset = _serializer.int32(obj.rightPwmDrive, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorState
    let len;
    let data = new MotorState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [leftPosition]
    data.leftPosition = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rightPosition]
    data.rightPosition = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [leftRotateRate]
    data.leftRotateRate = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rightRotateRate]
    data.rightRotateRate = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [leftCurrent]
    data.leftCurrent = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rightCurrent]
    data.rightCurrent = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [leftPwmDrive]
    data.leftPwmDrive = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [rightPwmDrive]
    data.rightPwmDrive = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ubiquity_motor/MotorState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2cfd7795d24b243d92cf05fc320353f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.leftPosition !== undefined) {
      resolved.leftPosition = msg.leftPosition;
    }
    else {
      resolved.leftPosition = 0.0
    }

    if (msg.rightPosition !== undefined) {
      resolved.rightPosition = msg.rightPosition;
    }
    else {
      resolved.rightPosition = 0.0
    }

    if (msg.leftRotateRate !== undefined) {
      resolved.leftRotateRate = msg.leftRotateRate;
    }
    else {
      resolved.leftRotateRate = 0.0
    }

    if (msg.rightRotateRate !== undefined) {
      resolved.rightRotateRate = msg.rightRotateRate;
    }
    else {
      resolved.rightRotateRate = 0.0
    }

    if (msg.leftCurrent !== undefined) {
      resolved.leftCurrent = msg.leftCurrent;
    }
    else {
      resolved.leftCurrent = 0.0
    }

    if (msg.rightCurrent !== undefined) {
      resolved.rightCurrent = msg.rightCurrent;
    }
    else {
      resolved.rightCurrent = 0.0
    }

    if (msg.leftPwmDrive !== undefined) {
      resolved.leftPwmDrive = msg.leftPwmDrive;
    }
    else {
      resolved.leftPwmDrive = 0
    }

    if (msg.rightPwmDrive !== undefined) {
      resolved.rightPwmDrive = msg.rightPwmDrive;
    }
    else {
      resolved.rightPwmDrive = 0
    }

    return resolved;
    }
};

module.exports = MotorState;
