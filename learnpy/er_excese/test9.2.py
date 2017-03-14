
t = list()
fname = raw_input('Enter a file name: ')
fhand = open(fname)
for line in fhand:
    words = line.split()
    if len(words) == 0: continue
    if words[0] == 'From':
        t.append(words[2])
print t

##word = dict()
##for i in t:
##    word[i] = word.get(i,0) +1  #使用.get函数也可得到相同结果
##print word

word = dict()
for i in t:
    if i not in word:
        word[i] = 1
    else:
        word[i] += 1
print word
