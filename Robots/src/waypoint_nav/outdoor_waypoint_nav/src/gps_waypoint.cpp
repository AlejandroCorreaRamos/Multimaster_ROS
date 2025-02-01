#include <ros/ros.h>
#include <ros/package.h>
#include <fstream>
#include <utility>
#include <vector>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include "/home/user/catkin_ws/src/robot_localization/include/robot_localization/navsat_conversions.h"
#include <geometry_msgs/PointStamped.h>
#include <std_msgs/Bool.h>
#include <tf/transform_listener.h>
#include <math.h>
#include "server_bridge/LaunchGoal.h"
#include "server_bridge/CancelGoal.h"

// initialize variables

typedef actionlib::SimpleActionClient <move_base_msgs::MoveBaseAction>
MoveBaseClient; //create a type definition for a client called MoveBaseClient
MoveBaseClient* ac = nullptr;

ros::Publisher pubWaypointNodeEnded;

std::vector <std::pair<double, double>> waypointVect;
std::vector<std::pair < double, double> > ::iterator iter; //init. iterator
geometry_msgs::PointStamped UTM_point, map_point, UTM_next, map_next;
int count = 0, waypointCount = 0, wait_count = 0;
double numWaypoints = 0;
double latiGoal, longiGoal, latiNext, longiNext;
std::string utm_zone;
std::string path_local, path_abs;


int countWaypointsInFile(std::string path_local)
{
    path_abs = ros::package::getPath("outdoor_waypoint_nav") + path_local;
    std::ifstream fileCount(path_abs.c_str());
    if(fileCount.is_open())
    {
        double lati = 0;
        while(!fileCount.eof())
        {
            fileCount >> lati;
            ++count;
        }
        count = count - 1;
        numWaypoints = count / 2;
        ROS_INFO("%.0f GPS waypoints were read", numWaypoints);
        fileCount.close();
    }
    else
    {
        std::cout << "Unable to open waypoint file" << std::endl;
        ROS_ERROR("Unable to open waypoint file");
    }
    return numWaypoints;
}

std::vector <std::pair<double, double>> getWaypoints(std::string path_local)
{
    double lati = 0, longi = 0;

    path_abs = ros::package::getPath("outdoor_waypoint_nav") + path_local;
    std::ifstream fileRead(path_abs.c_str());
    for(int i = 0; i < numWaypoints; i++)
    {
        fileRead >> lati;
        fileRead >> longi;
        waypointVect.push_back(std::make_pair(lati, longi));
    }
    fileRead.close();

    //Outputting vector
    ROS_INFO("The following GPS Waypoints have been set:");
    for(std::vector < std::pair < double, double >> ::iterator iterDisp = waypointVect.begin(); iterDisp != waypointVect.end();
    iterDisp++)
    {
        ROS_INFO("%.9g %.9g", iterDisp->first, iterDisp->second);
    }
    return waypointVect;
}

geometry_msgs::PointStamped latLongtoUTM(double lati_input, double longi_input)
{
    double utm_x = 0, utm_y = 0;
    geometry_msgs::PointStamped UTM_point_output;

    //convert lat/long to utm
    RobotLocalization::NavsatConversions::LLtoUTM(lati_input, longi_input, utm_y, utm_x, utm_zone);

    //Construct UTM_point and map_point geometry messages
    UTM_point_output.header.frame_id = "utm";
    UTM_point_output.header.stamp = ros::Time(0);
    UTM_point_output.point.x = utm_x;
    UTM_point_output.point.y = utm_y;
    UTM_point_output.point.z = 0;

    return UTM_point_output;
}

geometry_msgs::PointStamped UTMtoMapPoint(geometry_msgs::PointStamped UTM_input)
{
    geometry_msgs::PointStamped map_point_output;
    bool notDone = true;
    tf::TransformListener listener; //create transformlistener object called listener
    ros::Time time_now = ros::Time::now();
    while(notDone)
    {
        try
        {
            UTM_point.header.stamp = ros::Time::now();
            listener.waitForTransform("odom", "utm", time_now, ros::Duration(3.0));
            listener.transformPoint("odom", UTM_input, map_point_output);
            notDone = false;
        }
        catch (tf::TransformException& ex)
        {
            ROS_WARN("%s", ex.what());
            ros::Duration(0.01).sleep();
            throw ex;
        }
    }
    return map_point_output;
}

move_base_msgs::MoveBaseGoal buildGoal(geometry_msgs::PointStamped map_point, geometry_msgs::PointStamped map_next, bool last_point)
{
    move_base_msgs::MoveBaseGoal goal;

    //Specify what frame we want the goal to be published in
    goal.target_pose.header.frame_id = "odom";
    goal.target_pose.header.stamp = ros::Time::now();

    // Specify x and y goal
    goal.target_pose.pose.position.x = map_point.point.x; //specify x goal
    goal.target_pose.pose.position.y = map_point.point.y; //specify y goal

    // Specify heading goal using current goal and next goal (point robot towards its next goal once it has achieved its current goal)
    if(last_point == false)
    {
        tf::Matrix3x3 rot_euler;
        tf::Quaternion rot_quat;

        // Calculate quaternion
        float x_curr = map_point.point.x, y_curr = map_point.point.y; // set current coords.
        float x_next = map_next.point.x, y_next = map_next.point.y; // set coords. of next waypoint
        float delta_x = x_next - x_curr, delta_y = y_next - y_curr;   // change in coords.
        float yaw_curr = 0, pitch_curr = 0, roll_curr = 0;
        yaw_curr = atan2(delta_y, delta_x);

        // Specify quaternions
        rot_euler.setEulerYPR(yaw_curr, pitch_curr, roll_curr);
        rot_euler.getRotation(rot_quat);

        goal.target_pose.pose.orientation.x = rot_quat.getX();
        goal.target_pose.pose.orientation.y = rot_quat.getY();
        goal.target_pose.pose.orientation.z = rot_quat.getZ();
        goal.target_pose.pose.orientation.w = rot_quat.getW();
    }
    else
    {
        goal.target_pose.pose.orientation.w = 1.0;
    }

    return goal;
}

