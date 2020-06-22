-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: price-aggregator-backend.coxajyvhvlmg.us-east-1.rds.amazonaws.com    Database: common_cents
-- ------------------------------------------------------
-- Server version	10.2.21-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `brandId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`brandId`),
  UNIQUE KEY `unique_brand` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (3,'Apple'),(13,'Bose'),(8,'Cuisinart'),(12,'Dyson'),(14,'Google'),(7,'Hamilton Beach'),(10,'Honeywell'),(5,'Keurig'),(9,'Mr. Coffee'),(6,'Nespresso'),(1,'Nintendo'),(4,'Samsung'),(2,'Sony'),(11,'Vornado'),(15,'Warner Bros. Games');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `catId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`catId`),
  UNIQUE KEY `unique_cat` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'Cell Phones'),(4,'Coffee Makers'),(5,'Fans'),(2,'Headphones'),(1,'Video Games');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoryBrand`
--

DROP TABLE IF EXISTS `categoryBrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoryBrand` (
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  PRIMARY KEY (`catId`,`brandId`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `categoryBrand_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`catId`),
  CONSTRAINT `categoryBrand_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brands` (`brandId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoryBrand`
--

LOCK TABLES `categoryBrand` WRITE;
/*!40000 ALTER TABLE `categoryBrand` DISABLE KEYS */;
INSERT INTO `categoryBrand` VALUES (1,1),(1,2),(1,15),(2,2),(2,3),(2,4),(2,13),(3,3),(3,4),(3,14),(4,5),(4,6),(4,7),(4,8),(4,9),(5,10),(5,11),(5,12);
/*!40000 ALTER TABLE `categoryBrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productRetailer`
--

DROP TABLE IF EXISTS `productRetailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productRetailer` (
  `upc` varchar(20) NOT NULL,
  `retailerId` int(11) NOT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `url` text DEFAULT NULL,
  PRIMARY KEY (`upc`,`retailerId`),
  KEY `productRetailer_ibfk_2` (`retailerId`),
  CONSTRAINT `productRetailer_ibfk_1` FOREIGN KEY (`upc`) REFERENCES `products` (`upc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productRetailer_ibfk_2` FOREIGN KEY (`retailerId`) REFERENCES `retailers` (`retailerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productRetailer`
--

LOCK TABLES `productRetailer` WRITE;
/*!40000 ALTER TABLE `productRetailer` DISABLE KEYS */;
INSERT INTO `productRetailer` VALUES (' 887276346526',1,1096.00,'https://www.amazon.com/dp/B07V4H4FBL/ref=twister_B0829Q1NQP?_encoding=UTF8&psc=1'),(' 887276346526',2,1049.99,'https://www.bestbuy.com/site/samsung-galaxy-note10-with-256gb-memory-cell-phone-unlocked-aura-black/6359978.p?skuId=6359978'),(' 887276346526',3,834.00,'https://www.newegg.com/p/23B-0002-00CX5?Description=samsung%20galaxy%20note&cm_re=samsung_galaxy_note-_-9SIAJ3AA3T7660-_-Product'),('086279078537',1,99.95,'https://www.amazon.com/Cuisinart-DCC-3200-PerfecTemp-Programmable-Coffeemaker/dp/B00MVWGQX0'),('086279078537',4,109.95,'https://www.walmart.com/ip/PerfecTemp-14-Cup-Programmable-Coffeemaker-DCC-3200/47005005'),('086279078537',5,99.99,'https://www.target.com/p/cuisinart-perfectemp-14-cup-programmable-coffee-maker-stainless-steel-dcc-3200/-/A-21398008'),('17817703277',1,229.00,'https://www.amazon.com/Bose-SoundLink-around-ear-wireless-headphones/dp/B0117RGG8E'),('17817703277',4,229.00,'https://www.walmart.com/ip/Bose-SoundLink-Around-Ear-Wireless-Bluetooth-Headphones-II-Black/167413326'),('17817703277',5,229.99,'https://www.target.com/p/bose-soundlink-around-ear-wireless-headphones/-/A-78804364?preselect=49179114#lnk=sametab'),('17817731355',1,99.00,'https://www.amazon.com/Bose-SoundSport-Wireless-Headphones-761529-0010/dp/B01L7PSJFO'),('17817731355',2,99.00,'https://www.bestbuy.com/site/bose-soundsport-wireless-in-ear-headphones-black/5168600.p?skuId=5168600'),('17817731355',5,99.99,'https://www.target.com/p/bose-soundsport-wireless-headphones/-/A-51122449?preselect=51118143#lnk=sametab'),('17817770613',1,349.00,'https://www.amazon.com/Bose-QuietComfort-Wireless-Headphones-Cancelling/dp/B0756CYWWD'),('17817770613',4,349.00,'https://www.walmart.com/ip/Bose-QuietComfort-35-Wireless-Noise-Cancelling-Headphones-II-with-Google-Assistant-Black/602445423'),('17817770613',5,349.99,'https://www.target.com/p/bose-quietcomfort-35-wireless-headphones-ii/-/A-52955552?preselect=52791828#lnk=sametab'),('17817796163',1,399.00,'https://www.amazon.com/Bose-Cancelling-Wireless-Bluetooth-Headphones/dp/B07Q9MJKBV'),('17817796163',4,399.00,'https://www.walmart.com/ip/Bose-Noise-Cancelling-Headphones-700-with-Google-Assistant-Black/932544113'),('17817796163',5,399.99,'https://www.target.com/p/bose-noise-cancelling-over-ear-headphones-700/-/A-78679757?preselect=76486318#lnk=sametab'),('190199220355',2,699.99,'https://www.bestbuy.com/site/apple-iphone-11-with-64gb-memory-cell-phone-unlocked-black/6223303.p?skuId=6223303'),('190199220355',3,799.95,'https://www.newegg.com/apple-iphone-11-6-1-4g-lte/p/23B-000A-00AW5?Description=iphone%2011&cm_re=iphone_11-_-9SIAAM8AT49944-_-Product'),('190199220355',4,699.00,'https://www.walmart.com/ip/Straight-Talk-Apple-iPhone-11-Prepaid-with-64GB-Black/962829984?variantFieldId=actual_color'),('190199220447',1,749.00,'https://www.amazon.com/dp/B084GW2C77'),('190199220447',2,749.99,'https://www.bestbuy.com/site/apple-iphone-11-128gb-yellow-unlocked/5613850.p?skuId=5613850'),('190199220447',3,849.99,'https://www.newegg.com/apple-iphone-11-6-1-4g-lte-yellow/p/N82E16875113486?Description=iphone%2011%20yellow%20128&cm_re=iphone_11_yellow_128-_-9SIANV8BM88808-_-Product&quicklink=true'),('190199246850',1,234.95,'https://www.amazon.com/Apple-MWP22AM-A-AirPods-Pro/dp/B07ZPC9QD4?ref_=ast_sto_dp'),('190199246850',2,249.99,'https://www.bestbuy.com/site/apple-airpods-pro-white/5706659.p?skuId=5706659'),('190199246850',3,234.00,'https://www.newegg.com/apple-mwp22am-a-0130-true-wireless/p/0TH-00CT-001Z6?Description=AIRPODS%20PRO&cm_re=AIRPODS_PRO-_-0TH-00CT-001Z6-_-Product&quicklink=true'),('190199246850',4,234.95,'https://www.walmart.com/ip/Apple-AirPods-Pro/520468661'),('190199246850',5,249.99,'https://www.target.com/p/apple-airpods-pro/-/A-54191101'),('190199380554',1,1099.00,'https://www.amazon.com/dp/B084GSPKMV'),('190199380554',3,1044.00,'https://www.newegg.com/p/23M-0003-01923'),('190199380554',4,1099.00,'https://www.walmart.com/ip/Total-Wireless-Apple-iPhone-11-Pro-Max-Prepaid-with-64G-Space-Gray/616926759'),('190199503502',2,349.99,'https://www.bestbuy.com/site/apple-iphone-se-2nd-generation-64gb-unlocked-white/6389070.p?skuId=6389070'),('190199503502',4,399.00,'https://www.walmart.com/ip/Unlocked-Apple-iPhone-SE-2020-w-64GB-White/368933225'),('190199503502',5,399.00,'https://www.target.com/p/apple-iphone-se-2nd-generation-unlocked/-/A-79860500?preselect=79860211#lnk=sametab'),('190199503519',2,349.99,'https://www.bestbuy.com/site/apple-iphone-se-2nd-generation-64gb-unlocked-productred/6389071.p?skuId=6389071'),('190199503519',4,399.00,'https://www.walmart.com/ip/Unlocked-Apple-iPhone-SE-2020-w-64GB-PRODUCT-RED/573038381'),('190199503519',5,399.00,'https://www.target.com/p/apple-iphone-se-2nd-generation-unlocked-64gb-product-red/-/A-79860212'),('190199503526',2,349.99,'https://www.bestbuy.com/site/apple-iphone-se-2nd-generation-64gb-unlocked-black/6389069.p?skuId=6389069'),('190199503526',4,399.00,'https://www.walmart.com/ip/Unlocked-Apple-iPhone-SE-2020-w-64GB-Black/519463028'),('190199503526',5,399.00,'https://www.target.com/p/apple-iphone-se-2nd-generation-64gb-black/-/A-79691961'),('21614999917',1,199.20,'https://www.amazon.com/Nespresso-VertuoPlus-Espresso-DeLonghi-Aeroccino/dp/B01N1QSB6J'),('21614999917',4,199.20,'https://www.walmart.com/ip/Nespresso-VertuoPlus-Deluxe-Coffee-and-Espresso-Maker-by-De-Longhi-with-Aeroccino-Black/912153046'),('21614999917',5,199.20,'https://www.target.com/p/nespresso-vertuo-plus-deluxe-espresso-and-coffee-maker-bundle-black/-/A-52213013'),('27242908727',1,128.00,'https://www.amazon.com/Sony-WH-CH700N-Canceling-Headphones-WHCH700N/dp/B079GPFLT1'),('27242908727',4,128.00,'https://www.walmart.com/ip/Sony-WH-CH700N-Wireless-Noise-Canceling-Over-Ear-Headphones-Black/617546364'),('27242908727',5,199.99,'https://www.target.com/p/sony-noise-cancelling-headphones-black-whch700n-b/-/A-53334681'),('27242911574',1,348.00,'https://www.amazon.com/Sony-Noise-Cancelling-Headphones-WH1000XM3/dp/B07G4MNFS1?ref_=ast_sto_dp'),('27242911574',2,349.99,'https://www.bestbuy.com/site/sony-wh-1000xm3-wireless-noise-cancelling-over-the-ear-headphones-with-google-assistant-black/6280544.p?skuId=6280544'),('27242911574',5,349.99,'https://www.upcitemdb.com/norob/alink/?id=w2u2231333338444t2&tid=1&seq=1588874924&plt=b7e6633bfed02fc122fbfcc6579b6e13'),('27242914797',1,248.00,'https://www.amazon.com/Sony-WH-XB900N-Wireless-Canceling-Headphones/dp/B07RM8WQ8G'),('27242914797',2,249.99,'https://www.bestbuy.com/site/sony-wh-xb900n-wireless-noise-cancelling-over-the-ear-headphones-black/6347796.p?skuId=6347796'),('27242914797',5,249.99,'https://www.target.com/p/sony-wireless-noise-cancelling-on-ear-headphones-black-whxb900n-b/-/A-76486314'),('27242918832',1,128.00,'https://www.amazon.com/Sony-Headphones-Bluetooth-Technology-WFXB700/dp/B085VQFZ8Z'),('27242918832',2,129.99,'https://www.bestbuy.com/site/sony-wfxb700-true-wireless-headphones-black/6408362.p?skuId=6408362'),('27242918832',5,129.99,'https://www.target.com/p/sony-true-wireless-earbuds-black-wfxb700-b/-/A-79757335'),('40094499403',1,99.99,'https://www.amazon.com/Hamilton-Beach-49976-Single-Serve-Programmable/dp/B06Y2WCHDV'),('40094499403',4,99.00,'https://www.walmart.com/ip/2-Way-49954-Ground-Maker-Pods-Coffee-Compatible-Serve-Full-Pot-Beach-Programmable-Single-Hamilton-Coffee-Model-FlexBrew/511290968'),('40094499403',5,99.99,'https://www.target.com/p/hamilton-beach-2-way-flex-brew-single-serve-coffee-maker-49954/-/A-52212831'),('43765004135',1,46.94,'https://www.amazon.com/Vornado-CR1-0073-06-Small-Whole-Circulator/dp/B000MTVGOI?th=1'),('43765004135',4,46.94,'https://www.walmart.com/ip/Vornado-7-530-Compact-Whole-Room-Air-Circulator-Fan-Linen-White/39882358?selected=true'),('43765004135',5,48.49,'https://www.target.com/p/vornado-530-compact-air-circulator-fan-linen-white/-/A-14054001'),('43765005422',1,99.99,'https://www.amazon.com/Vornado-CR1-0121-06-Large-Whole-Circulator/dp/B0025QKUE8'),('43765005422',4,129.99,'https://www.walmart.com/ip/Vornado-660-Whole-Room-Air-Circulator-Fan-Black/13423127'),('43765005422',5,99.99,'https://www.target.com/p/vornado-660-large-air-circulator/-/A-52301974?preselect=52273747#lnk=sametab'),('43765006603',1,59.99,'https://www.amazon.com/Vornado-Whole-Room-Tower-Circulator/dp/B006PCLR5Y'),('43765006603',4,59.99,'https://www.walmart.com/ip/Vornado-29-143-Whole-Room-Air-Circulator-Tower-Fan-Black/39086171'),('43765006603',5,59.99,'https://www.target.com/p/vornado-29-34-143-whole-room-air-circulator-tower-fan-with-remote-black/-/A-13829143'),('43765009482',1,23.94,'https://www.amazon.com/Vornado-Flippi-Personal-Oscillating-Circulator/dp/B000YKH0AE'),('43765009482',4,23.94,'https://www.walmart.com/ip/Vornado-4-5-Flippi-V8-Personal-Air-Circulator-Fan-Black/13423120'),('43765009482',5,24.99,'https://www.target.com/p/vornado-flippi-v8-oscillating-personal-air-circulator-fan-black/-/A-14054010'),('43765010129',1,125.58,'https://www.amazon.com/Vornado-6303DC-Circulator-Variable-Control/dp/B01C41BDKI'),('43765010129',4,189.51,'https://www.walmart.com/ip/Vornado-6303DC-Ice-White-9-Diameter-485-Cfm-Variable-Speed-Floor-Fan/543174237'),('43765010129',5,139.99,'https://www.target.com/p/vornado-6303dc-energy-smart-medium-air-circulator-fan-with-remote-white/-/A-51007062'),('43765010471',1,44.99,'https://www.amazon.com/Vornado-CR1-0253-06-Small-Whole-Circulator/dp/B01BF3XTX0'),('43765010471',4,49.97,'https://www.walmart.com/ip/Vornado-Fans-460-3SPD-BLK-Circ-Fan-4-Pack/152302943?selected=true'),('43765010471',5,49.99,'https://www.target.com/p/vornado-460-small-air-circulator/-/A-52301970?preselect=52273732#lnk=sametab'),('43765011751',1,99.99,'https://www.amazon.com/Vornado-Oscillating-Circulator-Oscillation-Controls/dp/B078HZM2JP'),('43765011751',4,139.99,'https://www.walmart.com/ip/Vornado-OSCR37-37-Inch-Tower-V-Flow-Whole-Room-4-Speed-Adjustable-Circulator/493157912'),('43765011751',5,99.99,'https://www.target.com/p/vornado-37-34-oscr37-oscillating-tower-fan-black/-/A-76486655'),('45496590420',2,59.99,'https://www.bestbuy.com/site/the-legend-of-zelda-breath-of-the-wild-nintendo-switch/5721500.p?skuId=5721500'),('45496590420',4,54.99,'https://www.walmart.com/ip/The-Legend-of-Zelda-Breath-of-the-Wild-Nintendo-Nintendo-Switch-045496590420/55432568'),('45496590420',5,54.99,'https://www.target.com/p/the-legend-of-zelda-breath-of-the-wild-nintendo-switch/-/A-52161264'),('45496592998',2,59.99,'https://www.bestbuy.com/site/super-smash-bros-ultimate-nintendo-switch/5723319.p?skuId=5723319'),('45496592998',4,59.90,'https://www.walmart.com/ip/Super-Smash-Bros-Ultimate-Nintendo-Nintendo-Switch-045496592998/467273231'),('45496592998',5,59.99,'https://www.target.com/p/super-smash-bros-ultimate-nintendo-switch/-/A-53494594'),('45496596439',2,59.99,'https://www.bestbuy.com/site/animal-crossing-new-horizons-nintendo-switch/5723316.p?skuId=5723316'),('45496596439',4,59.98,'https://www.walmart.com/ip/Animal-Crossing-New-Horizons-Nintendo-Nintendo-Switch-045496596439/720388718'),('45496596439',5,59.99,'https://www.target.com/p/animal-crossing-new-horizons-8211-nintendo-switch/-/A-76780148'),('45496882174',2,299.99,'https://www.bestbuy.com/site/nintendo-switch-32gb-console-neon-red-neon-blue-joy-con/6364255.p?skuId=6364255'),('45496882174',5,299.99,'https://www.target.com/p/nintendo-switch-with-neon-blue-and-neon-red-joy-con/-/A-77464001'),('53891129725',1,35.99,'https://www.amazon.com/Mr-Coffee-Programmable-Dishwashable-Filtration/dp/B07VD4PW3V'),('53891129725',4,49.99,'https://www.walmart.com/ip/Mr-Coffee-12-Cup-Programmable-Coffee-Maker-with-Dishwashable-Design-Advanced-Water-Filtration-Black-Chrome/734984585'),('53891129725',5,35.99,'https://www.target.com/p/mr-coffee-12-cup-programmable-coffee-maker-with-dishwashable-design-bvmc-lmx120/-/A-54617167'),('611247355985',1,79.00,'https://www.amazon.com/Keurig-K55-K-Classic-Coffee-Programmable/dp/B018UQ5AMS'),('611247355985',4,79.00,'https://www.walmart.com/ip/Keurig-K-Classic-Single-Serve-K-Cup-Pod-Coffee-Maker-Black/49800185'),('611247355985',5,119.99,'https://www.target.com/p/keurig-k-classic-single-serve-k-cup-pod-coffee-maker/-/A-50981282?preselect=50700747#lnk=sametab'),('611247369449',1,152.49,'https://www.amazon.com/Keurig-K-Elite-Strength-Temperature-Capability/dp/B0788F3R8X'),('611247369449',4,167.80,'https://www.walmart.com/ip/Keurig-K-Elite-Single-Serve-K-Cup-Pod-Coffee-Maker-Brushed-Silver/564807397?selected=true'),('611247369449',5,169.99,'https://www.walmart.com/ip/Keurig-K-Elite-Single-Serve-K-Cup-Pod-Coffee-Maker-Brushed-Silver/564807397?selected=true'),('611247373378',1,189.99,'https://www.amazon.com/Keurig-Single-Serve-K-Cup-Special/dp/B07J5FV7WS'),('611247373378',4,218.99,'https://www.walmart.com/ip/Keurig-K-Cafe-Special-Edition-Single-Serve-K-Cup-Pod-Coffee-Latte-and-Cappuccino-Maker-Nickel/354978330'),('611247373378',5,219.99,'https://www.target.com/p/keurig-k-cafe-special-edition-single-serve-k-cup-pod-coffee-latte-and-cappuccino-maker-nickel/-/A-53536794'),('611247375358',1,79.99,'https://www.amazon.com/Keurig-K-Mini-Single-Serve-Coffee/dp/B07N3G8GRY?th=1'),('611247375358',4,79.99,'https://www.walmart.com/ip/Keurig-K-Mini-Single-Serve-K-Cup-Pod-Coffee-Maker-6-to-12-oz-Brew-Sizes-Studio-Gray/889266703?selected=true'),('611247375358',5,89.99,'https://www.target.com/p/keurig-k-mini-single-serve-k-cup-pod-coffee-maker/-/A-53788870?preselect=54222546#lnk=sametab'),('611247379837',1,189.99,'https://www.amazon.com/Keurig-K-Duo-Plus-Coffee-Compatible/dp/B07P5W3J29'),('611247379837',4,228.99,'https://www.walmart.com/ip/Keurig-K-Duo-Plus-Coffee-Maker-with-Single-Serve-K-Cup-Pod-and-12-Cup-Carafe-Brewer-Black/629084823'),('611247379837',5,199.99,'https://www.target.com/p/keurig-k-duo-plus-single-serve-38-carafe-coffee-maker/-/A-76626393'),('711719519102',1,59.99,'https://www.amazon.com/dp/B07DJRFSDF?ref_=ast_sto_dp'),('711719519102',4,59.99,'https://www.walmart.com/ip/The-Last-of-Us-Part-II-Sony-PlayStation-4-711719519102/839659063'),('711719519102',5,59.99,'https://www.target.com/p/the-last-of-us-part-ii-playstation-4/-/A-78382925'),('711719521099',2,399.99,'https://www.bestbuy.com/site/sony-playstation-4-pro-console-jet-black/5388900.p?skuId=5388900'),('711719521099',4,399.00,'https://www.walmart.com/ip/Sony-PlayStation-4-Pro-1TB-Gaming-Console-Wireless-Game-Pad-Black/741505081'),('711719521099',5,399.99,'https://www.target.com/p/playstation-4-pro-1tb-console/-/A-51610033'),('711719537984',1,59.99,'https://www.amazon.com/Ghost-Tsushima-Launch-PlayStation-4/dp/B085JSJFGK?ref_=ast_sto_dp&th=1'),('711719537984',4,59.99,'https://www.walmart.com/ip/Ghost-of-Tsushima-Launch-Edition-Sony-PlayStation-4/555861376'),('711719537984',5,59.99,'https://www.target.com/p/ghost-of-tsushima-launch-edition-playstation-4/-/A-79700262'),('72179231042',1,69.99,'https://www.amazon.com/Mr-Coffee-Optimal-Coffeemaker-BVMC-PSTX91-RB/dp/B0037ZG3DS'),('72179231042',4,69.99,'https://www.walmart.com/ip/Mr-Coffee-Classic-Coffee-10-Cup-Thermal-Coffee-Maker/14320818'),('72179231042',5,69.99,'https://www.target.com/p/mr-coffee-10-cup-programmable-thermal-coffee-maker-bvmc-pstx91/-/A-12225853'),('842776111210',1,448.00,'https://www.amazon.com/Google-Pixel-Memory-Phone-Unlocked/dp/B07R5CJDD7'),('842776111210',2,429.99,'https://www.bestbuy.com/site/google-pixel-3a-xl-64gb-unlocked-clearly-white/6347788.p?skuId=6347788'),('842776111210',5,419.99,'https://www.walmart.com/ip/Google-Pixel-XL-3a-Black-Factory-Unlocked/767183825'),('842776114945',1,699.99,'https://www.amazon.com/Google-GA01187-US-Pixel-Black-Unlocked/dp/B07YMNLXL3/ref=sr_1_2?dchild=1&keywords=pixel+4&qid=1591460239&sr=8-2'),('842776114945',2,749.99,'https://www.bestbuy.com/site/google-pixel-4-with-64gb-cell-phone-unlocked-just-black/6382490.p?skuId=6382490'),('842776114945',4,799.00,'https://www.walmart.com/ip/Google-Pixel-4-Black-64-GB-Unlocked/925508836?selected=true'),('883929689613',1,49.94,'https://www.amazon.com/gp/product/B07DJWBYKP/ref=ox_sc_act_title_1?smid=ATVPDKIKX0DER&psc=1'),('883929689613',4,49.94,'https://www.walmart.com/ip/Cyberpunk-2077-Cyberpunk-2077-for-PlayStation-4-PS4/786104378'),('883929689613',5,59.99,'https://www.target.com/p/cyberpunk-2077-playstation-4/-/A-77332707'),('883929689620',1,49.94,'https://www.amazon.com/gp/product/B07DJW4WZC/ref=ox_sc_act_title_2?smid=ATVPDKIKX0DER&psc=1'),('883929689620',4,49.94,'https://www.walmart.com/ip/Cyberpunk-2077-Cyberpunk-2077-for-Xbox-One-Xbox-One/973645137'),('883929689620',5,59.99,'https://www.target.com/p/cyberpunk-2077-xbox-one/-/A-77332708'),('883929695485',1,49.94,'https://www.amazon.com/gp/product/B07T8BP118/ref=ox_sc_act_title_2?smid=ATVPDKIKX0DER&th=1'),('883929695485',2,59.99,'https://www.bestbuy.com/site/cyberpunk-2077-windows/6358434.p?skuId=6358434'),('883929695485',4,49.94,'https://www.walmart.com/ip/Cyberpunk-2077-Warner-Bros-PC-883929695485/318328087'),('885609010250',1,399.99,'https://www.amazon.com/Dyson-308247-01-Purifier-White-Silver/dp/B071HMNTPM'),('885609010250',4,489.99,'https://www.walmart.com/ip/Dyson-Pure-Cool-Link-Air-Purifier/48194394'),('885609010250',5,399.99,'https://www.target.com/p/dyson-tp01-pure-cool-tower-air-purifier-silver/-/A-75570777'),('885609014753',1,449.99,'https://www.amazon.com/Dyson-Pure-Purifying-White-Silver/dp/B07BJDSKS8'),('885609014753',4,449.99,'https://www.walmart.com/ip/Dyson-Pure-Cool-Purifying-Fan-DP04/467412235'),('885609014753',5,449.99,'https://www.target.com/p/dyson-dp04-pure-cool-air-purifier-38-fan/-/A-53448822'),('887276381350',1,149.00,'https://www.amazon.com/Samsung-Wireless-improved-Charging-included/dp/B083KVM9VW?ref_=ast_sto_dp'),('887276381350',2,149.99,'https://www.bestbuy.com/site/samsung-galaxy-buds-true-wireless-earbud-headphones-black/6400885.p?skuId=6400885'),('887276381350',4,149.00,'https://www.walmart.com/ip/Samsung-Galaxy-Buds-Cosmic-Black/668616360'),('887276381350',5,149.99,'https://www.target.com/p/samsung-galaxy-buds/-/A-79567447?preselect=79553179#lnk=sametab'),('887276395968',1,1198.00,'https://www.amazon.com/Samsung-Unlocked-Fingerprint-Recognition-Long-Lasting/dp/B082XY6YYZ?ref_=ast_sto_dp&th=1'),('887276395968',2,1149.99,'https://www.bestbuy.com/site/samsung-galaxy-s20-5g-enabled-128gb-unlocked-cosmic-black/6395756.p?skuId=6395756'),('92926999001',1,14.94,'https://www.amazon.com/Honeywell-HT-900-TurboForce-Circulator-Black/dp/B001R1RXUG'),('92926999001',4,14.94,'https://www.walmart.com/ip/Honeywell-Table-Air-Circulator-Fan-HT-900-Black/16503230'),('92926999001',5,16.99,'https://www.target.com/p/honeywell-table-air-circulator-fan/-/A-76855265?preselect=11153539#lnk=sametab');
/*!40000 ALTER TABLE `productRetailer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `name` varchar(256) NOT NULL,
  `upc` varchar(20) NOT NULL,
  `brandId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `msrp` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`upc`),
  UNIQUE KEY `unique_prod` (`name`),
  KEY `catId` (`catId`),
  KEY `brandId` (`brandId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`catId`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brands` (`brandId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('Galaxy Note 10+ 256GB - Aura Black',' 887276346526',4,3,'https://image-us.samsung.com/us/smartphones/galaxy-note10/gallery/aura_black_n10plus/21_RFP_4A22i14CI_2_Front_Back_LockUps_AuraBlack_RGB.jpg?$product-details-jpg$',1099.99),('PerfecTemp 14-Cup Programmable Coffeemaker','086279078537',8,4,'https://target.scene7.com/is/image/Target/GUEST_6aef4976-ae69-4dbf-a264-653179c67d10?wid=488&hei=488&fmt=pjpeg',99.95),('SoundLink Around Ear Wireless Headphones II','17817703277',13,2,'https://images-na.ssl-images-amazon.com/images/I/71jDdUuRi8L._AC_SL1500_.jpg',229.95),('SoundSport Wireless Headphones','17817731355',13,2,'https://images-na.ssl-images-amazon.com/images/I/61aca1w7aDL._AC_SL1500_.jpg',99.95),('QuietComfort 35 Wireless Headphones II','17817770613',13,2,'https://media.sweetwater.com/api/i/q-82__ha-e58cefcf4ee5e2db__hmac-f103a4ce26b550a31a0d27c7449ad06a1d382a1f/images/items/750/QC35-2Bk-large.jpg',349.95),('Noise Cancelling Wireless Bluetooth Headphones 700','17817796163',13,2,'https://multimedia.bbycastatic.ca/multimedia/products/500x500/135/13595/13595376.jpg',399.95),('iPhone 11 64GB - Black','190199220355',3,3,'https://assets.swappie.com/iphon11musta1-600x600.jpg',699.00),('iPhone 11 128GB - Yellow','190199220447',3,3,'https://ebuy.jo/store/image/cache/catalog/Apple/i11/Apple-iPhone-11-Yellow-eBuy.jo-1-1000x1000.jpg',749.00),('AirPods Pro','190199246850',3,2,'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22?wid=1144&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1572990352299',249.99),('iPhone 11 Pro Max 64GB - Space Gray','190199380554',3,3,'https://www.theedustore.co.uk/media/catalog/product/cache/1/image/600x/9df78eab33525d08d6e5fb8d27136e95/7/4/74940994_4675428884.jpg',1099.00),('iPhone SE (2nd generation) 64GB - White','190199503502',3,3,'https://target.scene7.com/is/image/Target/GUEST_feeb28ac-b403-4a05-ad00-1d2e5d17cd6c?fmt=webp&wid=1400&qlt=80',399.00),('iPhone SE (2nd generation) 64GB - PRODUCT(RED)','190199503519',3,3,'https://target.scene7.com/is/image/Target/GUEST_16a7c305-a962-4458-a647-47c7c59042ce?fmt=webp&wid=1400&qlt=80',399.00),('iPhone SE (2nd generation) 64GB - Black','190199503526',3,3,'https://target.scene7.com/is/image/Target/GUEST_3e9d3000-4faf-4d67-93d1-74b9a9567aa5?fmt=webp&wid=1400&qlt=80',399.00),('VertuoPlus Deluxe Coffee and Espresso Machine with Aeroccino by De\'Longhi','21614999917',6,4,'https://www.delonghi.com/Global/Products/Images/Coffee-Makers/Nespresso-System/VertuoPlus%20Deluxe%20ENV155BAE/ENV155BAE.jpg',249.00),('Noise Cancelling Headphones (WHCH700N/B)','27242908727',2,2,'https://images-na.ssl-images-amazon.com/images/I/81-5VFufp4L._AC_SY450_.jpg',129.99),('Over-Ear Wireless Noise-Cancelling Headphones (WH1000XM3/B)','27242911574',2,2,'https://static.bhphoto.com/images/images2000x2000/1536057364_1432359.jpg',349.99),('Noise Cancelling On-Ear Headphones (WHXB900N/B)','27242914797',2,2,'https://images-na.ssl-images-amazon.com/images/I/81OL7eorGHL._AC_SY450_.jpg',249.99),('True Wireless Headphones WFXB700','27242918832',2,2,'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6408/6408362cv17d.jpg',129.99),('Flexbrew 2-Way Coffee Maker with 12-Cup Carafe & Pod Brewer, Black','40094499403',7,4,'https://www.londondrugs.com/on/demandware.static/-/Sites-londondrugs-master/default/dw9e903393/products/L0445731/large/L0445731.JPG',99.99),('530 Small Air Circulator','43765004135',11,5,'https://images.homedepot-static.com/productImages/6366c51f-9e00-4c5a-ac0b-53bccfb5c82b/svn/white-vornado-desk-fans-530l-64_1000.jpg',54.99),('660 Large Air Circulator','43765005422',11,5,'https://images.homedepot-static.com/productImages/f703daec-1ec2-4ba8-aafe-9a06f86bc936/svn/black-vornado-box-fans-660-64_1000.jpg',109.99),('143 29 Inch Tower Circulator','43765006603',11,5,'https://images.homedepot-static.com/productImages/4b74887a-dd2b-48fb-903c-51b4d5305602/svn/black-vornado-tower-fans-fa1-0026-06-64_1000.jpg',69.99),('Flippi V8 Personal Air Circulator','43765009482',11,5,'https://thetechyhome.com/wp-content/uploads/2018/08/Vornado-Flippi-V8--e1533941435937-300x300.jpg',29.99),('6303DC Energy Smart Medium Air Circulator','43765010129',11,5,'https://gd.image-gmkt.com/li/498/486/1172486498.g_0-w_g.jpg',149.99),('460 Small Air Circulator','43765010471',11,5,'https://images-na.ssl-images-amazon.com/images/G/15/aplusautomation/vendorimages/c0c3a835-656c-4ff3-a66c-592dd8dcf943.jpg._CB485977122__SR300,300_.jpg',59.99),('OSCR37 37 Inch Oscillating Tower Circulator','43765011751',11,5,'https://m.media-amazon.com/images/S/aplus-media/vc/5e1b38b3-5191-45df-a162-9391ee293644._SR300,300_.jpg',109.99),('The Legend of Zelda: Breath of the Wild','45496590420',1,1,'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/5721/5721500_sd.jpg;maxHeight=1000;maxWidth=1000',59.99),('Super Smash Bros. Ultimate','45496592998',1,1,'https://target.scene7.com/is/image/Target/GUEST_b26ea68d-b0c3-4f30-a67a-4182b17841f3?wid=488&hei=488&fmt=pjpeg',59.99),('Animal Crossing: New Horizons','45496596439',1,1,'https://target.scene7.com/is/image/Target/GUEST_83f32699-98bf-49e0-903a-1eede0c034e8?wid=488&hei=488&fmt=pjpeg',59.99),('Switch Console with Neon Blue & Red Joy-Con','45496882174',1,1,'https://azcd.domayne.com.au/media/catalog/product/n/e/neon_joy_con_product_page_1_1.jpg',299.99),('12 Cup Programmable Coffee Maker with Dishwashable Design','53891129725',9,4,'https://target.scene7.com/is/image/Target/GUEST_d6f4be8e-72f3-47f0-8a75-ca21048907bb?wid=488&hei=488&fmt=pjpeg',59.99),('K-Classic','611247355985',5,4,'https://secure.img1-fg.wfcdn.com/im/21871660/resize-h800%5Ecompr-r85/7163/71632178/Keurig+K-Classic%252C+Single+Serve+K-Cup+Pod+Coffee+Maker%252C+6+to+10oz+Brew+Sizes.jpg',119.99),('K-Elite','611247369449',5,4,'https://images.homedepot-static.com/productImages/3e4e3ee6-1573-4d88-8486-ffd41ccb111d/svn/brushed-silver-keurig-coffee-makers-5000197492-64_1000.jpg',169.99),('K-Cafe','611247373378',5,4,'https://b3h2.scene7.com/is/image/BedBathandBeyond/201215865635445p?wid=460&hei=460',219.99),('K-Mini','611247375358',5,4,'https://secure.img1-fg.wfcdn.com/im/64284321/resize-h800%5Ecompr-r85/7706/77061830/Keurig+K-Mini+Plus%252C+Single+Serve+K-Cup+Pod+Coffee+Maker%252C+6+to+12oz+Brew+Size.jpg',79.99),('K-Duo Plus','611247379837',5,4,'https://i5.walmartimages.com/asr/7334d606-f498-472e-b0e6-0cbfcc0452cb_1.af613ea01ea3e8bb0032a51151db78d3.jpeg?odnWidth=612&odnHeight=612&odnBg=ffffff',229.99),('The Last of Us Part II Standard Edition','711719519102',2,1,'https://i5.walmartimages.com/asr/aa90b058-ae3a-4fcc-82b5-33f7940f36be_2.623b29d5eb03b785e1e648f0ee45d728.jpeg?odnWidth=undefined&odnHeight=undefined&odnBg=ffffff',59.99),('PlayStation 4 Pro 1TB Console','711719521099',2,1,'https://i5.walmartimages.com/asr/1114228a-fe9b-4aa1-b732-9ba6d32787f1_1.b18a4a6bdfaf618804d4c6f875c16ff5.jpeg',399.99),('Ghost of Tsushima Launch Edition','711719537984',2,1,'https://i5.walmartimages.com/asr/170b457b-17d9-4887-ae40-768c553ab9a2_3.50957b06ea1a446fb3dc6bcff362165e.png?odnWidth=undefined&odnHeight=undefined&odnBg=ffffff',59.99),('Optimal Brew Thermal Coffeemaker, 10-Cup','72179231042',9,4,'https://www.mrcoffee.com/dw/image/v2/AAMB_PRD/on/demandware.static/-/Sites-master-catalog/default/dw0d97735c/images/highres/BVMC-PSTX95GTF-1.jpg?sw=400&sh=400&sm=fit',99.99),('Pixel 3a XL 64GB - Black','842776111210',14,3,'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6347/6347788_sd.jpg;maxHeight=1000;maxWidth=1000',479.99),('Pixel 4 64GB - Just Black','842776114945',14,3,'https://shop.ee.co.uk/medias/google-pixel-4-64gb-black-detail1-Format-960?context=bWFzdGVyfHJvb3R8NDc1MTZ8aW1hZ2UvanBlZ3xzeXMtbWFzdGVyL3Jvb3QvaGE2L2gwOS85NDE1NjE5MTgyNjIyL2dvb2dsZS1waXhlbC00LTY0Z2ItYmxhY2stZGV0YWlsMV9Gb3JtYXQtOTYwfGM1MDlmMDQxNzZmM2U2YTdhZGRiMGEyMmZmNWY3OTVhODczMDM1ODBiZDU3NmNlNTczZDdlZWY1MTA0MzFjNzc',799.00),('Cyberpunk 2077 - PlayStation 4','883929689613',15,1,'https://i5.walmartimages.com/asr/372995ed-4865-4e9f-b92d-34192d0b73f7_3.efa98a0cdf0ba91a37a06c7b56f9b690.png?odnWidth=undefined&odnHeight=undefined&odnBg=ffffff',59.99),('Cyberpunk 2077 - Xbox One','883929689620',15,1,'https://i5.walmartimages.com/asr/5c20f109-299a-42b9-bb40-d9f1ae131743_1.3ea74cb6b092992e4432b754b775b76b.jpeg?odnWidth=612&odnHeight=612&odnBg=ffffff',59.99),('Cyberpunk 2077 - PC','883929695485',15,1,'https://i5.walmartimages.com/asr/07f9f90c-e914-4f2a-89c4-25620e759609_1.873766532150eddd91bb0b14974d9d20.jpeg?odnWidth=612&odnHeight=612&odnBg=ffffff',59.99),('Pure Cool TP01 Purifying Fan (White/Silver)','885609010250',12,5,'https://target.scene7.com/is/image/Target/GUEST_8b26dc5f-2c2e-4270-85ff-93fdbbeae759?wid=250&hei=250&fmt=pjpeg',399.99),('Pure Cool DP04 Purifying Fan (White/Silver)','885609014753',12,5,'https://images.homedepot-static.com/productImages/619b8fec-b508-4434-8e61-444f844c81bd/svn/whites-dyson-air-purifiers-310150-01-64_1000.jpg',449.99),('Galaxy Buds+, Cosmic Black','887276381350',4,2,'https://images.samsung.com/is/image/samsung/ca/galaxy-s20/gallery/ca-galaxy-buds-plus-r175-sm-r175nzkaxac-frontblack-208963033?$PD_GALLERY_L_JPG$',149.99),('Galaxy S20+ 5G Enabled 128GB - Cosmic Black','887276395968',4,3,'https://image-us.samsung.com/us/smartphones/galaxy-s20/business/product/gallery/s20-plus/cosmic-black/Y2_Lockup_CosmicBlack_600x600_v2.jpg?$bu-pdp-image-mobile-jpg$',1199.99),('HT-900 TurboForce Air Circulator Fan, Black','92926999001',10,5,'https://i.pinimg.com/originals/ca/f1/de/caf1de0b905ded616b0638a562d442b1.jpg',17.80);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retailers`
--

DROP TABLE IF EXISTS `retailers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retailers` (
  `retailerId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`retailerId`),
  UNIQUE KEY `unique_ret` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retailers`
--

LOCK TABLES `retailers` WRITE;
/*!40000 ALTER TABLE `retailers` DISABLE KEYS */;
INSERT INTO `retailers` VALUES (1,'Amazon'),(2,'Best Buy'),(3,'Newegg'),(5,'Target'),(4,'Wal-Mart');
/*!40000 ALTER TABLE `retailers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-22 14:25:44
