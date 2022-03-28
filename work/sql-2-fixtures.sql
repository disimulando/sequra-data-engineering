
CREATE SCHEMA IF NOT EXISTS sql_2;

DROP TABLE IF EXISTS sql_2.dim_merchants;

CREATE TABLE sql_2.dim_merchants (
  merchant_id INTEGER,
  name VARCHAR(255),
  sector VARCHAR(255),
  live_on DATE,
  api_status VARCHAR(255),
  updated_at DATE,
  PRIMARY KEY(merchant_id)    
);

INSERT INTO sql_2.dim_merchants VALUES 
  (1,'trajesamedida','retail','2020-07-25','allowed','2020-07-25'),
  (25,'decoracionMark','home','2018-06-08','allowed','2021-02-17'),
  (4,'superdiario','food','2018-11-05','allowed','2021-02-17'),
  (10,'ropainterior','retail',NULL,'allowed','2021-02-17'),
  (11,'proteinasaltorendimiento','health','2018-03-15','denied','2021-02-17'),
  (12,'gimnasioMoreno','health','2019-08-17','allowed','2021-02-17'),
  (6,'cuerpoyvida','health','2021-01-14','supervised','2021-02-20'),
  (2,'dietasana','health','2021-01-15','allowed','2021-02-20'),
  (3,'ropadesalon','retail','2019-01-02','supervised','2021-02-20'),
  (13,'menajecocina','home',NULL,'allowed','2021-02-06');
