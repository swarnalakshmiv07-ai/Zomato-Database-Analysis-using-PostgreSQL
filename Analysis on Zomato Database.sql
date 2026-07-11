--Analysis of the Zomato Database------------------------------------------------

--1)  Retrieve the list of tables in the zomato database.

select table_name
from information_schema.tables
where table_schema='public'
order by table_name;

--2) Retrieve the details of all the columns present in the table "Restaurants".

select * from Restaurants;

--3)  Retrieve the total price of all the orders. 

select order_id,total_price from Orders;

--4) Write an SQL query to get the ID, name and rating of all the restaurants with a rating of 4 or above.

select restaurant_id , name , rating
from Restaurants
where rating>=4;

--5)Write an SQL query to get all the orders which were not delivered.

select *  from Orders 
where order_status !='delivered';

--6) Write SQL queries to Fetch users who created their account after '2023-01-01' or live in 'Bangalore'


select * from Users
where created_at > '2023-01-01' OR  address='Bangalore';

--7) Write an SQL query to get all the undelivered orders after 2024-01-01.

select * from Orders
where order_date >'2024-01-01' AND order_status<> 'Delivered';

--8) Write an SQL query to get all the undelivered orders after 2024-01-01 sorted in the descending order of the total_price coloumn.


SELECT * from Orders
where order_status<> 'delivered' and order_date > '2024-01-01'
order by total_price DESC;

--9) Write an SQL query to get the list of users sorted in the descending order of their account creation dates.

select * from Users
order by created_at DESC;


--10) Write an SQL query to fetch only 10 reviews from the Reviews table.
select * from  Reviews
limit 10;

--11) Write an SQL query to get the following details of the top 10 most rated restaurants in Bangalore

-- Name

-- Locality

-- Cuisines

-- Average cost for two

-- Rating

select name,locality,cuisines,average_cost_for_two,rating
from Restaurants
where  city='Bangalore'
order by rating DESC
limit 10;

--12) Write the query to fetch the details of restaurants sorted in the descending order of rating.

-- Return only 15 rows

-- Skip the first 15 rows
select * from Restaurants
order by rating DESC
limit 15 
offset 15;

--13) Write a SQL query to calculate the total number of orders.

select count(*)  as total_orders from Orders;

--14) Write a SQL query to calculate the average rating of all orders.

select avg(rating) as average_rating from  Reviews;

--15) Write a SQL query to calculate the number of unique users 

select count(DISTINCT user_id)  as unique_users from Orders;

--16) Write a SQL query to calculate the average rating for each restaurant. 
select  restaurant_id , avg(rating) as average_rating
from Reviews
group by restaurant_id;

--17) Write a SQL query to count the total number of orders for each restaurant.

select  restaurant_id , count(order_id) as total_orders
from Orders
group by restaurant_id;

--18) Write a SQL query to calculate the total revenue for each restaurant.
select restaurant_id , sum(total_price) as total_revenue
from Orders
group by restaurant_id;

--19) Write a SQL query to find the lowest price of dishes for each restaurant.


select restaurant_id , min(price) as lowest_price
from Dishes
group by restaurant_id;

--20) Write a SQL query to count the number of unique customers for each restaurant.

select restaurant_id , count(DISTINCT user_id) as unique_customers
from Orders
group by restaurant_id;

--21) Write a SQL query to find restaurants with total revenue greater than 1000.

select restaurant_id , sum(total_price) as total_revenue from Orders
group by restaurant_id
having sum(total_price) > 1000;

--22) Write a SQL query to find cities where the number of orders exceeds 50. 

select r.city , count(o.order_id) as total_orders from Orders o
join  Restaurants r
on  o.restaurant_id = r.restaurant_id 
group by r.city
having count(o.order_id)> 50;

--23) Write a SQL query to fetch the name of the user, rating, and comment for the first 10 reviews in the Reviews table.


select 
      u.name,
      r.rating, 
      r.comment 
    from Users u
    join Reviews r
    on u.user_id = r.user_id
    order by r.review_id
    limit 10


