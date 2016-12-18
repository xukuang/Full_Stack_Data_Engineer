import urllib.request
import json
from bs4 import BeautifulSoup



# GET
url = 'http://kaoshi.edu.sina.com.cn/college/scorelist?tab=batch&wl=1&local=2&batch=&syear=2013'
response = urllib.request.urlopen(url,  timeout=20)
result = response.read().decode('utf-8')

print(result)


# POST
url = 'http://shuju.wdzj.com/plat-info-target.html'
data = urllib.parse.urlencode({'type': 1, 'target1': 19, 'target2': 20, 'wdzjPlatId': 59}).encode("utf-8")
request = urllib.request.Request(url, data)
response = urllib.request.urlopen(request)
result = response.read().decode("utf-8")

for key in json.loads(result).keys():
	print(key)


