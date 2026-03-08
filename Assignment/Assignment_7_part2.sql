
/*
Use appropriate joins to solve following queries.
Note: To solve below queries, use “sales” database

1. Write a query that lists each order number followed by the name of the
customer who made the order.
*/

mysql> SELECT o.onum,c.cname
    -> FROM orders o
    -> INNER JOIN customers c
    -> ON o.snum=c.snum;
+------+----------+
| onum | cname    |
+------+----------+
| 3001 | Cisneros |
| 3003 | Clemens  |
| 3003 | Hoffman  |
| 3002 | Pereira  |
| 3005 | Grass    |
| 3005 | Liu      |
| 3006 | Cisneros |
| 3009 | Giovanni |
| 3007 | Grass    |
| 3007 | Liu      |
| 3008 | Clemens  |
| 3008 | Hoffman  |
| 3010 | Grass    |
| 3010 | Liu      |
| 3011 | Clemens  |
| 3011 | Hoffman  |
+------+----------+
16 rows in set (0.00 sec)

/*
2. Write a query that gives the names of both the salesperson and the
customer for each order along with the order number.
*/

mysql> DESC customers
    -> ;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| cnum   | int         | YES  |     | NULL    |       |
| cname  | varchar(10) | YES  |     | NULL    |       |
| city   | varchar(10) | YES  |     | NULL    |       |
| rating | int         | YES  |     | NULL    |       |
| snum   | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> DESC ORDERS;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| onum  | int          | YES  |     | NULL    |       |
| amt   | decimal(7,2) | YES  |     | NULL    |       |
| odate | date         | YES  |     | NULL    |       |
| cnum  | int          | YES  |     | NULL    |       |
| snum  | int          | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc salespeople;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| snum  | int          | YES  |     | NULL    |       |
| sname | varchar(10)  | YES  |     | NULL    |       |
| city  | varchar(10)  | YES  |     | NULL    |       |
| comm  | decimal(3,2) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
snum

mysql> SELECT o.onum,c.cname,s.sname
    -> FROM ORDERS o
    -> INNER JOIN CUSTOMERS c
    -> ON o.snum=c.snum
    -> INNER JOIN salespeople s
    -> ON o.snum = s.snum;
+------+----------+---------+
| onum | cname    | sname   |
+------+----------+---------+
| 3001 | Cisneros | Rifkin  |
| 3003 | Clemens  | Peel    |
| 3003 | Hoffman  | Peel    |
| 3002 | Pereira  | Motika  |
| 3005 | Grass    | Serres  |
| 3005 | Liu      | Serres  |
| 3006 | Cisneros | Rifkin  |
| 3009 | Giovanni | Axelrod |
| 3007 | Grass    | Serres  |
| 3007 | Liu      | Serres  |
| 3008 | Clemens  | Peel    |
| 3008 | Hoffman  | Peel    |
| 3010 | Grass    | Serres  |
| 3010 | Liu      | Serres  |
| 3011 | Clemens  | Peel    |
| 3011 | Hoffman  | Peel    |
+------+----------+---------+
16 rows in set (0.00 sec)

/*
3. Write a query that produces all customers serviced by salespeople with a
commission above 12%. Display the customer’s name, the salesperson’s 
name, and the salesperson’s rate of commission.
*/

SELECT c.cname,s.sname,s.comm
FROM  customers c
INNER JOIN 
salespeople s
ON c.snum= s.snum
WHERE s.comm >0.12 ;

mysql> SELECT c.cname,s.sname,s.comm
    -> FROM  customers c
    -> INNER JOIN
    -> salespeople s
    -> ON c.snum= s.snum
    -> WHERE s.comm >0.12 ;
+----------+--------+------+
| cname    | sname  | comm |
+----------+--------+------+
| Liu      | Serres | 0.13 |
| Grass    | Serres | 0.13 |
| Cisneros | Rifkin | 0.15 |
+----------+--------+------+
3 rows in set (0.03 sec)


/*
4. Write a query that calculates the commission earned by each 
salesperson for orders placed by customers with a rating above 100.
*/

mysql> SELECT o.onum,s.comm,s.comm *o.amt
    -> FROM orders o
    -> INNER JOIN salespeople s
    -> ON s.snum=o.snum
    -> INNER JOIN customers c
    -> ON o.cnum =c.cnum
    -> WHERE rating >100;
+------+------+---------------+
| onum | comm | s.comm *o.amt |
+------+------+---------------+
| 3010 | 0.13 |       40.2935 |
| 3007 | 0.13 |        9.8475 |
| 3005 | 0.13 |      670.8585 |
| 3006 | 0.15 |      164.7240 |
| 3001 | 0.15 |        2.8035 |
| 3009 | 0.10 |      171.3230 |
+------+------+---------------+
6 rows in set (0.00 sec)


/*
5. Write a query that produces all pairs of salespeople who are living in 
the same city. Exclude combinations of salespeople with themselves as
well as duplicate rows with the order reversed.

*/
mysql> SELECT s.sname AS salesperson1, s1.sname AS salesperson2, s.city
    -> FROM salespeople S
    -> INNER JOIN salespeople S1
    -> ON s.city=s1.city
    -> WHERE s.snum <s1.snum;
