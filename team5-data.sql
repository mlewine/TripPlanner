
-- teamN-data.sql, where N is your team number, should contain valid SQL code to insert data into your database tables for at least 3 attractions in each of 3 cities, including Metz, Paris, and one or more cities of your choosing. There should be data for each field for each row in each table, including the descriptions of the attractions (the descriptions should be correct, but don't have to be longer than two sentences). In addition, include insert statements to create a trip in Paris on Saturday, 30 July 2016 with at leat 3 activities, at least one of which requires a reservation and at least two of which requires payment (they can be the same activity).

Use team5_schema;

Insert into address values(1,NULL, "Place d'Armes", NULL, 'Metz', 'France', '57000');
Insert into address values(2,1, "Parvis des Droits de l'Homme", NULL, 'Metz', 'France', '57020');
Insert into address values(3,2, "Rue du Haut Poirier", NULL, 'Metz', 'France', '57000');
Insert into address values(4,NULL, 'Champ de Mars', NULL, 'Paris', 'France', '75007'); 
Insert into address values(5,NULL, 'Musée du Louvre', NULL, 'Paris', 'France', '75058'); 
Insert into address values(6,6, 'Parvis Notre-Dame -Pl. Jean-Paul II', NULL, 'Paris', 'France', '75004');
Insert into address values(7,NULL, 'Escale du Pont St Michel', NULL, 'Paris', 'France', '75001');
Insert into address values(8,NULL, 'Piazza del Colosseo', NULL, 'Rome', 'Italy', '00184');
Insert into address values(9,NULL, 'Piazza della Rotonda', NULL, 'Rome', 'Italy', '00186');
Insert into address values(10,NULL, 'Piazza di Trevi', NULL, 'Rome', 'Italy', '00187');
Insert into address values(11,123, 'ABC Way', 'GA', 'Atlanta', 'USA', '30322');
Insert into address values(12,42, 'Wallaby Way', NULL, 'Sydney', 'Australia', '2055');
Insert into address values(13,222, 'Even Numbers St.','Wisconsin', 'Milwaukee', 'USA', '53202');
Insert into address values(14,1600, 'Pennsylvania Avenue NW', NULL, 'Washington D.C.', 'USA', '20013');
Insert into address values(15,11, 'Boulevard Solidarite, Harmony Park', NULL, 'Metz', 'France', '57070');
Insert into address values(16,16, 'Rue de la Federation', NULL, 'Paris', 'France','75015');
Insert into address values(17,NULL, 'Musée du Louvre', NULL, 'Paris', 'France', '75058');
Insert into address values(18,NULL, 'Boulevard Saint-Michel', NULL, 'Paris', 'France', '75000');
Insert into address values(19,248, 'Rue de Rivoli', NULL, 'Paris', 'France', '75001');
Insert into address values(20, 62, 'Piazza dei Cinquecento', NULL, 'Rome', 'Italy', '00185');

Insert into credit_card values('Walter White', 6293144476892690, '2016-09-20', 632, 11);
Insert into credit_card values('Leslie Knope', 1616161616161616, '2017-01-19', 016, 12);
Insert into credit_card values('Harry Potter', 9787823478925813, '2018-08-18', 731, 14);

Insert into user values('Walter White', 'walt.white@notarealemail.com', NULL, NULL, 11, 'password');
Insert into user values('Leslie Knope', 'l.knope@notarealemail.com', NULL, True , 12, 'password');
Insert into user values('Homer Simpson', 'homer_simpson234@thisisfake.com', True , NULL, 13, 'password'); 
Insert into user values('Harry Potter', 'harrypotter731@hogwarts.edu', NULL, NULL, 14, 'password');

Insert into trip values(1,'Metz', '2016-07-07', 'Yes', 'walt.white@notarealemail.com');
Insert into trip values(2,'Paris', '2016-07-12', 'Yes', 'homer_simpson234@thisisfake.com');
Insert into trip values(3,'Rome', '2016-07-24', 'Yes', 'harrypotter731@hogwarts.edu');
Insert into trip values(4,'Paris', '2016-07-30', 'Yes', 'l.knope@notarealemail.com');


Insert into attraction values(1,'Metz Cathedral', 'The Metz Cathedral is a Roman Catholic Cathedral located in the heart of Metz, France. The stained glass windows include works by Gothic and Renaissance master glass makers, such as Hermann von Munster and Theobold of Lixheim', 1, 4.50, NULL,0,"https://upload.wikimedia.org/wikipedia/en/7/70/Northern_Facade_Metz_Cathedral.jpg");
Insert into attraction values(2,'Centre Pompidou-Metz', 'The Centre Pompidou-Metz is a museum of modern and contemporary arts located in Metz, capital of Lorraine,France. It is a branch of Pompidou arts centre of Paris, and features exhibitions from the French National Museum of Modern Art.', 2, 10.00,NULL,0,"http://images.adsttc.com/media/images/5332/4deb/c07a/806c/3600/0080/large_jpg/POMPIDOU_METZ_326.jpg?1395805665");
Insert into attraction values(3,'Museums of Metz', 'It is a labyrinthal organization of rooms, incorporating the ancient Petites Carmes Abbey, the Chèvremont granary, and the Trinitaires church.', 3, 5.00,NULL,0,"https://upload.wikimedia.org/wikipedia/commons/7/7d/Mus%C3%A9es_de_Metz.jpg");
Insert into attraction values(4,'Eiffel Tower', 'The Eiffel Tower is a wrought iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.', 4, 17.00,NULL,0,"http://cdn.history.com/sites/2/2015/04/hith-eiffel-tower-iStock_000016468972Large.jpg");
Insert into attraction values(5,'Louvre', "The Louvre or the Louvre Museum is the world's largest museum and a historic monument in Paris, France. A central landmark of the city, it is located on the Right Bank of the Seine in the 1st arrondissement.", 5, 15.00,NULL,0,"http://www.gf-luxury.com/wp-content/uploads/2016/04/Louvre-Museum-Paris.jpg");
Insert into attraction values(6,'Notre Dame', 'Notre Dame is a medeival catholic, and is considered to be one of the best examples of Gothic architecture in the world. Making the climb to the top of the 300 foot towers gives one of the best views in the city.', 6, 8.50,NULL,0,"http://www.gf-luxury.com/wp-content/uploads/2016/04/Louvre-Museum-Paris.jpg");
Insert into attraction values(7,'58 Tour Eiffel', 'Dine in the heart of Parisian nightlife...When the sun goes down, 58 Tour Eiffel takes on a new dimension. You will be greeted by a hostess who will lead you to your table where the atmosphere of luxury will surround you', 4, 85.00,60,1,"https://s1.kkday.com/images/product/5988/20160129052101_A6vLh.jpg");
Insert into attraction values(8,'Brunch boat cruise', 'Step on board Paris en Scène and experience our meal prepared on board according to the best bistro traditions by our chef. The only requirement is that you get comfortable in our large leather armchairs, while admiring the view of the Seine', 7, 39.00,50,1,"http://citydiscovery4.imgix.net/13749__1433223548.jpg?w=960&h=723&auto=format&crop=faces,entropy&fit=crop&q=60");
Insert into attraction values(9,'Colosseum', 'The Colosseum is located just east of the Roman Forum and was built to a practical design, with its 80 arched entrances allowing easy access to 55,000 spectators', 8, 15.50,NULL,0, "http://images.mapsofworld.com/travel-blog/Facts-about-the-Colosseum-in-Rome.jpg");
Insert into attraction values(10,'Pantheon', 'It is one of the best-preserved of all Ancient Roman buildings, in large part because it has been in continuous use throughout its history, and since the 7th century, the Pantheon has been used as a church dedicated to "St. Mary and the Martyrs"', 9, NULL,NULL,0,"https://upload.wikimedia.org/wikipedia/commons/0/06/Rome_Pantheon_front.jpg");
Insert into attraction values(11,'Trevi Fountain', 'The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Pietro Bracci', 10, NULL,NULL,0,"http://images.fineartamerica.com/images-medium-large-5/toss-your-coins-in-the-trevi-fountain-rome-mark-e-tisdale.jpg");

Insert into review values(1,'Beautiful church!', 'Great place', '2016-07-07', 'walt.white@notarealemail.com',1);
Insert into review values(2,'Incredible art! Wish I could have spent more time there, but I had to catch a train', 'Beautiful art', '2016-07-07', 'walt.white@notarealemail.com',2);
Insert into review values(3,"So much to see here! Definitely could've spent the whole day here", 'Worth going to', '2016-07-07', 'walt.white@notarealemail.com',3);
Insert into review values(4,"Terrible views from the top. I couldn't even see the Eiffel Tower. Not worth the climb", 'Not worth the money', '2016-07-12', 'homer_simpson234@thisisfake.com',4);
Insert into review values(5,'"Would much rather see the pyramid in Egypt. 10/10 disappointed" / "It was just a glass pyramid. Not sure how some people spend a whole day there"', 'Terrible time', '2016-07-12', 'homer_simpson234@thisisfake.com',5);
Insert into review values(6,'When I heard flying buttresses I got all excited. This left me very dissappointed when I found myself in a dilapidated cult building', 'Very disappointed', '2016-07-12', 'homer_simpson234@thisisfake.com',6);
Insert into review values(7,'"Tiniest portions of all time." / "My dinner was some leaves and sauce on a plate. Paid 65 euros."', 'Do not eat here', '2016-07-12', 'homer_simpson234@thisisfake.com',7);
Insert into review values(8,'SO GOOD! I highly recommend trying their breakfast crepes', 'Cruise is a ton of fun', '2016-07-12', 'homer_simpson234@thisisfake.com',8);
Insert into review values(9,'This was highly disappointing. I just saw old rubble.', 'Not much to see', '2016-07-24', 'harrypotter731@hogwarts.edu',9);
Insert into review values(10,'Surprisingly NOT the parthenon.', 'Wrong place', '2016-07-24', 'harrypotter731@hogwarts.edu',10);
Insert into review values(11,'Finally lived my lifelong Lizzie McGuire dreams! It was incredible!', 'Great time', '2016-07-24', 'harrypotter731@hogwarts.edu',11);

Insert into activity values(1,1,NULL,'Visit Church', '2016-07-07 14:45', '2016-07-07 15:15', 1);
Insert into activity values(2,2,NULL,'Visit Art Exhibitions', '2016-07-07 12:45', '2016-07-07 14:15', 1);
Insert into activity values(3,3,NULL,'Visit Art Exhibitions', '2016-07-07 9:30', '2016-07-07 12:00', 1);
Insert into activity values(4,4,NULL,'Have a picnic', '2016-07-12 17:30', '2016-07-12 19:00', 2);
Insert into activity values(5,5,NULL,'Visit Art Exhibitions', '2016-07-12 10:30', '2016-07-12 13:00', 2);
Insert into activity values(6,6,NULL,'Climb the Notre Dame tower', '2016-07-12 14:30', '2016-07-12 15:30', 2);
Insert into activity values(7,7,1,'Eat Dinner', '2016-07-12 18:30', '2016-07-12 19:30', 2);
Insert into activity values(8,8,3,'Eat Brunch on the Seine River', '2016-07-12 10:30', '2016-07-12 11:30', 2);
Insert into activity values(9,9,NULL,'Visit Colosseum', '2016-07-24 15:30', '2016-07-24 17:00', 3);
Insert into activity values(10,10,NULL,'Visit Pantheon', '2016-07-24 12:30', '2016-07-24 13:00', 3);
Insert into activity values(11,11,NULL,'Visit Trevi Fountain', '2016-07-24 17:45', '2016-07-24 19:00', 3);
Insert into activity values(12,4,NULL,'Climb Eiffel Tower', '2016-07-30 17:30','2016-07-30 19:00',4);
Insert into activity values(13,7,2,'Eat Dinner', '2016-07-30 19:30','2016-07-30 20:30',4);
Insert into activity values(14,6,NULL,'Climb the Notre Dame tower', '2016-07-30 13:15','2016-07-30 14:45',4);

Insert into reservations values(1, '2016-07-30 18:30','2016-07-30 19:30',7,60);
Insert into reservations values(2, '2016-07-30 19:30','2016-07-30 20:30',7,60);
Insert into reservations values(3, '2016-07-30 10:30','2016-07-30 11:30',8,60);

Insert into public_transportation values (1,'Mettis A/B', 1, 15);
Insert into public_transportation values (2,'Mettis B', 2, 15);
Insert into public_transportation values (3,'Mettis A', 3, 15);
Insert into public_transportation values (4,'BIR-HAKEIM on the #6 Metro ligne', 4, 16);
Insert into public_transportation values (5,'Metro: Palais-Royal–Musée du Louvre station (line 1)', 5, 17);
Insert into public_transportation values (6,'Metro: Lines B, C, 4 St.-Michel Notre Dame Stop', 6, 18);
Insert into public_transportation values (7,'Metro: Line 6 (stations: Dupleix, Bir-Hakeim or Trocadéro),Line 9 (station: Trocadéro), Line 8 (station: École Militaire)', 7, 19);
Insert into public_transportation values (8,'Railway: RER B or C station  Gare Saint-Michel – Nôtre Dame / Metro: line 4 station Saint-Michel', 8, 18);
Insert into public_transportation values (9,'Roman Metro A,B', 9, 20);
Insert into public_transportation values (10,'Roman Metro B,C', 10, 20);
Insert into public_transportation values (11,'Roman Metro A,C', 11, 20);

Insert into attraction_hours values (1,1,'09:30', '17:30','Monday');
Insert into attraction_hours values (2,1, '09:30', '17:30', 'Tuesday');
Insert into attraction_hours values (3,1, '09:30', '17:30', 'Wednesday');
Insert into attraction_hours values (4,1, '09:30', '17:30', 'Thursday');
Insert into attraction_hours values (5,1, '09:30', '17:30', 'Friday');
Insert into attraction_hours values (6,1, '14:00', '18:00', 'Sunday');
Insert into attraction_hours values (7,2, '10:00', '18:00', 'Monday');
Insert into attraction_hours values (8,2, '10:00', '18:00', 'Wednesday');
Insert into attraction_hours values (9,2, '10:00', '18:00', 'Thursday');
Insert into attraction_hours values (10,2, '10:00', '19:00', 'Friday');
Insert into attraction_hours values (11,2, '10:00', '19:00', 'Saturday');
Insert into attraction_hours values (12,2, '10:00', '19:00', 'Sunday');
Insert into attraction_hours values (13,3, '09:00', '17:00', 'Monday');
Insert into attraction_hours values (14,3, '09:00', '17:00', 'Wednesday');
Insert into attraction_hours values (15,3, '09:00', '17:00', 'Thursday');
Insert into attraction_hours values (16,3, '09:00', '17:00', 'Friday');
Insert into attraction_hours values (17,3, '09:00', '17:00', 'Saturday');
Insert into attraction_hours values (18,3, '09:00', '17:00', 'Sunday');
Insert into attraction_hours values (19,4, '09:00', '24:00', 'Monday');
Insert into attraction_hours values (20,4, '09:00', '24:00', 'Tuesday');
Insert into attraction_hours values (21,4, '09:00', '24:00', 'Wednesday');
Insert into attraction_hours values (22,4, '09:00', '24:00', 'Thursday');
Insert into attraction_hours values (23,4, '09:00', '24:00', 'Friday');
Insert into attraction_hours values (24,4, '09:00', '24:00', 'Saturday');
Insert into attraction_hours values (25,4, '09:00', '24:00', 'Sunday');
Insert into attraction_hours values (26,5, '09:00', '18:00', 'Monday');
Insert into attraction_hours values (27,5, '09:00', '18:00', 'Wednesday');
Insert into attraction_hours values (28,5, '09:00', '18:00', 'Thursday');
Insert into attraction_hours values (29,5, '09:00', '18:00', 'Friday');
Insert into attraction_hours values (30,5, '09:00', '18:00', 'Saturday');
Insert into attraction_hours values (31,5, '09:00', '18:00', 'Sunday');
Insert into attraction_hours values (32,6, '08:00', '18:45', 'Monday');
Insert into attraction_hours values (33,6, '08:00', '18:45', 'Tuesday');
Insert into attraction_hours values (34,6, '08:00', '18:45', 'Wednesday');
Insert into attraction_hours values (35,6, '08:00', '18:45', 'Thursday');
Insert into attraction_hours values (36,6, '08:00', '18:45', 'Friday');
Insert into attraction_hours values (37,6, '08:00', '18:45', 'Saturday');
Insert into attraction_hours values (38,6, '08:00', '18:45', 'Sunday');
Insert into attraction_hours values (39,7, '18:30', '21:00', 'Monday');
Insert into attraction_hours values (40,7, '18:30', '21:00', 'Tuesday');
Insert into attraction_hours values (41,7, '18:30', '21:00', 'Wednesday');
Insert into attraction_hours values (42,7, '18:30', '21:00', 'Thursday');
Insert into attraction_hours values (43,7, '18:30', '21:00', 'Friday');
Insert into attraction_hours values (44,7, '18:30', '21:00', 'Saturday');
Insert into attraction_hours values (45,7, '18:30', '21:00', 'Sunday');
Insert into attraction_hours values (46,8, '10:30', '11:30', 'Monday');
Insert into attraction_hours values (47,8, '10:30', '11:30', 'Tuesday');
Insert into attraction_hours values (48,8, '10:30', '11:30', 'Wednesday');
Insert into attraction_hours values (49,8, '10:30', '11:30', 'Thursday');
Insert into attraction_hours values (50,8, '10:30', '11:30', 'Friday');
Insert into attraction_hours values (51,8, '10:30', '11:30', 'Saturday');
Insert into attraction_hours values (52,8, '10:30', '11:30', 'Sunday');
Insert into attraction_hours values (53,9, '08:30', '15:30', 'Monday');
Insert into attraction_hours values (54,9, '08:30', '15:30', 'Tuesday');
Insert into attraction_hours values (55,9, '08:30', '15:30', 'Wednesday');
Insert into attraction_hours values (56,9, '08:30', '15:30', 'Thursday');
Insert into attraction_hours values (57,9, '08:30', '15:30', 'Friday');
Insert into attraction_hours values (58,9, '08:30', '15:30', 'Saturday');
Insert into attraction_hours values (59,9, '08:30', '15:30', 'Sunday');
Insert into attraction_hours values (60,10, '09:30', '19:30', 'Monday');
Insert into attraction_hours values (61,10, '09:30', '19:30', 'Tuesday');
Insert into attraction_hours values (62,10, '09:30', '19:30', 'Wednesday');
Insert into attraction_hours values (63,10, '09:30', '19:30', 'Thursday');
Insert into attraction_hours values (64,10, '09:30', '19:30', 'Friday');
Insert into attraction_hours values (65,10, '09:30', '18:00', 'Saturday');
Insert into attraction_hours values (66,10, '09:30', '18:00', 'Sunday');
Insert into attraction_hours values (67,11, '00:00', '24:00', 'Monday');
Insert into attraction_hours values (68,11, '00:00', '24:00', 'Tuesday');
Insert into attraction_hours values (69,11, '00:00', '24:00', 'Wednesday');
Insert into attraction_hours values (70,11, '00:00', '24:00', 'Thursday');
Insert into attraction_hours values (71,11, '00:00', '24:00', 'Friday');
Insert into attraction_hours values (72,11, '00:00', '24:00', 'Saturday');
Insert into attraction_hours values (73,11, '00:00', '24:00', 'Sunday');






