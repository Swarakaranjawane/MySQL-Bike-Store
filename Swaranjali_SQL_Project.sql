create database bike_store;
use bike_store;

-- Que 1. how many orders have been made by Lizzette
-- query 
select customers.first_name, customers.last_name,
count(orders.customer_id) as Number_Of_Orders
from customers 
join orders on customers.customer_id= orders.customer_id
where customers.first_name = "Lizzette"
group by customers.first_name,customers.last_name;

-- output
/*
Lizzette	Stein	3
*/

-- Que 2. display the details of orders where order_date, required_date are same
-- query
select * from orders
where order_date = required_date;
-- or 
select * from orders
where datediff(order_date, required_date)=0;

-- output
/*
70	50	3	2016-02-11	2016-02-11		3	9
76	9	3	2016-02-16	2016-02-16		2	6
158	117	3	2016-04-04	2016-04-04		3	9
185	24	3	2016-04-20	2016-04-20		1	2
239	13	3	2016-05-27	2016-05-27		3	9
246	17	3	2016-05-30	2016-05-30		2	6
264	5	3	2016-06-10	2016-06-10		1	3
349	30	3	2016-08-03	2016-08-03		1	3
350	31	3	2016-08-03	2016-08-03		1	3
357	14	3	2016-08-05	2016-08-05		3	8
391	61	3	2016-08-23	2016-08-23		3	9
*/
 
-- Que 3. display order_id of orders where shipped_date is null
-- query
select order_id from orders
where shipped_date is null;

-- output 
/*
70
76
158
185
239
246
264
349
350
357
391
*/

-- Que 4. list the names of customer having phone number 
-- Query
select first_name 
from customers 
where  phone is not null;

-- Output
/*
Charolette
Latasha
Robby
Emmitt
Theo
Williemae
Janetta
Mozelle
Lolita
Tommie
Sarai
*/

-- Que 5. Retrieve full name of customers who have placed order
-- query  
select concat(customers.first_name," ",customers.last_name) as full_name 
from customers
inner join orders 
on customers.customer_id = orders.customer_id
where orders.order_id is not null;

-- output
/*
Johnathan Velazquez
Jaqueline Cummings
Joshua Robertson
Nova Hess
Arla Ellis
Sharyn Hopkins
Laureen Paul
Leslie Higgins
Neil Mccall
Alane Munoz
Tarra Guerrero
*/

-- Que 6.  list top 5 orders where shipping was delayed
-- query 
select * from orders
where shipped_date > required_date 
order by shipped_date - required_date desc
limit 5;

-- output
/*
4	175	4	2016-01-03	2016-01-04	2016-01-05	1	3
12	91	4	2016-01-06	2016-01-08	2016-01-09	1	2
14	258	4	2016-01-09	2016-01-11	2016-01-12	1	3
15	450	4	2016-01-09	2016-01-10	2016-01-12	2	7
20	923	4	2016-01-14	2016-01-16	2016-01-17	1	2
*/

-- Que 7. Retrieve customer details who have placed more than 2 orders
--  query
select customers.first_name, customers.last_name, count(orders.customer_id) 
as total_orders 
from customers 
inner join orders 
on customers.customer_id = orders.customer_id
group by customers.customer_id, customers.first_name, customers.last_name
having total_orders >2;

-- output
 /*
Cleotilde	Booth	3
Genoveva	Baldwin	3
Latasha	Hays	3
Robby	Sykes	3
Monika	Berg	3
Mozelle	Carter	3
Araceli	Golden	3
Williemae	Holloway	3
Corene	Wall	3
Lashawn	Ortiz	3
Caren	Stephens	3
 */
 
-- Que 8. Get all orders placed in 2017 
-- query 
select * from orders
where year(order_date)= 2017;

-- output
/*
636	532	4	2017-01-03	2017-01-04	2017-01-05	1	2
637	512	4	2017-01-03	2017-01-05	2017-01-05	2	6
638	1302	4	2017-01-04	2017-01-05	2017-01-06	2	7
639	550	4	2017-01-06	2017-01-07	2017-01-07	2	6
640	1093	4	2017-01-06	2017-01-08	2017-01-07	2	6
641	673	4	2017-01-07	2017-01-10	2017-01-08	1	3
642	847	4	2017-01-07	2017-01-09	2017-01-10	2	7
643	901	4	2017-01-08	2017-01-09	2017-01-11	1	3
644	439	4	2017-01-08	2017-01-11	2017-01-10	2	6
645	1199	4	2017-01-08	2017-01-11	2017-01-10	2	6
646	975	4	2017-01-09	2017-01-12	2017-01-11	1	2
*/ 

