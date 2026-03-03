C:\Users\jadha>mysql -u root -pmanager

mysql> CREATE DATABASE new_hr_db;
Query OK, 1 row affected (0.08 sec)

mysql> USE new_hr_db;
Database changed


mysql> SOURCE E:\C-MC\DBMS\new-hr-db.sql
 
 /*
1. Display all the first names in lower case and the last names in upper case as the 
single column separated with ' - '. Provide the meaningful name to the column
*/
mysql> SELECT CONCAT(LOWER(FIRST_NAME),'-',UPPER(LAST_NAME)) AS 'FULL NAME'
    -> FROM employees;
+-------------------+
| FULL NAME         |
+-------------------+
| ellen-ABEL        |
| sundar-ANDE       |
| mozhe-ATKINSON    |
| shelli-BAIDA      |
| amit-BANDA        |
| elizabeth-BATES   |
| sarah-BELL        |
| david-BERNSTEIN   |
| laura-BISSOT      |
| harrison-BLOOM    |
| hermann-BROWN     |
| alexis-BULL       |
| anthony-CABRIO    |
| gerald-CAMBRAULT  |
| nanette-CAMBRAULT |
| john-CHEN         |
| kelly-CHUNG       |
| karen-COLMENARES  |
| curtis-DAVIES     |
| pat-DAVIS         |
| julia-DELLINGER   |
| jennifer-DILLY    |
| louise-DORAN      |
| alberto-ERRAZURIZ |
| britney-EVERETT   |
| daniel-FAVIET     |
| kevin-FEENEY      |
| jean-FLEAUR       |
| tayler-FOX        |
| adam-FRIPP        |
| lex-GARCIA        |
| ki-GEE            |
| girard-GEONI      |
| william-GIETZ     |
| douglas-GRANT     |
| kimberely-GRANT   |
| danielle-GREENE   |
| nancy-GRUENBERG   |
| peter-HALL        |
| shelley-HIGGINS   |
| guy-HIMURO        |
| alyssa-HUTTON     |
| valli-JACKSON     |
| susan-JACOBS      |
| alexander-JAMES   |
| charles-JOHNSON   |
| vance-JONES       |
| payam-KAUFLING    |
| alexander-KHOO    |
| janette-KING      |
| steven-KING       |
| sundita-KUMAR     |
| renske-LADWIG     |
| james-LANDRY      |
| david-LEE         |
| den-LI            |
| jack-LIVINGSTON   |
| jason-MALLIN      |
| steven-MARKLE     |
| james-MARLOW      |
| michael-MARTINEZ  |
| mattea-MARVINS    |
| randall-MATOS     |
| allan-MCEWEN      |
| samuel-MCLEOD     |
| irene-MIKKILINENI |
| bruce-MILLER      |
| kevin-MOURGOS     |
| julia-NAYER       |
| diana-NGUYEN      |
| donald-OCONNELL   |
| christopher-OLSEN |
| tj-OLSON          |
| lisa-OZER         |
| karen-PARTNERS    |
| joshua-PATEL      |
| randall-PERKINS   |
| hazel-PHILTANKER  |
| luis-POPP         |
| trenna-RAJS       |
| michael-ROGERS    |
| nandita-SARCHAND  |
| ismael-SCIARRA    |
| john-SEO          |
| sarath-SEWALL     |
| john-SINGH        |
| lindsey-SMITH     |
| william-SMITH     |
| stephen-STILES    |
| martha-SULLIVAN   |
| patrick-SULLY     |
| jonathon-TAYLOR   |
| winston-TAYLOR    |
| sigal-TOBIAS      |
| sean-TUCKER       |
| oliver-TUVAULT    |
| jose manuel-URMAN |
| peter-VARGAS      |
| timothy-VENZL     |
| clara-VISHNEY     |
| shanta-VOLLMAN    |
| alana-WALSH       |
| matthew-WEISS     |
| jennifer-WHALEN   |
| david-WILLIAMS    |
| neena-YANG        |
| eleni-ZLOTKEY     |
+-------------------+
107 rows in set (0.03 sec)

/*
2. Display the first word of the job title. (Hint : Use substring_index).
*/

mysql> SELECT SUBSTRING_INDEX(JOB_TITLE,' ',1)
    -> FROM Jobs;
