FROM centos:centos7
MAINTAINER damien.duportal@gmail.com

# Install ChefDK (it embed ruby/bundle/gem/tools...)
RUN rpm -ivh https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.2.0-2.el6.x86_64.rpm

RUN yum clean all
RUN yum install -y sudo openssh-clients which curl

# Install the latest version of the docker CLI
# This is from the boot2docker Dockerfile :-)
RUN curl -L -o /usr/local/bin/docker https://get.docker.io/builds/Linux/x86_64/docker-latest && \
    chmod +x /usr/local/bin/docker

# Use chef-DK embedded ruby install
RUN echo 'eval "$(chef shell-init bash)"' >> /.bashrc

# Install and configure Docker CLI to work with VM's daemon
ENV DOCKER_HOST tcp://10.0.2.15:2375

# Install some usefull tools not embedded in chef DK
RUN for GEMNAME in strainer kitchen-docker librarian-chef knife-spec; \
		do chef gem install ${GEMNAME} --no-ri --no-rdoc; \
	done;

# Configure sudo for test-kitchen)
RUN sed -i 's/Defaults\(.*\)requiretty/#Defaults requiretty/g' /etc/sudoers

RUN mkdir -p /vagrant
VOLUME ["/vagrant"]
WORKDIR /vagrant

CMD ["/bin/bash"]
