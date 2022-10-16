# Get the base Ubuntu image from Docker Hub
FROM ubuntu:latest

# Update apps on the base image
RUN apt-get -y update && apt-get install -y

# Install the Clang compiler
RUN apt-get -y install clang

# Copy the current folder which contains C++ source code to the Docker image under /usr/src
COPY . /usr/src/dockertest1

# Specify the working directory
WORKDIR /usr/src/dockertest1

# Use Clang to compile the Test.cpp source file
RUN clang++ -o HelloDocker HelloDocker.cpp

# Run the output program from the previous step
CMD ["./HelloDocker"]




## For gcc env
# # Get the GCC preinstalled image from Docker Hub
# FROM gcc:4.9

# # Copy the current folder which contains C++ source code to the Docker image under /usr/src
# COPY . /usr/src/dockertest1

# # Specify the working directory
# WORKDIR /usr/src/dockertest1

# # Use GCC to compile the Test.cpp source file
# RUN g++ -o Test Test.cpp

# # Run the program output from the previous step
# CMD ["./Test"]




# FROM docker/whalesay:latest
# LABEL Name=sddockercppenv Version=0.0.1
# RUN apt-get -y update && apt-get install -y fortunes
# CMD ["sh", "-c", "/usr/games/fortune -a | cowsay"]
