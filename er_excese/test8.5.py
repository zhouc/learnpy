
count = 0
fname = raw_input('Enter a file name: ')
fhand = open(fname)
for f in fhand:
    f1 = f.split()
    if len(f1) ==0: continue
    if f1[0] !='From': continue
    print f1[1]
    count = count + 1
print 'There were ' , count , 'lines in the file with Form as the first word'
