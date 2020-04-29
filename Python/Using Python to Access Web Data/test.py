import re
hand = open('https://www.py4e.com/code3/mbox-short.txt')
for line in hand:
    line = line.rstrip()
if re.search('From:', line):
    print(line)
