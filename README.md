# TankBot_sim
simulation repositorie for TankBot


docker build -f docker/Dockerfile -t tankbot-sim .

docker run --rm -it tankbot-sim

ros2 launch tankbot_gazebo gazebo.launch.py