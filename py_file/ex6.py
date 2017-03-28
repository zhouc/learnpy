#-- coding: utf-8 --
#输出整数
x = "There are %d types of people." % 10
#赋值
binary = "binary"
do_not = "don't"
#输出两个字符
#字符串包含字符串
y = "Those who know %s and those who %s." % (binary, do_not)

print x
print y
#字符串包含字符串
print "I said: %r." % x
#字符串包含字符串
print "I also said: '%s'." % y
#给hilarious赋值
hilarious = False
joke_evaluation = "Isn't that joke so funny?! %r"
#字符串包含字符串
print joke_evaluation % hilarious

w = "This is the left side of..."
e = "a string with a right side."

print w + e
