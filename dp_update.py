import requests, string

url = 'http://ghost.bioe.illinois.edu/deepphenotyping/experiment_total'

data = requests.get(url).json()
count = data['count']
count_str = f'{count:,}'

with open('index_raw.html') as f:
	s = string.Template("".join(f.readlines()))
	s = s.substitute(DPCOUNT=count_str)

with open('index.html', 'w') as f:
	f.write(s)
