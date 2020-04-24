-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: price-aggregator-backend.coxajyvhvlmg.us-east-1.rds.amazonaws.com:3306
-- Generation Time: Apr 20, 2020 at 11:56 PM
-- Server version: 10.2.21-MariaDB-log
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jacky_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS categoryBrand, productRetailer, retailers, products, brands, categories;

CREATE TABLE `brands` (
  `brandId` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(50) NOT NULL,
  UNIQUE KEY unique_brand(`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `catId` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(50) NOT NULL,
  UNIQUE KEY unique_cat(`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categoryBrand`
--

CREATE TABLE `categoryBrand` (
  `catId` int NOT NULL,
  `brandId` int NOT NULL,
  FOREIGN KEY (`catId`) REFERENCES `categories`(`catId`),
  FOREIGN KEY (`brandId`) REFERENCES `brands`(`brandId`),
  PRIMARY KEY (`catId`, `brandId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `name` varchar(256) NOT NULL,
  `upc` varchar(20) NOT NULL,
  `brandId` int NOT NULL,
  `catId` int NOT NULL,
  UNIQUE KEY unique_prod (`name`),
  FOREIGN KEY (`catId`) REFERENCES `categories`(`catId`),
  FOREIGN KEY (`brandId`) REFERENCES `brands`(`brandId`),
  PRIMARY KEY (`upc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `retailers`
--

CREATE TABLE `retailers` (
  `retailerId` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(50) NOT NULL,
  UNIQUE KEY unique_ret (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productRetailer`
--

CREATE TABLE `productRetailer` (
  `upc` varchar(20) NOT NULL,
  `retailerId` int NOT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `url` text(2048) DEFAULT NULL,
  FOREIGN KEY (`upc`) REFERENCES `products`(`upc`),
  FOREIGN KEY (`retailerId`) REFERENCES `retailers`(`retailerId`),
  PRIMARY KEY (`upc`, `retailerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
/*ALTER TABLE `brands`
  ADD PRIMARY KEY (`brandId`);

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for table `categoryBrand`
--
ALTER TABLE `categoryBrand`
  ADD CONSTRAINT `categoryBrand_fk_brand` FOREIGN KEY (`brandId`) REFERENCES `brands` (`brandId`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoryBrand_fk_category` FOREIGN KEY (`catId`) REFERENCES `categories` (`catId`) ON DELETE CASCADE;

--
-- Constraints for table `productRetailer`
--
ALTER TABLE `productRetailer`
  ADD CONSTRAINT `productRetailer_fk_brandProduct` FOREIGN KEY (`brandProdId`) REFERENCES `brandProduct` (`brandProdId`) ON DELETE CASCADE;
COMMIT;*/

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
