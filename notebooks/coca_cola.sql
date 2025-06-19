-- Database creation
CREATE DATABASE coca_cola_db;
USE coca_cola_db;

-- Table creation
CREATE TABLE coca_cola (
Date DATE,
Open FLOAT,
High FLOAT,
Low FLOAT,
`Close` FLOAT,
Adj_Close FLOAT,
Volume BIGINT
); 

-- Allow local file import
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

-- Load data from CSV file
LOAD DATA LOCAL INFILE 'C:/Users/felip/Projects/Coca_Cola_Company_SQL_Analysis/data/coca_cola.csv'
INTO TABLE coca_cola
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM coca_cola LIMIT 10; 
SELECT COUNT(*) FROM coca_cola;
DESCRIBE coca_cola;

SELECT
  COUNT(*) AS total,
  SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Date_null,
  SUM(CASE WHEN Open IS NULL THEN 1 ELSE 0 END) AS Open_null,
  SUM(CASE WHEN High IS NULL THEN 1 ELSE 0 END) AS High_null,
  SUM(CASE WHEN Low IS NULL THEN 1 ELSE 0 END) AS Low_null,  
  SUM(CASE WHEN `Close` IS NULL THEN 1 ELSE 0 END) AS Close_null,
  SUM(CASE WHEN Adj_Close IS NULL THEN 1 ELSE 0 END) AS Adj_Close_null,
  SUM(CASE WHEN Volume IS NULL THEN 1 ELSE 0 END) AS Volume_null
FROM coca_cola;

-- Monthly Average Closing Price
SELECT 
  DATE_FORMAT(Date, '%Y-%m') AS month,
  ROUND(AVG(Close), 2) AS average_monthly_close,
  MAX(High) AS highest_price_in_month
FROM coca_cola
GROUP BY month
ORDER BY month;

-- Analysis: Closing Price Above Average
CREATE OR REPLACE VIEW vw_closing_above_average AS
SELECT Date, Close
FROM coca_cola
WHERE Close > (
  SELECT AVG(Close) FROM coca_cola
);

-- Analysis: Closing Price Rank
CREATE OR REPLACE VIEW vw_rank_close AS
SELECT 
  Date,
  Close,
  RANK() OVER (ORDER BY Close DESC) AS ranking
FROM coca_cola;

-- Analysis: LEAD / LAG
CREATE OR REPLACE VIEW vw_lead_lag_close AS
SELECT 
  Date,
  Close,
  LAG(Close) OVER (ORDER BY Date) AS previous_close,
  LEAD(Close) OVER (ORDER BY Date) AS next_close
FROM coca_cola;

SELECT * FROM vw_lead_lag_close