-- Que 9.  select customers whose email domain is 'hotmail.com'
-- query 
select * 
from customers 
where email like '%hotmail.com';

-- output
/*
6	Lyndsey	Bean		lyndsey.bean@hotmail.com	769 West Road 	Fairport	NY	14450
7	Latasha	Hays	(716) 986-3359	latasha.hays@hotmail.com	7014 Manor Station Rd. 	Buffalo	NY	14215
12	Robby	Sykes	(516) 583-7761	robby.sykes@hotmail.com	486 Rock Maple Street 	Hempstead	NY	11550
14	Garry	Espinoza		garry.espinoza@hotmail.com	7858 Rockaway Court 	Forney	TX	75126
16	Emmitt	Sanchez	(212) 945-8823	emmitt.sanchez@hotmail.com	461 Squaw Creek Road 	New York	NY	10002
28	Jeanice	Frost		jeanice.frost@hotmail.com	76 Devon Lane 	Ossining	NY	10562
33	Deloris	Burke		deloris.burke@hotmail.com	895 Edgemont Drive 	Palos Verdes Peninsula	CA	90274
36	Bernita	Mcdaniel		bernita.mcdaniel@hotmail.com	2 Peg Shop Ave. 	Liverpool	NY	13090
47	Bridgette	Guerra		bridgette.guerra@hotmail.com	9982 Manor Drive 	San Lorenzo	CA	94580
52	Tu	Ramirez		tu.ramirez@hotmail.com	24 W. Courtland Street 	East Elmhurst	NY	11369
54	Fran	Yang		fran.yang@hotmail.com	440 Pearl St. 	Utica	NY	13501
*/


-- Que 10. retrieve orders that were placed in the first quarter of 2018
-- Query 
select * from orders
where order_date 
between '2018-01-01' and '2018-03-31';

-- output
/*
1324	862	4	2018-01-01	2018-01-04	2018-01-03	2	6
1325	68	4	2018-01-01	2018-01-02	2018-01-03	3	8
1326	567	4	2018-01-01	2018-01-03	2018-01-02	3	9
1327	1026	4	2018-01-02	2018-01-03	2018-01-05	2	6
1328	1083	4	2018-01-02	2018-01-03	2018-01-03	2	6
1329	443	4	2018-01-04	2018-01-05	2018-01-06	1	3
1330	761	4	2018-01-04	2018-01-05	2018-01-07	2	7
1331	1122	4	2018-01-05	2018-01-06	2018-01-08	2	6
1332	256	4	2018-01-06	2018-01-07	2018-01-09	2	7
1333	203	4	2018-01-06	2018-01-07	2018-01-07	3	8
1334	425	4	2018-01-07	2018-01-09	2018-01-10	2	6
*/

-- Que 11. Retrieve first and last name whose first and last name contain no vowels except a and have been ordered more than 2 times
-- Query
select customers.first_name,customers.last_name, count(orders.customer_id) as order_count from customers
inner join orders on customers.customer_id = orders.customer_id
where first_name not like "%e%" and last_name not like "%e%"
and first_name not like "%i%" and last_name not like "%i%"
and first_name not like "%o%" and last_name not like "%o%"
and first_name not like "%u%" and last_name not like "%u%"
group by customers.first_name, customers.last_name
having order_count >2 ;

-- output
/*
Latasha	Hays	3
*/

-- Que 12. Find the average time taken for shipping an order where shipping date was within 5 days from the order date
-- Query 
select avg(datediff(shipped_date,order_date)) as Average from orders
where datediff(shipped_date, order_date) <= 5;

-- Output
/*
1.9820
*/

-- Que 13. Display all the customers who's first name starts with 's' and ends with 't' 
-- or who have lived in city of 'Jamaica' also avoid duplicate customer entries.
-- Query
select distinct * from customers 
where first_name like 's%t'
or  city= 'Jamaica';

