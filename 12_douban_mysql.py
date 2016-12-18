import MySQLdb
import MySQLdb.cursors

db = MySQLdb.connect(host='127.0.0.1', user='root', passwd='iae', db='study', port=3306, charset='utf8', cursorclass = MySQLdb.cursors.DictCursor)
db.autocommit(True)
cursor = db.cursor()

fr = open('data/douban_movie_clean.txt', encoding = 'utf-8')

cursor.execute('TRUNCATE TABLE movie_s_utf8')
count = 0
for line in fr:
	count += 1
	print(count)
	if count == 1:
		continue
	
	line = line.strip().split('^')
	cursor.execute("insert into movie_s_utf8(title, url, rate, length, description) values(%s, %s, %s, %s, %s)",[line[1], line[2], line[4], line[-3], line[-1]])
	
fr.close()


cursor.close()
db.close()


