
fname = raw_input('Enter file: ')
fhand = open(fname)
t = list()
for word in fhand:
    words = word.split()
    for w in words:
        if w not in t:
            t.append(w)
t.sort()
print t