-- Output
/*
223	Scarlet	Yates		scarlet.yates@hotmail.com	687 Shirley St. 	Patchogue	NY	11772
335	Scarlet	Reed		scarlet.reed@hotmail.com	151 S. Myers Court 	Bronx	NY	10451
205	Harris	Pittman		harris.pittman@yahoo.com	404 Cherry Hill Road 	Jamaica	NY	11432
272	Deja	Chaney		deja.chaney@hotmail.com	52 Woodside Ave. 	Jamaica	NY	11432
352	Josef	Greer		josef.greer@gmail.com	92 Summer Court 	Jamaica	NY	11432
439	Sunshine	Rosario		sunshine.rosario@aol.com	1 Chestnut Lane 	Jamaica	NY	11432
456	Serina	Hensley		serina.hensley@yahoo.com	53 Proctor Drive 	Jamaica	NY	11432
505	Wilda	Petersen		wilda.petersen@aol.com	899 Helen St. 	Jamaica	NY	11432
575	Laurence	Christian		laurence.christian@gmail.com	2 Maple St. 	Jamaica	NY	11432
620	Eric	Hardin		eric.hardin@gmail.com	39 S. Parker Drive 	Jamaica	NY	11432
1086	Cori	Schwartz		cori.schwartz@msn.com	43 Lancaster Lane 	Jamaica	NY	11432
*/

-- Que 14. Create a view of list of state
-- Query
create view unique_state_view as
select distinct state from customers;

select * from unique_state_view; 

-- Output
/*
NY
CA
TX
*/

-- Que 15. Create a view that shows customers full name, city and most recent order date
-- Query
create view recent_orders_of_customer as
select concat(customers.first_name," ",customers.last_name) as Fullname,customers.city, 
max(orders.order_date) as recent_order
from customers
join orders on customers.customer_id= orders.customer_id
group by fullname, city;

select * from recent_orders_of_customer;

-- Output
/*
Johnathan Velazquez	Pleasanton	2016-01-01
Jaqueline Cummings	Huntington Station	2016-01-01
Joshua Robertson	Patchogue	2016-01-02
Nova Hess			Duarte	2018-04-11
Arla Ellis			Utica	2016-01-03
Sharyn Hopkins		Baldwinsville	2018-04-01
Laureen Paul		Bellmore	2016-01-04
Leslie Higgins		Saratoga Springs	2016-01-04
Neil Mccall			San Carlos	2018-04-21
Alane Munoz			Yonkers	2016-01-05
Tarra Guerrero		Auburn	2016-01-05
*/

--  Que 16. Count the occurence of each zip code in the customer tables which lies between 10000 and 11000.
-- Query
select zip_code, count(zip_code) from customers
where zip_code between 10000 and 11000
group by zip_code
order by count(zip_code) desc;

-- Output
/*
10550	20
10583	17
10562	13
10950	11
10952	11
10977	10
10451	9
10573	8
10002	7
10541	7
*/

-- Que 17. List all the customers who live in same city were store is located 
-- Query
select concat(customers.first_name," ", customers.last_name) as customer_name, 
customers.city, stores.store_name
from customers join stores
on customers.city = stores.city;

-- Output
/*
Jayne Kirkland	Rowlett	Rowlett Bikes
Ashanti Parks	Baldwin	Baldwin Bikes
Omer Estrada	Rowlett	Rowlett Bikes
Dorine Roberson	Santa Cruz	Santa Cruz Bikes
Javier Nichols	Rowlett	Rowlett Bikes
Justina Jenkins	Baldwin	Baldwin Bikes
Ginette Edwards	Baldwin	Baldwin Bikes
Jennette Wooten	Rowlett	Rowlett Bikes
Lashawna Richardson	Baldwin	Baldwin Bikes
Christopher Richardson	Santa Cruz	Santa Cruz Bikes
Cyndi Dyer	Baldwin	Baldwin Bikes
*/

-- Que 18. Count the number of orders supplied from  each store
-- Query
select stores.store_id, stores.store_name , count(orders.store_id) as count_of_order 
from  orders inner join stores on orders.store_id= stores.store_id
group by stores.store_id, stores.store_name;

-- Output
/*
1	Santa Cruz Bikes	348
2	Baldwin Bikes	1093
3	Rowlett Bikes	174f
*/

--  Que 19. Create a unique id for each customer by adding middle 2 number from zip_code 
-- and first 2 letter of first_name and last 2 letter of last_name
-- Query
select first_name, last_name,
concat(substr(zip_code,(length(zip_code)/2),2),
left(first_name,2),
right(last_name,2))as Unique_id 
from customers
group by first_name,last_name,Unique_id;

