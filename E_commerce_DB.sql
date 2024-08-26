Create database E_commerce;
use E_commerce;
create table User(
User_Name varchar(20),
Password varchar(15),
First_Name varchar(15),
Last_Name varchar(15),
Email varchar(15));

alter table User add user_id int auto_increment primary key;
alter table User add created_at timestamp default current_timestamp;

create table categories(
category_id int auto_increment primary key,
category_name varchar(100) not null,
description text,
created_at timestamp default current_timestamp);

create table Products(
product_id int auto_increment primary key,
product_name varchar(100),
description text,
price decimal(10,2) not null,
stock int not null,
category_id int,
created_at timestamp default current_timestamp,
foreign key (category_id) references Categories(category_id));

create table Orders(
order_id int auto_increment primary key,
user_id int,
total_amount decimal(10,2) not null,
order_date timestamp default current_timestamp,
status varchar(50) not null default 'pending',
foreign key(user_id) references User(user_id));

create table OrderItems(
order_item_id int auto_increment primary key,
order_id int,
product_id int,
quantity int not null,
price decimal(10,2) not null,
foreign key (order_id) references Orders(order_id),
foreign key (product_id) references Products(product_id));

Create table Cart(
cart_id int auto_increment primary key,
user_id int,
product_id int,
quantity int not null default 1,
added_at timestamp default current_timestamp,
foreign key (user_id) references User(user_id),
foreign key (product_id) references Products(product_id));

create table Payment(
payment_id int auto_increment primary key,
order_id int,
amount decimal(10,2) not null,
payment_date timestamp default current_timestamp,
payment_method varchar(50),
status varchar(50) default 'Completed',
foreign key (order_id) references Orders(Order_id));

create table rating(
user_id int,
product_id int,
rating int check (rating between 1 and 5),
foreign key (product_id) references Products(product_id),
rating_date timestamp default current_timestamp,
foreign key(user_id) references User(user_id)
);

show tables;
                                                                                                                                                                                                                                                      
 
