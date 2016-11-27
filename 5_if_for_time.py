# 条件判断
a = 5
if a == 1:
	print(1)
elif a == 2:
	print(2)
else:
	print(3)

# 循环
c = 1
while c < 10:
	print(c)
	c = c+1

for i in range(1, 5):
	print(i)

a = [1, 2.1, 'Hello']
b = {'k1': 1, 'k2': 2.1, 'k3': 'Hello'}

# for循环遍历数组
for i in a: 
	print(i)

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

# 时间格式
import time

a = time.time()
print(a, type(a))

a = int(time.time())
a = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(a))
print(a)

a = "2013-10-10 23:40:00"
timeArray = time.strptime(a, "%Y-%m-%d %H:%M:%S")
timeStamp = int(time.mktime(timeArray))
print(timeStamp)