drop database if exists team5_schema;
create database team5_schema;
use team5_schema;

DROP TABLE if exists address;
CREATE TABLE address(
  address_id int primary key auto_increment,
  street_num int not null,
  street varchar(64) not null,
  state varchar(32),
  city varchar(32) not null,
  country varchar(32) not null,
  zip varchar(16) not null
);

DROP TABLE if exists credit_card;
CREATE TABLE if not exists credit_card (
  name varchar(16) not null,
  ccnumber varchar(16) primary key,
  card_expdate varchar(5) NOT NULL,
  cvv INT NOT NULL, 
  address_id int NOT NULL,
  foreign key(address_id) references address(address_id)
);

drop table if exists user;
CREATE TABLE if not exists user (
  name varchar(32) not null,
  user_email varchar(64) primary key,
  suspended varchar(16),
  isadmin varchar(16),
  address_id int,
  foreign key(address_id) references address(address_id)
	ON UPDATE CASCADE
	ON DELETE SET NULL
);

drop table if exists trip;
create table if not exists trip (
  trip_id int primary key not null auto_increment,
  city varchar(16) not null,
  startdate date not null,
  booked varchar(4) not null,
  user_email varchar(64),
  activity_id int not null,
  foreign key (user_email) references user(user_email)
	ON UPDATE CASCADE
	ON DELETE SET NULL
);

drop table if exists attraction;
create table if not exists attraction (
  attraction_id int (16) primary key not null auto_increment,
  name varchar(32) not null,
  description varchar(128),
  address_id int,
  price float,
  start datetime,	
  quantity int,
  timeslotstarttime datetime,
  timeslotendtime datetime,
  reservationnumber int unique,
  foreign key(address_id) references address(address_id)
	ON UPDATE CASCADE
	ON DELETE SET NULL
);

drop table if exists review;
create table review (	
  review_id int primary key not null auto_increment,		
  body varchar(128),
  title varchar(16) not null,
  date date not null,
  author_email varchar(64) not null,
  attraction_id int not null,
  foreign key (author_email) references user(user_email),
  foreign key (attraction_id) references attraction(attraction_id)
);

drop table if exists activity;
create table activity (
  activity_id int primary key not null auto_increment,
  attraction_id int,
  reservationnumber int,
  name varchar(16),
  startdatetime datetime not null,
  enddatetime datetime not null,
  trip_id int not null,
  foreign key (reservationnumber) references attraction (reservationnumber),
  foreign key (attraction_id) references attraction (attraction_id),
  foreign key (trip_id) references trip (trip_id)
);

DROP TABLE if exists public_transportation;
CREATE TABLE if not exists public_transportation (
  name varchar(16) primary key unique not null,
  attraction_id int not null, 
  user_email varchar(64) unique not null,
  address_id int NOT NULL,
  foreign key (address_id) references address(address_id),
  foreign key (user_email) references user(user_email),
  foreign key (attraction_id) references attraction(attraction_id)
);

drop table if exists attraction_hours;
create table if not exists attraction_hours (
  attraction_id int not null,
  opening_time time,
  closing_time time,
  day_of_the_week varchar(16) primary key not null,
  foreign key (attraction_id) references attraction (attraction_id)
);