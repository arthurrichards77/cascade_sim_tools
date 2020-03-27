import sys

if len(sys.argv)!=2:
    print("python waypointsToXml.py <file>")
    exit()

input_filename = sys.argv[1]

num_wp = 0

print("""<PropertyList>
  <version type="int">2</version>
  <route>""")

with open(input_filename) as input_data:
    all_data = input_data.read()
    all_lines = all_data.split("\n")
    for this_line in all_lines[1:]:
        this_data = this_line.split("\t")
        if len(this_data)>8:
            this_lat = this_data[8]
            this_lon = this_data[9]
            if this_lat!=0.0 and this_lon!=0.0:
                if num_wp>0:
                    print('    <wp n={}>'.format(num_wp))
                else:
                    print('    <wp>')
                print('      <type type="string">basic</type>')
                print('      <ident type="string">WP{}</ident>'.format(num_wp))
                print('      <lon type="double">{}</lon>'.format(this_lon))
                print('      <lat type="double">{}</lat>'.format(this_lat))
                print('    </wp>')
                num_wp = num_wp+1
                
print("""  </route>
</PropertyList>""")