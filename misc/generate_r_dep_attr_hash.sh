# run this script to generate a attirbute hash of r dependency packages with <name> => <version> pairs that can be pasted into
# the chef attributes file. You may want to change the version string to the actual version of R on the system. It is set to 
# 3.1.2 currently (and this assumes the node where the command is executed has R 3.1.2 installed

dpkg -l|awk '{printf "    '\''%s'\'' => '\''%s'\'',\n", $2, $3}' | grep -e "^\s*'r-" |awk 'BEGIN {printf "default['\''r'\'']['\''dist'\''] = {\n  '\''3.1.2'\'' => {\n"} {print $0} END { printf "  }\n}\n"}'
