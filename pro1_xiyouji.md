## 西游记用字统计

### 涉及内容
1. 文件读取
文件读取使用open()函数，这里要特别注意encoding参数。当读取的文件含有中文字符时，一般要设定encoding = 'utf-8'。
2. 可以使用for()函数迭代一个对象
3. 向一个列表中添加元素可以使用append属性。

```
## 文件读取
fr = open('data/xyj.txt', 'r', encoding = 'utf-8')

characters = []
stat = {}

## 迭代文件对象
for line in fr:
	line = line.strip()

	if len(line) == 0:
		continue

	## 迭代字符串对象
	for x in range(len(line)):
	    ## 字符串判断
		if not line[x] in characters:
		    ## 字符串元素添加
			characters.append(line[x])
		## 字典键判断
		if not line[x] in stat:
			## 字典值添加
			stat[line[x]] = 0
		stat[line[x]] += 1
		# print(stat)

fw = open('data/result.txt', 'w', encoding = 'utf-8')
## 迭代字典对象
for k, v in stat.items():
	fw.write(k + ',' + str(v) + '\n') 
fw.close()

```