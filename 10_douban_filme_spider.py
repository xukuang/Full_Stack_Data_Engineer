# code =

import urllib.request
import json
from bs4 import BeautifulSoup


tags = []

 
url = 'https://movie.douban.com/j/search_tags?type=movie'
request = urllib.request.Request(url)
response = urllib.request.urlopen(url, timeout=20)
result = response.read().decode('utf-8')
result = json.loads(result)
tags = result['tags']
print(tags)


movies = []

for tag in tags:
	limit = 0
	while 1 :
		tag = urllib.parse.quote(tag)
		url = 'https://movie.douban.com/j/search_subjects?type=movie&tag=' + tag + '&sort=recommend&page_limit=20&page_start=' + str(limit)
		request = urllib.request.Request(url)
		response = urllib.request.urlopen(url, timeout = 20)

		result = response.read().decode('utf-8')
		# print(result)
		result = json.loads(result)

		result = result['subjects']
		if len(result) == 0:
			break

		limit += 20
		for item in result:
			movies.append(item)

for x in range(0, len(movies)):
	item = movies[x]
	request = urllib.request.Request(url = item['url'])
	response = urllib.request.urlopen(request, timeout = 20)

	result = response.read().decode('utf-8')
	
	html = BeautifulSoup(result, "html.parser")
	title = html.select('h1')[0]
	title = title.select('span')[0]
	title = title.get_text()
	# print(title)
	
	movies[x]['title'] = title
	#print(type(movies))



fw = open("data/movies.txt", 'w', encoding = 'utf-8')

for item in movies:
	tmp = ''
	for key, value in item.items():
		tmp += str(value) + ','
	fw.write(tmp[:-1] + '\n')

fw.close()
