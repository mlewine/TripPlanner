drop database if exists team5_schema;
create database team5_schema;
use team5_schema;

DROP TABLE if exists address;
CREATE TABLE address(
  address_id int primary key auto_increment,
  street_num int not null,
  street varchar(64) not null,
  state varchar(64),
  city varchar(64) not null,
  country varchar(64) not null,
  zip varchar(64) not null
);

DROP TABLE if exists credit_card;
CREATE TABLE if not exists credit_card (
  name varchar(64) not null,
  ccnumber varchar(64) primary key,
  card_expdate date NOT NULL,
  cvv varchar(3) NOT NULL, 
  address_id int,
  foreign key(address_id) references address(address_id)
  ON DELETE SET NULL
);

drop table if exists user;
CREATE TABLE if not exists user (
  name varchar(64) not null,
  user_email varchar(64) primary key,
  suspended varchar(64),
  isadmin varchar(64),
  address_id int,
  foreign key(address_id) references address(address_id)
	ON DELETE SET NULL
);

drop table if exists trip;
create table if not exists trip (
  trip_id int primary key not null auto_increment,
  city varchar(64) not null,
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
  name varchar(64) not null,
  description varchar(128),
  address_id int,
  price float,
  start datetime,	
  quantity int,
  timeslotstarttime datetime,
  timeslotendtime datetime,
  reservationnumber int unique,
  foreign key(address_id) references address(address_id)
	ON DELETE SET NULL
);

drop table if exists review;
create table review (	
  review_id int primary key not null auto_increment,		
  body varchar(128),
  title varchar(64) not null,
  date date not null,
  author_email varchar(64),
  attraction_id int ,
  foreign key (author_email) references user(user_email),
  foreign key (attraction_id) references attraction(attraction_id)
  ON UPDATE CASCADE
  ON DELETE SET NULL
);

drop table if exists activity;
create table activity (
  activity_id int primary key not null auto_increment,
  attraction_id int,
  reservationnumber int,
  name varchar(64),
  startdatetime datetime not null,
  enddatetime datetime not null,
  trip_id int,
  foreign key (reservationnumber) references attraction (reservationnumber),
  foreign key (attraction_id) references attraction (attraction_id),
  foreign key (trip_id) references trip (trip_id)
  ON UPDATE CASCADE
  ON DELETE SET NULL
);

DROP TABLE if exists public_transportation;
CREATE TABLE if not exists public_transportation (
  name varchar(64) primary key unique,
  attraction_id int, 
  user_email varchar(64) unique,
  address_id int,
  foreign key (address_id) references address(address_id),
  foreign key (user_email) references user(user_email),
  foreign key (attraction_id) references attraction(attraction_id)
  ON UPDATE CASCADE
  ON DELETE SET NULL
);

drop table if exists attraction_hours;
create table if not exists attraction_hours (
  attraction_id int,
  opening_time time,
  closing_time time,
  day_of_the_week varchar(64) primary key not null,
  foreign key (attraction_id) references attraction (attraction_id)
  ON DELETE SET NULL
);