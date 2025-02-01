# Install script for directory: /home/user/catkin_ws/src/geographiclib/include/GeographicLib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/GeographicLib" TYPE FILE FILES
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Accumulator.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/AlbersEqualArea.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/AzimuthalEquidistant.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/CassiniSoldner.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/CircularEngine.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Constants.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/DMS.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Ellipsoid.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/EllipticFunction.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/GARS.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/GeoCoords.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Geocentric.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Geodesic.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/GeodesicExact.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/GeodesicLine.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/GeodesicLineExact.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Geohash.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Geoid.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Georef.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Gnomonic.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/GravityCircle.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/GravityModel.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/LambertConformalConic.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/LocalCartesian.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/MGRS.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/MagneticCircle.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/MagneticModel.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Math.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/NearestNeighbor.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/NormalGravity.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/OSGB.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/PolarStereographic.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/PolygonArea.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Rhumb.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/SphericalEngine.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/SphericalHarmonic.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/SphericalHarmonic1.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/SphericalHarmonic2.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/TransverseMercator.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/TransverseMercatorExact.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/UTMUPS.hpp"
    "/home/user/catkin_ws/src/geographiclib/include/GeographicLib/Utility.hpp"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/GeographicLib" TYPE FILE FILES "/home/user/catkin_ws/src/geographiclib/build/include/GeographicLib/Config.h")
endif()

