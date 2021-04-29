FROM ubuntu:saucy
MAINTAINER Honglin Feng <hfeng@tutum.co>

# Install packages
#RUN sed -i 's/us.archive/old-releases/g' /etc/apt/sources.list
RUN sed -i 's/archive/old-releases/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -qq install -y libgomp1 numactl
ADD bin /
RUN chmod 777 *xeon64
CMD numactl --physcpubind=0-3 --localalloc /runme_xeon64
#RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server pwgen
#RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

#ADD set_root_pw.sh /set_root_pw.sh
#ADD run.sh /run.sh
#RUN chmod +x /*.sh

#ENV AUTHORIZED_KEYS **None**

#EXPOSE 22
#CMD ["/run.sh"]
