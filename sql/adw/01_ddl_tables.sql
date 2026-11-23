CREATE TABLE dim_date (
  date_key       NUMBER(8)    NOT NULL,   -- 20240131 (smart key)
  full_date      DATE         NOT NULL,
  day_name       VARCHAR2(10),
  day_of_month   NUMBER(2),
  month_key      NUMBER(6)    NOT NULL,   -- 202401
  month_num      NUMBER(2),
  month_name     VARCHAR2(10),
  month_label    VARCHAR2(10),            -- 'Jan 2024'
  quarter_key    NUMBER(5)    NOT NULL,   -- 20241
  quarter_label  VARCHAR2(8),             -- 'Q1 2024'
  year_num       NUMBER(4)    NOT NULL,
  CONSTRAINT pk_dim_date PRIMARY KEY (date_key)
);

CREATE TABLE dim_product (
  product_key       NUMBER(6) NOT NULL,
  sku               VARCHAR2(12),
  product_name      VARCHAR2(60),
  subcategory_id    NUMBER(3),
  subcategory_name  VARCHAR2(40),
  category_id       NUMBER(3),
  category_name     VARCHAR2(40),
  unit_price        NUMBER(10,2),
  unit_cost         NUMBER(10,2),
  CONSTRAINT pk_dim_product PRIMARY KEY (product_key)
);

CREATE TABLE dim_customer (
  customer_key   NUMBER(6) NOT NULL,
  customer_name  VARCHAR2(60),
  segment        VARCHAR2(20),
  CONSTRAINT pk_dim_customer PRIMARY KEY (customer_key)
);

CREATE TABLE dim_geography (
  geography_key  NUMBER(6) NOT NULL,
  region_name    VARCHAR2(30),
  country_name   VARCHAR2(40),
  state_name     VARCHAR2(40),
  city_name      VARCHAR2(40),
  CONSTRAINT pk_dim_geography PRIMARY KEY (geography_key)
);

-- Grain: one row per order line
CREATE TABLE fact_sales (
  sales_key        NUMBER(10) NOT NULL,
  order_id         NUMBER(10) NOT NULL,
  order_line_no    NUMBER(2)  NOT NULL,
  date_key         NUMBER(8)  NOT NULL,
  product_key      NUMBER(6)  NOT NULL,
  customer_key     NUMBER(6)  NOT NULL,
  geography_key    NUMBER(6)  NOT NULL,
  quantity         NUMBER(5),
  unit_price       NUMBER(10,2),
  discount_amount  NUMBER(12,2),
  gross_sales      NUMBER(12,2),
  net_revenue      NUMBER(12,2),
  cogs             NUMBER(12,2),
  CONSTRAINT pk_fact_sales PRIMARY KEY (sales_key)
);
