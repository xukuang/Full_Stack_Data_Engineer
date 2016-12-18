import json
fr = open('data/xyj.txt', 'r', encoding = 'utf-8')

characters = []
stat = {}

for line in fr:
	line = line.strip()

	if len(line) == 0:
		continue

	for x in range(len(line)):
		if not line[x] in characters:
			characters.append(line[x])
		if not line[x] in stat:
			stat[line[x]] = 0
		stat[line[x]] += 1
		# print(stat)

fw = open('data/result.txt', 'w', encoding = 'utf-8')
for k, v in stat.items():
	fw.write(k + ',' + str(v) + '\n') 
fw.close()

fw = open('data/result_python.csv', 'w', errors = 'ignore')
for k, v in stat.items():
	fw.write(k + ',' + str(v) + '\n') 
fw.close()

statlist = sorted(stat.items(), key = lambda item:item[1], reverse = True)

fw = open('data/result_list.csv', 'w', errors = 'ignore')
for item in statlist:
	fw.write(item[0] + ',' + str(item[1]) + '\n') 
fw.close()

fw = open('data/result.json', 'w')
fw.write(json.dumps(stat)) 
fw.close()