bool processWaypoints(server_bridge::LaunchGoal::Request &req, server_bridge::LaunchGoal::Response &res)
{
    ros::Time receive_time = ros::Time::now();
    ROS_INFO("Solicitud recibida a las: %f", receive_time.toSec());
    // ros::param::get("/outdoor_waypoint_nav/coordinates_file", path_local);
    // numWaypoints = countWaypointsInFile(path_local);

    // //Reading waypoints from text file and output results
    std::vector<double> doubleValues = {req.goal[0], req.goal[1]};

    // Crear un par de tipo std::pair<double, double> y añadir al vector pairVector
    std::pair<double, double> pairValues(doubleValues[0], doubleValues[1]);
    // waypointVect.push_back(pairValues);


    // Iterate through vector of waypoints for setting goals
    // for(iter = waypointVect.begin(); iter < waypointVect.end(); iter++)
    // {
    //Setting goal:
    latiGoal = pairValues.first;
    longiGoal = pairValues.second;
    latiNext = pairValues.first;
    longiNext = pairValues.second;
    bool final_point = true;

    // //set next goal point if not at last waypoint
    // if(iter < (waypointVect.end() - 1))
    // {
    //     iter++;
    //     latiNext = iter->first;
    //     longiNext = iter->second;
    //     iter--;
    // }
    // else //set to current
    // {
    //     latiNext = iter->first;
    //     longiNext = iter->second;
    //     final_point = true;
    // }


    //Convert lat/long to utm:
    UTM_point = latLongtoUTM(latiGoal, longiGoal);
    UTM_next = latLongtoUTM(latiNext, longiNext);

    //Transform UTM to map point in odom frame
    int count = 0;
    while(count < 5){
        try{
            map_point = UTMtoMapPoint(UTM_point);
            map_next = UTMtoMapPoint(UTM_next);
            break;
        }
        catch(tf::TransformException& ex){
            count++;
        }
    }
    if(count==5){
        ROS_ERROR("UTM Error");
        res.success = false;
        return false;
    }
    ROS_INFO("Received Latitude goal:%.8f", latiGoal);
    ROS_INFO("Received longitude goal:%.8f", longiGoal);

    //Build goal to send to move_base
    move_base_msgs::MoveBaseGoal goal = buildGoal(map_point, map_next, final_point); //initiate a move_base_msg called goal

    // Send Goal
    ROS_INFO("Sending goal");
    ac->sendGoal(goal); //push goal to move_base node
    
    //Wait for result
    ac->waitForResult(); //waiting to see if move_base was able to reach goal

    if(ac->getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    {
        ROS_INFO("Husky has reached its goal!");
        res.success = true;
        //switch to next waypoint and repeat
    }
    else
    {
        ROS_ERROR("Husky was unable to reach its goal. GPS Waypoint unreachable.");
        ROS_INFO("Exiting node...");
        // Notify joy_launch_control that waypoint following is complete
        // std_msgs::Bool node_ended;
        // node_ended.data = true;
        // pubWaypointNodeEnded.publish(node_ended);
        // ros::shutdown();
        res.success = false;
    }
    // } // End for loop iterating through waypoint vector

    // ROS_INFO("Husky has reached all of its goals!!!\n");
    // ROS_INFO("Ending node...");

    // Notify joy_launch_control that waypoint following is complete
    // std_msgs::Bool node_ended;
    // node_ended.data = true;
    // pubWaypointNodeEnded.publish(node_ended);

    return true;
}

// bool Cancelprocess(server_bridge::CancelGoal::Request &reqc, server_bridge::CancelGoal::Response &resc)

// {

//     ROS_INFO("Cancelando");
//     // ac->cancelAllGoals();
//     // resc.success = true;
//     // return true;

//     resc.success = true;
//     return true;

// }

int main(int argc, char** argv)
{
    ros::init(argc, argv, "gps_waypoint"); //initiate node called gps_waypoint
    ros::NodeHandle n;
    ROS_INFO("Initiated gps_waypoint node");
    ac = new MoveBaseClient("/move_base", true);
    while(!ac->waitForServer(ros::Duration(5.0)))
    {
        wait_count++;
        if(wait_count > 3)
        {
            ROS_ERROR("move_base action server did not come up, killing gps_waypoint node...");
            // Notify joy_launch_control that waypoint following is complete
            std_msgs::Bool node_ended;
            node_ended.data = true;
            pubWaypointNodeEnded.publish(node_ended);
            ros::shutdown();
        }
        ROS_INFO("Waiting for the move_base action server to come up");
    }

    // Initiate publisher to send end of node message
    ros::Publisher pubWaypointNodeEnded = n.advertise<std_msgs::Bool>("/outdoor_waypoint_nav/waypoint_following_status", 100);
    ros::ServiceServer service = n.advertiseService("LaunchGoal", processWaypoints);

    // Cancel process navegation
    // ros::ServiceServer service_cancel = n.advertiseService("CancelGoal", Cancelprocess);

    // ros::shutdown();
    ros::spin();
    return 0;
}
