
import MySQLdb
import MySQLdb.cursors

db = MySQLdb.connect(host='127.0.0.1', user='root', passwd='iae', db='study', port=3306, charset='utf8', cursorclass = MySQLdb.cursors.DictCursor)
db.autocommit(True)
cursor = db.cursor()

fr = open('data/douban_movie_clean.txt', encoding = 'utf-8')
cursor.execute('TRUNCATE TABLE movie_utf8')

sign = [1, 2, 4, -3, -1]
count = 0
for line in fr:
	count += 1
	print(count)
	if count == 1:
		continue
	a = []
	line = line.strip().split('^')
	for i in range(5):

		if len(line[sign[i]]) > 0:
			a.append(line[sign[i]])
		else:
			a.append(-10000)
	# print(a)
	
	cursor.execute("insert into movie_utf8(title, url, rate, length, description) values(%s, %s, %s, %s, %s)", a)
fr.close()

# Read
cursor.execute("select * from movie_utf8")
movies = cursor.fetchall()
print(type(movies))
print(movies[0])

single = cursor.fetchone()
print(type(single))
print(single)

fw = open('data/douban_movie_clean_kuang_python2.txt', 'w', encoding = 'utf-8')
for i in movies[0].keys():
	fw.write(i + '^')
fw.write('\n')
for i in movies:

	for v in i.values():
		fw.write(str(v) + '^')
	fw.write('\n')

fw.close()

cursor.close()
db.close()