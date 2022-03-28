CREATE SCHEMA IF NOT EXISTS data_modeling;

DROP TABLE IF EXISTS data_modeling.dim_merchants CASCADE;

CREATE TABLE data_modeling.dim_merchants (
  merchant_id INTEGER,
  merchant_reference VARCHAR(255),
  name VARCHAR(255),
  created_at DATE,
  sector VARCHAR(255),
  live_on DATE,
  months_with_sq INTEGER,
  dt VARCHAR(255),
  PRIMARY KEY(merchant_id)
);

DROP TABLE IF EXISTS data_modeling.dim_default_type CASCADE;

CREATE TABLE data_modeling.dim_default_type (
  default_type_id INTEGER,
  default_state_name VARCHAR(255),
  default_state_desc VARCHAR(255),
  dt VARCHAR(255),
  PRIMARY KEY(default_type_id)
);

DROP TABLE IF EXISTS data_modeling.fact_orders_d CASCADE;

CREATE TABLE data_modeling.fact_orders_d (
  si_order_id INTEGER,
  record_date DATE,
  merchant_id INTEGER,
  default_type_id INTEGER,
  loan_reference VARCHAR(255),
  confirmed_at DATE,
  original_order_value VARCHAR(255),
  current_order_value VARCHAR(255),
  current_product_name VARCHAR(255),
  is_finished BOOLEAN,
  is_cancelled BOOLEAN,
  instalments_count INTEGER,
  overdue_instalments_count INTEGER,
  started_to_be_delayed BOOLEAN,
  overdue_instalments_principal INTEGER,
  overdue_instalments_fees INTEGER,
  days_unbalanced INTEGER,
  dt VARCHAR(255),
  PRIMARY KEY (si_order_id,record_date),
  CONSTRAINT fk_merchant FOREIGN KEY(merchant_id) REFERENCES data_modeling.dim_merchants(merchant_id),
  CONSTRAINT fk_default_type FOREIGN KEY(default_type_id) REFERENCES data_modeling.dim_default_type(default_type_id)
);
