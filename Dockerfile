FROM ubuntu:saucy
MAINTAINER Michael Orr <michael@cloudspace.com>

RUN apt-get update
# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server
RUN mkdir /var/run/sshd

# Add image configuration scripts
ADD bash_scripts/run.sh /run.sh
ADD bash_scripts/create_user.sh /create_user.sh
RUN chmod 755 /*.sh

EXPOSE 22

# default command - runs shell script controller
CMD ["/run.sh"]