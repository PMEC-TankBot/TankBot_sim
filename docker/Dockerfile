# Imagem base com ROS 2 Humble e Gazebo Desktop
FROM osrf/ros:humble-desktop-full

# Workspace principal
ENV MAIN_WS=/sim_ws


# Instala dependências gerais, ROS2 e Gazebo
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      python3-colcon-common-extensions \
      python3-pip \
      ros-humble-gazebo-plugins \
      ros-humble-gazebo-ros-pkgs \
      ros-humble-rviz2 \
      ros-humble-xacro \
      ros-humble-robot-state-publisher \
      ros-humble-teleop-twist-keyboard \
      ros-humble-joint-state-publisher \
      ros-humble-joint-state-publisher-gui \
      gcc \
      g++ \
      git \
      nano && \
    rm -rf /var/lib/apt/lists/*

# Cria diretório do workspace
RUN mkdir -p ${MAIN_WS}/src

# Baixa modelos oficiais do Gazebo
RUN git clone https://github.com/osrf/gazebo_models.git /tmp/gazebo_models && \
    cp -r /tmp/gazebo_models/* /usr/share/gazebo-11/models/ && \
    rm -rf /tmp/gazebo_models

# Define diretório de trabalho
WORKDIR ${MAIN_WS}

# Copia apenas os pacotes do TankBot
COPY ./modules/ ./src/

# Limpa cache do apt novamente
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Compila o workspace e prepara o ambiente ao abrir o container
RUN /bin/bash -c ". /opt/ros/${ROS_DISTRO}/setup.bash; \
      colcon build --symlink-install" && \
    echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /root/.bashrc && \
    echo "source ${MAIN_WS}/install/setup.bash" >> /root/.bashrc

CMD ["bash"]