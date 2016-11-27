# code =

import urllib.request
import json
from bs4 import BeautifulSoup

url = 'http://kaoshi.edu.sina.com.cn/college/scorelist?tab=batch&wl=1&local=2&batch=&syear=2013'

response = urllib.request.urlopen(url,  timeout=20)
result = response.read().decode('utf-8')

print(result)
