----Grocery store management system----

    CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT , 
	product_name VARCHAR(25) NOT NULL , 
	description VARCHAR(100) NOT NULL , 
	unit_price DECIMAL(5,2) NOT NULL , 
	quantity INT NOT NULL
	);
	
	
	CREATE TABLE customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT , 
	customer_name VARCHAR(30) NOT NULL , 
	phone VARCHAR(15) NOT NULL , 
	address VARCHAR(20) NOT NULL
	);

    CREATE TABLE supplier(
supplier_id INT PRIMARY KEY AUTO_INCREMENT , 
supplier_name VARCHAR(20) NOT NULL , 
address VARCHAR(20) NOT NULL , 
phone VARCHAR(15) NOT NULL , 
email VARCHAR(30) NOT NULL , 
product_id INT NOT NULL,
FOREIGN KEY (product_id) REFERENCES product(product_id) 
);


CREATE TABLE employee(
employee_id INT PRIMARY KEY AUTO_INCREMENT , 
employee_name VARCHAR(30) NOT NULL , 
job_title VARCHAR(15) NOT NULL , 
joining_date DATE NOT NULL , 
phone VARCHAR(15) NOT NULL,  
address VARCHAR(30) NOT NULL,
branch_id INT NOT NULL,
FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);


CREATE TABLE bill(
bill_id INT PRIMARY KEY AUTO_INCREMENT , 
quantity INT NOT NULL , 
sale_date DATETIME DEFAULT CURRENT_TIMESTAMP, 
total_bill DECIMAL(7,2) NOT NULL , 
product_id INT NOT NULL , 
customer_id INT NOT NULL,
FOREIGN KEY (product_id) REFERENCES product(product_id),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


CREATE TABLE branch(
branch_id INT PRIMARY KEY AUTO_INCREMENT , 
phone VARCHAR(15) NOT NULL , 
address VARCHAR(30) NOT NULL 
);

CREATE TABLE stockout_products(
stockout_products_id INT PRIMARY KEY AUTO_INCREMENT , 
product_id INT NOT NULL , 
required_quantity INT NOT NULL,
FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE dateexpired_products(
dateexpired_products_id INT PRIMARY KEY AUTO_INCREMENT , 
product_id INT NOT NULL , 
expiry_date DATE NOT NULL,
FOREIGN KEY (product_id) REFERENCES product(product_id)
);


CREATE TABLE online_orders (
    Online_orders_id INT PRIMARY KEY AUTO_INCREMENT,
	quantity INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP, 
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE delivery_boy (
delivery_boy_id INT PRIMARY KEY AUTO_INCREMENT , 
name VARCHAR(20) NOT NULL , 
phone VARCHAR(15) NOT NULL
);


CREATE TABLE expenses (
expenses_id INT PRIMARY KEY AUTO_INCREMENT , 
electricity_bill DECIMAL(7,2) NOT NULL , 
water_bill DECIMAL(6,2) NOT NULL , 
salary DECIMAL(9,2) NOT NULL,
branch_id INT NOT NULL,
FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);


CREATE TABLE shift (
shift_id INT PRIMARY KEY AUTO_INCREMENT , 
duty_time ENUM('Day','Evening') NOT NULL , 
employee_id INT NOT NULL , 
branch_id INT NOT NULL,
FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);



INSERT INTO `product` (`product_id`, `product_name`, `description`, `unit_price`, `quantity`) 
VALUES (NULL, 'Bread', 'Made of wheat and oven baked', '50', '30'), 
(NULL, 'Milk', 'organic and collected from our own farm', '120', '25'),
(NULL, 'Biscuit', 'Homemade and oven baked', '30', '20');

INSERT INTO `customer` (`customer_id`, `customer_name`, `phone`, `address`) 
VALUES (NULL, 'Abir', '+880170404', 'Sadar girls school road '), 
(NULL, 'Apon', '+880188', 'c&b road'), 
(NULL, 'Jasmin', '09349334', 'karim kutir');

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `address`, `phone`, `email`, `product_id`) 
VALUES (NULL, 'Sahabuddin', 'natun bazar', '+88017', 's@gmail.com', '1'), 
(NULL, 'Amrita Dairy', 'Kashipur', '+880188', 'r@g mail .com', '2'), 
(NULL, 'Ettadi', 'Kaunia ', '+09349334', 'b@gmail.com', '1');

INSERT INTO `branch` (`branch_id`, `phone`, `address`) 
VALUES (NULL, '+88017', 'Sadar road'), 
(NULL, '+880188', 'college row'), 
(NULL, '+34889', 'Nothullabaad');

INSERT INTO `employee` (`employee_id`, `employee_name`, `job_title`, `joining_date`, `phone`, `address`, `branch_id`) 
VALUES (NULL, 'Rahman', 'manager', '2022-04-07', '+88017', 'Dhaka', '1'), 
(NULL, 'Kuddus', 'salesman', '2023-04-05', '+8801888345', 'Khulna', '2'), 
(NULL, 'Vuiya', 'Cleaner', '2024-07-01', '8801888765', 'Dumki', '3');


INSERT INTO `stockout_products` (`stockout_products_id`, `product_id`, `required_quantity`) 
VALUES (NULL, '2', '10'), 
(NULL, '1', '15');

INSERT INTO `dateexpired_products` (`dateexpired_products_id`, `product_id`, `expiry_date`) 
VALUES (NULL, '2', '2024-06-03'), 
(NULL, '3', '2024-06-02');

INSERT INTO `online_orders` (`Online_orders_id`, `quantity`, `order_date`, `product_id`) 
VALUES (NULL, '2', current_timestamp(), '2'), 
(NULL, '3', current_timestamp(), '3'), 
(NULL, '4', current_timestamp(), '1');

INSERT INTO `delivery_boy` (`delivery_boy_id`, `name`, `phone`) 
VALUES (NULL, 'Opi', '+88019'), 
(NULL, 'tarik', '+880188');

INSERT INTO `bill` (`bill_id`, `quantity`, `sale_date`, `total_bill`, `product_id`, `customer_id`) 
VALUES (NULL, '5', current_timestamp(), '400', '1', '1'), 
(NULL, '3', current_timestamp(), '300', '2', '2'), 
(NULL, '8', current_timestamp(), '600', '3', '3');

INSERT INTO `expenses` (`expenses_id`, `electricity_bill`, `water_bill`, `salary`, `branch_id`) 
VALUES (NULL, '25000', '5000', '100000', '1'), 
(NULL, '15000', '4500', '120000', '2'), 
(NULL, '29000', '7000', '200000', '3');

INSERT INTO `shift` (`shift_id`, `duty_time`, `employee_id`, `branch_id`) 
VALUES (NULL, 'Day', '1', '1'), 
(NULL, 'Evening', '2', '2'), 
(NULL, 'Evening', '3', '3');

