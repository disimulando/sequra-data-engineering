
CREATE SCHEMA IF NOT EXISTS sql_1;

DROP TABLE IF EXISTS sql_1.fact_credit_d;

CREATE TABLE sql_1.fact_credit_d (
  credit_id BIGINT,
  record_date DATE,
  ext_fin_id INTEGER,
  principal INTEGER,
  interest INTEGER,
  days_unbalanced INTEGER,
  PRIMARY KEY(credit_id, record_date)
);

INSERT INTO sql_1.fact_credit_d VALUES 
  (15,'2022-01-05',1,100,3,0),
  (15,'2022-01-06',1,100,3,0),
  (16,'2022-01-06',1,80,2,1),
  (15,'2022-01-07',1,100,3,0),
  (16,'2022-01-07',1,80,2,1),
  (17,'2022-01-07',2,300,3,NULL),
  (18,'2022-01-07',2,50,3,0),
  (15,'2022-01-08',1,100,3,0),
  (16,'2022-01-08',1,80,2,1),
  (17,'2022-01-08',2,300,3,NULL),
  (18,'2022-01-08',2,50,3,0),
  (19,'2022-01-08',2,65,3,0);

--

DROP TABLE IF EXISTS sql_1.fact_economic_events_d ;

CREATE TABLE sql_1.fact_economic_events_d (
  credit_id BIGINT,
  economic_event_id BIGINT,
  record_date DATE,
  type VARCHAR(255),
  amount INTEGER,
  PRIMARY KEY(credit_id, economic_event_id, record_date)
);

INSERT INTO sql_1.fact_economic_events_d VALUES 
  (15,1,'2022-01-05','installment',5),
  (15,2,'2022-01-05','chargeback',10),
  (17,3,'2022-01-07','chargeback',10),
  (18,4,'2022-01-08','payment',50),
  (18,5,'2022-01-10','chargeback',50),
  (19,6,'2022-01-10','payment',30);

--

DROP TABLE IF EXISTS sql_1.dim_ext_fin ;

CREATE TABLE sql_1.dim_ext_fin (
  ext_fin_id INTEGER,
  name VARCHAR(255),
  start_date DATE,
  PRIMARY KEY(ext_fin_id)
);

INSERT INTO sql_1.dim_ext_fin VALUES 
  (1,'Inv1','2020-04-18'),
  (2,'Fund2','2021-10-11');
