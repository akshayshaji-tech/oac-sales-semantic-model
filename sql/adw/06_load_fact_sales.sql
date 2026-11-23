EXEC DBMS_RANDOM.SEED(42);

INSERT /*+ APPEND */ INTO fact_sales
WITH g AS (SELECT /*+ MATERIALIZE */ LEVEL n FROM dual CONNECT BY LEVEL <= 30000),
o AS (
  SELECT /*+ MATERIALIZE */ n,
         TRUNC((n-1)/3)+1 AS order_id,
         MOD(n-1,3)+1     AS line_no,
         TRUNC(1096*POWER(ORA_HASH(TRUNC((n-1)/3)+1,999999,1)/1000000,0.85)) AS d_off,
         ORA_HASH(TRUNC((n-1)/3)+1,99,7)+1 AS cust,
         ORA_HASH(TRUNC((n-1)/3)+1,11,9)+1 AS geo,
         TRUNC(DBMS_RANDOM.VALUE(1,28)) AS prod,
         TRUNC(DBMS_RANDOM.VALUE(1,6))  AS qty,
         CASE WHEN DBMS_RANDOM.VALUE < 0.7 THEN 0
              ELSE TRUNC(DBMS_RANDOM.VALUE(1,5))*0.05 END AS disc
  FROM g)
SELECT o.n, o.order_id, o.line_no, d.date_key, o.prod, o.cust, o.geo,
       o.qty, p.unit_price,
       ROUND(o.qty*p.unit_price*o.disc,2),
       ROUND(o.qty*p.unit_price,2),
       ROUND(o.qty*p.unit_price*(1-o.disc),2),
       ROUND(o.qty*p.unit_cost,2)
FROM o
JOIN dim_date    d ON d.full_date   = DATE '2023-01-01' + o.d_off
JOIN dim_product p ON p.product_key = o.prod;
COMMIT;
