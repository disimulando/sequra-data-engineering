
# SeQura Data Engineering

## Solution for the PySpark Question

Some assumptions about the DWH:

- A third party process stores the current status of the credits in a *landing zone* (ex: aws s3).
- This external process, includes a `record_date` for each record.
- This process stores the data in parquet files, partitioned by `record_date`. 

This way, there is a "folder" for each ingestion date in the *landing zone*. Inside each folder (ex: `record_date=2022-02-06`) we will find the records corresponding to that date (`2022-02-06`).

We will develop a daily process that will:
- read a dataframe from those parquet files
- transform that dataframe (keep only some records, for some relevant dates)
- make the dataframe available in a new table

In this new daily table we will keep, for each credit:
- one record with current status (yesterday)
- another record for each past month status (last day of each past month)

These new tables (T0, T1, T2, etc.) will be stored in a *processed data zone*, also in parquet files.

We will leave out of the scope of this project considerations like timezones, backfills, idempotency, etc.

Why parquet and why partitioning by date?

First of all, in this pipeline we will need to access data filtering by date. Partitioning data by date during the ingestion will allows us to read as little data as possible during the ETL.

Maybe the results will be analyzed applying date-ranges filters. Partitioning the output by date will be usefull in this case, but depending the explotation use cases, we would need additional partitions.

If we had to perform further transformation on the dataframe, we should also take care of the locality of the data, attempting to place data (rows) that will be used together, near one another.

While planning that, we also have to take platform resources (ex: nodes) into account, to balance data the best way possible.

Finally, parquet format implements a columnar (hybrid) aproach. This fits great with most analytical processing (OLAP) problems in terms of locallity. The data that is needed together is stored near, which improves reading performance.

:coffee: [See the proposed implementation](work/pyspark.ipynb)

### Run the solution

:computer: There is a runnable implementation of this solution in this jupyter notebook. You can deploy the necessary infrastructure using `docker-compose`. See [how to install docker compose](https://docs.docker.com/compose/install/). Download this repo on your local machine and run this command:

```
docker-compose up
```

This will open a jupyter-lab server, where you can access the notebook using this URL:

:earth_africa: [http://localhost:8888/lab/tree/work/pyspark.ipynb](http://localhost:8888/lab/tree/work/pyspark.ipynb)
