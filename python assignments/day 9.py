import requests
from bs4 import BeautifulSoup
import pandas as pd
import lxml

url="https://www.imdb.com/chart/top/"
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36",
    "Referer": "https://www.imdb.com/chart/top/",
}
try:

    response = requests.get(url,headers=headers)
    if response.status_code == 200:
        print("Access Granted. Status Code:", response.status_code)
    else:
        print("Unexpected Status Code:", response.status_code)
except requests.exceptions.RequestException as e:
    print("Error:", e)
r=requests.get("https://www.imdb.com/chart/top/",headers=headers)
print(r)

soup=BeautifulSoup(r.text,'lxml')

movie_list=soup.find_all('li',class_='ipc-metadata-list-summary-item')

Rank=[]
Name=[]
Year=[]
Rating=[]

for movie in movie_list:
    Rank.append(movie.find('h3',class_='ipc-title__text').text.split('.')[0])
    Name.append(movie.find('h3',class_='ipc-title__text').text.split('.')[1].strip())
    Year.append(movie.find_all('span',class_='cli-title-metadata-item')[0].text)
    Rating.append(movie.find('span',class_='ratingGroup--imdb-rating').text[0:3])

d={'Rank':Rank,'Movie Name':Name,'Year of Release':Year,'Rating':Rating}
print(d)

model=pd.DataFrame(data = d)
model.to_csv("IMDB 250.csv")
print(model)






