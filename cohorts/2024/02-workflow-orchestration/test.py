import pandas as pd
from datetime import date
from tabulate import tabulate

today = date.today()
final_date = today.strftime("%d.%m.%Y")

power_data = ['https://transparency.entsoe.eu/transmission-domain/r2/scheduledCommercialExchangesDayAhead/show'
              '?name=&defaultValue=false&viewType=TABLE&areaType=BORDER_CTY&atch=false&dateTime.dateTime'
              '='+final_date+'+00:00|CET|DAY&border.values=CTY|10YFR-RTE------C!CTY_CTY|10YFR-RTE------C_CTY_CTY'
                             '|10YBE----------2&direction.values=Export&direction.values=Import&dateTime.timezone'
                             '=CET_CEST&dateTime.timezone_input=CET+(UTC+1)+/+CEST+(UTC+2)','https://transparency.entsoe.eu/transmission-domain/r2/scheduledCommercialExchangesDayAhead/show?name=&defaultValue=false&viewType=TABLE&areaType=BORDER_CTY&atch=false&dateTime.dateTime='+final_date+'+00:00|CET|DAY&border.values=CTY|10YFR-RTE------C!CTY_CTY|10YFR-RTE------C_CTY_CTY|10Y1001A1001A83F&direction.values=Export&direction.values=Import&dateTime.timezone=CET_CEST&dateTime.timezone_input=CET+(UTC+1)+/+CEST+(UTC+2)']
df_list = []
for url in power_data:
    tables = pd.read_html(url, index_col=None, header=None,)
    df = tables[0]
    df_list.append(df)
    
df_final = pd.concat(df_list, sort=False)
df_final = df_final.drop_duplicates().reset_index(drop=True)
print(tabulate(df_final.head(), headers='keys'))
df_final.to_excel('power_data.xlsx')

df_final