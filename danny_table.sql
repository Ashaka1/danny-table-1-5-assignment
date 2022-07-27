
CREATE DATABASE dannys_diner;



CREATE TABLE sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INTEGER
);

INSERT INTO sales VALUES('A', '2021-01-01', '1');
 INSERT INTO sales VALUES ('A', '2021-01-01', '2');
  INSERT INTO sales VALUES('A', '2021-01-07', '2');
  INSERT INTO sales VALUES('A', '2021-01-10', '3');
  INSERT INTO sales VALUES('A', '2021-01-11', '3');
 INSERT INTO sales VALUES ('A', '2021-01-11', '3');
  INSERT INTO sales VALUES('B', '2021-01-01', '2');
  INSERT INTO sales VALUES('B', '2021-01-02', '2');
 INSERT INTO sales VALUES ('B', '2021-01-04', '1');
 INSERT INTO sales VALUES ('B', '2021-01-11', '1');
  INSERT INTO sales VALUES('B', '2021-01-16', '3');
 INSERT INTO sales VALUES ('B', '2021-02-01', '3');
  INSERT INTO sales VALUES('C', '2021-01-01', '3');
 INSERT INTO sales VALUES ('C', '2021-01-01', '3');
  INSERT INTO sales VALUES('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  product_id INTEGER,
  product_name VARCHAR(5),
  price INTEGER
);

INSERT INTO menu VALUES ('1', 'sushi', '10');
 INSERT INTO menu VALUES  ('2', 'curry', '15');
  INSERT INTO menu VALUES ('3', 'ramen', '12');
  

CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);

INSERT INTO members VALUES('A', '2021-01-07');
  INSERT INTO members VALUES('B', '2021-01-09');
  
  
 -- 1-What is the total amount each customer spent at the restaurant?
 SELECT customer_id, sum(price) as total_price FROM menu m
 join sales s ON m.product_id = s.product_id
 group by customer_id;
 -- order by customer_id not working
 
 
 -- 2- How many days has each customer visited the restaurant?
 select customer_id , count(distinct(order_date)) as days_visited from sales
 group by customer_id;

 
 -- 3- What was the first item from the menu purchased by each customer?
 SELECT  customer_id, product_name, order_date FROM menu m
 join sales s ON m.product_id = s.product_id 
 where order_date <= '2021-01-01'
 --group by s.customer_id ;
 --group by product_name ;
 
 -- 4- What is the most purchased item on the menu? how many times was it purchased by all customers?
	 SELECT  product_name, count(s.product_id) as no_of_items_sold  FROM menu m
	 join sales s ON m.product_id = s.product_id
	 group by product_name;
     
     -- 5- how many times was it purchased by all customers each?
     SELECT  customer_id, product_name, count(m.product_id) as no_items_purchased
     FROM menu m
	 join sales s ON m.product_id = s.product_id
     where product_name = 'ramen'
     group by customer_id;
     
    