--24) Write a SQL query to retrieve the coupon code, discount percentage, active status, and order ID for all coupons, including unused ones (not linked to any orders).

select 
      c.code,
      c.discount_percentage,
      c.is_active,
      oc.order_id
from  Order_Coupons oc
right join Coupons c
on c.coupon_id=oc.coupon_id
ORDER BY code DESC;

--25) Write a SQL query to generate a list of all combinations of dishes and restaurants.

 select d.name as dish_name , r.name as restaurant_name
 from Restaurants r
 cross join Dishes d

 --26) Write a SQL query to fetch the restaurant name and dish name for each restaurant and its associated dishes. 
 
select r.name as restaurant_name , d.name as dish_name
from Restaurants r
join Dishes d
on r.restaurant_id =d.restaurant_id;

--27) Write a SQL query to fetch the order ID, coupon code, and discount amount for each order that has a coupon applied.


select oc.order_id , c.code, oc.discount_amount
from Coupons c
join Order_Coupons oc
on c.coupon_id = oc.coupon_id;

--28) Write a SQL query to fetch the names of all active delivery partners and restaurants that are currently delivering.

select name 
from Delivery_Partners
where  active_status='1'
union 
select name  from Restaurants
where is_delivering_now ='yes';

--29) Write a SQL query to fetch the name and type of all active delivery partners and restaurants that are currently delivering.


SELECT 
    name AS entity_name,
    'Delivery Partner' AS entity_type
FROM Delivery_Partners
WHERE active_status = '1'

UNION

SELECT 
    name AS entity_name,
    'Restaurant' AS entity_type
FROM Restaurants
WHERE is_delivering_now = 'yes';


--30) Write a SQL query to identify all reviews with comments shorter than 10 characters.

select  rev.review_id , r.restaurant_id , rev.user_id , rev.rating , rev.comment 
from Restaurants r
join Reviews rev
on r.restaurant_id =rev.restaurant_id
where length(rev.comment) < 10;

--31) Write a SQL query to retrieve all restaurant IDs along with their full addresses by concatenating the city, locality, and address fields.

select restaurant_id , concat(city, ',' ,locality, ',' , address) as full_address
from Restaurants;

--32) Write a SQL query to retrieve all user IDs along with the year of their registration extracted from the created_at field. 

select user_id ,  substring(created_at,1,4)as registration_year from Users;

--33) Write a SQL query to retrieve all order delivery IDs and their corresponding unique performance label by concatenating the delivery partner's name, delivery status, and order delivery ID.

select od.order_delivery_id , concat(dp.name,' - ',od.delivery_status,' - ',od.order_delivery_id ) as unique_delivery_performance 
from Order_Delivery od
join Delivery_Partners dp
on od.partner_id=dp.partner_id;

--34) Write a SQL query to retrieve all dish names and their descriptions where the description contains the word "snack."

select name , description 
from dishes
where  description like '%Snack%';

--35) Write a SQL query to count the number of users whose email addresses end with "@gmail.com". 

select count(user_id) as gmail_users
from Users
where email like '%@gmail.com';

--36) Write an SQL query to fetch the names and email addresses of users who have placed at least one order from a restaurant rated 4.5 or higher.


select name, email 
from Users
where user_id in (select user_id 
                  from Orders 
                  where restaurant_id in (select restaurant_id 
				                          from Restaurants
				                          where rating>=4.5));


--37) Write an SQL query to fetch the order_id, user_id, total_price, and the average price of dishes in each order.

select o.order_id , o.user_id , o.total_price ,
(select avg(od.price) from Order_Details od where o.order_id=od.order_id) as avg_dish_price from Orders o;

--38) Write an SQL query to display the order_id, user_id, total_price, and the total cost of dishes for each order.

select o.order_id , o.user_id , o.total_price , 
      ( select sum(od.price * od.quantity )
from Order_Details od
where o.order_id=od.order_id) as total_dish_cost from Orders o;

--39) Write an SQL query to display the restaurant name and the price of the most expensive dish offered by that restaurant.

