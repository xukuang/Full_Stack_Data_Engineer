import locale, sys
print(locale.getpreferredencoding())
print(sys.getdefaultencoding())

fr = open('xyj.txt', 'r', encoding = 'utf-8')
print(fr.encoding)

for line in fr:
	print(line)
	break
fr.close()

fw = open('data.txt', 'a')
print(fw.encoding)
for x in range(1, 10):
	fw.write(str(x) + '\n')
	break
fw.close()

fr = open('data.txt', 'r')
for line in fr:
	line = line.strip()
	print(line)
fr.close()