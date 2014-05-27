CREATE SERVER 
amazon_s3 
FOREIGN DATA WRAPPER dummy_data
OPTIONS (
  wrapper 's3fdw'
);

CREATE USER MAPPING FOR public 
SERVER amazon_s3 ;

CREATE FOREIGN TABLE stats(
  dvalue date,
  email varchar,
  hour interval,
  login_time interval,
  logout_time interval,
  available_time interval
) SERVER amazon_s3
OPTIONS (
  hostname 's3.amazonaws.com',
  bucketname 'reports',
  filename 'hourly.csv',
  format 'csv',
  delimiter E',',
  quote E'"',
  header 'true'
);

select * from stats;

