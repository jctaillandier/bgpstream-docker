import pybgpstream, argparse

parser = argparse.ArgumentParser(description='BGP Stream script')
parser.add_argument('-tf','--time_from', required=True)
parser.add_argument('-tt', '--time_to', required=True)
parser.add_argument('-f', '--filters', default=None)
args = parser.parse_args()

HEADERS = [
    "Record Type",
    "Element Type",
    "timestamp",
    "",
    "RRCnum",
    "",
    "",
    "Advertising AS",
    "Next Hop",
    "Prefix",
    "",
    "AS Path",
    "communities(asn:communityValue)",
    "",
    "",
]

_FROM = f"{args.time_from} 00:00:01"
_TO = f"{args.time_to} 00:00:00"

stream = pybgpstream.BGPStream(
    from_time=_FROM,
    until_time=_TO,
    record_type="updates",
    collectors=["rrc00"],
)

with open(f"./data/{_FROM.split(' ')[0]}_{_TO.split(' ')[0]}.csv", "w") as f:
    print(f"Writing to file: ./data/{_FROM.split(' ')[0]}_{_TO.split(' ')[0]}.csv")
    f.write(f"{HEADERS}\n")
    for index,rec in enumerate(stream):
        if args.filters:
            if args.filters in rec.fields:
                f.write(f"{rec}\n")
        else:    
            f.write(f"{rec}\n")
        if index % 1000 == 0:
            print(f"Processed {index} records")
