# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ur_script_control: 8 messages, 0 services")

set(MSG_I_FLAGS "-Iur_script_control:/home/remco/catkin_ws/src/ur_script_control/msg;-Iur_script_control:/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ur_script_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg" NAME_WE)
add_custom_target(_ur_script_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_script_control" "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg" ""
)

get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg" NAME_WE)
add_custom_target(_ur_script_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_script_control" "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg" "ur_script_control/object_pose:std_msgs/Header:ur_script_control/RobotArmFeedback:ur_script_control/RobotArmActionGoal:ur_script_control/RobotArmActionResult:ur_script_control/RobotArmActionFeedback:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:ur_script_control/RobotArmResult:ur_script_control/RobotArmGoal"
)

get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg" NAME_WE)
add_custom_target(_ur_script_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_script_control" "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg" ""
)

get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg" NAME_WE)
add_custom_target(_ur_script_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_script_control" "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg" "ur_script_control/object_pose"
)

get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg" NAME_WE)
add_custom_target(_ur_script_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_script_control" "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg" "ur_script_control/object_pose:actionlib_msgs/GoalID:std_msgs/Header:ur_script_control/RobotArmGoal"
)

get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg" NAME_WE)
add_custom_target(_ur_script_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_script_control" "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg" "actionlib_msgs/GoalID:std_msgs/Header:ur_script_control/RobotArmResult:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg" NAME_WE)
add_custom_target(_ur_script_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_script_control" "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg" ""
)

get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg" NAME_WE)
add_custom_target(_ur_script_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur_script_control" "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg" "ur_script_control/RobotArmFeedback:actionlib_msgs/GoalID:std_msgs/Header:actionlib_msgs/GoalStatus"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
)
_generate_msg_cpp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
)
_generate_msg_cpp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
)
_generate_msg_cpp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
)
_generate_msg_cpp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
)
_generate_msg_cpp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
)
_generate_msg_cpp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
)
_generate_msg_cpp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
)

### Generating Services

### Generating Module File
_generate_module_cpp(ur_script_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ur_script_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ur_script_control_generate_messages ur_script_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_cpp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_cpp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_cpp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_cpp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_cpp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_cpp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_cpp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_cpp _ur_script_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_script_control_gencpp)
add_dependencies(ur_script_control_gencpp ur_script_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_script_control_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
)
_generate_msg_eus(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
)
_generate_msg_eus(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
)
_generate_msg_eus(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
)
_generate_msg_eus(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
)
_generate_msg_eus(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
)
_generate_msg_eus(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
)
_generate_msg_eus(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
)

### Generating Services

### Generating Module File
_generate_module_eus(ur_script_control
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ur_script_control_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ur_script_control_generate_messages ur_script_control_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_eus _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_eus _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_eus _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_eus _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_eus _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_eus _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_eus _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_eus _ur_script_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_script_control_geneus)
add_dependencies(ur_script_control_geneus ur_script_control_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_script_control_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
)
_generate_msg_lisp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
)
_generate_msg_lisp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
)
_generate_msg_lisp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
)
_generate_msg_lisp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
)
_generate_msg_lisp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
)
_generate_msg_lisp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
)
_generate_msg_lisp(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
)

### Generating Services

### Generating Module File
_generate_module_lisp(ur_script_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ur_script_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ur_script_control_generate_messages ur_script_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_lisp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_lisp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_lisp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_lisp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_lisp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_lisp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_lisp _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_lisp _ur_script_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_script_control_genlisp)
add_dependencies(ur_script_control_genlisp ur_script_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_script_control_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
)
_generate_msg_nodejs(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
)
_generate_msg_nodejs(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
)
_generate_msg_nodejs(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
)
_generate_msg_nodejs(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
)
_generate_msg_nodejs(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
)
_generate_msg_nodejs(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
)
_generate_msg_nodejs(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ur_script_control
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ur_script_control_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ur_script_control_generate_messages ur_script_control_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_nodejs _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_nodejs _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_nodejs _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_nodejs _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_nodejs _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_nodejs _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_nodejs _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_nodejs _ur_script_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_script_control_gennodejs)
add_dependencies(ur_script_control_gennodejs ur_script_control_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_script_control_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
)
_generate_msg_py(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
)
_generate_msg_py(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
)
_generate_msg_py(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
)
_generate_msg_py(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
)
_generate_msg_py(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
)
_generate_msg_py(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
)
_generate_msg_py(ur_script_control
  "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
)

### Generating Services

### Generating Module File
_generate_module_py(ur_script_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ur_script_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ur_script_control_generate_messages ur_script_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_py _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmAction.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_py _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_py _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_py _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionGoal.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_py _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionResult.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_py _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/msg/object_pose.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_py _ur_script_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/remco/catkin_ws/src/ur_script_control/build/devel/share/ur_script_control/msg/RobotArmActionFeedback.msg" NAME_WE)
add_dependencies(ur_script_control_generate_messages_py _ur_script_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur_script_control_genpy)
add_dependencies(ur_script_control_genpy ur_script_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur_script_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur_script_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(ur_script_control_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ur_script_control_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ur_script_control_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur_script_control
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(ur_script_control_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ur_script_control_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ur_script_control_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur_script_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(ur_script_control_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ur_script_control_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ur_script_control_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur_script_control
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(ur_script_control_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ur_script_control_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ur_script_control_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur_script_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(ur_script_control_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ur_script_control_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ur_script_control_generate_messages_py geometry_msgs_generate_messages_py)
endif()
