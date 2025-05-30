cmake_minimum_required(VERSION 3.5)
project(tankbot_gazebo)

find_package(ament_cmake REQUIRED)

# instala seus scripts de launch como executáveis
install(PROGRAMS
  launch/display.launch.py
  launch/gazebo.launch.py
  DESTINATION share/${PROJECT_NAME}/launch
)

ament_package()