+----------------------------------+
| SUBSTRING_INDEX(JOB_TITLE,' ',1) |
+----------------------------------+
| Public                           |
| Accounting                       |
| Administration                   |
| President                        |
| Administration                   |
| Accountant                       |
| Finance                          |
| Human                            |
| Programmer                       |
| Marketing                        |
| Marketing                        |
| Public                           |
| Purchasing                       |
| Purchasing                       |
| Sales                            |
| Sales                            |
| Shipping                         |
| Stock                            |
| Stock                            |
+----------------------------------+
19 rows in set (0.00 sec)


/*
3. Display the First name, last name and length of first name for the employees whose 
last name contains character ‘b’ anywhere after 3rd position.
*/

SELECT FIRST_NAME,LAST_NAME,LENGTH(FIRST_NAME)
FROM employees
WHERE LAST_NAME LIKE '___%b%';

mysql> SELECT FIRST_NAME,LAST_NAME,LENGTH(FIRST_NAME)
    -> FROM employees
    -> WHERE LAST_NAME LIKE '___%b%';
+------------+-----------+--------------------+
| FIRST_NAME | LAST_NAME | LENGTH(FIRST_NAME) |
+------------+-----------+--------------------+
| Gerald     | Cambrault |                  6 |
| Nanette    | Cambrault |                  7 |
| Nancy      | Gruenberg |                  5 |
| Susan      | Jacobs    |                  5 |
+------------+-----------+--------------------+
4 rows in set (0.00 sec)

/*
4. Display the employee id, first name and last name of the employees whose first or 
last name includes a space in between
*/

mysql> SELECT EMPLOYEE_ID ,FIRST_NAME,LAST_NAME
    -> FROM employees
    -> WHERE  FIRST_NAME LIKE '% %'
    -> ;
+-------------+-------------+-----------+
| EMPLOYEE_ID | FIRST_NAME  | LAST_NAME |
+-------------+-------------+-----------+
|         112 | Jose Manuel | Urman     |
+-------------+-------------+-----------+
1 row in set (0.00 sec)

/*
5. Display first name, salary, and round the salary to thousands.
*/
SELECT FIRST_NAME,SALARY,ROUND(SALARY)
FROM employees;

mysql> SELECT FIRST_NAME,SALARY,ROUND(SALARY)
    -> FROM employees;
