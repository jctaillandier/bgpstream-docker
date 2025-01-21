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
- Careful, even this one day sample will general Gb.

## Output column description
- Record Type: Type of BGP route message, I work with Updates for now
- Element Type
- Timestamp: Epoch format timestamp of message
- RRCnum: 
- Advertising AS: The ASN of the one that sent the message
- Next Hop: From the point where data was collected (Som IXP) what is the current next hop towards requested IP
- Prefix: The advertised prefix, which is a block of IP addresses (169.145.140.0 to 169.145.141.255) that the Advertising AS claims to own.
- AS Path: The route the message took before getting to the IXP (where data was collected for us). The first AS is who originated this message / the source of the message. The following numbers are the hops it took until the IXP where it was intercepted for us. 
- communities(asn:communityValue): Weird concept, but any AS that passed along the message can add these. They don't mean something, they are just tags that AS can then resolve locally. The left side of colon is the AS that created this tag. the Right side is a code, that means something to the AS
