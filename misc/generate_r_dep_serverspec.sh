# run this script to generate the contents for a serverspec file that can be used to verify the installation
# of a given version of R dist

dpkg -l|awk '{printf "    expect(package '\''%s'\'').to be_installed.with_version('\''%s'\'')\n", $2, $3}' | grep -e "^\s*expect(package 'r-" |awk 'BEGIN {printf "require_relative '\''../../../kitchen/data/spec_helper'\''\n\ndescribe '\''cookbook-r::default'\'' do\n\n  it '\''installs the required r packages with correct version'\'' do\n"} {print $0} END { printf "  end\nend\n"}'
