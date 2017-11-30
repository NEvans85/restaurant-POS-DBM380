-- Assignment: Week 4 - Individual: Database Creation
-- Author: Nicholas Evans
-- Course: DBM 380 
-- Instructor: Wade Fergus
-- Due Date: November 23, 2015

-- This first group of tables are populated before operation. The data contained in these tables is required for operation.

create table MODLIBRARY (
  MOD_CODE integer unique not null,
  MOD_NAME varchar(8) not null,
  MOD_GROUP varchar(8) not null,
  MOD_PRICE number(6,2) default '0.00',
  PRIMARY KEY (MOD_CODE)
);
  
create table EMPLOYEE (
  EMP_ID smallint unique not null,
  EMP_FNAME varchar(15) not null,
  EMP_LNAME varchar(15) not null,
  PRIMARY KEY (EMP_ID)
);

create table PRINTER (
  PRINTER_ID smallint unique not null,
  PRINTER_NAME varchar(8),
  PRINTER_LOC char(15),
  PRIMARY KEY (PRINTER_ID) 
);

create table JOB (
  JOB_ID smallint unique not null,
  JOB_NAME varchar(12),
  PRIMARY KEY (JOB_ID)
);

create table PRODUCT (
  PROD_ID integer unique not null,
  PROD_NAME varchar(10) not null,
  PROD_PRICE number(8,2) not null,
  PROD_INSTOCK smallint,
  PRINTER_ID smallint,
  PRIMARY KEY (PROD_ID),
  FOREIGN KEY (PRINTER_ID) REFERENCES PRINTER
);

-- This second group of tables are populated during operation
  
create table SHIFT (
  SHFT_ID integer unique not null,
  EMP_ID smallint not null,
  JOB_ID smallint not null,
  SHFT_TIMEIN time default sysdate,
  SHFT_TIMEOUT time default NULL,
  PRIMARY KEY (SHFT_ID),
  FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE,
  FOREIGN KEY (JOB_ID) REFERENCES JOB
);

create table TICKET (
  TICKET_ID integer unique not null,
  EMP_ID smallint not null,
  TICKET_TIME time default sysdate,
  PRIMARY KEY (TICKET_ID),
  FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE
  );
  
create table INVOICE (
  INVC_ID integer unique not null,
  EMP_ID smallint,
  INVC_OPENTIME time default sysdate,
  INVC_CLOSETIME time,
  INVC_TOTAL number(9,2),
  INVC_TIP number(9,2),
  PRIMARY KEY (INVC_ID),
  FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE
  );
  
create table LINE (
  LINE_ID integer unique not null,
  INVC_ID integer not null,
  TICKET_ID integer not null,
  PROD_ID integer not null,
  PRIMARY KEY (LINE_ID),
  FOREIGN KEY (INVC_ID) REFERENCES INVOICE,
  FOREIGN KEY (TICKET_ID) REFERENCES TICKET,
  FOREIGN KEY (PROD_ID) REFERENCES PRODUCT
  );
  
create table LINEMOD (
  LINEMOD_ID integer unique not null,
  LINE_ID integer not null,
  MOD_CODE, integer not null,
  PRIMARY KEY (LINEMOD_ID),
  FOREIGN KEY (LINE_ID) REFERENCES LINE
  );

-- The following code will populate the tables with test data.

insert into MODLIBRARY (MOD_CODE, MOD_NAME, MOD_GROUP) values (1, ADD, general)
insert into MODLIBRARY (MOD_CODE, MOD_NAME, MOD_GROUP) values (6, NO, general)
insert into MODLIBRARY values (53, cheese, addons, 1.50)
insert into MODLIBRARY values (60, jumbo shrimp, addons, 4.00)
insert into MODLIBRARY (MOD_CODE, MOD_NAME, MOD_GROUP) values (142, avocado, a)
insert into MODLIBRARY (MOD_CODE, MOD_NAME, MOD_GROUP) values (201, bacon, b)
insert into MODLIBRARY (MOD_CODE, MOD_NAME, MOD_GROUP) values (1815, potato-shoestring, p)
insert into MODLIBRARY (MOD_CODE, MOD_NAME, MOD_GROUP) values (2130, SPLIT, s)
insert into MODLIBRARY (MOD_CODE, MOD_NAME, MOD_GROUP) values (114, ALLERGY!!!, a)
insert into MODLIBRARY (MOD_CODE, MOD_NAME, MOD_GROUP) values (2017, rice, r)

insert into EMPLOYEE values (1, Mirta, Kendall)
insert into EMPLOYEE values (2, Sharita, Sherry)
insert into EMPLOYEE values (3, Hannah, Golson)
insert into EMPLOYEE values (4, Leoma, Squillace)
insert into EMPLOYEE values (5, Maribeth, Ownby)
insert into EMPLOYEE values (6, Fletcher, Jerry)
insert into EMPLOYEE values (7, Ricarda, Henriquez)
insert into EMPLOYEE values (8, Pamelia, Gautreaux)
insert into EMPLOYEE values (9, Kerry, Rackham)
insert into EMPLOYEE values (10, Willow, Knaus)

insert into PRINTER values (1, Bar, 192.168.001.012)
insert into PRINTER values (2, Kit_Hot, 192.168.001.013)
insert into PRINTER values (3, Kit_Cold, 192.168.001.014)
insert into PRINTER values (4, Kit_Dessert, 192.168.001.015)
--This table has no need for additional values in a simple restaurant, larger restaurants with multiple kitchens will have more printers.

