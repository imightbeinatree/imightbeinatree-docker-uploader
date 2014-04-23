FROM ubuntu:saucy
MAINTAINER Michael Orr <michael@cloudspace.com>

RUN apt-get update
# Install packages
#RUN DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor mysql-server-5.6 pwgen

# Add image configuration scripts
ADD bash_scripts/run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 22

# default command - runs shell script controller
CMD ["/run.sh"]