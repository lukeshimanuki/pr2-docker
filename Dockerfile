FROM osrf/ros:kinetic-desktop-full-xenial

RUN apt-get update
RUN apt-get -y install wget vim python-catkin-tools ros-kinetic-robot ros-kinetic-pr2 ros-kinetic-pr2-simulator ros-kinetic-ompl ros-kinetic-convex-decomposition ros-kinetic-ivcon

RUN git clone git://github.com/RichardKelley/kinetic_pr2.git
RUN cd kinetic_pr2 && git checkout 523def2a03bcbc008d23315767b1cccf471b880a
RUN cd kinetic_pr2/src && git clone git://github.com/Learning-and-Intelligent-Systems/lis_pr2_pkg.git
RUN cd kinetic_pr2/src/lis_pr2_pkg && git checkout f610d74851433441b0a4558163cca07e2f7e6db2
RUN rm -Rf kinetic_pr2/src/moveit/moveit_setup_assistant/
RUN bash -c 'source /ros_entrypoint.sh && cd kinetic_pr2 && catkin_make'

RUN DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install --no-install-recommends apache2 atftpd beep bluez-hcidump build-essential cdbs chrony ckermit config-package-dev curl debhelper distcc dnsmasq emacs fakeroot fortune-mod fortunes gdb grub2-common gstreamer0.10-alsa hddtemp ifplugd initramfs-tools ipmitool iptables iw libapache2-mod-python libc6 libcap-dev libcap2 libcap2-dev libgcc1 libsdl1.2debian libstdc++6 lm-sensors netperf nfs-client nfs-kernel-server nodejs nvidia-current nvidia-settings octave openssh-server openjdk-9-jre portmap python python-bluez python-pexpect python-pycurl python-svn reprepro ros-kinetic-linux-networking ros-kinetic-openni-launch ros-kinetic-pr2 rsyslog screen smartmontools snmp snmpd subversion syslinux tcpdump tcsh udev unionfs-fuse vim wireless-tools zsh postfix

RUN DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install --no-install-recommends ros-kinetic-pr2-gripper-sensor

RUN cd / && wget \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/pr2/p/pr2-sysros/pr2-sysros_0.5.63-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/pr2/p/pr2-kernel-meta/pr2-kernel_0.0.6None_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/pr2/p/pr2-kernel-meta/pr2-kernel-headers_0.0.6None_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/pr2/p/pr2-environment/pr2-environment_0.5.87-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/pr2/p/pr2-core/pr2-core_0.5.44-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/pr2/p/pr2-core-groovy/pr2-core-groovy_0.1.2-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/pr2/p/pr2-core-fuerte/pr2-core-fuerte_0.1.7-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-wrt610n/pr2-wrt610n_0.5.3-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-webui/pr2-webui_0.5.9-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-users/pr2-users_0.5.2-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-udev/pr2-udev_0.5.1-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-systemcheck/pr2-systemcheck_0.5.1-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-stress/pr2-stress_0.5.2-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-sendhwlog/pr2-sendhwlog_0.5.3-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-repo/pr2-repo_0.5.1-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-repo-pr2/pr2-repo-pr2_0.5.2-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-network/pr2-network_0.5.72-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-netconsole/pr2-netconsole_0.5.14-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-netboot/pr2-netboot_0.5.43-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-iptables.d/pr2-iptables.d_0.5.1-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-grant/pr2-grant_0.5.11-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-ctr350/pr2-ctr350_0.6.0_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-ckill/pr2-ckill_0.5.6-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/p/pr2-chrony/pr2-chrony_0.5.4-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/r/ros-repo/ros-repo_0.5.1-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/e/executable-selector/executable-selector_0.0.4-precise_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/l/linux/linux-image-3.4.28.rt40-1-pr2_3.4.28.rt40-1.1_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/l/linux/linux-image-3.4.28.rt40-1-pr2-rt_3.4.28.rt40-1.1_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/l/linux/linux-headers-3.4.28.rt40-1-pr2_3.4.28.rt40-1.1_amd64.deb \
	http://packages.namniart.com/repos/pr2.bak/pr2-0.6.1/ubuntu/pool/main/l/linux/linux-headers-3.4.28.rt40-1-pr2-rt_3.4.28.rt40-1.1_amd64.deb \
	&& for deb in *.deb; do ar -x ${deb} && tar xvzf data.tar.gz && rm ${deb} control.tar.gz data.tar.gz debian-binary; done

