CREATE TABLE Price AS SELECT DISTINCT id, price, weekly_price, monthly_price, security_deposit, cleaning_fee,
guests_included, extra_people, minimum_nights, maximum_nights,
minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights,
maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm FROM Listings;

UPDATE Price 
SET price= REPLACE(price, '$',''); 
UPDATE Price 
SET price= REPLACE(price, ',',''); 
ALTER TABLE Price
ALTER COLUMN price TYPE FLOAT USING price::numeric ;

UPDATE Price 
SET weekly_price= REPLACE(weekly_price, '$',''); 
ALTER TABLE Price
ALTER COLUMN weekly_price TYPE FLOAT USING price::numeric ;

UPDATE Price 
SET monthly_price= REPLACE(monthly_price, '$',''); 
ALTER TABLE Price
ALTER COLUMN monthly_price TYPE FLOAT USING price::numeric ;

UPDATE Price 
SET security_deposit= REPLACE(security_deposit, '$',''); 
ALTER TABLE Price
ALTER COLUMN security_deposit TYPE FLOAT USING price::numeric ;

UPDATE Price 
SET cleaning_fee= REPLACE(cleaning_fee, '$',''); 
ALTER TABLE Price
ALTER COLUMN cleaning_fee TYPE FLOAT USING price::numeric ;

UPDATE Price 
SET extra_people= REPLACE(extra_people, '$',''); 
ALTER TABLE Price
ALTER COLUMN extra_people TYPE INTEGER USING price::numeric ;

ALTER TABLE Price
ALTER COLUMN minimum_nights_avg_ntm TYPE FLOAT USING price::numeric ;

ALTER TABLE Price
ALTER COLUMN maximum_nights_avg_ntm TYPE FLOAT USING price::numeric ;

ALTER TABLE Price
RENAME COLUMN id TO listing_id;

ALTER TABLE Price
ADD FOREIGN KEY(listing_id) REFERENCES Listings(id);

/* not complete!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
ALTER TABLE Listings
DROP COLUMN  security_deposit;
ALTER TABLE Listings
DROP COLUMN cleaning_fee;
ALTER TABLE Listings
DROP COLUMN guests_included;
ALTER TABLE Listings
DROP COLUMN extra_people;
ALTER TABLE Listings
DROP COLUMN  minimum_nights;
ALTER TABLE Listings
DROP COLUMN maximum_nights;
ALTER TABLE Listings
DROP COLUMN minimum_minimum_nights;
ALTER TABLE Listings
DROP COLUMN maximum_minimum_nights;
ALTER TABLE Listings
DROP COLUMN minimum_maximum_nights;
ALTER TABLE Listings
DROP COLUMN maximum_maximum_nights;
ALTER TABLE Listings
DROP COLUMN minimum_nights_avg_ntm; 
ALTER TABLE Listings
DROP COLUMN maximum_nights_avg_ntm;
