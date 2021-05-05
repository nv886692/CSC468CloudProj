FROM ubuntu

MAINTAINER Ram Rajamony, rajamon@us.ibm.com

RUN apt-get update
RUN apt-get -qq install -y libgomp1 numactl
ADD bin /
#onesocket
CMD numactl --physcpubind=0-7,16-23 --localalloc /gups.exe
#twosocket
#CMD numactl --physcpubind=0-31 --interleave=0,1 /gups.exe 
