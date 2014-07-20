FROM centos:centos7
MAINTAINER damien.duportal@gmail.com

#RUN rpm -ivh https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.2.0-2.el6.x86_64.rpm
RUN curl -L https://www.opscode.com/chef/install.sh | bash

RUN yum clean all
RUN yum install -y sudo openssh-server openssh-clients which curl
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''

RUN useradd -d /home/kitchen -m -s /bin/bash kitchen
RUN echo kitchen:kitchen | chpasswd
RUN echo 'kitchen ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
