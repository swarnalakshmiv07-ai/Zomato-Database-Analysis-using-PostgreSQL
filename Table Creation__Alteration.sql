--Zomato Databse

-- Create Tables
-- 1) Users

create table Users(
user_id int primary key,
name varchar(90),
email varchar(90),
phone varchar(20),
address varchar(40),
created_at timestamp
);

select * from Users;

--2) Restaurants

create table Restaurants(
restaurant_id int primary key,
name  varchar(90),
country_code  int,
city  varchar(50),
address  text,
locality varchar(70),
locality_verbose text,
cuisines  varchar(150),
currency  varchar(25),
has_table_booking varchar(5),
has_online_delivery varchar(5),
is_delivering_now varchar(5),
switch_to_order_menu varchar(5),
price_range int,
votes int,
average_cost_for_two decimal,
rating decimal
);

select * from Restaurants;

--3)Delivery_Partners

create table Delivery_Partners(
partner_id  int primary key,
name varchar(90),
phone varchar(25),
vehicle_number varchar(20),
rating decimal,
active_status boolean
);

select * from Delivery_Partners;

--4)Orders

create table Orders(
order_id int primary key,
user_id int,
restaurant_id int,
order_date timestamp,
order_status varchar(30),
delivery_time timestamp,
total_price decimal
);

select * from Orders;

--5) Order_Details

create table Order_Details(
order_detail_id int primary key,
order_id int,
dish_id int,
quantity int,
price decimal
);

select * from Order_Details;

--6) Dishes

create table Dishes(
dish_id int primary key,
restaurant_id int,
name varchar(150),
description text,
price decimal,
available boolean,
calories int
);

--7) Payments

create table Payments(
payment_id int primary key,
order_id int,
amount decimal,
payment_method varchar(20),
payment_status varchar(30),
payment_date timestamp
);

select * from Payments;

--8)Coupons

create table Coupons(
coupon_id int primary key,
code varchar(20),
discount_percentage decimal,
expiration_date date,
minimum_order_amount decimal,
is_active boolean
);

select * from Coupons;

--9.Order_Coupons

create table Order_Coupons(
order_coupon_id int primary key,
order_id int,
coupon_id int,
discount_amount decimal
);

select * from Order_Coupons;

--10.Order_Delivery

create table Order_Delivery(
order_delivery_id int primary key,
order_id int,
partner_id int,
delivery_start_time timestamp,
delivery_end_time timestamp,
delivery_status varchar(30)
);

select * from Order_Delivery;

--11.Reviews

create table Reviews(
review_id int primary key,
restaurant_id int,
user_id int,
rating decimal,
comment text,
review_date date
);

select * from Reviews;


---------------------------------------------------------------------------------
-- Foreign key-------------------------------------------------------------------

--(Users-Orders)
alter table Orders
add constraint fk_userid
foreign key (user_id)
references Users(user_id);

-- (Restaurants - Orders)
alter table Orders
add constraint fk_restaurantid
foreign key (restaurant_id)
references Restaurants(restaurant_id);


--(Orders - Order_Details)
alter table Order_Details
add constraint fk_orderid
foreign key (order_id)
references Orders(order_id);

--(Dishes - Order_Details)
alter table Order_Details
add constraint fk_dishid
foreign key (dish_id)
references Dishes(dish_id);

--(Orders - Payments)
alter table Payments
add constraint fk_orderid
foreign key (order_id)
references Orders(order_id);

--(Coupons - Order_Coupons)
alter table Order_Coupons
add constraint fk_couponid
foreign key (coupon_id)
references Coupons(coupon_id);

--(Orders - Order_Coupons)
alter table Order_Coupons
add constraint fk_orderid
foreign key (order_id)
references Orders(order_id);

--(Delivery_Partners - Order_Delivery)
alter table Order_Delivery
add constraint fk_partnerid
foreign key (partner_id)
references Delivery_Partners(partner_id);

--(Orders - Order_Delivery)
alter table Order_Delivery
add constraint fk_orderid
foreign key (order_id)
references Orders(order_id);

--(Restaurants - Reviews)
alter table Reviews
add constraint fk_restaurantid
foreign key(restaurant_id)
references Restaurants(restaurant_id);

--(Users - Reviews)
alter table Reviews 
add constraint fk_userid
foreign key (user_id)
references Users(user_id);


--Relationships is done -----------------------------------------------------------
--Now CSV file imporing is done.-------------------------------------------------









