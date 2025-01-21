FROM --platform=linux/amd64 ubuntu:focal

# Your subsequent instructions
RUN apt update -y && apt upgrade -y && apt install vim -y

COPY . ./bgp_project

WORKDIR ./bgp_project

RUN chmod +x ./installs.sh 

RUN ./installs.sh

RUN python3 -m pip install -r ./requirements.txt
