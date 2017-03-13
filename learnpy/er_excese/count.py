str = 'X-DSPAM-Confidence: 0.8475'
stop1 = str.find(':')
num = float(str[stop1+1:])
print num
