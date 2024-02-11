CREATE TABLE customers (
    customers_id int NOT NULL primary key,
    first_name varchar(25) NOT NULL,
    Last_name varchar(25),
    age int NOT NULL,
    country varchar(25) default 'Npl',
    CHECK (age>=18)
);

select * from customers;
drop table orders;
select * from orders;
CREATE TABLE orders (
    Orders_id int NOT NULL PRIMARY KEY,
    item_nme varchar(25) not null,
    price float,
    cust_id int,
    FOREIGN KEY (cust_id) REFERENCES customers(customers_id),
        CHECK (price>0)
);

describe orders;
select * from orders;

INSERT INTO customers (customers_id, first_name,Last_name,age,country)
VALUES (1, 'Ram', 'Thapa',21,'USA');

INSERT INTO customers (customers_id, first_name,Last_name,age)
VALUES (2, 'sita', 'Thapa',15);

INSERT INTO customers (customers_id, first_name,Last_name,age)
VALUES (3, 'Ganesh', 'sth',22);

INSERT INTO customers (customers_id, first_name,Last_name,age,country)
VALUES (4, 'Rosan', 'Thapa',18, 'JPN');

INSERT INTO customers (customers_id, first_name,Last_name,age,country)
VALUES (5, 'Mohan', 'Thapa',18, 'JPN');

INSERT INTO customers (customers_id, first_name,Last_name,age,country)
VALUES (6, 'Yuvan', 'Thapa',18, 'USA');

--  insert in order tables;
select * from orders;

select * from customers;
INSERT INTO orders (Orders_id, item_nme,price,cust_id)
VALUES (1, 'pizza',190 ,2);

INSERT INTO orders (Orders_id, item_nme,price,cust_id)
VALUES (2, 'momo',150 ,3);

delete from customers where customers_id=1;
delete from orders where cust_id=1;

INSERT INTO orders (Orders_id, item_nme,price,cust_id)
VALUES (3, 'veg momo',120 ,3);

INSERT INTO orders (Orders_id, item_nme,price,cust_id)
VALUES (4, 'mango',100 ,4);

INSERT INTO orders (Orders_id, item_nme,price,cust_id)
VALUES (5, 'orange',100 ,5);

INSERT INTO orders (Orders_id, item_nme,price,cust_id)
VALUES (6, 'grapes',100 ,6);

DELETE from orders where Orders_id = 5;


DESCRIBE customers;
select * from customers;

select * from orders;

select cust.first_name, cust.last_name,cust.country, od.item_nme,od.price
from customers cust
inner join orders od on cust.customers_id=od.cust_id;

drop view cust_orders_view;
select * from customers;

select * from orders;

select * from cust_orders_view;
create view cust_orders_view
as
select cust.first_name, cust.last_name,cust.country, 
od.item_nme,od.price
from customers cust
inner join orders od on cust.customers_id=od.cust_id;

drop materialized view cust_orders_materialized_view;
select * from cust_orders_materialized_view;

create materialized view cust_orders_materialized_view
as
select cust.first_name, cust.last_name,cust.country, od.item_nme,
od.price
from customers cust
inner join orders od on cust.customers_id=od.cust_id;

select * from customers;
select * from cust_orders_view;
select * from cust_orders_materialized_view;
select * from customers;
select * from orders;
INSERT INTO orders (Orders_id, item_nme,price,cust_id)
VALUES (3, 'grapes',100 ,4);

create view order_view
as 
select item_nme, price 
from orders;

create materialized view order_materialized_view
as 
select item_nme, price 
from orders;

INSERT INTO orders (Orders_id, item_nme,price,cust_id)
VALUES (4, 'grapes',100 ,5);
select *
from orders;

select * from order_view;
select * from order_materialized_view;
select cust.first_name, cust.last_name,cust.country, 
od.item_nme,od.price
from customers cust
inner join orders od on cust.customers_id=od.cust_id;

select * from customers;

select * from orders;

CREATE MATERIALIZED VIEW LOG ON customers
WITH PRIMARY KEY
INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW LOG ON orders
WITH PRIMARY KEY
INCLUDING NEW VALUES;

select * from customers;
-- Sequence 
CREATE SEQUENCE my_sequence
  START WITH 9
  INCREMENT BY 2
  NOCACHE
  NOCYCLE;

select sequence_name, Last_number, Max_value, Increment_by 
from user_sequences;


INSERT INTO customers (customers_id, first_name,Last_name,age,country)
VALUES (my_sequence.NEXTVAL, 'test_2', 'Thapa',21,'USA');
select * from customers;

ALTER SEQUENCE my_sequence INCREMENT BY 2;
DROP SEQUENCE my_sequence;

-- SYNONYM
CREATE SYNONYM cust FOR customers;
select * from cust;
DROP SYNONYM cust;


select * from customers;
select * from orders;

select cust.first_name, cust.last_name,od.item_nme,od.price
from customers cust
inner join orders od on cust.customers_id= od.cust_id;

select * --cust.first_name, cust.last_name,od.item_nme,od.price
from customers cust
left join orders od on cust.customers_id= od.cust_id;

select * --cust.first_name, cust.last_name,od.item_nme,od.price
from customers cust
right join orders od on cust.customers_id= od.cust_id;

select * --cust.first_name, cust.last_name,od.item_nme,od.price
from orders od
right join customers cust on cust.customers_id= od.cust_id;

create view cust_view
as
select cust.first_name, cust.last_name,od.item_nme,od.price
from customers cust
inner join orders od on cust.customers_id= od.cust_id;

select * from cust_view;

select * from customers
where customers_id=4;

select * from customers
where first_name like 'R%';

select * from customers
where first_name like '%n';

select * from customers
where first_name like '%va%';

select * from customers
where first_name like 'n%a';

select * from customers
where first_name like '_eeta';

select * from customers;
select min(age) from customers;
select max(age) from customers;
select avg(age) from customers;
select count(*) from customers;

select * 
from customers
order by age desc;

select * 
from customers
order by first_name desc;

select * 
from customers
order by first_name asc;

select country, count(*) 
from customers
GROUP by country;

select *
from customers
where customers_id in (7,9);

select *
from customers
where customers_id in (7);
select *
from customers
where customers_id between 7 and 9;

select country, count(*) 
from customers
GROUP by country
having count(*)>1;

select country, count(*) 
from customers
GROUP by country
having count(*)=1;

select * from customers
where age =(
select min(age) from customers);

select * from customers
order by customers_id;
select * from orders
order by cust_id;

select * from customers c
where EXISTS(
select 1 from orders  ord where c.customers_id=ord.cust_id);

select * from customers c
where not EXISTS(
select 1 from orders  ord where c.customers_id=ord.cust_id);


SELECT * FROM V$DIAG_INFO;
SELECT * FROM V$DIAG_ALERT_EXT;