insert into JOB values (1, Server_AM)
insert into JOB values (2, Server_PM)
insert into JOB values (3, Busser)
insert into JOB values (4, Manager)
insert into JOB values (5, Host)
insert into JOB values (6, Cook_Prep)
insert into JOB values (7, Dishwasher)
insert into JOB values (8, Cook_Line)
insert into JOB values (9, Chef)
insert into JOB values (10 Sous Chef)

insert into PRODUCT values (2, Budweiser, 4.00, NULL, 1)  
insert into PRODUCT values (51, Arnld Palm, 2.75, NULL, 1)
insert into PRODUCT values (60, Diet, 2.75, NULL, 1)
insert into PRODUCT values (104, Caesar, 9.00, NULL, 3 )
insert into PRODUCT values (152, Artichoke, 11.00, NULL, 2)
insert into PRODUCT values (170, Sweet FF, 7.00, NULL, 2)
insert into PRODUCT values (201, Duck, 28.00, 10, 2)
insert into PRODUCT values (216, Scallops, 34.00, 6, 2)
insert into PRODUCT values (218, Tritip Sand, 18.00, NULL, 2)
insert into PRODUCT values (300, Sundae, 8.00, 10, 4)

insert into SHIFT values (1, 2, 1, 2014-03-14 08:59:03, 2014-03-15 16:30:54)
insert into SHIFT values (2, 3, 1, 2014-03-15 09:02:50, 2014-03-16 16:35:11)
insert into SHIFT values (3, 9, 4, 2014-03-15 08:55:41, 2014-03-17 17:00:06)
insert into SHIFT values (4, 6, 8, 2014-03-15 07:12:02, 2014-03-18 15:30:44)
insert into SHIFT values (5, 2, 1, 2014-03-18 11:03:22, 2014-04-06 20:02:16)
insert into SHIFT values (6, 3, 2, 2014-03-14 17:00:20, 2014-04-15 01:01:01)
insert into SHIFT values (7, 4, 6, 2014-03-17 09:15:32, 2014-04-17 17:30:15)
insert into SHIFT values (8, 6, 8, 2014-03-17 10:54:12, 2014-04-17 18:58:41)
insert into SHIFT values (9, 1, 9, 2014-03-19 09:11:51, NULL)
insert into SHIFT values (10, 2, 1, 2014-03-19 16:58:41, NULL)

insert into TICKET values (1, 2, 2014-03-15 11:02:50)
insert into TICKET values (2, 3, 2014-03-15 12:15:50)
insert into TICKET values (3, 7, 2014-03-15 16:12:12)
insert into TICKET values (4, 2, 2014-03-18 09:30:52)
insert into TICKET values (5, 2, 2014-03-18 10:17:46)
insert into TICKET values (6, 6, 2014-03-19 09:02:50)
insert into TICKET values (7, 2, 2014-03-19 10:13:47)
insert into TICKET values (8, 3, 2014-03-06 14:11:12)
insert into TICKET values (9, 6, 2014-03-06 16:27:44)
insert into TICKET values (10, 7, 2014-03-06 19:55:10)

insert into INVOICE values (1, 2, 2014-03-14 14:59:03, 2014-03-15 16:30:54, 105.22, 15.78)
insert into INVOICE values (2, 3, 2014-03-15 15:02:50, 2014-03-16 16:35:11, 220.44, 40.00)
insert into INVOICE values (3, 9, 2014-03-15 15:55:41, 2014-03-17 17:00:06, 400.25, 65.75)
insert into INVOICE values (4, 6, 2014-03-15 13:12:02, 2014-03-18 15:30:44, 78.50, 14.00)
insert into INVOICE values (5, 2, 2014-03-18 18:03:22, 2014-04-06 20:02:16, 24.11, 5.00)
insert into INVOICE values (6, 3, 2014-03-14 00:00:20, 2014-04-15 01:01:01, 111.65, 20.00)
insert into INVOICE values (7, 4, 2014-03-17 13:15:32, 2014-04-17 17:30:15, 165.55, 32.11)
insert into INVOICE values (8, 6, 2014-03-17 14:54:12, 2014-04-17 18:58:41, 10.15, 0.00)
insert into INVOICE values (9, 1, 2014-03-19 09:11:51, NULL, NULL, NULL)
insert into INVOICE values (10, 2, 2014-03-19 16:58:41, NULL, NULL, NULL)


insert into LINE values (1, 2, 3, 104)
insert into LINE values (2, 2, 3, 152)
insert into LINE values (3, 2, 4, 218)
insert into LINE values (4, 2, 4, 216)
insert into LINE values (5, 8, 2, 300)
insert into LINE values (6, 4, 5, 51)
insert into LINE values (7, 4, 5, 2)
insert into LINE values (8, 4, 5, 60)
insert into LINE values (9, 6, 8, 201)
insert into LINE values (10, 6, 8, 201)

insert into LINEMOD values (1, 2, 2130)
insert into LINEMOD values (2, 4, 1)
insert into LINEMOD values (3, 4, 60)
insert into LINEMOD values (4, 4, 6)
insert into LINEMOD values (5, 4, 201)
insert into LINEMOD values (6, 3, 142)
insert into LINEMOD values (7, 3, 114)
insert into LINEMOD values (8, 3, 6)
insert into LINEMOD values (9, 3, 1815)
insert into LINEMOD values (10, 10, 2130)