+-------------+----------+---------------+
| FIRST_NAME  | SALARY   | ROUND(SALARY) |
+-------------+----------+---------------+
| Steven      | 24000.00 |         24000 |
| Neena       | 17000.00 |         17000 |
| Lex         | 17000.00 |         17000 |
| Alexander   |  9000.00 |          9000 |
| Bruce       |  6000.00 |          6000 |
| David       |  4800.00 |          4800 |
| Valli       |  4800.00 |          4800 |
| Diana       |  4200.00 |          4200 |
| Nancy       | 12008.00 |         12008 |
| Daniel      |  9000.00 |          9000 |
| John        |  8200.00 |          8200 |
| Ismael      |  7700.00 |          7700 |
| Jose Manuel |  7800.00 |          7800 |
| Luis        |  6900.00 |          6900 |
| Den         | 11000.00 |         11000 |
| Alexander   |  3100.00 |          3100 |
| Shelli      |  2900.00 |          2900 |
| Sigal       |  2800.00 |          2800 |
| Guy         |  2600.00 |          2600 |
| Karen       |  2500.00 |          2500 |
| Matthew     |  8000.00 |          8000 |
| Adam        |  8200.00 |          8200 |
| Payam       |  7900.00 |          7900 |
| Shanta      |  6500.00 |          6500 |
| Kevin       |  5800.00 |          5800 |
| Julia       |  3200.00 |          3200 |
| Irene       |  2700.00 |          2700 |
| James       |  2400.00 |          2400 |
| Steven      |  2200.00 |          2200 |
| Laura       |  3300.00 |          3300 |
| Mozhe       |  2800.00 |          2800 |
| James       |  2500.00 |          2500 |
| TJ          |  2100.00 |          2100 |
| Jason       |  3300.00 |          3300 |
| Michael     |  2900.00 |          2900 |
| Ki          |  2400.00 |          2400 |
| Hazel       |  2200.00 |          2200 |
| Renske      |  3600.00 |          3600 |
| Stephen     |  3200.00 |          3200 |
| John        |  2700.00 |          2700 |
| Joshua      |  2500.00 |          2500 |
| Trenna      |  3500.00 |          3500 |
| Curtis      |  3100.00 |          3100 |
| Randall     |  2600.00 |          2600 |
| Peter       |  2500.00 |          2500 |
| John        | 14000.00 |         14000 |
| Karen       | 13500.00 |         13500 |
| Alberto     | 12000.00 |         12000 |
| Gerald      | 11000.00 |         11000 |
| Eleni       | 10500.00 |         10500 |
| Sean        | 10000.00 |         10000 |
| David       |  9500.00 |          9500 |
| Peter       |  9000.00 |          9000 |
| Christopher |  8000.00 |          8000 |
| Nanette     |  7500.00 |          7500 |
| Oliver      |  7000.00 |          7000 |
| Janette     | 10000.00 |         10000 |
| Patrick     |  9500.00 |          9500 |
| Allan       |  9000.00 |          9000 |
| Lindsey     |  8000.00 |          8000 |
| Louise      |  7500.00 |          7500 |
| Sarath      |  7000.00 |          7000 |
| Clara       | 10500.00 |         10500 |
| Danielle    |  9500.00 |          9500 |
| Mattea      |  7200.00 |          7200 |
| David       |  6800.00 |          6800 |
| Sundar      |  6400.00 |          6400 |
| Amit        |  6200.00 |          6200 |
| Lisa        | 11500.00 |         11500 |
| Harrison    | 10000.00 |         10000 |
| Tayler      |  9600.00 |          9600 |
| William     |  7400.00 |          7400 |
| Elizabeth   |  7300.00 |          7300 |
| Sundita     |  6100.00 |          6100 |
| Ellen       | 11000.00 |         11000 |
| Alyssa      |  8800.00 |          8800 |
| Jonathon    |  8600.00 |          8600 |
| Jack        |  8400.00 |          8400 |
| Kimberely   |  7000.00 |          7000 |
| Charles     |  6200.00 |          6200 |
| Winston     |  3200.00 |          3200 |
| Jean        |  3100.00 |          3100 |
| Martha      |  2500.00 |          2500 |
| Girard      |  2800.00 |          2800 |
| Nandita     |  4200.00 |          4200 |
| Alexis      |  4100.00 |          4100 |
| Julia       |  3400.00 |          3400 |
| Anthony     |  3000.00 |          3000 |
| Kelly       |  3800.00 |          3800 |
| Jennifer    |  3600.00 |          3600 |
| Timothy     |  2900.00 |          2900 |
| Randall     |  2500.00 |          2500 |
| Sarah       |  4000.00 |          4000 |
| Britney     |  3900.00 |          3900 |
| Samuel      |  3200.00 |          3200 |
| Vance       |  2800.00 |          2800 |
| Alana       |  3100.00 |          3100 |
| Kevin       |  3000.00 |          3000 |
| Donald      |  2600.00 |          2600 |
| Douglas     |  2600.00 |          2600 |
| Jennifer    |  4400.00 |          4400 |
| Michael     | 13000.00 |         13000 |
| Pat         |  6000.00 |          6000 |
| Susan       |  6500.00 |          6500 |
| Hermann     | 10000.00 |         10000 |
| Shelley     | 12008.00 |         12008 |
| William     |  8300.00 |          8300 |
+-------------+----------+---------------+
107 rows in set (0.01 sec)

/*
6. Display employee ID and the date on which he ended his previous job in the format as 
mentioned. (Format: Thursday, October 27th 2011) 
*/
mysql> SELECT EMPLOYEE_ID,DATE_FORMAT(END_DATE,'%W,%M %D %Y') AS Job_end_date
    -> FROM job_history;
+-------------+-----------------------------+
| EMPLOYEE_ID | Job_end_date                |
+-------------+-----------------------------+
|         101 | Thursday,October 27th 2011  |
|         101 | Sunday,March 15th 2015      |
|         102 | Sunday,July 24th 2016       |
|         114 | Sunday,December 31st 2017   |
|         122 | Sunday,December 31st 2017   |
|         176 | Saturday,December 31st 2016 |
|         176 | Sunday,December 31st 2017   |
|         200 | Friday,June 17th 2011       |
|         200 | Saturday,December 31st 2016 |
|         201 | Tuesday,December 19th 2017  |
+-------------+-----------------------------+
10 rows in set (0.00 sec)

