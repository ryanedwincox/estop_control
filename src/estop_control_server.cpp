// Creates ROS service that recieves a message from a client and 
// sends it to the arduino to control the estop relay

#include "ros/ros.h"
#include "estop_control/estopSignal.h"
#include <SerialStream.h>
#include <iostream>
#include <unistd.h>
#include <cstdlib>
#include <string>

using namespace std;
using namespace LibSerial;

SerialStream serial_port;

void initializeSerialPort();

bool add(estop_control::estopSignal::Request  &req,
         estop_control::estopSignal::Response &res)
{
  if(serial_port.good()) {
      int message = req.message;
      serial_port << message;  // send message to arduino
      res.handshake = true;
      ROS_INFO("message: %ld", (long int)req.message);
      //ROS_INFO("sending back response: [%d]", res.handshake);
  }

  return true;
}

int main(int argc, char **argv)
{
    initializeSerialPort();
    ros::init(argc, argv, "estop_control_server");
    ros::NodeHandle n;

    ros::ServiceServer service = n.advertiseService("estop_control", add);
    ROS_INFO("Ready for message");
    while (ros::ok())
    {
    ros::spinOnce();
    }
    return 0;
}

void initializeSerialPort ()
{
    // Open serial port
    serial_port.Open("/dev/serial/by-id/usb-Arduino_LLC_Arduino_Micro-if00");
    if (!serial_port.good()) {
        ROS_ERROR("Error: Could not open serial port.");
        exit(1);
    }

    // Set baud rate
    serial_port.SetBaudRate(SerialStreamBuf::BAUD_9600);
    if (!serial_port.good()) {
        ROS_ERROR("Error: Could not set baud rate.");
        exit(1);
    }

    // Set character size
    serial_port.SetCharSize(SerialStreamBuf::CHAR_SIZE_8);
    if (!serial_port.good()) {
        ROS_ERROR("Error: Could not set character size.");
        exit(1);
    }

    // Disable parity
    serial_port.SetParity(SerialStreamBuf::PARITY_NONE);
    if (!serial_port.good()) {
        ROS_ERROR("Error: Could not set parity.");
        exit(1);
    }

    // Set number of stop bits
    serial_port.SetNumOfStopBits(1);
    if (!serial_port.good()) {
        ROS_ERROR("Error: Could not set number of stop bits.");
        exit(1);
    }

    // Turn off hardware flow control
    serial_port.SetFlowControl(SerialStreamBuf::FLOW_CONTROL_NONE);
    if (!serial_port.good()) {
        ROS_ERROR("Error: Could not set hardware flow control.");
        exit(1);
    }
}
