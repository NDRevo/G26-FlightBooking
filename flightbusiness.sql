-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: travelbusiness
-- ------------------------------------------------------
-- Server version	8.0.27


DROP TABLE IF EXISTS users;

CREATE TABLE users (
  username varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  firstname varchar(25) DEFAULT NULL,
  lastname varchar(25) DEFAULT NULL,
  `role` varchar(14) NOT NULL DEFAULT 'customer',
  PRIMARY KEY (username)
);

DROP TABLE IF EXISTS aircrafts;
CREATE TABLE aircrafts (
  aircraftid varchar(50) NOT NULL DEFAULT '',
  numberseats int DEFAULT NULL,
  PRIMARY KEY (aircraftid)
);

INSERT INTO aircrafts VALUES ('Airbus 101',1);
INSERT INTO aircrafts VALUES ('Airbus 104',4);
INSERT INTO aircrafts VALUES ('Airbus 105',5);
INSERT INTO aircrafts VALUES ('Airbus 110',10);
INSERT INTO aircrafts VALUES ('Boeing 105',5);
INSERT INTO aircrafts VALUES ('Boeing 106',6);
INSERT INTO aircrafts VALUES ('Boeing 112',12);

DROP TABLE IF EXISTS airlinecompany;
CREATE TABLE airlinecompany (
  companyid varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (companyid)
);


INSERT INTO airlinecompany VALUES ('AA');
INSERT INTO airlinecompany VALUES ('DL');
INSERT INTO airlinecompany VALUES ('JB');
INSERT INTO airlinecompany VALUES ('SP');
INSERT INTO airlinecompany VALUES ('SW');
INSERT INTO airlinecompany VALUES ('UA');


DROP TABLE IF EXISTS airport;

CREATE TABLE airport (
  airportid varchar(3) NOT NULL DEFAULT 'XXX',
  PRIMARY KEY (airportid)
);


INSERT INTO airport VALUES ('EWR');
INSERT INTO airport VALUES ('HND');
INSERT INTO airport VALUES ('JFK');
INSERT INTO airport VALUES ('LAX');
INSERT INTO airport VALUES ('LGA');
INSERT INTO airport VALUES ('LHR');
INSERT INTO airport VALUES ('MCO');
INSERT INTO airport VALUES ('NRT');
INSERT INTO airport VALUES ('ORD');
INSERT INTO airport VALUES ('TXA');


DROP TABLE IF EXISTS associates;
CREATE TABLE associates (
  companyid varchar(2) NOT NULL DEFAULT '',
  airportid varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (companyid,airportid),
  KEY associates_ibfk_2 (airportid),
  CONSTRAINT associates_ibfk_1 FOREIGN KEY (companyid) REFERENCES airlinecompany (companyid),
  CONSTRAINT associates_ibfk_2 FOREIGN KEY (airportid) REFERENCES airport (airportid) ON DELETE CASCADE
);

INSERT INTO associates VALUES ('AA','EWR');
INSERT INTO associates VALUES ('JB','EWR');
INSERT INTO associates VALUES ('SP','EWR');
INSERT INTO associates VALUES ('AA','HND');
INSERT INTO associates VALUES ('DL','JFK');
INSERT INTO associates VALUES ('UA','JFK');
INSERT INTO associates VALUES ('AA','LAX');
INSERT INTO associates VALUES ('DL','LAX');
INSERT INTO associates VALUES ('SW','LAX');
INSERT INTO associates VALUES ('JB','LGA');
INSERT INTO associates VALUES ('SP','LGA');
INSERT INTO associates VALUES ('SW','LGA');
INSERT INTO associates VALUES ('DL','LHR');
INSERT INTO associates VALUES ('UA','LHR');
INSERT INTO associates VALUES ('JB','MCO');
INSERT INTO associates VALUES ('UA','NRT');
INSERT INTO associates VALUES ('JB','ORD');
INSERT INTO associates VALUES ('SP','ORD');
INSERT INTO associates VALUES ('SW','ORD');


DROP TABLE IF EXISTS daysofoperation;
CREATE TABLE daysofoperation (
  dooid int NOT NULL,
  monday int DEFAULT NULL,
  tuesday int DEFAULT NULL,
  wednesday int DEFAULT NULL,
  thursday int DEFAULT NULL,
  friday int DEFAULT NULL,
  saturday int DEFAULT NULL,
  sunday int DEFAULT NULL,
  PRIMARY KEY (dooid)
);


