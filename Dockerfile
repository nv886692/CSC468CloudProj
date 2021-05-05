FROM ubuntu:saucy
MAINTAINER Honglin Feng <hfeng@tutum.co>

# Install packages

RUN sed -i 's/archive/old-releases/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -qq install -y libgomp1 numactl
ADD bin /
RUN chmod 777 *xeon64
#onesocket
CMD numactl --physcpubind=0-7,16-23 --localalloc /runme_xeon64 
#twosocket
#CMD numactl --physcpubind=0-31 --interleave=0,1 /runme_xeon64


#ENV AUTHORIZED_KEYS **None**

#EXPOSE 22
#CMD ["/run.sh"]