-- Output
/*
Debra	Burks	127Deks
Kasha	Todd	008Kadd
Tameka	Fisher	278Taer
Daryl	Spence	553Dace
Charolette	Rice	820Chce
Lyndsey	Bean	450Lyan
Latasha	Hays	215Lays
Jacquline	Duncan	372Jaan
Genoveva	Baldwin	050Gein
Pamelia	Newman	950Paan
*/

-- Que 20. Give the list of customers on basis of first_name and count of store of only
-- those customers who have have placed orders in more than one store
-- Query
select customers.first_name as Customer, count(distinct orders.store_id) as Number_of_Store 
from customers
join orders join stores
on customers.customer_id = orders.customer_id
group by customer
having  count(distinct orders.store_id)>1;

-- Output
/*
Adam	2
Adriene	2
Agatha	2
Alane	2
Alejandro	2
Aleta	2
Angele	2
Arvilla	2
Bernetta	2
Bettie	2
Carola	2
*/

-- Que 21. Write a query to get all customers and their order details. Include customers even if they haven't placed any orders. 
-- Query
select customers.first_name, customers.last_name, orders.order_date 
from customers left join orders 
on customers.customer_id= orders.customer_id;
-- output
/*
Debra	Burks	2018-11-18
Debra	Burks	2018-04-18
Debra	Burks	2016-12-09
Kasha	Todd	2018-04-09
Kasha	Todd	2017-08-21
Kasha	Todd	2017-02-05
Tameka	Fisher	2018-10-21
Tameka	Fisher	2018-04-06
Tameka	Fisher	2018-03-27
Daryl	Spence	2018-04-18
Daryl	Spence	2017-11-21
*/ 

-- Que 22. Write a query to get all order details and their corresponding customer information. 
-- Include orders even if the customer information is missing 
-- Query
select orders.order_id, orders.order_date, customers.customer_id, customers.first_name, customers.last_name 
from orders right join customers
on orders.customer_id = customers.customer_id;
-- output
/*
1613	2018-11-18	1	Debra	Burks
1555	2018-04-18	1	Debra	Burks
599	2016-12-09	1	Debra	Burks
1509	2018-04-09	2	Kasha	Todd
1084	2017-08-21	2	Kasha	Todd
692	2017-02-05	2	Kasha	Todd
1612	2018-10-21	3	Tameka	Fisher
1496	2018-04-06	3	Tameka	Fisher
1468	2018-03-27	3	Tameka	Fisher
*/


-- Que 23. Write a query to get every possible combination of customers and stores (even if they are not related).
select customers.customer_id , stores.store_id 
from customers cross join stores
order by customers.customer_id desc;
/*
'1445', '1'
'1445', '3'
'1445', '2'
'1444', '1'
'1444', '3'
'1444', '2'
'1443', '1'
'1443', '3'
'1443', '2'
'1442', '1'
*/

-- Que 24. Find the orders placed by customers from a specific list of cities ('Orchard Park', 'Fairport', 'Buffalo').
SELECT order_id, customer_id, order_date
FROM orders
WHERE customer_id IN (
    SELECT customer_id 
    FROM customers
    WHERE city IN ('Orchard Park', 'Fairport', 'Buffalo')
);

-- output
/*
29	437	2016-01-20
34	80	2016-01-22
104	7	2016-03-03
192	728	2016-04-27
220	1358	2016-05-12
265	682	2016-06-10
375	536	2016-08-17
386	1362	2016-08-20
469	1089	2016-09-29
516	111	2016-10-21
*/

-- Que 25. Display the order date and categorize the orders based on the order date 'Old' for orders before 2016-05-01, 
-- 'Recent' for 2016-05-01 and onwards. 

SELECT order_id, order_date, 
CASE 
    WHEN order_date < '2016-05-01' THEN 'Old'
    ELSE 'Recent'
END AS order_category
from orders;

-- Que 26. Delete customers who haven’t placed any orders.
delete from customers
where customer_id not in( select customer_id from orders);

-- Que 27. Update the city of customers who have placed an order in 2016-08-29 to 'Updated City' and display customer's id.
UPDATE customers
SET city = 'Updated City'
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE order_date = '2016-08-29'
);
select customer_id from customers
where city ='Updated City';

-- Output
/*
447
1001
1295 
*/


create table employee( 
emp_id int primary key,
emp_name varchar(20) not null,
phone bigint unique check(length(phone)=10),
email varchar(20) default'abc@gmail.com');
