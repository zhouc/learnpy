
def computegrade():
      try:
            score = input('Enter score: ')
            if score >= 0.9 and score <=1.0:
                  grade ='A'
            elif score >= 0.8 and score <=1.0:
                  grade ='B'
            elif score >= 0.7 and score <=1.0:
                  grade ='C'
            elif score >= 0.6 and score <=1.0:
                  grade ='D'
            elif score < 0.6 and score >=0:
                  grade ='F' 
            return grade
      except:
            print 'Bad score'

