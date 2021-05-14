STREAM

EVERYONE:

ssh into node that will host container
locate these files (this directory)
run 'make all'
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DOCKER:

run 'nano Dockerfile' and input this code: 
FROM ubuntu 
RUN apt-get update 
RUN apt-get -qq install -y libgomp1 numactl 
ADD bin / 
CMD numactl --physcpubind=0-7,16-23 --localalloc /stream.exe      //onesocket
OR
CMD numactl --physcpubind=0-31 --interleave=0,1 ./stream.exe      //twosocket

run 'docker build -t nameHere .' to build the image

run 'docker run -it --privileged nameHere' ro run the image
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
NATIVE LINUX:

Run 'sudo apt-get update'
Run 'sudo apt-get install numactl'

-running the benchmark :
 Onesocket: numactl --physcpubind=0-7,16-23 --localalloc ./stream.exe 
 Twosocket: numactl --physcpubind=0-31 --interleave=0,1 ./stream.exe 