/*
7. Display first name and date of first salary of the employees. 
(Consider 1st day of month as salary day. HINT: LAST_DAY).
*/

SELECT EMPLOYEE_ID,FIRST_NAME,HIRE_DATE,DATE_ADD(HIRE_DATE,INTERVAL 30  DAY) AS First_sal
FROM employees;


mysql> SELECT EMPLOYEE_ID,FIRST_NAME,HIRE_DATE,DATE_ADD(HIRE_DATE,INTERVAL 30  DAY) AS First_sal
    -> FROM employees;
+-------------+-------------+------------+------------+
| EMPLOYEE_ID | FIRST_NAME  | HIRE_DATE  | First_sal  |
+-------------+-------------+------------+------------+
|         100 | Steven      | 2013-06-17 | 2013-07-17 |
|         101 | Neena       | 2015-09-21 | 2015-10-21 |
|         102 | Lex         | 2011-01-13 | 2011-02-12 |
|         103 | Alexander   | 2016-01-03 | 2016-02-02 |
|         104 | Bruce       | 2017-05-21 | 2017-06-20 |
|         105 | David       | 2015-06-25 | 2015-07-25 |
|         106 | Valli       | 2016-02-05 | 2016-03-06 |
|         107 | Diana       | 2017-02-07 | 2017-03-09 |
|         108 | Nancy       | 2012-08-17 | 2012-09-16 |
|         109 | Daniel      | 2012-08-16 | 2012-09-15 |
|         110 | John        | 2015-09-28 | 2015-10-28 |
|         111 | Ismael      | 2015-09-30 | 2015-10-30 |
|         112 | Jose Manuel | 2016-03-07 | 2016-04-06 |
|         113 | Luis        | 2017-12-07 | 2018-01-06 |
|         114 | Den         | 2012-12-07 | 2013-01-06 |
|         115 | Alexander   | 2013-05-18 | 2013-06-17 |
|         116 | Shelli      | 2015-12-24 | 2016-01-23 |
|         117 | Sigal       | 2015-07-24 | 2015-08-23 |
|         118 | Guy         | 2016-11-15 | 2016-12-15 |
|         119 | Karen       | 2017-08-10 | 2017-09-09 |
|         120 | Matthew     | 2014-07-18 | 2014-08-17 |
|         121 | Adam        | 2015-04-10 | 2015-05-10 |
|         122 | Payam       | 2013-05-01 | 2013-05-31 |
|         123 | Shanta      | 2015-10-10 | 2015-11-09 |
|         124 | Kevin       | 2017-11-16 | 2017-12-16 |
|         125 | Julia       | 2015-07-16 | 2015-08-15 |
|         126 | Irene       | 2016-09-28 | 2016-10-28 |
|         127 | James       | 2017-01-14 | 2017-02-13 |
|         128 | Steven      | 2018-03-08 | 2018-04-07 |
|         129 | Laura       | 2015-08-20 | 2015-09-19 |
|         130 | Mozhe       | 2015-10-30 | 2015-11-29 |
|         131 | James       | 2015-02-16 | 2015-03-18 |
|         132 | TJ          | 2017-04-10 | 2017-05-10 |
|         133 | Jason       | 2014-06-14 | 2014-07-14 |
|         134 | Michael     | 2016-08-26 | 2016-09-25 |
|         135 | Ki          | 2017-12-12 | 2018-01-11 |
|         136 | Hazel       | 2018-02-06 | 2018-03-08 |
|         137 | Renske      | 2013-07-14 | 2013-08-13 |
|         138 | Stephen     | 2015-10-26 | 2015-11-25 |
|         139 | John        | 2016-02-12 | 2016-03-13 |
|         140 | Joshua      | 2016-04-06 | 2016-05-06 |
|         141 | Trenna      | 2013-10-17 | 2013-11-16 |
|         142 | Curtis      | 2015-01-29 | 2015-02-28 |
|         143 | Randall     | 2016-03-15 | 2016-04-14 |
|         144 | Peter       | 2016-07-09 | 2016-08-08 |
|         145 | John        | 2014-10-01 | 2014-10-31 |
|         146 | Karen       | 2015-01-05 | 2015-02-04 |
|         147 | Alberto     | 2015-03-10 | 2015-04-09 |
|         148 | Gerald      | 2017-10-15 | 2017-11-14 |
|         149 | Eleni       | 2018-01-29 | 2018-02-28 |
|         150 | Sean        | 2015-01-30 | 2015-03-01 |
|         151 | David       | 2015-03-24 | 2015-04-23 |
|         152 | Peter       | 2015-08-20 | 2015-09-19 |
|         153 | Christopher | 2016-03-30 | 2016-04-29 |
|         154 | Nanette     | 2016-12-09 | 2017-01-08 |
|         155 | Oliver      | 2017-11-23 | 2017-12-23 |
|         156 | Janette     | 2014-01-30 | 2014-03-01 |
|         157 | Patrick     | 2014-03-04 | 2014-04-03 |
|         158 | Allan       | 2014-08-01 | 2014-08-31 |
|         159 | Lindsey     | 2015-03-10 | 2015-04-09 |
|         160 | Louise      | 2015-12-15 | 2016-01-14 |
|         161 | Sarath      | 2016-11-03 | 2016-12-03 |
|         162 | Clara       | 2015-11-11 | 2015-12-11 |
|         163 | Danielle    | 2017-03-19 | 2017-04-18 |
|         164 | Mattea      | 2018-01-24 | 2018-02-23 |
|         165 | David       | 2018-02-23 | 2018-03-25 |
|         166 | Sundar      | 2018-03-24 | 2018-04-23 |
|         167 | Amit        | 2018-04-21 | 2018-05-21 |
|         168 | Lisa        | 2015-03-11 | 2015-04-10 |
|         169 | Harrison    | 2016-03-23 | 2016-04-22 |
|         170 | Tayler      | 2016-01-24 | 2016-02-23 |
|         171 | William     | 2017-02-23 | 2017-03-25 |
|         172 | Elizabeth   | 2017-03-24 | 2017-04-23 |
|         173 | Sundita     | 2018-04-21 | 2018-05-21 |
|         174 | Ellen       | 2014-05-11 | 2014-06-10 |
|         175 | Alyssa      | 2015-03-19 | 2015-04-18 |
|         176 | Jonathon    | 2016-03-24 | 2016-04-23 |
|         177 | Jack        | 2016-04-23 | 2016-05-23 |
|         178 | Kimberely   | 2017-05-24 | 2017-06-23 |
|         179 | Charles     | 2018-01-04 | 2018-02-03 |
|         180 | Winston     | 2016-01-24 | 2016-02-23 |
|         181 | Jean        | 2016-02-23 | 2016-03-24 |
|         182 | Martha      | 2017-06-21 | 2017-07-21 |
|         183 | Girard      | 2018-02-03 | 2018-03-05 |
|         184 | Nandita     | 2014-01-27 | 2014-02-26 |
|         185 | Alexis      | 2015-02-20 | 2015-03-22 |
|         186 | Julia       | 2016-06-24 | 2016-07-24 |
|         187 | Anthony     | 2017-02-07 | 2017-03-09 |
|         188 | Kelly       | 2015-06-14 | 2015-07-14 |
|         189 | Jennifer    | 2015-08-13 | 2015-09-12 |
|         190 | Timothy     | 2016-07-11 | 2016-08-10 |
|         191 | Randall     | 2017-12-19 | 2018-01-18 |
|         192 | Sarah       | 2014-02-04 | 2014-03-06 |
|         193 | Britney     | 2015-03-03 | 2015-04-02 |
|         194 | Samuel      | 2016-07-01 | 2016-07-31 |
|         195 | Vance       | 2017-03-17 | 2017-04-16 |
|         196 | Alana       | 2016-04-24 | 2016-05-24 |
|         197 | Kevin       | 2016-05-23 | 2016-06-22 |
|         198 | Donald      | 2017-06-21 | 2017-07-21 |
|         199 | Douglas     | 2018-01-13 | 2018-02-12 |
|         200 | Jennifer    | 2013-09-17 | 2013-10-17 |
|         201 | Michael     | 2014-02-17 | 2014-03-19 |
|         202 | Pat         | 2015-08-17 | 2015-09-16 |
|         203 | Susan       | 2012-06-07 | 2012-07-07 |
|         204 | Hermann     | 2012-06-07 | 2012-07-07 |
|         205 | Shelley     | 2012-06-07 | 2012-07-07 |
|         206 | William     | 2012-06-07 | 2012-07-07 |
+-------------+-------------+------------+------------+
107 rows in set (0.00 sec)

