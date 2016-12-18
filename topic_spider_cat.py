import urllib.request
import json
from bs4 import BeautifulSoup

# GET
url = 'http://placekitten.com/g/500/600'
response = urllib.request.urlopen(url,  timeout=20)
result = response.read()

with open('data/cat_500_600.jpg', 'wb') as f:
	f.write(result)
