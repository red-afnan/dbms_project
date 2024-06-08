-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 09:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_date` datetime DEFAULT current_timestamp(),
  `total_bill` decimal(7,2) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `quantity`, `sale_date`, `total_bill`, `product_id`, `customer_id`) VALUES
(1, 5, '2024-06-06 17:20:21', 400.00, 1, 1),
(2, 3, '2024-06-06 17:20:21', 300.00, 2, 2),
(3, 8, '2024-06-06 17:20:21', 600.00, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `phone`, `address`) VALUES
(1, '+88017', 'Sadar road'),
(2, '+880188', 'college row'),
(3, '+34889', 'Nothullabaad');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `phone`, `address`) VALUES
(1, 'Abir', '+880170404', 'Sadar girls school r'),
(2, 'Apon', '+880188', 'c&b road'),
(3, 'Jasmin', '09349334', 'karim kutir');

-- --------------------------------------------------------

--
-- Table structure for table `dateexpired_products`
--

CREATE TABLE `dateexpired_products` (
  `dateexpired_products_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dateexpired_products`
--

INSERT INTO `dateexpired_products` (`dateexpired_products_id`, `product_id`, `expiry_date`) VALUES
(1, 2, '2024-06-03'),
(2, 3, '2024-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `delivery_boy_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_boy`
--

INSERT INTO `delivery_boy` (`delivery_boy_id`, `name`, `phone`) VALUES
(1, 'Opi', '+88019'),
(2, 'tarik', '+880188');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(30) NOT NULL,
  `job_title` varchar(15) NOT NULL,
  `joining_date` date NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(30) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_name`, `job_title`, `joining_date`, `phone`, `address`, `branch_id`) VALUES
(1, 'Rahman', 'manager', '2022-04-07', '+88017', 'Dhaka', 1),
(2, 'Kuddus', 'salesman', '2023-04-05', '+8801888345', 'Khulna', 2),
(3, 'Vuiya', 'Cleaner', '2024-07-01', '8801888765', 'Dumki', 3);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expenses_id` int(11) NOT NULL,
  `electricity_bill` decimal(7,2) NOT NULL,
  `water_bill` decimal(6,2) NOT NULL,
  `salary` decimal(9,2) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expenses_id`, `electricity_bill`, `water_bill`, `salary`, `branch_id`) VALUES
(1, 25000.00, 5000.00, 100000.00, 1),
(2, 15000.00, 4500.00, 120000.00, 2),
(3, 29000.00, 7000.00, 200000.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `online_orders`
--

CREATE TABLE `online_orders` (
  `Online_orders_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `online_orders`
--

INSERT INTO `online_orders` (`Online_orders_id`, `quantity`, `order_date`, `product_id`) VALUES
(1, 2, '2024-06-06 17:17:27', 2),
(2, 3, '2024-06-06 17:17:27', 3),
(3, 4, '2024-06-06 17:17:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(25) NOT NULL,
  `description` varchar(100) NOT NULL,
  `unit_price` decimal(5,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `description`, `unit_price`, `quantity`) VALUES
(1, 'Bread', 'Made of wheat and oven baked', 50.00, 30),
(2, 'Milk', 'organic and collected from our own farm', 120.00, 25),
(3, 'Biscuit', 'Homemade and oven baked', 30.00, 20);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(11) NOT NULL,
  `duty_time` enum('Day','Evening') NOT NULL,
  `employee_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shift_id`, `duty_time`, `employee_id`, `branch_id`) VALUES
(1, 'Day', 1, 1),
(2, 'Evening', 2, 2),
(3, 'Evening', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stockout_products`
--

CREATE TABLE `stockout_products` (
  `stockout_products_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `required_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stockout_products`
--

INSERT INTO `stockout_products` (`stockout_products_id`, `product_id`, `required_quantity`) VALUES
(1, 2, 10),
(2, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `address`, `phone`, `email`, `product_id`) VALUES
(1, 'Sahabuddin', 'natun bazar', '+88017', 's@gmail.com', 1),
(2, 'Amrita Dairy', 'Kashipur', '+880188', 'r@g mail .com', 2),
(3, 'Ettadi', 'Kaunia ', '+09349334', 'b@gmail.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `dateexpired_products`
--
ALTER TABLE `dateexpired_products`
  ADD PRIMARY KEY (`dateexpired_products_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`delivery_boy_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expenses_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `online_orders`
--
ALTER TABLE `online_orders`
  ADD PRIMARY KEY (`Online_orders_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `stockout_products`
--
ALTER TABLE `stockout_products`
  ADD PRIMARY KEY (`stockout_products_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dateexpired_products`
--
ALTER TABLE `dateexpired_products`
  MODIFY `dateexpired_products_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `delivery_boy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expenses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `online_orders`
--
ALTER TABLE `online_orders`
  MODIFY `Online_orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stockout_products`
--
ALTER TABLE `stockout_products`
  MODIFY `stockout_products_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `dateexpired_products`
--
ALTER TABLE `dateexpired_products`
  ADD CONSTRAINT `dateexpired_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`);

--
-- Constraints for table `online_orders`
--
ALTER TABLE `online_orders`
  ADD CONSTRAINT `online_orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `shift_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `stockout_products`
--
ALTER TABLE `stockout_products`
  ADD CONSTRAINT `stockout_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
