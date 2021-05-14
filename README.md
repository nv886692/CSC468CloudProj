# CSC468CloudProj
RandomAccess

EVERYONE:
1. ssh into node that will host container
2. locate these files (this directory)
3. run 'mkdir bin'
4. run 'make all'
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DOCKER:

 run 'nano Dockerfile' and input this code:
 
      ```
      1. FROM ubuntu
      2. RUN apt-get update
      3. RUN apt-get -qq install -y libgomp1 numactl
      4. ADD bin /
      5. CMD numactl --physcpubind=0-7,16-23 --localalloc /gups.exe
      ```
      
 run 'docker build -t nameHere .'  to build the image 
 
 run 'docker run -it --privileged nameHere' to run the image

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
NATIVE LINUX:

Run 'sudo apt-get install numactl'

-running the commands :  
1. numactl --physcpubind=0-7,16-23 --localalloc ./gups.exe 
2. numactl --physcpubind=0-31 --interleave=0,1 ./gups.exe   
will run Random Access benchmark natively
