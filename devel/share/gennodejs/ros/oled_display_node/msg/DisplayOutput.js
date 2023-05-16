// Auto-generated. Do not edit!

// (in-package oled_display_node.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DisplayOutput {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.actionType = null;
      this.row = null;
      this.column = null;
      this.numChars = null;
      this.attributes = null;
      this.text = null;
      this.comment = null;
    }
    else {
      if (initObj.hasOwnProperty('actionType')) {
        this.actionType = initObj.actionType
      }
      else {
        this.actionType = 0;
      }
      if (initObj.hasOwnProperty('row')) {
        this.row = initObj.row
      }
      else {
        this.row = 0;
      }
      if (initObj.hasOwnProperty('column')) {
        this.column = initObj.column
      }
      else {
        this.column = 0;
      }
      if (initObj.hasOwnProperty('numChars')) {
        this.numChars = initObj.numChars
      }
      else {
        this.numChars = 0;
      }
      if (initObj.hasOwnProperty('attributes')) {
        this.attributes = initObj.attributes
      }
      else {
        this.attributes = 0;
      }
      if (initObj.hasOwnProperty('text')) {
        this.text = initObj.text
      }
      else {
        this.text = '';
      }
      if (initObj.hasOwnProperty('comment')) {
        this.comment = initObj.comment
      }
      else {
        this.comment = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DisplayOutput
    // Serialize message field [actionType]
    bufferOffset = _serializer.int32(obj.actionType, buffer, bufferOffset);
    // Serialize message field [row]
    bufferOffset = _serializer.int32(obj.row, buffer, bufferOffset);
    // Serialize message field [column]
    bufferOffset = _serializer.int32(obj.column, buffer, bufferOffset);
    // Serialize message field [numChars]
    bufferOffset = _serializer.int32(obj.numChars, buffer, bufferOffset);
    // Serialize message field [attributes]
    bufferOffset = _serializer.int32(obj.attributes, buffer, bufferOffset);
    // Serialize message field [text]
    bufferOffset = _serializer.string(obj.text, buffer, bufferOffset);
    // Serialize message field [comment]
    bufferOffset = _serializer.string(obj.comment, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DisplayOutput
    let len;
    let data = new DisplayOutput(null);
    // Deserialize message field [actionType]
    data.actionType = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [row]
    data.row = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [column]
    data.column = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [numChars]
    data.numChars = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [attributes]
    data.attributes = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [text]
    data.text = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [comment]
    data.comment = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.text);
    length += _getByteLength(object.comment);
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'oled_display_node/DisplayOutput';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '567ef47aeacf47c506f682fecb519829';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request to place text on the display.
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DisplayOutput(null);
    if (msg.actionType !== undefined) {
      resolved.actionType = msg.actionType;
    }
    else {
      resolved.actionType = 0
    }

    if (msg.row !== undefined) {
      resolved.row = msg.row;
    }
    else {
      resolved.row = 0
    }

    if (msg.column !== undefined) {
      resolved.column = msg.column;
    }
    else {
      resolved.column = 0
    }

    if (msg.numChars !== undefined) {
      resolved.numChars = msg.numChars;
    }
    else {
      resolved.numChars = 0
    }

    if (msg.attributes !== undefined) {
      resolved.attributes = msg.attributes;
    }
    else {
      resolved.attributes = 0
    }

    if (msg.text !== undefined) {
      resolved.text = msg.text;
    }
    else {
      resolved.text = ''
    }

    if (msg.comment !== undefined) {
      resolved.comment = msg.comment;
    }
    else {
      resolved.comment = ''
    }

    return resolved;
    }
};

// Constants for message
DisplayOutput.Constants = {
  DISPLAY_ALL: 1,
  DISPLAY_SUBSTRING: 2,
  DISPLAY_STARTUP_STRING: 3,
  DISPLAY_SET_BRIGHTNESS: 4,
}

module.exports = DisplayOutput;
