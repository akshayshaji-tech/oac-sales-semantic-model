INSERT INTO dim_customer
SELECT n,
       REGEXP_SUBSTR('Aarav,Maya,Liam,Sofia,Noah,Priya,Ethan,Chen,Omar,Elena','[^,]+',1,MOD(n,10)+1)||' '||
       REGEXP_SUBSTR('Patel,Nguyen,Smith,Garcia,Khan,Mueller,Tanaka,Silva,Brown,Rossi','[^,]+',1,MOD(TRUNC(n/10),10)+1),
       CASE WHEN MOD(n,7) < 4 THEN 'Consumer'
            WHEN MOD(n,7) < 6 THEN 'Corporate'
            ELSE 'Home Office' END
FROM (SELECT LEVEL n FROM dual CONNECT BY LEVEL <= 100);
COMMIT;
