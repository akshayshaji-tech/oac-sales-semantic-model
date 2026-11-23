ALTER TABLE fact_sales ADD CONSTRAINT fk_fs_date FOREIGN KEY (date_key)
  REFERENCES dim_date(date_key) RELY DISABLE NOVALIDATE;
ALTER TABLE fact_sales ADD CONSTRAINT fk_fs_product FOREIGN KEY (product_key)
  REFERENCES dim_product(product_key) RELY DISABLE NOVALIDATE;
ALTER TABLE fact_sales ADD CONSTRAINT fk_fs_customer FOREIGN KEY (customer_key)
  REFERENCES dim_customer(customer_key) RELY DISABLE NOVALIDATE;
ALTER TABLE fact_sales ADD CONSTRAINT fk_fs_geography FOREIGN KEY (geography_key)
  REFERENCES dim_geography(geography_key) RELY DISABLE NOVALIDATE;

BEGIN DBMS_STATS.GATHER_SCHEMA_STATS('SALES_DW'); END;
/

GRANT SELECT ON dim_date      TO oac_ro;
GRANT SELECT ON dim_product   TO oac_ro;
GRANT SELECT ON dim_customer  TO oac_ro;
GRANT SELECT ON dim_geography TO oac_ro;
GRANT SELECT ON fact_sales    TO oac_ro;
