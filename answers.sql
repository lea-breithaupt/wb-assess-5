Problem 1:
SELECT email 
FROM customers 
ORDER BY email ASC;

Answer:
         email          
------------------------
 ecrocker@gmail.com
 hboyardee@yahoo.com
 mcallender@hotmail.com 


Problem 2:
SELECT id 
FROM orders 
WHERE customer_id = (
    SELECT id
    FROM customers
    WHERE fname='Elizabeth' AND lname='Crocker'
);

Answer:
 id 
----
  1
  3
  4
  6
  8

Problem 3:
SELECT SUM(num_cupcakes) 
FROM orders 
WHERE processed=false;

Answer:
 sum 
-----
 209

Problem 4:
SELECT c.name, SUM(o.num_cupcakes)
FROM cupcakes AS c
LEFT JOIN orders AS o
ON c.id = o.cupcake_id
GROUP BY c.id, c.name
ORDER BY c.name ASC

Answer:
    name     | sum 
-------------+-----
 carrot cake |  10
 chocolate   |    
 funfetti    |  13
 raspberry   |  25
 red velvet  | 215
 vanilla     | 202

 Problem 5:
 SELECT c.email, SUM(o.num_cupcakes)
 FROM customers AS c
 LEFT JOIN orders AS o
 ON c.id = o.customer_id
 GROUP BY c.email
 ORDER BY SUM(o.num_cupcakes) DESC;

 Answer:
          email          | sum 
------------------------+-----
 ecrocker@gmail.com     | 265
 hboyardee@yahoo.com    | 184
 mcallender@hotmail.com |  16

Problem 6:
SELECT DISTINCT  c.fname, c.lname, c.email
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id
INNER JOIN cupcakes AS cc
ON cc.id=o.cupcake_id
WHERE o.processed = true AND cc.name='funfetti';

Answer:
 fname  |  lname   |        email        
--------+----------+---------------------
 Hector | Boyardee | hboyardee@yahoo.com