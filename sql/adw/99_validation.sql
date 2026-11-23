SELECT COUNT(*) AS fact_rows FROM fact_sales;   -- expect 30000
SELECT d.year_num, SUM(f.net_revenue) AS net_revenue, COUNT(DISTINCT f.order_id) AS orders
FROM fact_sales f JOIN dim_date d ON d.date_key = f.date_key
GROUP BY d.year_num ORDER BY 1;
SELECT p.category_name, SUM(f.net_revenue) AS net_revenue
FROM fact_sales f JOIN dim_product p ON p.product_key = f.product_key
GROUP BY p.category_name ORDER BY 2 DESC;
SELECT g.region_name, SUM(f.net_revenue) AS net_revenue
FROM fact_sales f JOIN dim_geography g ON g.geography_key = f.geography_key
GROUP BY g.region_name ORDER BY 2 DESC;
