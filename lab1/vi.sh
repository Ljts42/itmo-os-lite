#!bin/bash
grep -E "^\[[ 0-9.]*\] \(WW\) .*" /var/log/anaconda/X.log | sed -E "s/\(WW\)/Warning:/" > full.log
grep -E "^\[[ 0-9.]*\] \(II\) .*" /var/log/anaconda/X.log | sed -E "s/\(II\)/Information:/" >> full.log
cat full.log
