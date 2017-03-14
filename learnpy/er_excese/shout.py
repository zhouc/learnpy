try:
    fname = raw_input('Enter the file name: ')
    fhand = open(fname)
except:
    print fname.upper(),'TO YOU - You have been punk\'d!'
    exit()
total = 0
count = 0
for line in fhand:
    if line.startswith('X-DSPAM-Confidence:'):
        num = float(line[line.find(':')+1:line.find('\n')])
        total = total + num
        count = count + 1
average = total / count
print 'Average spam confidence: %g' %average
