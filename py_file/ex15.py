#导入arge module
from sys import argv
#argv 模块赋值
script, filename = argv
#将filename的文件地址赋值给txt
txt = open(filename)
#输出txt中的内容
print "Here's your file %r:" % filename
print txt.read()

print "Type the filename again:"
file_again = raw_input("> ")

txt_again = open(file_again)

print txt_again.read()
