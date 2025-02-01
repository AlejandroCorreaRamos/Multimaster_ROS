#!/usr/bin/env python

import rospy
from server_bridge.srv import LaunchGoal, LaunchGoalResponse
import subprocess

def handle_launch_goal_request(req):
    rospy.loginfo("LaunchGoal service has been called.")
    print(req.goal)
    # try:
    #     subprocess.Popen(['roslaunch', 'outdoor_waypoint_nav', 'send_goals.launch'])
    #     success = True
    # except Exception as e:
    #     rospy.logerr("Failed to launch file: %s", str(e))
    #     success = False
    return LaunchGoalResponse(success=success)

def launch_goal_service():
    rospy.init_node('launch_goal_service_node')
    service = rospy.Service('LaunchGoal', LaunchGoal, handle_launch_goal_request)
    rospy.loginfo("LaunchGoal service is ready.")
    rospy.spin()

if __name__ == "__main__":
    launch_goal_service()