+--------------+--------------+--------+
| salesperson1 | salesperson2 | city   |
+--------------+--------------+--------+
| Peel         | Motika       | London |
+--------------+--------------+--------+
1 row in set (0.05 sec)





mysql> desc salespeople;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| snum  | int          | YES  |     | NULL    |       |
| sname | varchar(10)  | YES  |     | NULL    |       |
| city  | varchar(10)  | YES  |     | NULL    |       |
| comm  | decimal(3,2) | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)



/*Note: To solve below queries, use “spj” database

1. Display the Supplier name and the Quantity sold.
*/
mysql> SELECT sname,sum(sp.qty)
    -> FROM s
    -> INNER JOIN
    -> sp
    -> ON s.sid=sp.sid
    -> GROUP BY s.sname;
+-------+-------------+
| sname | sum(sp.qty) |
+-------+-------------+
| Smith |         900 |
| Jones |        3200 |
| Blake |         700 |
| Clark |         600 |
| Adams |        3100 |
+-------+-------------+
5 rows in set (0.00 sec)

/*
2. Display the Part name and Quantity sold.
*/

mysql> SELECT Pname,SUM(sp.qty)
    -> FROM p
    -> INNER JOIN sp
    -> ON p.pid=sp.pid
    -> GROUP BY Pname;
+-------+-------------+
| Pname | SUM(sp.qty) |
+-------+-------------+
| Nut   |        1000 |
| Screw |        4800 |
| Cam   |        1100 |
| Cog   |        1300 |
| Bolt  |         300 |
+-------+-------------+
5 rows in set (0.00 sec)

/*
3. Display the Job name and Quantity sold.
*/

mysql> SELECT Jname ,sum(sp.QTY)
    -> FROM j
    -> INNER JOIN sp
    -> ON j.jid =sp.jid
    -> GROUP BY Jname;
+----------+-------------+
| Jname    | sum(sp.QTY) |
+----------+-------------+
| Sorter   |         800 |
| Console  |        3300 |
| Punch    |        1200 |
| Reader   |         500 |
| Collator |        1100 |
| Terminal |         400 |
| Tape     |        1200 |
+----------+-------------+
7 rows in set (0.00 sec)

/*
4. Display the Supplier name, Part name, Job name and Quantity sold.
*/

mysql> SELECT S.sname, P.pname, J.jname, SP.qty
    -> FROM S
    -> INNER JOIN SP ON S.sid = SP.sid
    -> INNER JOIN P ON P.pid = SP.pid
    -> INNER JOIN J ON J.jid = SP.jid;
+-------+-------+----------+------+
| sname | pname | jname    | qty  |
+-------+-------+----------+------+
| Jones | Screw | Sorter   |  400 |
| Blake | Screw | Sorter   |  200 |
| Smith | Nut   | Sorter   |  200 |
| Adams | Cog   | Punch    |  200 |
| Jones | Cam   | Punch    |  100 |
| Blake | Screw | Punch    |  500 |
| Jones | Screw | Punch    |  200 |
| Adams | Bolt  | Punch    |  200 |
| Clark | Cog   | Reader   |  300 |
| Jones | Screw | Reader   |  200 |
| Adams | Cog   | Console  |  500 |
| Adams | Cam   | Console  |  400 |
| Adams | Screw | Console  |  800 |
| Jones | Screw | Console  |  500 |
| Adams | Screw | Console  |  200 |
| Adams | Bolt  | Console  |  100 |
| Smith | Nut   | Console  |  700 |
| Adams | Nut   | Console  |  100 |
| Adams | Cam   | Collator |  500 |
| Jones | Screw | Collator |  600 |
| Jones | Screw | Terminal |  400 |
| Clark | Cog   | Tape     |  300 |
| Adams | Cam   | Tape     |  100 |
| Jones | Screw | Tape     |  800 |
+-------+-------+----------+------+
24 rows in set (0.16 sec)

/*
5. Display the Supplier name, Supplying Parts to a Job in the same City.
*/


mysql> SELECT DISTINCT S.sname
    -> FROM S
    -> INNER JOIN SP ON S.sid = SP.sid
    -> INNER JOIN J ON SP.jid = J.jid
    -> WHERE S.city = J.city;
+-------+
| sname |
+-------+
| Jones |
| Blake |
| Clark |
| Adams |
+-------+
4 rows in set (0.00 sec)

/*
6. Display the Part name that is ‘Red’ in color, and the Total Quantity sold for that 
part.
*/
mysql> SELECT P.pname, SUM(SP.qty) AS total_quantity
    -> FROM P
    -> JOIN SP ON P.pid = SP.pid
    -> WHERE P.color = 'Red'
    -> GROUP BY P.pname;
+-------+----------------+
| pname | total_quantity |
+-------+----------------+
| Nut   |           1000 |
| Screw |           1300 |
| Cog   |           1300 |
+-------+----------------+
3 rows in set (0.06 sec)

