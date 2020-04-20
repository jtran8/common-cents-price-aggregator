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
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brandId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brandId`, `name`) VALUES
(1, 'Nintendo'),
(2, 'Sony'),
(3, 'Apple'),
(4, 'Samsung');

-- --------------------------------------------------------

--
-- Table structure for table `brandProduct`
--

CREATE TABLE `brandProduct` (
  `brandProdId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `prodId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brandProduct`
--

INSERT INTO `brandProduct` (`brandProdId`, `brandId`, `prodId`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 4),
(4, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catId`, `name`) VALUES
(1, 'Video Games'),
(2, 'Cell Phones'),
(3, 'Headphones');

-- --------------------------------------------------------

--
-- Table structure for table `categoryBrand`
--

CREATE TABLE `categoryBrand` (
  `catBrandId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoryBrand`
--

INSERT INTO `categoryBrand` (`catBrandId`, `catId`, `brandId`) VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 2),
(4, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prodId` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `upc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prodId`, `name`, `upc`) VALUES
(1, 'Switch Console with Neon Blue & Red Joy-Con', '045496882174'),
(2, 'Over-Ear Wireless Noise-Cancelling Headphones (WH1000XM3/B)', '027242911574'),
(3, 'Galaxy S20+ 5G Enabled 128GB (Unlocked) - Cosmic Black', '887276395968'),
(4, 'AirPods Pro', '190199246850');

-- --------------------------------------------------------

--
-- Table structure for table `productRetailer`
--

CREATE TABLE `productRetailer` (
  `prodRetailerId` int(11) NOT NULL,
  `brandProdId` int(11) NOT NULL,
  `price` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `retailer`
--

CREATE TABLE `retailer` (
  `retailerId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retailer`
--

INSERT INTO `retailer` (`retailerId`, `name`, `url`) VALUES
(1, 'Amazon', 'https://www.amazon.com/'),
(2, 'BestBuy', 'https://www.bestbuy.com/'),
(3, 'Target', 'https://www.target.com/'),
(4, 'Walmart', 'https://www.walmart.com/');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `brandProduct`
--
ALTER TABLE `brandProduct`
  ADD PRIMARY KEY (`brandProdId`),
  ADD KEY `brandProduct_fk_brand` (`brandId`),
  ADD KEY `brandProduct_fk_product` (`prodId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `categoryBrand`
--
ALTER TABLE `categoryBrand`
  ADD PRIMARY KEY (`catBrandId`),
  ADD KEY `categoryBrand_fk_category` (`catId`),
  ADD KEY `categoryBrand_fk_brand` (`brandId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodId`);

--
-- Indexes for table `productRetailer`
--
ALTER TABLE `productRetailer`
  ADD PRIMARY KEY (`prodRetailerId`),
  ADD KEY `productRetailer_fk_brandProduct` (`brandProdId`);

--
-- Indexes for table `retailer`
--
ALTER TABLE `retailer`
  ADD PRIMARY KEY (`retailerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brandProduct`
--
ALTER TABLE `brandProduct`
  MODIFY `brandProdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categoryBrand`
--
ALTER TABLE `categoryBrand`
  MODIFY `catBrandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productRetailer`
--
ALTER TABLE `productRetailer`
  MODIFY `prodRetailerId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retailer`
--
ALTER TABLE `retailer`
  MODIFY `retailerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brandProduct`
--
ALTER TABLE `brandProduct`
  ADD CONSTRAINT `brandProduct_fk_brand` FOREIGN KEY (`brandId`) REFERENCES `brand` (`brandId`) ON DELETE CASCADE,
  ADD CONSTRAINT `brandProduct_fk_product` FOREIGN KEY (`prodId`) REFERENCES `product` (`prodId`) ON DELETE CASCADE;

--
-- Constraints for table `categoryBrand`
--
ALTER TABLE `categoryBrand`
  ADD CONSTRAINT `categoryBrand_fk_brand` FOREIGN KEY (`brandId`) REFERENCES `brand` (`brandId`) ON DELETE CASCADE,
  ADD CONSTRAINT `categoryBrand_fk_category` FOREIGN KEY (`catId`) REFERENCES `category` (`catId`) ON DELETE CASCADE;

--
-- Constraints for table `productRetailer`
--
ALTER TABLE `productRetailer`
  ADD CONSTRAINT `productRetailer_fk_brandProduct` FOREIGN KEY (`brandProdId`) REFERENCES `brandProduct` (`brandProdId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
