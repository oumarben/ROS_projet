// Generated by gencpp from file ubiquity_motor/MotorState.msg
// DO NOT EDIT!


#ifndef UBIQUITY_MOTOR_MESSAGE_MOTORSTATE_H
#define UBIQUITY_MOTOR_MESSAGE_MOTORSTATE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace ubiquity_motor
{
template <class ContainerAllocator>
struct MotorState_
{
  typedef MotorState_<ContainerAllocator> Type;

  MotorState_()
    : header()
    , leftPosition(0.0)
    , rightPosition(0.0)
    , leftRotateRate(0.0)
    , rightRotateRate(0.0)
    , leftCurrent(0.0)
    , rightCurrent(0.0)
    , leftPwmDrive(0)
    , rightPwmDrive(0)  {
    }
  MotorState_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , leftPosition(0.0)
    , rightPosition(0.0)
    , leftRotateRate(0.0)
    , rightRotateRate(0.0)
    , leftCurrent(0.0)
    , rightCurrent(0.0)
    , leftPwmDrive(0)
    , rightPwmDrive(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _leftPosition_type;
  _leftPosition_type leftPosition;

   typedef double _rightPosition_type;
  _rightPosition_type rightPosition;

   typedef double _leftRotateRate_type;
  _leftRotateRate_type leftRotateRate;

   typedef double _rightRotateRate_type;
  _rightRotateRate_type rightRotateRate;

   typedef float _leftCurrent_type;
  _leftCurrent_type leftCurrent;

   typedef float _rightCurrent_type;
  _rightCurrent_type rightCurrent;

   typedef int32_t _leftPwmDrive_type;
  _leftPwmDrive_type leftPwmDrive;

   typedef int32_t _rightPwmDrive_type;
  _rightPwmDrive_type rightPwmDrive;





  typedef boost::shared_ptr< ::ubiquity_motor::MotorState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ubiquity_motor::MotorState_<ContainerAllocator> const> ConstPtr;

}; // struct MotorState_

typedef ::ubiquity_motor::MotorState_<std::allocator<void> > MotorState;

typedef boost::shared_ptr< ::ubiquity_motor::MotorState > MotorStatePtr;
typedef boost::shared_ptr< ::ubiquity_motor::MotorState const> MotorStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ubiquity_motor::MotorState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ubiquity_motor::MotorState_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ubiquity_motor::MotorState_<ContainerAllocator1> & lhs, const ::ubiquity_motor::MotorState_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.leftPosition == rhs.leftPosition &&
    lhs.rightPosition == rhs.rightPosition &&
    lhs.leftRotateRate == rhs.leftRotateRate &&
    lhs.rightRotateRate == rhs.rightRotateRate &&
    lhs.leftCurrent == rhs.leftCurrent &&
    lhs.rightCurrent == rhs.rightCurrent &&
    lhs.leftPwmDrive == rhs.leftPwmDrive &&
    lhs.rightPwmDrive == rhs.rightPwmDrive;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ubiquity_motor::MotorState_<ContainerAllocator1> & lhs, const ::ubiquity_motor::MotorState_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ubiquity_motor

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ubiquity_motor::MotorState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ubiquity_motor::MotorState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ubiquity_motor::MotorState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ubiquity_motor::MotorState_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ubiquity_motor::MotorState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ubiquity_motor::MotorState_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ubiquity_motor::MotorState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2cfd7795d24b243d92cf05fc320353f9";
  }

  static const char* value(const ::ubiquity_motor::MotorState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2cfd7795d24b243dULL;
  static const uint64_t static_value2 = 0x92cf05fc320353f9ULL;
};

template<class ContainerAllocator>
struct DataType< ::ubiquity_motor::MotorState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ubiquity_motor/MotorState";
  }

  static const char* value(const ::ubiquity_motor::MotorState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ubiquity_motor::MotorState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"float64 leftPosition\n"
"float64 rightPosition\n"
"float64 leftRotateRate\n"
"float64 rightRotateRate\n"
"float32 leftCurrent\n"
"float32 rightCurrent\n"
"int32 leftPwmDrive\n"
"int32 rightPwmDrive\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::ubiquity_motor::MotorState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ubiquity_motor::MotorState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.leftPosition);
      stream.next(m.rightPosition);
      stream.next(m.leftRotateRate);
      stream.next(m.rightRotateRate);
      stream.next(m.leftCurrent);
      stream.next(m.rightCurrent);
      stream.next(m.leftPwmDrive);
      stream.next(m.rightPwmDrive);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MotorState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ubiquity_motor::MotorState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ubiquity_motor::MotorState_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "leftPosition: ";
    Printer<double>::stream(s, indent + "  ", v.leftPosition);
    s << indent << "rightPosition: ";
    Printer<double>::stream(s, indent + "  ", v.rightPosition);
    s << indent << "leftRotateRate: ";
    Printer<double>::stream(s, indent + "  ", v.leftRotateRate);
    s << indent << "rightRotateRate: ";
    Printer<double>::stream(s, indent + "  ", v.rightRotateRate);
    s << indent << "leftCurrent: ";
    Printer<float>::stream(s, indent + "  ", v.leftCurrent);
    s << indent << "rightCurrent: ";
    Printer<float>::stream(s, indent + "  ", v.rightCurrent);
    s << indent << "leftPwmDrive: ";
    Printer<int32_t>::stream(s, indent + "  ", v.leftPwmDrive);
    s << indent << "rightPwmDrive: ";
    Printer<int32_t>::stream(s, indent + "  ", v.rightPwmDrive);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UBIQUITY_MOTOR_MESSAGE_MOTORSTATE_H
