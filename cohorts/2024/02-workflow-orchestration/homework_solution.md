## Week 2 Homework

## Question 1. Data Loading

Once the dataset is loaded, what's the shape of the data?

ans:
- 266,855 rows x 20 columns.

```python
import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    """
    load data from API
    """
    filtered_dfs = []
    for i in range(10,13):
        url = f'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2020-{i}.csv.gz'
        taxi_dtypes = {
                        'VendorID': pd.Int64Dtype(),
                        'passenger_count': pd.Int64Dtype(),
                        'trip_distance': float,
                        'RatecodeID':pd.Int64Dtype(),
                        'store_and_fwd_flag':str,
                        'PULocationID':pd.Int64Dtype(),
                        'DOLocationID':pd.Int64Dtype(),
                        'payment_type': pd.Int64Dtype(),
                        'fare_amount': float,
                        'extra':float,
                        'mta_tax':float,
                        'tip_amount':float,
                        'tolls_amount':float,
                        'improvement_surcharge':float,
                        'total_amount':float,
                        'congestion_surcharge':float
                    }
        parse_dates = ['lpep_pickup_datetime', 'lpep_dropoff_datetime']
        # response = requests.get(url)
        sub_data =  pd.read_csv(url, sep=',', compression='gzip', dtype=taxi_dtypes, parse_dates=parse_dates)
        if not sub_data.empty:
            filtered_dfs.append(sub_data)
    if filtered_dfs:
        data = pd.concat(filtered_dfs)
    return data
```
Output:
<img src="https://github.com/ChukwuemekaAham/data-engineering-zoomcamp/blob/main/cohorts/2024/02-workflow-orchestration/img/load.png" />

## Question 2. Data Transformation

Upon filtering the dataset where the passenger count is greater than 0 _and_ the trip distance is greater than zero, how many rows are left?

ans: 

- 139 370 rows

```python
if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    #Question 2. Data Transformation
    #Upon filtering the dataset where the passenger count is greater than 0 and the trip distance is greater than zero, how many rows are left?
    print("Rows with 0 passanger count:",data['passenger_count'].isin([0]).sum())
    print("Rows with 0 trip distance:",data['trip_distance'].isin([0]).sum())
    data = data[(data['passenger_count']>0) & (data['trip_distance']>0)]
    return data


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
```
Output:
<img src="https://github.com/ChukwuemekaAham/data-engineering-zoomcamp/blob/main/cohorts/2024/02-workflow-orchestration/img/tran1.png" />

## Question 3. Data Transformation

Which of the following creates a new column `lpep_pickup_date` by converting `lpep_pickup_datetime` to a date?

ans:

```python
data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date
```

## Question 4. Data Transformation

What are the existing values of `VendorID` in the dataset?

ans:

```python
print(data["VendorID"].unique())
```
- 1 or 2

## Question 5. Data Transformation

How many columns need to be renamed to snake case?

ans: 

- 4

```python
 data.rename(columns={"VendorID":"vendor_id","RatecodeID":"ratecode_id","PULocationID":"pulocation_id","DOLocationID":"dulocation_id"},inplace=True)
```

## Question 6. Data Exporting

how many partitions (folders) are present in Google Cloud?

ans: 

- 96
