# BGPStream project, containerized 
- Original project at https://github.com/CAIDA/pybgpstream
- Docker version of project doesn't work anymore 

## Build it
`docker build -t docker-bgp .`

note: It is built with X86 architecture because bgpstream project owners don't have release with arm.

## To run container
`docker run -it  --mount type=bind,source=<host folder>/,target=/bgp_project/ docker-bgp`
- I mounted on my local host for ease of use as I am working on MacOs

## Sample Python command once in the project
`python3 bgpstream.py -tf='2024-12-01' -tt='2024-12-02'`
- Careful, even this one day sample will general a lot of data.