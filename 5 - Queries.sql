-- Assignment: Week 5 - Individual: SQL Queries
-- Author: Nicholas Evans
-- Course: DBM 380 
-- Instructor: Wade Fergus
-- Due Date: November 30, 2015

--The following queries return all the data from each of the tables in the database.

select * from MODLIBRARY;
select * from EMPLOYEE;
select * from PRINTER;
select * from JOB;
select * from PRODUCT;
select * from TICKET;
select * from INVOICE;
select * from LINE;
select * from LINEMOD;

-- The following 2 queries return filtered data from single tables within the database.

-- This query returns the product name and the number in stock of any products with a limited quantity, a potentially valuable list in a restaurant setting.

select PROD_NAME as 'Item Name', PROD_INSTOCK as '# in stock' from PRODUCT WHERE PROD_INSTOCK IS NOT NULL order by PROD_NAME;

-- This query return the employee name and ID # for all employees whose last name begins with the letter R.

select EMP_ID as 'ID #', EMP_LNAME as 'Last Name', EMP_FNAME as 'First Name' from EMPLOYEE where EMP_LNAME like 'R%' order by EMP_LNAME;

-- The following 2 queries use the JOIN clause to combine data from two or more tables

-- This query returns the employee name, job name, and shift length for each shift. It is sorted in chronological order by the starting time of the shift.

select e.EMP_FNAME as 'First Name', e.EMP_LNAME as 'Last Name', timestampdiff(s.SHFT_TIMEOUT, s.SHFT_TIMEIN) as 'Shift Length', j.JOB_NAME as 'Position'
  from SHIFT as s
  join EMPLOYEE as e ON s.EMP_ID = e.EMP_ID
  join JOB as j ON s.JOB_ID = j.JOB_ID
  order by s.SHFT_TIMEIN
  ;
  
-- This query returns the name or each product sold along with the employee that sold it, when it was ordered, and on which invoice. It is sorted chronological order.
 
select t.TICKET_TIME as 'Time of Order', e.EMP_FNAME as 'Ordered by', p.PROD_NAME as 'Item Ordered', l.INVC_ID as 'On Check #'
  from LINE as l
  join TICKET as t on l.TICKET_ID = t.TICKET_ID
  join PRODUCT as p on l.PROD_ID = p.PROD_ID
  join EMPLOYEE as e on t.EMP_ID = e.EMP_ID
  order by t.TICKET_TIME
  ;