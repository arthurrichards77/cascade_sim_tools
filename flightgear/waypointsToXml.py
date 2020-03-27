import sys

if len(sys.argv)!=2:
    print("python waypointsToXml.py <file>")
    exit()

print(str(sys.argv))

input_filename = sys.argv[1]

with open(input_filename) as input_data:
    all_data = input_data.read()
    all_lines = all_data.split("\n")
    for this_line in all_lines[1:]:
        print(this_line)
        this_data = this_line.split("\t")
        print(this_data)
