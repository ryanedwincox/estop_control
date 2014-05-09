// Creates ROS service which recieves a heartbeat service and send the estop command to 
// the estop control server when the hearbeats are not recieved

#include "ros/ros.h"
#include "std_srvs/Empty.h"
#include "estop_control/estopSignal.h"
#include "time.h"
#include "stdio.h"

using namespace std;

bool heartbeat = false;
time_t previousTime;
time_t now;

bool callback(std_srvs::Empty::Request  &req,
         std_srvs::Empty::Response &res)
{
    heartbeat = true;
    ROS_INFO("beating");
    return true;
}

void heartMonitor(ros::NodeHandle n)
{
    time(&now);  // get current time; same as: now = time(NULL)

    if(heartbeat == true)
    {
        heartbeat = false;
        ROS_INFO("beating");
        previousTime = now;
    }

    if(difftime(now, previousTime) > 1)  // 1 second delay
    {
        ROS_INFO("heart stopped"); //estop

        ros::ServiceClient client = n.serviceClient<estop_control::estopSignal>("estop_control");
        estop_control::estopSignal srv;
        srv.request.message = 1;
        if (client.call(srv))
        {
          ROS_INFO("Recieved handshake: %d", (bool)srv.response.handshake);
        }
        else
        {
          ROS_ERROR("Failed to call service estop_control");
        }
    }
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "heartbeat_server");
  ros::NodeHandle n;

  ros::ServiceServer service = n.advertiseService("heartbeat", callback);
  ROS_INFO("Normal");
  while(ros::ok())
  {
      ros::spinOnce();
      heartMonitor(n);
  }
  return 0;
}
