# Install script for directory: /home/user/catkin_ws/src/geographiclib/matlab

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/matlab/geographiclib" TYPE FILE FILES
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/Contents.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/cassini_fwd.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/cassini_inv.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/defaultellipsoid.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/ecc2flat.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/eqdazim_fwd.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/eqdazim_inv.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/flat2ecc.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/gedistance.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/gedoc.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/geocent_fwd.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/geocent_inv.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/geodarea.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/geoddistance.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/geoddoc.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/geodreckon.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/geographiclib_test.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/geoid_height.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/geoid_load.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/gereckon.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/gnomonic_fwd.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/gnomonic_inv.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/loccart_fwd.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/loccart_inv.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/mgrs_fwd.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/mgrs_inv.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/polarst_fwd.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/polarst_inv.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/projdoc.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/tranmerc_fwd.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/tranmerc_inv.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/utmups_fwd.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/utmups_inv.m"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/matlab/geographiclib/private" TYPE FILE FILES
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/A1m1f.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/A2m1f.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/A3coeff.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/A3f.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/AngDiff.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/AngNormalize.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/AngRound.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/C1f.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/C1pf.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/C2f.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/C3coeff.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/C3f.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/C4coeff.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/C4f.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/G4coeff.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/GeoRotation.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/LatFix.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/SinCosSeries.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/atan2dx.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/cbrtx.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/copysignx.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/cvmgt.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/eatanhe.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/geoid_file.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/geoid_load_file.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/norm2.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/remx.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/sincosdx.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/sumx.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/swap.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/tauf.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib/private/taupf.m"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/matlab/geographiclib-legacy" TYPE FILE FILES
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/Contents.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/geocentricforward.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/geocentricreverse.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/geodesicdirect.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/geodesicinverse.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/geodesicline.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/geoidheight.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/localcartesianforward.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/localcartesianreverse.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/mgrsforward.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/mgrsreverse.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/polygonarea.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/utmupsforward.m"
    "/home/user/catkin_ws/src/geographiclib/matlab/geographiclib-legacy/utmupsreverse.m"
    )
endif()

