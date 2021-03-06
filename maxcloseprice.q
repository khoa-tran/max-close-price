### Hive Queries To Compute Max Close Price By Stock Symbol ###

### CREATE EXTERNAL TABLE ###
hive> CREATE EXTERNAL TABLE IF NOT EXISTS stocks_starterkit (
exch STRING,
symbol STRING,
ymd STRING,
price_open FLOAT,
price_high FLOAT,
price_low FLOAT,
price_close FLOAT,
volume INT,
price_adj_close FLOAT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/hirw/input/stocks';

### SELECT 100 RECORDS ###
hive> SELECT * FROM stocks_starterkit
LIMIT 100;

### DESCRIBE TO GET MORE INFORMATION ABOUT TABLE ###
hive> DESCRIBE FORMATTED stocks_starterkit;

### CALCULATE MAX CLOSING PRICE ###
hive> SELECT symbol, max(price_close) max_close FROM stocks_starterkit
GROUP BY symbol;