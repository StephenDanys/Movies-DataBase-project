CREATE TABLE Location_table AS SELECT DISTINCT id, street, neighbourhood, neighbourhood_cleansed, city, state,
zipcode, market, smart_location, country_code, country, latitude, longitude,
is_location_exact FROM Listings;

ALTER TABLE Location_table RENAME COLUMN id TO listing_id;

ALTER TABLE Location_table ADD FOREIGN KEY (listing_id) REFERENCES Listing(id);

ALTER TABLE Listing 
	DROP COLUMN street,
	DROP COLUMN neighbourhood,
	DROP COLUMN neighbourhood_cleansed,
	DROP COLUMN city,
	DROP COLUMN state,
	DROP COLUMN zipcode,
	DROP COLUMN market, 
	DROP COLUMN smart_location,
	DROP COLUMN country_code,
	DROP COLUMN country,
	DROP COLUMN latitude,
	DROP COLUMN longitude,
	DROP COLUMN is_location_exact;

DELETE FROM Location_table 
 WHERE NOT EXISTS(SELECT NULL
                    FROM Neighbourhood n
                   WHERE n.neighbourhood = Location_table.neighbourhood);

ALTER TABLE Location_table ADD FOREIGN KEY (neighbourhood) REFERENCES Neighbourhood(neighbourhood);
