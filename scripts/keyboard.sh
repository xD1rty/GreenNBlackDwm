xset -q|grep LED| awk '{ if (substr ($10,5,1) == 1) print "АБВ"; else print "ABC"; }'