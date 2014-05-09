// Sends a heartbeat service at 10Hz
// This node should be run from RViz

#include "ros/ros.h"
#include <cstdlib>
#include "std_srvs/Empty.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "heartbeat_client");

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<std_srvs::Empty>("heartbeat");
  std_srvs::Empty srv;

  ros::Rate r(10); // 10Hz
  while(1)
  {
      if (client.call(srv))
      {
        ROS_INFO("alive");
      }
      else
      {
        ROS_ERROR("dead");
        return 1;
      }
  }
  return 0;
}