/*
8. Display first name and experience of the employees in the format of number of years, 
months and days completed.

*/


SELECT FIRST_NAME,HIRE_DATE,


+-------------+------------+----------------------------+
| first_name  | hire_date  | experience                 |
+-------------+------------+----------------------------+
| Steven      | 2013-06-17 | 12 years 7 months 16 days  |
| Neena       | 2015-09-21 | 10 years 4 months 12 days  |
| Lex         | 2011-01-13 | 15 years 0 months 20 days  |
| Alexander   | 2016-01-03 | 10 years 0 months 30 days  |


/*
9. Display the employee id, first name and joining date of the employees who joined in 
the month of august of any year
*/

mysql> SELECT EMPLOYEE_ID,FIRST_NAME,HIRE_DATE
    -> FROM employees
    -> WHERE DATE_FORMAT(HIRE_DATE,'%M') = 'AUGUST';
+-------------+------------+------------+
| EMPLOYEE_ID | FIRST_NAME | HIRE_DATE  |
+-------------+------------+------------+
|         108 | Nancy      | 2012-08-17 |
|         109 | Daniel     | 2012-08-16 |
|         119 | Karen      | 2017-08-10 |
|         129 | Laura      | 2015-08-20 |
|         134 | Michael    | 2016-08-26 |
|         152 | Peter      | 2015-08-20 |
|         158 | Allan      | 2014-08-01 |
|         189 | Jennifer   | 2015-08-13 |
|         202 | Pat        | 2015-08-17 |
+-------------+------------+------------+
9 rows in set (0.00 sec)

