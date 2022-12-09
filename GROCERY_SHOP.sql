CREATE TABLE GROCER_SHOP(
	ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR NOT NULL
	
);
CREATE TABLE CUSTOMERS(
	ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR NOT NULL,
	ADDRESS VARCHAR NOT NULL,
	CONTACT INT NOT NULL,
	PASSWORD VACHAR UNIQUE NOT NULL,
	grocery_shop_id int not null,
	foreign key(grocery_shop_id) references grocery_shop(id)
	
);
CREATE TABLE VENDERS(
	ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR NOT NULL,
	PRICE INT NOT NULL,
	LOCATION VARCHAR NOT NULL,
	EMAIL UNIQUE NOT NULL,
	CONTACT VARCHAR NOT NULL,
	grocery_shop_id int not null,
	foreign key(grocery_shop_id) references grocery_shop(id)
	
);
CREATE TABLE PRODUCTS(
	ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR NOT NULL,
	PRICE INT NOT NULL,
	DESCRIPTION VARCHAR NOT NULL,
	IMAGE BYTEA UNIQUE NOT NULL,
	posted_by varchar not null,
	grocery_shop_id int not null,
	foreign key(grocery_shop_id) references grocery_shop(id),
	customers_id int not null,
	foreign key(customers_id) references customers(id),
	venders_id int not null,
	foreign key(venders_id) references venders(id)
);
CREATE TABLE ORDERS(
	ID INT PRIMARY KEY NOT NULL,
	STATUS VARCHAR NOT NULL,
	product_quantity varchar not null,
	product_id int not null,
	foreign key(grocery_shop_id) references grocery_shop(id),
	grocery_shop_id int not null,
	foreign key(grocery_shop_id) references grocery_shop(id),
	customers_id int not null,
	foreign key(customers_id) references customers(id),
	venders_id int not null,
	foreign key(venders_id) references venders(id)
);
CREATE TABLE DELIVERY(
	ID INT PRIMARY KEY NOT NULL,
	EMAIL UNIQUE NOT NULL,
	CONTACT VARCHAR NOT NULL,
	ORDERS_ID INT NOT NULL,
	DELIVERY_MAN VARCHAR NOT NULL
);
CREATE TABLE ADMINS(
	ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR NOT NULL,
	CONTACT VARCHAR NOT NULL,
	grocery_shop_id int not null,
	foreign key(grocery_shop_id) references grocery_shop(id)
);
CREATE TABLE CATEGORIES(
	ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR NOT NULL
);

CREATE TABLE CAKES(
	NAME VARCHAR NOT NULL,
	IMAGE BYTEA UNIQUE NOT NULL,
	PRICE INT NOT NULL,
	CATEGORY VARCHAR NOT NULL,
	DESCRIPTION VARCHAR NOT NULL,
	RECIPES VARCHAR NOT NULL,
	venders_id int not null,
	foreign key(venders_id) references venders(id)
);
CREATE TABLE USERS(
	ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR NOT NULL,
	USER_TYPE VARCHAR NOT NULL
);