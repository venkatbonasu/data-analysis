import pandas as pd

data = pd.read_csv('C:\\Users\\venkat\\OneDrive\\Desktop\\covid_19_data.csv')
data = data[['Country/Region', 'Confirmed']]
data = data.dropna()
average_cases = data.groupby('Country/Region').mean().round(2)
average_cases.to_csv('average_cases_by_country.csv')
print("Saved: average_cases_by_country.csv")