/*
10. Display the details of employees who joined before the year 2015
*/
mysql> SELECT EMPLOYEE_ID,HIRE_DATE
    -> FROM employees
    -> WHERE DATE_FORMAT(HIRE_DATE,'%Y') < 2015;
+-------------+------------+
| EMPLOYEE_ID | HIRE_DATE  |
+-------------+------------+
|         100 | 2013-06-17 |
|         102 | 2011-01-13 |
|         108 | 2012-08-17 |
|         109 | 2012-08-16 |
|         114 | 2012-12-07 |
|         115 | 2013-05-18 |
|         120 | 2014-07-18 |
|         122 | 2013-05-01 |
|         133 | 2014-06-14 |
|         137 | 2013-07-14 |
|         141 | 2013-10-17 |
|         145 | 2014-10-01 |
|         156 | 2014-01-30 |
|         157 | 2014-03-04 |
|         158 | 2014-08-01 |
|         174 | 2014-05-11 |
|         184 | 2014-01-27 |
|         192 | 2014-02-04 |
|         200 | 2013-09-17 |
|         201 | 2014-02-17 |
|         203 | 2012-06-07 |
|         204 | 2012-06-07 |
|         205 | 2012-06-07 |
|         206 | 2012-06-07 |
+-------------+------------+
24 rows in set (0.00 sec)


/*
11. Display the number of days between system date and 1st January 2011.
*/
mysql> SELECT TIMESTAMPDIFF(DAY,'2011-01-01',NOW()) AS RESULT;
+--------+
| RESULT |
+--------+
|   5537 |
+--------+
1 row in set (0.00 sec)

/*
12. Display number of employees joined after 15th of any month.
*/
mysql> SELECT COUNT(employee_id) AS count
    -> FROM employees
    -> WHERE DAY(hire_date) >15;
+-------+
| count |
+-------+
|    57 |
+-------+
1 row in set (0.00 sec)

/*
13. Display third highest salary of employees.
*/

mysql> SELECT DISTINCT SALARY
    -> FROM employees
    -> ORDER BY SALARY DESC
    -> LIMIT 2,1;
+----------+
| SALARY   |
+----------+
| 14000.00 |
+----------+
1 row in set (0.00 sec)

/*
===========================================================================================================================================
===========================================================================================================================================
*/


/*
Note: To solve below queries, use “spj” database
1. Display all the Suppliers, belonging to cities starting with the letter ‘L’.
*/

