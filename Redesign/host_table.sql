CREATE TABLE Host AS SELECT DISTINCT id, host_url, host_name, host_since, host_location, host_about,
host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost,
host_thumbnail_url, host_picture_url, host_neighbourhood, host_listings_count,
host_total_listings_count, host_verifications, host_has_profile_pic, host_identity_verified,
calculated_host_listings_count FROM Listings;

ALTER TABLE Host 
    RENAME COLUMN host_url TO url,
    RENAME COLUMN host_name TO name,
    RENAME COLUMN host_since TO since,
    RENAME COLUMN host_location TO location,
    RENAME COLUMN host_about TO aoout,
    RENAME COLUMN host_response_time TO response_time,
    RENAME COLUMN host_response_rate TO response_rate,
    RENAME COLUMN host_acceptance_rate TO acceptance_rate,
    RENAME COLUMN host_is_superhost TO is_superhost,
    RENAME COLUMN host_thumbnail_url TO thumbnail_url,
    RENAME COLUMN host_picture_url TO picture_url,
    RENAME COLUMN host_neighbourhood TO neighbourhood,
    RENAME COLUMN host_listings_count TO listings_count,
    RENAME COLUMN host_total_listings_count TO total_listings_count,
    RENAME COLUMN host_verifications TO verifications,
    RENAME COLUMN host_has_profile_pic TO has_profile_pic,
    RENAME COLUMN host_identity_verified TO identity_verified,
    RENAME COLUMN calculated_host_listings_count TO calculated_listings_count;

ALTER TABLE Listings
	DROP COLUMN host_id;
ALTER TABLE Listings
	DROP COLUMN host_url;
ALTER TABLE Listings
	DROP COLUMN host_name;
ALTER TABLE Listings
	DROP COLUMN host_since;
ALTER TABLE Listings
	DROP COLUMN host_location;
ALTER TABLE Listings
	DROP COLUMN host_about;
ALTER TABLE Listings
	DROP COLUMN host_response_time;
ALTER TABLE Listings
	DROP COLUMN host_response_rate;
ALTER TABLE Listings
	DROP COLUMN host_acceptance_rate;
ALTER TABLE Listings
	DROP COLUMN host_is_superhost;
ALTER TABLE Listings
	DROP COLUMN host_thumbnail_url;
ALTER TABLE Listings
	DROP COLUMN host_picture_url;
ALTER TABLE Listings
	DROP COLUMN host_neighbourhood;
ALTER TABLE Listings
	DROP COLUMN host_listings_count;
ALTER TABLE Listings
	DROP COLUMN host_total_listings_count;
ALTER TABLE Listings
	DROP COLUMN host_verifications;
ALTER TABLE Listings
	DROP COLUMN host_has_profile_pic;
ALTER TABLE Listings
	DROP COLUMN host_identity_verified;
ALTER TABLE Listings
	DROP COLUMN calculated_host_listings_count;

ALTER TABLE HOST 
ADD PRIMARY KEY (id);

ALTER TABLE Listings 
ADD FOREIGN KEY (host_id) REFERENCES Host(id);