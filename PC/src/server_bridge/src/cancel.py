#!/usr/bin/env python

import rospy
from server_bridge.srv import CancelGoal, CancelGoalResponse
import subprocess

def handle_cancel_goal_request(req):
    rospy.loginfo("CancelGoal service has been called.")
    return CancelGoalResponse(success=success)

def cancel_goal_service():
    rospy.init_node('cancel_goal_service_node')
    service = rospy.Service('CancelGoal', CancelGoal, handle_cancel_goal_request)
    rospy.loginfo("CancelGoal service is ready.")
    rospy.spin()

if __name__ == "__main__":
    cancel_goal_service()