mysql> SELECT *
    -> FROM s
    -> WHERE City LIKE 'L%';
+-----+-------+--------+--------+
| Sid | Sname | status | city   |
+-----+-------+--------+--------+
| s1  | Smith |     20 | London |
| s4  | Clark |     20 | London |
+-----+-------+--------+--------+
2 rows in set (0.00 sec)

/*
2. Display all the Jobs, with the third letter in JNAME as ‘n’.
*/

mysql> SELECT *
    -> FROM j
    -> WHERE Jname LIKE '__n%';
+-----+---------+--------+
| jid | Jname   | City   |
+-----+---------+--------+
| J2  | Punch   | Rome   |
| J4  | Console | Athens |
+-----+---------+--------+
2 rows in set (0.00 sec)

/*
3. Display all the Supplier names with the initial letter capital.
*/
mysql> SELECT CONCAT(UPPER(LEFT(Sname,1)), LOWER(SUBSTRING(Sname,2))) AS NAME
    -> FROM s;
+-------+
| NAME  |
+-------+
| Smith |
| Jones |
| Blake |
| Clark |
| Adams |
+-------+
5 rows in set (0.00 sec)


/*
4. Display all the Supplier names in upper case.
*/

mysql> SELECT UPPER(Sname)
    -> FROM s;
+--------------+
| UPPER(Sname) |
+--------------+
| SMITH        |
| JONES        |
| BLAKE        |
| CLARK        |
| ADAMS        |
+--------------+
5 rows in set (0.00 sec)

/*
5. Display all the Supplier names in lower case.
*/
mysql> SELECT LOWER(Sname)
    -> FROM s;
+--------------+
| LOWER(Sname) |
+--------------+
| smith        |
| jones        |
| blake        |
| clark        |
| adams        |
+--------------+
5 rows in set (0.00 sec)


/*
6. Display the Supplier names and the lengths of the names.
*/

mysql> SELECT Sname,LENGTH(Sname)
    -> FROM s;
+-------+---------------+
| Sname | LENGTH(Sname) |
+-------+---------------+
| Smith |             5 |
| Jones |             5 |
| Blake |             5 |
| Clark |             5 |
| Adams |             5 |
+-------+---------------+
5 rows in set (0.00 sec)


/*
7. Display the current day (e.g. Thursday).
*/

mysql> SELECT DAYNAME(NOW());
+----------------+
| DAYNAME(NOW()) |
+----------------+
| Saturday       |
+----------------+
1 row in set (0.02 sec)

/*
8. Display the minimum Status in the Supplier table.
*/

mysql> SELECT MIN(status)
    -> FROM s;
+-------------+
| MIN(status) |
+-------------+
|          10 |
+-------------+
1 row in set (0.16 sec)

/*
9. Display the maximum Weight in the Parts table.
*/
mysql> SELECT MAX(weight)
    -> FROM p;
+-------------+
| MAX(weight) |
+-------------+
|          19 |
+-------------+
1 row in set (0.00 sec)

/*
10. Display the average Weight of the Parts.
*/

mysql> SELECT AVG(weight)
    -> FROM p;
+-------------+
| AVG(weight) |
+-------------+
|     15.1667 |
+-------------+
1 row in set (0.02 sec)

/*
11. Display the total Quantity sold for part ‘P1’.
*/

mysql> SELECT pid ,SUM(QTY)  FROM sp
    -> WHERE pid='p1'
    -> GROUP BY pid ;
+-----+----------+
| pid | SUM(QTY) |
+-----+----------+
| P1  |      900 |
+-----+----------+
1 row in set (0.00 sec)
+----------+
| SUM(QTY) |
+----------+
|     4800 |
+----------+
1 row in set (0.00 sec)

/*
12. Display all the Supplier names (with ‘la’ replaced by ‘ro’). 
HINT: REPLACE
*/

mysql> SELECT Sname,REPLACE(Sname,'la','ro')
    -> FROM s;
+-------+--------------------------+
| Sname | REPLACE(Sname,'la','ro') |
+-------+--------------------------+
| Smith | Smith                    |
| Jones | Jones                    |
| Blake | Broke                    |
| Clark | Crork                    |
| Adams | Adams                    |
+-------+--------------------------+
5 rows in set (0.00 sec)

/*REPLACE(string, search_string, replace_string);
*/