
t = list()
while(True):
    num = raw_input('Enter a number: ')
    if num =='done':
        break
    t.append(float(num))
t_max = max(t)
t_min = min(t)
print 'Maximum: ',t_max,'\nMinimum: ',t_min
    
