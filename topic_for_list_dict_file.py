a = [1, 2.1, 'Hello']
b = {'k1': 1, 'k2': 2.1, 'k3': 'Hello'}

# for循环遍历字典
## 遍历键
for key in b:
	print(key)
for key in b.keys():
	print(key)
## 遍历值
for value in b.values():
	print(value)
## 遍历键和值
for key,value in b.items():
	print(key, value)

# for循环遍历文件
fr = open('data/result_python.csv', 'r')

for line in fr:
	line = line.strip()
	print(line)

fr.close()