select r.name as restaurant_name , 
        (select max(d.price)
from Dishes d
where r.restaurant_id=d.restaurant_id) as max_dish_price from Restaurants r;

--40) Write an SQL query to retrieve the order_id and user_id for orders where the total_price is greater than the average total_price for that specific user.


select o1.order_id ,o1.user_id , o1.total_price
from Orders o1
where o1.total_price > (select avg(o2.total_price) 
from Orders o2 
where o1.user_id=o2.user_id);

--41) Write a query to retrieve the restaurant_id, name, and rating for restaurants whose rating is higher than the average rating for other restaurants offering the same cuisine.

select r1.restaurant_id , r1.name , r1.rating 
from Restaurants r1
where r1.rating > ( select avg(r2.rating) from Restaurants r2 where r1.cuisines =r2.cuisines)

--42) Write a query to retrieve user_id, restaurant_id, and total_price for users who have placed orders with a total_price greater than or equal to the average order price for that particular restaurant.

select o1.user_id , o1.restaurant_id ,o1.total_price
from Orders o1
where o1.total_price >= (select avg(o2.total_price)
from Orders o2 
where o1.restaurant_id =o2.restaurant_id);

--43) Write a SQL query to create a view called order_summary that joins the Users, Restaurants, and Orders tables to show the user_name, restaurant_name, and total_price for each order.

create view order_summary as 
select u.name as user_name , r.name as restaurant_name , o.total_price as total_price 
from Orders o 
join Users u
on o.user_id =  u.user_id
join Restaurants r
on o.restaurant_id = r.restaurant_id;

select * from order_summary;

--44) Write a SQL query to create a view called restaurant_ratings that shows the restaurant_name, rating, and cuisines for each restaurant.


create view restaurant_ratings as 
select name as restaurant_name , rating as rating 
, cuisines 
from Restaurants ;

select * from restaurant_ratings;

--45) Write a query to return the names of restaurants that have at least one review with a rating above the overall average rating of all reviews.
select distinct r.name  from Restaurants r
join Reviews rev 
on  r.restaurant_id=rev.restaurant_id
where rev.rating > (select avg(rating) from Reviews rev );

--46.1) Create a view to list restaurants with a rating greater than 4.
--46.2) Write a query that retrieves the user details (user_id and total spending) for users who have spent more than the average spending at high-rated restaurants.

drop view if exists  high_rated_restaurants;

create view  high_rated_restaurants as
select * from Restaurants where rating>4;


select user_id , sum(total_price) as total_spending
from Orders where restaurant_id in (select restaurant_id from high_rated_restaurants) 
group by user_id 
having sum(total_price) > (select avg(total_price) from Orders where restaurant_id in ( select restaurant_id from high_rated_restaurants ));


--47.1) Use a subquery to retrieve the restaurant_id of high-rated restaurants.Make use of the high_rated_restaurants view.
--47.2) Join the Orders and Users tables to display the user’s name and the total price of their orders.
--47.3) Filter the orders to only include those with a total price over 200.

drop view if exists  high_rated_restaurants;

create view  high_rated_restaurants as
select * from Restaurants where rating>4;


select u.name , o.total_price 
from Orders o
join Users u
on o.user_id =u.user_id
where total_price > 200 
and o.restaurant_id in (select restaurant_id from high_rated_restaurants );

--48) Create an index on the city column of the Restaurants table to improve the query performance.

create index indx_cty on Restaurants(city);

--49)  Explain and analyze the query before creating the indexes.
--     Create indexes on the restaurant_id columns in both Orders and Restaurants tables.
--     Re-run the query after creating the indexes and analyze the performance improvement.

CREATE INDEX idx_orders_restaurant_id
ON Orders(restaurant_id);

CREATE INDEX idx_restaurants_restaurant_id
ON Restaurants(restaurant_id);

EXPLAIN
SELECT o.order_id, r.name
FROM Orders o
JOIN Restaurants r
    ON o.restaurant_id = r.restaurant_id
WHERE r.city = 'Los Angeles';

