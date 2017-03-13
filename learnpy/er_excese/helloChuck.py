def computepay(hours,rate):
            if hours <= 40:
                  pay = hours * rate
            else:
                  pay = (hours - 40) * rate *1.5+40 * rate
            return(pay)
