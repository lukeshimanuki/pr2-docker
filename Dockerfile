FROM osrf/ros:kinetic-desktop-full-xenial

RUN apt-get update
RUN apt-get -y install wget vim python-catkin-tools ros-kinetic-robot ros-kinetic-pr2 ros-kinetic-pr2-simulator ros-kinetic-ompl ros-kinetic-convex-decomposition ros-kinetic-ivcon

RUN git clone git://github.com/RichardKelley/kinetic_pr2.git
RUN cd kinetic_pr2 && git checkout 523def2a03bcbc008d23315767b1cccf471b880a
RUN rm -Rf kinetic_pr2/src/moveit/moveit_setup_assistant/
RUN bash -c 'source /ros_entrypoint.sh && cd kinetic_pr2 && catkin_make'