/*
7. Display all the Quantity sold by Suppliers with the Status = 20.
*/
mysql> SELECT S.sname, SUM(SP.qty)
    -> FROM S
    -> JOIN SP ON S.sid = SP.sid
    -> WHERE S.status = 20
    -> GROUP BY S.sname;
+-------+-------------+
| sname | SUM(SP.qty) |
+-------+-------------+
| Smith |         900 |
| Clark |         600 |
+-------+-------------+
2 rows in set (0.00 sec)


/*
8. Display all the Parts and their Total Quantity for the parts with the
Weight > 14.
*/

mysql> SELECT P.pname, SUM(SP.qty) AS total_quantity
    -> FROM P
    -> JOIN SP ON P.pid = SP.pid
    -> WHERE P.weight > 14
    -> GROUP BY P.pname;
+-------+----------------+
| pname | total_quantity |
+-------+----------------+
| Screw |           3500 |
| Cog   |           1300 |
| Bolt  |            300 |
+-------+----------------+
3 rows in set (0.12 sec)

*/
9. Display all the Job names and City, which has bought more than 500 Parts.
*/
mysql> SELECT Jname,city,sum(sp.qty)
    -> FROM j
    -> INNER JOIN sp
    -> ON j.jid =sp.jid
    -> GROUP BY Jname,city
    -> HAVING SUM(sp.QTY) >500;
+----------+--------+-------------+
| Jname    | city   | sum(sp.qty) |
+----------+--------+-------------+
| Sorter   | Paris  |         800 |
| Console  | Athens |        3300 |
| Punch    | Rome   |        1200 |
| Collator | London |        1100 |
| Tape     | London |        1200 |
+----------+--------+-------------+
5 rows in set (0.00 sec)

/*
10. Display all the Part names and Quantity sold that have a Weight less than 15.
*/
mysql> SELECT P.pname, SUM(SP.qty)
    -> FROM P
    -> INNER JOIN SP
    -> ON P.pid = SP.pid
    -> WHERE P.weight < 15
    -> GROUP BY P.pname;
+-------+-------------+
| pname | SUM(SP.qty) |
+-------+-------------+
| Nut   |        1000 |
| Cam   |        1100 |
| Screw |        1300 |
+-------+-------------+
3 rows in set (0.00 sec)


/*
11. Display all the Suppliers with the same Status as the supplier, ‘CLARK’.
*/
mysql> SELECT sname, status
    -> FROM S
    -> WHERE status = (
    -> SELECT status
    -> FROM S
    -> WHERE sname = 'CLARK'
    -> );
+-------+--------+
| sname | status |
+-------+--------+
| Smith |     20 |
| Clark |     20 |
+-------+--------+
2 rows in set (0.00 sec)


/*
12. Display all the Parts which have more Weight than any “Red” parts.
*/
mysql> SELECT pname, weight, color
    -> FROM P
    -> WHERE weight > ANY (
    -> SELECT weight
    -> FROM P
    -> WHERE color = 'Red'
    -> );
+-------+--------+-------+
| pname | weight | color |
+-------+--------+-------+
| Bolt  |     17 | Green |
| Screw |     17 | Blue  |
| Screw |     14 | Red   |
| Cog   |     19 | Red   |
+-------+--------+-------+
4 rows in set (0.00 sec)

/*
13. Display all the Jobs going on in the same city as the job ‘TAPE’.
*/

mysql> SELECT jname, city
    -> FROM J
    -> WHERE city = (
    -> SELECT city
    -> FROM J
    -> WHERE jname = 'TAPE'
    -> );
+----------+--------+
| jname    | city   |
+----------+--------+
| Collator | London |
| Tape     | London |
+----------+--------+
2 rows in set (0.00 sec

/*
14. Display all the Parts with Weight less than any of the “Green” parts.
*/
 SELECT pname, weight
    FROM P
     WHERE weight < ANY (
     SELECT weight
     FROM P
     WHERE color = 'Green' );


     mysql>  SELECT pname, weight
    ->     FROM P
    ->      WHERE weight < ANY (
    ->      SELECT weight
    ->      FROM P
    ->      WHERE color = 'Green' );
+-------+--------+
| pname | weight |
+-------+--------+
| Nut   |     12 |
| Screw |     14 |
| Cam   |     12 |
+-------+--------+
3 rows in set (0.00 sec)

/*
15. Display the name of the Supplier who has sold the maximum Quantity (in one
sale)
*/



/*
16. Display the name of the Supplier who has sold the maximum overall
 Quantity (sum of Sales)

 */

 SELECT S.sname
FROM S
JOIN SP ON S.sid = SP.sid
GROUP BY S.sid, S.sname
HAVING SUM(SP.qty) = (
    SELECT MAX(total_qty)
    FROM (
        SELECT SUM(qty) AS total_qty
        FROM SP
        GROUP BY sid
    ) AS t
);

+-------+-------------+
| Sname | sum(sp.QTY) |
+-------+-------------+
| Jones |        3200 |
+-------+-------------+
1 row in set (0.00 sec)