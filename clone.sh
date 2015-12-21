#!/usr/bin/python
import re
import os

file = open('urls.txt', 'r')
for line in file.read().split("\n") :
	if len(line) == 0:
		continue

	match = re.search('github.com/([^/]+)', line);

	dir = match.group(1)
	if os.path.isdir(dir) is not True :
		os.mkdir(dir)

	os.chdir(dir)
	os.system('rm -rf ./*')
	os.system('git clone ' + line)
	os.chdir('../')	
