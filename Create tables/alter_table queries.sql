ALTER TABLE CALENDAR
ADD FOREIGN KEY (listing_id) REFERENCES Listings (id);

ALTER TABLE LISTINGS_SUMMARY
ADD FOREIGN KEY (id) REFERENCES Listings (id);

ALTER TABLE REVIEWS
ADD FOREIGN KEY (listing_id) REFERENCES Listings (id);

ALTER TABLE REVIEWS_SUMMARY
ADD FOREIGN KEY (listing_id) REFERENCES Listings (id);

ALTER TABLE Geolocation
ADD FOREIGN KEY(properties_neighbourhood) REFERENCES Neighbourhoods(neighbourhood);

ALTER TABLE Listings
ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES Neighbourhoods(neighbourhood);