n=0
m=0
while True:
      data = raw_input('Enter data: ')
      if data == 'done':
             print '%f %f %f' %(m,n,m/n)
             break
      try:
            data = float(data)
      except:
            print 'Input Error'
            continue
      n = n + 1
      m = m + data
