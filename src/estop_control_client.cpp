// This is a ROS service that sends the software estop state to control computer
// This node should be run from RViz

#include "ros/ros.h"
#include "estop_control/estopSignal.h"
#include <SerialStream.h>
#include <iostream>
#include <unistd.h>
#include <cstdlib>
#include <string>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "estop_control_client");
  if (argc != 3)
  {
    ROS_INFO("usage: estop_control_client int 0");
    ROS_INFO("usage: 1 is ESTOP");
    ROS_INFO("usage: 2 is disengage estop");
    ROS_INFO("usage: 3 is run");
    return 1;
  }

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<estop_control::estopSignal>("estop_control");
  estop_control::estopSignal srv;
  srv.request.message = atoll(argv[1]);
  if (client.call(srv))
  {
    ROS_INFO("Recieved handshake: %d", (bool)srv.response.handshake);
  }
  else
  {
    ROS_ERROR("Failed to call service estop_control");
    return 1;
  }

  return 0;
}
