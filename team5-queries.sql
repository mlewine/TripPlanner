-- Given a username or email address, is that user in the database?

SELECT * FROM user WHERE user_email = 'x@y.com';

-- Given a username or email address, is that user an admin user?

SELECT * FROM user WHERE user_email = 'x@y.com' AND isadmin = 1; 

-- Which attractions are open right now in Paris?

SELECT name FROM attraction JOIN attraction_hours USING (attraction_id) JOIN address USING (address_id) WHERE DATE_FORMAT(NOW(),'%H:%i') BETWEEN opening_time AND closing_time AND day_of_the_week = DATE_FORMAT(NOW(), '%W')  AND address.city = "PARIS" GROUP BY attraction.name;

-- Which attractions in Paris don't require reservations?

SELECT * FROM attraction JOIN address USING (address_id) WHERE attraction.requires_reservation = 0 AND address.city = 'Paris';

-- Which attraciotns in Metz are free?

SELECT attraction.name, address.city fROM attraction JOIN address USING (address_id) WHERE Price IS NULL AND address.city = 'Metz';

-- Show the details for one attraction?

SELECT description FROM attraction WHERE attraction.name = 'x';

-- List all the reviews for an attraction.

SELECT attraction.name, review.body FROM review join attraction using (attraction_id) WHERE attraction.name = 'x';

-- List all the reviews written by a particular user.

SELECT * FROM review WHERE author_email = "x@y.com";

-- Show the details of one review.

SELECT * FROM review WHERE review_id = x;

-- List the trips in the database for a particular user.

SELECT * FROM trip WHERE user_email = "x@y.com";

-- For an attraction that requires reservations and already has some reservations for a time slot, how many spots remain for that time slot?

SELECT attraction.name, reservations.slot_id, (reservations.spots_remaining-attraction.quantity) AS spots_left FROM reservations JOIN attraction USING (attraction_id) WHERE attraction_id = 8 and reservations.slot_id = 4;

-- For one of the trips in the database that has two more more paid activities, what is the total cost of the trip?

SELECT SUM(attraction.price) AS total_price, COUNT(attraction.price) AS paid_activities FROM trip JOIN activity USING (trip_id) JOIN attraction USING (attraction_id) WHERE trip_id = x GROUP BY (trip_id) HAVING COUNT(attraction.price) >= 2;

-- For one of the public transportation locations in your database, which attractions are nearest to that location (list it as the nearest public transportation)?

SELECT * FROM attraction JOIN public_transportation USING (attraction_id) WHERE transportation_name = "x";
