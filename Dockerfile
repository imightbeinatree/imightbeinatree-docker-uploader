FROM imightbeinatree/sshable
MAINTAINER Michael Orr <michael@cloudspace.com>

# do we also want to install the ssh stuff or do we leave it reliant on the base image?

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor

ADD bash_scripts/run.sh /run.sh
ADD bash_scripts/create_user.sh /create_user.sh
ADD bash_scripts/uploadwatcher.sh /uploadwatcher.sh
RUN chmod 755 /*.sh

ADD config_files/supervisord-uploadwatcher.conf /etc/supervisor/conf.d/supervisord-uploadwatcher.conf
CMD ["/run.sh"]