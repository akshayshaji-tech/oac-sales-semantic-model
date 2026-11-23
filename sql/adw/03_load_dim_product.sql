INSERT INTO dim_product
WITH sc AS (
  SELECT 1 id, 1 cat_id, 'Technology' cat, 'Laptops' sub, 'Laptop' base, 900 price FROM dual UNION ALL
  SELECT 2,1,'Technology','Smartphones','Phone',650 FROM dual UNION ALL
  SELECT 3,1,'Technology','Accessories','Dock',120 FROM dual UNION ALL
  SELECT 4,2,'Furniture','Office Chairs','Chair',260 FROM dual UNION ALL
  SELECT 5,2,'Furniture','Desks','Desk',480 FROM dual UNION ALL
  SELECT 6,2,'Furniture','Storage','Cabinet',210 FROM dual UNION ALL
  SELECT 7,3,'Office Supplies','Paper','Paper Ream',8 FROM dual UNION ALL
  SELECT 8,3,'Office Supplies','Binders','Binder Set',15 FROM dual UNION ALL
  SELECT 9,3,'Office Supplies','Writing','Pen Pack',12 FROM dual),
t AS (
  SELECT 1 n,'Essential' tier,0.8 f FROM dual UNION ALL
  SELECT 2,'Plus',1.0 FROM dual UNION ALL
  SELECT 3,'Pro',1.4 FROM dual)
SELECT (sc.id-1)*3+t.n,
       'SKU-'||LPAD((sc.id-1)*3+t.n,4,'0'),
       sc.base||' '||t.tier,
       sc.id, sc.sub, sc.cat_id, sc.cat,
       ROUND(sc.price*t.f,2),
       ROUND(sc.price*t.f*0.62,2)
FROM sc CROSS JOIN t;
COMMIT;
