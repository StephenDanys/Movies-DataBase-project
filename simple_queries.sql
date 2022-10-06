/*1*/
SELECT DISTINCT Listings.id
FROM Listings
INNER JOIN Calendar
ON Calendar.date = '2020-03-27' AND  Calendar.available = 'true' AND Calendar.listing_id = Listings.id;
/*Shows the listings that are available at 03/27/2020. OUTPUT:7386*/

/*2*/
SELECT * 
FROM Geolocation
INNER JOIN Neighbourhoods
ON Geolocation.Properties_neighbourhood= Neighbourhoods.neighbourhood
WHERE neighbourhood LIKE '%ΑΓΙΟΣ%';
/*Coordinates of neighbourhoods containing "ΑΓΙΟΣ" in their name. OUTPUT:3*/

/*3*/
SELECT DISTINCT name,listing_id
FROM Listings
INNER JOIN Calendar
ON id=listing_id
WHERE Calendar.maximum_nights BETWEEN 7 AND 10 AND Calendar.minimum_nights BETWEEN 2 AND 4;
/*Shows the name and the id of each listing with 2 until 4 minimum nights and 7 until 10 maximum nights. OUTPUT:139*/

/*4*/
SELECT reviewer_name,listing_id,comments
FROM Reviews
RIGHT JOIN Listings
ON Reviews.listing_id=Listings.id
WHERE reviewer_name LIKE'B%'
GROUP BY reviewer_id,reviewer_name,listing_id,comments;
/*Shows the name, the id of the listing and the comments of all reviewers, whom names start with B , grouped by their id's. OUTPUT:11612*/

/*5*/
SELECT DISTINCT Listings.name, Calendar.price, Calendar.date
FROM Listings
INNER JOIN Calendar
ON Listings.id=Calendar.listing_id
WHERE Calendar.date BETWEEN '2020-08-01' AND '2020-08-31' AND Calendar.available='true'
ORDER BY Calendar.date,Calendar.price,Listings.name
LIMIT 10000;
/*Shows the available listings for each day of August, ordered by their price in a ascending order. LIMITED OUTPUT:10000*/

/*6*/
SELECT Listings.name, Listings.id , COUNT (Reviews_summary.date)
FROM Reviews_summary
RIGHT JOIN Listings 
ON Reviews_summary.listing_id=Listings.id
GROUP BY Listings.id
ORDER BY count (Reviews_summary.date) DESC;
/*Shows in a descedent order the listings with the most reviews.OUTPUT:11541*/

/*7*/
SELECT Listings.name
FROM Listings
WHERE Listings.maximum_nights IN (
	SELECT MAX(maximum_nights)
	FROM Calendar);
/*Shows the listings with the most maximum nights. OUTPUT:1*/

/*8*/
SELECT AVG(Listings_Summary.price)
FROM Listings_summary
INNER JOIN Listings
ON Listings.id = Listings_Summary.id 
INNER JOIN Calendar
ON Calendar.listing_id = Listings_Summary.id
WHERE Calendar.date = '2020-06-25' AND Calendar.available = 'true' AND Listings.city = 'Nea Smirni';
/*Shows the average price of the available listings, located in Nea Smirni at the 25th of June. OUTPUT:1 RESULT:40*/

/*9*/
Select MIN(Listings_Summary.price)
FROM Listings_summary
INNER JOIN Listings
ON Listings.id = Listings_Summary.id 
WHERE Listings_Summary.room_type LIKE '%Private%';
/*Shows the minimum price of listings characterized for privacy.OUTPUT:1 RESULT:8*/

/*10*/
Select * from Reviews 
join Listings_summary on Reviews.listing_id=Listings_summary.id 
order by Listings_summary.number_of_reviews desc, date DESC
limit 1000;
/*Shows all the information about the reviews for the first 1000 listings, ordered by their number of reviews they have. LIMITED OUTPUT:1000*/

/*11*/
SELECT Listings.id, Listings.name, Listings_Summary.number_of_reviews 
FROM Listings
INNER JOIN Listings_Summary
ON Listings.id = Listings_Summary.id AND Listings_Summary.number_of_reviews > '500'
GROUP BY Listings.id, Listings.name, Listings_Summary.number_of_reviews ;
/*Shows the listings with more than 500 reviews, grouped by their id's. OUTPUT:10*/

/*12*/
SELECT Calendar.date, Calendar.listing_id, Calendar.price, Listings_summary.number_of_reviews  
FROM Calendar  
JOIN Listings ON Calendar.listing_id=Listings.id 
JOIN Listings_summary ON Listings_summary.id=Calendar.listing_id 
WHERE available='true' AND Calendar.date> '2020-08-31'
ORDER BY Calendar.date ASC;
/*Shows the available listing id's, their price and their number of their reviews, available >= 31/08. OUTPUT:1330889 */