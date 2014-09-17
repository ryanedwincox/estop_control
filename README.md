estop_control
=============

ROS package for remote hard eStop system. 

To be used in conjunction with the ROS package 'estop'

estop_control is to be installed on the computer communicating with the robotic arm.  It should be connected to the arduino in the arm junction box via USB.  

estop_control_server.cpp handles the serial communcation with the arduino and can send the commands 'stop', 'reset' and 'run'

heartbeat_server.cpp recieves a heartbeat message from the control computer to detect if the control computer crashes.  If no heartbeat is recieved the heartbeat_sever tells the estop_control_server to stop.

Includes Arduino code.
