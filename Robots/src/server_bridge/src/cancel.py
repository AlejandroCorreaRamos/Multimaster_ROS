#!/usr/bin/env python

import rospy
from server_bridge.srv import CancelGoal, CancelGoalResponse
import subprocess
import os

def handle_cancel_goal_request(req):
    try:
        # Comando para cancelar la navegacion
        # command = ['rostopic', 'pub', '-1', '/move_base/cancel', 'actionlib_msgs/GoalID', '--', '{}']
        os.system("rostopic pub -1 /move_base/cancel actionlib_msgs/GoalID -- {}")

        # Ejecuta el comando
        # result = subprocess.run(command, capture_output=True, text=True)

        # ac.cancel_all_goals()

        # # Imprime la salida del comando
        # print('Salida del comando:')
        # print(result.stdout)
        
        # # Imprime cualquier error (si ocurre)
        # if result.stderr:
        #     print('Errores:')
        #     print(result.stderr)
        
        rospy.loginfo("CancelGoal service has been called.")
        success = True
    
    except Exception as e:
        print("Ocurrio un error al ejecutar el comando: %s", e)
        success = False

    return CancelGoalResponse(success)
        
def cancel_goal_service():
    rospy.init_node('cancel_goal_service_node')
    service = rospy.Service('CancelGoal', CancelGoal, handle_cancel_goal_request)
    rospy.loginfo("CancelGoal service is ready.")
    rospy.spin()

if __name__ == "__main__":
    cancel_goal_service()