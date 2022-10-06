UPDATE Calendar
SET price= REPLACE(price, '$',''); 
UPDATE Calendar 
SET price= REPLACE(price, ',',''); 
ALTER TABLE Calendar
ALTER COLUMN price TYPE FLOAT USING price::numeric;

UPDATE Calendar
SET adjusted_price= REPLACE(adjusted_price, '$',''); 
ALTER TABLE Calendar
ALTER COLUMN adjusted_price TYPE FLOAT USING price::numeric;

ALTER TABLE Calendar
ALTER COLUMN available TYPE BOOLEAN; 