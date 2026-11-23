INSERT INTO dim_geography
SELECT ROWNUM, region, country, state, city FROM (
  SELECT 'North America' region,'United States' country,'New York' state,'New York City' city FROM dual UNION ALL
  SELECT 'North America','United States','California','Los Angeles' FROM dual UNION ALL
  SELECT 'North America','United States','Texas','Austin' FROM dual UNION ALL
  SELECT 'North America','Canada','Ontario','Toronto' FROM dual UNION ALL
  SELECT 'EMEA','United Kingdom','England','London' FROM dual UNION ALL
  SELECT 'EMEA','Germany','Bavaria','Munich' FROM dual UNION ALL
  SELECT 'EMEA','United Arab Emirates','Dubai','Dubai' FROM dual UNION ALL
  SELECT 'APAC','India','Karnataka','Bengaluru' FROM dual UNION ALL
  SELECT 'APAC','India','Maharashtra','Mumbai' FROM dual UNION ALL
  SELECT 'APAC','Australia','New South Wales','Sydney' FROM dual UNION ALL
  SELECT 'APAC','Japan','Tokyo','Tokyo' FROM dual UNION ALL
  SELECT 'APAC','Singapore','Singapore','Singapore' FROM dual);
COMMIT;
