#!/usr/bin/python
import sys, cgi, re

template, outfile = sys.argv[1:]

data = open(template).read()

while True:
    m = re.search("\{\{(\S+)\}\}", data, re.M)
    if not m:
	break
    infile = open(m.group(1)).read()
    infile = cgi.escape(infile)
    data = data[:m.start()] + infile + data[m.end():]

open(outfile, "w").write(data)