INSERT INTO daysofoperation VALUES (11111,NULL,NULL,3,4,5,6,0);
INSERT INTO daysofoperation VALUES (1010101,1,NULL,3,NULL,5,NULL,0);
INSERT INTO daysofoperation VALUES (1100101,1,2,NULL,NULL,5,NULL,0);
INSERT INTO daysofoperation VALUES (1100110,1,2,NULL,NULL,5,6,NULL);
INSERT INTO daysofoperation VALUES (1110001,1,2,3,NULL,NULL,NULL,0);
INSERT INTO daysofoperation VALUES (1111000,1,2,3,4,NULL,NULL,NULL);

DROP TABLE IF EXISTS flight;

CREATE TABLE flight (
  flightid varchar(4) NOT NULL DEFAULT '',
  arrivaltime time DEFAULT NULL,
  departuretime time DEFAULT NULL,
  departureairport varchar(3) DEFAULT NULL,
  destinationairport varchar(3) DEFAULT NULL,
  companyid varchar(2) NOT NULL DEFAULT '',
  aircraftid varchar(10) DEFAULT NULL,
  dooid int DEFAULT NULL,
  econfare int DEFAULT '0',
  busfare int DEFAULT NULL,
  firstfare int DEFAULT NULL,
  traveltype varchar(15) DEFAULT NULL,
  seatsavailable int DEFAULT NULL,
  duration time DEFAULT NULL,
  PRIMARY KEY (flightid,companyid),
  KEY companyid (companyid),
  KEY dooid_idx (dooid),
  KEY numberseats_idx (seatsavailable),
  KEY aircraftid (aircraftid),
  KEY airportid_idx (departureairport,destinationairport),
  CONSTRAINT aircraftid FOREIGN KEY (aircraftid) REFERENCES aircrafts (aircraftid) ON DELETE CASCADE,
  CONSTRAINT companyid FOREIGN KEY (companyid) REFERENCES airlinecompany (companyid),
  CONSTRAINT dooid FOREIGN KEY (dooid) REFERENCES daysofoperation (dooid)
);

INSERT INTO flight VALUES ('AA01','13:50:00','07:30:00','EWR','LAX','AA','Airbus 105',11111,320,550,650,'domestic',4,'06:20:00');
INSERT INTO flight VALUES ('AA02','21:50:00','15:30:00','LAX','EWR','AA','Airbus 105',1111000,410,620,700,'domestic',5,'06:20:00');
INSERT INTO flight VALUES ('JB01','14:10:00','11:40:00','EWR','ORD','JB','Airbus 105',1010101,125,220,360,'domestic',1,'02:30:00');
INSERT INTO flight VALUES ('JB02','05:30:00','07:40:00','EWR','ORD','JB','Airbus 101',1010101,50,90,120,'domestic',0,'02:10:00');
INSERT INTO flight VALUES ('SP01','20:15:00','18:05:00','EWR','ORD','SP','Airbus 105',1100101,120,250,350,'domestic',3,'02:10:00');

DROP TABLE IF EXISTS ticketfor;

CREATE TABLE ticketfor (
  username varchar(20) NOT NULL,
  ticketid int NOT NULL,
  purchasedate datetime DEFAULT NULL,
  bookingfee int NOT NULL DEFAULT '0',
  totalfare int NOT NULL DEFAULT '0',
  PRIMARY KEY (ticketid,username),
  KEY username (username),
  CONSTRAINT username FOREIGN KEY (username) REFERENCES users (username) ON DELETE CASCADE
);

DROP TABLE IF EXISTS flightforticket;

CREATE TABLE flightforticket (
  flightid varchar(4) NOT NULL,
  ticketid int NOT NULL,
  seatnumber int DEFAULT NULL,
  class varchar(15) DEFAULT NULL,
  fare int DEFAULT NULL,
  departuredate datetime DEFAULT NULL,
  arrivaldate datetime DEFAULT NULL,
  PRIMARY KEY (flightid,ticketid),
  KEY ticketid (ticketid),
  CONSTRAINT flightid FOREIGN KEY (flightid) REFERENCES flight (flightid) ON DELETE CASCADE,
  CONSTRAINT ticketid FOREIGN KEY (ticketid) REFERENCES ticketfor (ticketid) ON DELETE CASCADE
);

DROP TABLE IF EXISTS responses;
CREATE TABLE responses (
  questionid int NOT NULL DEFAULT '0',
  username varchar(20) NOT NULL,
  `text` varchar(250) NOT NULL,
  isreply tinyint DEFAULT NULL,
  PRIMARY KEY (`text`,questionid)
);

DROP TABLE IF EXISTS waitlist;

CREATE TABLE waitlist (
  username varchar(20) NOT NULL,
  flightid varchar(4) NOT NULL,
  PRIMARY KEY (username,flightid),
  KEY flightid_idx (flightid)
) ;

INSERT INTO waitlist VALUES ('a','JB01');