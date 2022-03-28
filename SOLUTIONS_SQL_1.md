
# SeQura Data Engineering

## Solution  for the SQL Question 1

```

WITH credits AS (

  SELECT 
    distinct(cd.credit_id) AS credit_id,
    cd.ext_fin_id AS financer_id
  FROM
    sql_1.fact_credit_d cd
  WHERE
    cd.record_date = (select max(cd.record_date) FROM sql_1.fact_credit_d cd WHERE DATE_PART('y', cd.record_date) = '2022')

),
financer AS (

  SELECT
    ef.ext_fin_id AS financer_id  
  FROM
    sql_1.dim_ext_fin ef
  WHERE
    ef.name = 'Fund2'

), 
financer_credits AS (

  SELECT 
    c.credit_id AS credit_id
  FROM
    credits c
  INNER JOIN 
    financer f ON c.financer_id = f.financer_id

)

  SELECT 
    evd.credit_id,
    evd.economic_event_id,
    evd.record_date,
    evd.type,
    evd.amount
  FROM
    sql_1.fact_economic_events_d evd
  INNER JOIN
    financer_credits fc ON fc.credit_id = evd.credit_id
  WHERE 
   type = 'chargeback' AND
   DATE_PART('y', record_date) = '2022';

```

![solution output](imgs/solutions_sql_1.png)

:coffee: [See the proposed implementation](work/sql-1.ipynb)

### Run the solution

:computer: There is a runnable implementation of this solution in this jupyter notebook. You can deploy the necessary infrastructure using `docker-compose`. See [how to install docker compose](https://docs.docker.com/compose/install/). Download this repo on your local machine and run this command:

```
docker-compose up
```

This will open a jupyter-lab server, where you can access the notebook using this URL:

:earth_africa: [http://localhost:8888/lab/tree/work/sql-1.ipynb](http://localhost:8888/lab/tree/work/sql-1.ipynb)
