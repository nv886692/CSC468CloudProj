# CSC468CloudProj
RandomAccess

EVERYONE:
1. ssh into node that will host container
2. locate these files (this directory)
3. cd into bin
4. run 'chmod +x Filename' where Filename = any Xeon64 file
5. cd out of bin
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DOCKER:

 run 'nano Dockerfile' and input this code:
 
      ```
      1. FROM ubuntu:saucy
      2. RUN sed -i 's/archive/old-releases/g' /etc/apt/sources.list
      3. RUN apt-get update
      4. RUN apt-get -qq install -y libgomp1 numactl
      5. ADD bin /
      6. CMD numactl --physcpubind=0-7,16-23 --localalloc /runme_xeon64
      7. OR: numactl --physcpubind=0-31 --interleave=0,1 /runme_xeon64
      ```
      
 run 'docker build -t nameHere .'  to build the image 
 
 run 'docker run -it --privileged nameHere' to run the image

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
NATIVE LINUX:

Run 'sudo apt-get install numactl'

inside of bin...
-running the commands :  
1. numactl --physcpubind=0-7,16-23 --localalloc ./runme_xeon64
2. numactl --physcpubind=0-31 --interleave=0,1 ./runme_xeon64   
will run the Linpack benchmark natively
