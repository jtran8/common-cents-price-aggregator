-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Generation Time: May 09, 2020 at 05:17 AM
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
-- Database: `common_cents`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brandId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brandId`, `name`) VALUES
(3, 'Apple'),
(1, 'Nintendo'),
(4, 'Samsung'),
(2, 'Sony');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `catId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`catId`, `name`) VALUES
(3, 'Cell Phones'),
(2, 'Headphones'),
(1, 'Video Games');

-- --------------------------------------------------------

--
-- Table structure for table `categoryBrand`
--

CREATE TABLE `categoryBrand` (
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoryBrand`
--

INSERT INTO `categoryBrand` (`catId`, `brandId`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(2, 4),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `productRetailer`
--

CREATE TABLE `productRetailer` (
  `upc` varchar(20) NOT NULL,
  `retailerId` int(11) NOT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productRetailer`
--

INSERT INTO `productRetailer` (`upc`, `retailerId`, `price`, `url`) VALUES
('190198453907', 3, '852.99', 'https://www.upcitemdb.com/norob/alink/?id=v2w2x2t2z22364a4u2&tid=1&seq=1588874946&plt=ff77ce6cc63f701c9345afa8ca041bd5'),
('190198453907', 9, '899.00', 'https://www.upcitemdb.com/norob/alink/?id=v2x25313w2x2e484v2&tid=1&seq=1588874946&plt=143771a9bbfe7584afb695b48814e082'),
('190198453907', 11, '1112.99', 'https://www.upcitemdb.com/norob/alink/?id=v2w2y2v2z203b4c4v2&tid=1&seq=1588874946&plt=03c8352339c24a6d0c84059c8163f91b'),
('190198453907', 12, '699.00', 'https://www.upcitemdb.com/norob/alink/?id=x2s263w2x243e4c4z2&tid=1&seq=1588874946&plt=542c65208c05ed11caa5d618ab8236ac'),
('190198453907', 14, '369.99', 'https://www.upcitemdb.com/norob/alink/?id=w2u253u243y2b4d4x2&tid=1&seq=1588874946&plt=355a9e3000ef5a31066716ad406ab842'),
('190198453907', 25, '1339.99', 'https://www.upcitemdb.com/norob/alink/?id=v2x2z2v22323e474x2&tid=1&seq=1588874946&plt=c2b9cf54f96efe5f278e5423819df817'),
('190199246850', 1, '229.00', 'https://www.upcitemdb.com/norob/alink/?id=y2v253t2v2136454z2&tid=1&seq=1588874913&plt=ae7a3c222b03c011417f2ce9b82e2a0a'),
('190199246850', 9, '249.00', 'https://www.upcitemdb.com/norob/alink/?id=y2p243y2w223f4c4u2&tid=1&seq=1588874913&plt=09215bb28d446ccfda1730d26d7f6c14'),
('190199246850', 12, '249.99', 'https://www.upcitemdb.com/norob/alink/?id=y2p203y2z223f464r2&tid=1&seq=1588874913&plt=9169aec4860c67ff622299185438d00e'),
('190199246850', 14, '229.95', 'https://www.upcitemdb.com/norob/alink/?id=y2p223y213z2a444q2&tid=1&seq=1588874913&plt=70e28298cdf0ec6492aa09b3efa14138'),
('190199246850', 19, '234.97', 'https://www.upcitemdb.com/norob/alink/?id=y2r2y20343136464y2&tid=1&seq=1588874913&plt=b4ee74328d995796ae4032f294f15427'),
('190199246850', 25, '471.94', 'https://www.upcitemdb.com/norob/alink/?id=y2v233x2x2y284c4v2&tid=1&seq=1588874913&plt=e9ea96e97f70277020ec6e10d99f9792'),
('190199246850', 29, '234.98', 'https://www.upcitemdb.com/norob/alink/?id=y2q203t2x213f474r2&tid=1&seq=1588874913&plt=7e5924fb18b3ff77a3d8305d40f98d42'),
('190199246850', 36, '249.99', 'https://www.upcitemdb.com/norob/alink/?id=y2p203y2y243d4b4v2&tid=1&seq=1588874913&plt=fe59875b4184b3c6484029ac6a2714ef'),
('190199246850', 61, '249.99', 'https://www.upcitemdb.com/norob/alink/?id=y2q223v20323e4d4u2&tid=1&seq=1588874913&plt=5669070dedb19490f513d15aea6575f8'),
('190199246850', 63, '329.99', 'https://www.upcitemdb.com/norob/alink/?id=y2p233t2v253c4c4y2&tid=1&seq=1588874913&plt=bd6c4819e0bd333675dccf51a9dee63a'),
('190199246850', 76, '329.99', 'https://www.upcitemdb.com/norob/alink/?id=y2p253y20343b4d4w2&tid=1&seq=1588874913&plt=38feaab6c646f2ad34c3416bee87e2c7'),
('190199246850', 78, '379.96', 'https://www.upcitemdb.com/norob/alink/?id=y2p233v2x2236494s2&tid=1&seq=1588874913&plt=7f1a75c27a75d6d468088ecbc7d8b9c7'),
('190199246850', 79, '249.00', 'https://www.upcitemdb.com/norob/alink/?id=y2p253z2w2z284d4v2&tid=1&seq=1588874913&plt=8f115a134c7b62edcbb40ddb709eb715'),
('190199246850', 84, '249.00', 'https://www.upcitemdb.com/norob/alink/?id=y2q2z2z2v233d4c4w2&tid=1&seq=1588874913&plt=1c53c69a96ed539f0e32951e47f92afe'),
('190199246850', 86, '249.00', 'https://www.upcitemdb.com/norob/alink/?id=y2p213v2y223f4b4x2&tid=1&seq=1588874913&plt=fa919c07158906e6818bcb5af37f4ef7'),
('190199246850', 87, '329.00', 'https://www.upcitemdb.com/norob/alink/?id=y2q2030303336454y2&tid=1&seq=1588874913&plt=57e7ee8f86f1f6c22b175c914d6eedd4'),
('27242911574', 1, '348.00', 'https://www.upcitemdb.com/norob/alink/?id=y2r203w22323f4d4x2&tid=1&seq=1588874924&plt=af5d131f72d320b8930cfdd7179b79cd'),
('27242911574', 9, '278.00', 'https://www.upcitemdb.com/norob/alink/?id=x2v213w2v2z28464r2&tid=1&seq=1588874924&plt=900255eab81d8fdbebf9d176e7a97e66'),
('27242911574', 12, '349.99', 'https://www.upcitemdb.com/norob/alink/?id=w2u2231333338444t2&tid=1&seq=1588874924&plt=b7e6633bfed02fc122fbfcc6579b6e13'),
('27242911574', 14, '256.77', 'https://www.upcitemdb.com/norob/alink/?id=w2x2x2t23323a454q2&tid=1&seq=1588874924&plt=362167161d1b49ed17d655f228a68e3c'),
('27242911574', 17, '348.00', 'https://www.upcitemdb.com/norob/alink/?id=w2w213y2330394a4x2&tid=1&seq=1588874924&plt=bf5b03c01df1f2723805883de8ed2474'),
('27242911574', 19, '251.49', 'https://www.upcitemdb.com/norob/alink/?id=y2q233z2134374b4v2&tid=1&seq=1588874924&plt=012089cc78bf3ecb7bc328eb379d6463'),
('27242911574', 21, '348.00', 'https://www.upcitemdb.com/norob/alink/?id=w2u2x2x21303e484s2&tid=1&seq=1588874924&plt=c06c51516c2c695f4d414153f3349718'),
('27242911574', 25, '398.00', 'https://www.upcitemdb.com/norob/alink/?id=x2p2z2y223y2f4d4z2&tid=1&seq=1588874924&plt=317385ed17b5989d7b389a971d436c83'),
('27242911574', 28, '332.45', 'https://www.upcitemdb.com/norob/alink/?id=x2p203x2x2z264c4t2&tid=1&seq=1588874924&plt=f0de484ae0a7586443d093b9a07e0958'),
('27242911574', 36, '349.99', 'https://www.upcitemdb.com/norob/alink/?id=x2u243z21353f4b4t2&tid=1&seq=1588874924&plt=0475a9830133e36a4218aac525ad2b29'),
('27242911574', 57, '348.00', 'https://www.upcitemdb.com/norob/alink/?id=w2t213y2y2y2f484y2&tid=1&seq=1588874924&plt=dcda7888e030056aac8317d099a79c5b'),
('27242911574', 61, '349.99', 'https://www.upcitemdb.com/norob/alink/?id=x2u24303y203a4b4x2&tid=1&seq=1588874924&plt=f40f316008324aef611621a12f3de1c3'),
('27242911574', 63, '399.99', 'https://www.upcitemdb.com/norob/alink/?id=w2u203w22363e464t2&tid=1&seq=1588874924&plt=6fae77c90debf83de9bac8d545a0cd19'),
('27242911574', 67, '349.99', 'https://www.upcitemdb.com/norob/alink/?id=y2r2z2z20363d4a4q2&tid=1&seq=1588874924&plt=b4c34e667d930d41dcdc2c84a113c6d1'),
('27242911574', 72, '278.99', 'https://www.upcitemdb.com/norob/alink/?id=y2r2z2032333c4b4w2&tid=1&seq=1588874924&plt=ac2c4ded5d5bb6f5c89f45e9d32036b6'),
('45496882174', 1, '289.88', 'https://www.upcitemdb.com/norob/alink/?id=y2r203w22323f494w2&tid=1&seq=1588874968&plt=7061f93eebbb995ac2c0847102c068c6'),
('45496882174', 9, '299.00', 'https://www.upcitemdb.com/norob/alink/?id=x2w253y2y2y2f474y2&tid=1&seq=1588874968&plt=66837fca6bf1367dc87c42347cb02b59'),
('45496882174', 12, '299.99', 'https://www.upcitemdb.com/norob/alink/?id=x2u253t20353a484v2&tid=1&seq=1588874968&plt=dffb20aecb4fdcbe506b41da9f9149ca'),
('45496882174', 14, '549.99', 'https://www.upcitemdb.com/norob/alink/?id=x2u2031343z28494z2&tid=1&seq=1588874968&plt=705a16b7d149d9de9d654ebfccab0c4c'),
('45496882174', 19, '297.97', 'https://www.upcitemdb.com/norob/alink/?id=y2s2x2031353c444u2&tid=1&seq=1588874968&plt=f068f8f618db5c6a130284502c0872a9'),
('45496882174', 29, '297.88', 'https://www.upcitemdb.com/norob/alink/?id=x2u233y223y2c454s2&tid=1&seq=1588874968&plt=c96a12dfdd5b6ab467700f77d210e691'),
('45496882174', 36, '299.99', 'https://www.upcitemdb.com/norob/alink/?id=x2u243z2336384a4z2&tid=1&seq=1588874968&plt=a257132a095a6e2512c37a247f79f1d6'),
('45496882174', 63, '399.99', 'https://www.upcitemdb.com/norob/alink/?id=x2x24303x203c454v2&tid=1&seq=1588874968&plt=e5afb956d2a9a248a5fe440fe08b0fdd'),
('45496882174', 67, '299.99', 'https://www.upcitemdb.com/norob/alink/?id=y2p233v2x253c484q2&tid=1&seq=1588874968&plt=f420954f0a2cbf1203fbcd05d5a6d221'),
('45496882174', 76, '399.99', 'https://www.upcitemdb.com/norob/alink/?id=x2x2x2v20343c444w2&tid=1&seq=1588874968&plt=7eae8a5a430acedf36491454b16bb547'),
('45496882174', 86, '365.99', 'https://www.upcitemdb.com/norob/alink/?id=x2x2430303y2f494u2&tid=1&seq=1588874968&plt=95f79fd4c6f9354d42bcd2c9e09665e7'),
('45496882174', 87, '399.96', 'https://www.upcitemdb.com/norob/alink/?id=x2t26323z24364d4x2&tid=1&seq=1588874968&plt=2ba941e666526e7cf5d0fbf988a4153c'),
('45496882174', 96, '409.50', 'https://www.upcitemdb.com/norob/alink/?id=y2o233z2v26394b4t2&tid=1&seq=1588874968&plt=9fd3a524e2d1f448ef58fd5186402c98'),
('45496882174', 106, '299.99', 'https://www.upcitemdb.com/norob/alink/?id=y2p2z2t23303c4c4r2&tid=1&seq=1588874968&plt=d565892ea3afc3f130c2ecace3f13400'),
('45496882174', 111, '244.45', 'https://www.upcitemdb.com/norob/alink/?id=y2p25323y233e4d4r2&tid=1&seq=1588874968&plt=2cba6420d47be19a226eaa92dcc944cf'),
('45496882174', 119, '299.99', 'https://www.upcitemdb.com/norob/alink/?id=y2r2y2w2x25394b4r2&tid=1&seq=1588874968&plt=344f9164eb4cde333b978c33d4a66cc7'),
('45496882174', 126, '279.95', 'https://www.upcitemdb.com/norob/alink/?id=x2x213x243338444z2&tid=1&seq=1588874968&plt=fbd8aa20776ac7945ec160163976251f'),
('711719051275', 3, '479.85', 'https://www.upcitemdb.com/norob/alink/?id=v2t21313x2337474&tid=1&seq=1588874902&plt=99ccb0b006c9929bd39a8320133cfe87'),
('711719051275', 9, '299.00', 'https://www.upcitemdb.com/norob/alink/?id=u2o2x2x243436494t2&tid=1&seq=1588874902&plt=04e313ec9c42f937d1e31b1e824723ca'),
('711719051275', 11, '244.49', 'https://www.upcitemdb.com/norob/alink/?id=v2w2131343436444t2&tid=1&seq=1588874902&plt=a1e404f0a55bd3365e4a46b056ae70de'),
('711719051275', 12, '349.99', 'https://www.upcitemdb.com/norob/alink/?id=u2r2z2w2x213d484x2&tid=1&seq=1588874902&plt=1fc23184a3a2c8381704c6cb96172886'),
('711719051275', 14, '214.99', 'https://www.upcitemdb.com/norob/alink/?id=w2w24303v2y2e494&tid=1&seq=1588874902&plt=6485054d9559ac597b0997ad7990c044'),
('711719051275', 19, '342.97', 'https://www.upcitemdb.com/norob/alink/?id=u2o253u2x243a464w2&tid=1&seq=1588874902&plt=e6aaec6b28fc981c113934dd5e8c53b4'),
('711719051275', 29, '399.00', 'https://www.upcitemdb.com/norob/alink/?id=13q2z2z2y213a494&tid=1&seq=1588874902&plt=23614dea1e55a20801af2b8a9f81c6c0'),
('711719051275', 36, '349.99', 'https://www.upcitemdb.com/norob/alink/?id=w2w243y2x2y2f4b4&tid=1&seq=1588874902&plt=5145f8b3aeaf48929465de16bbfc493c'),
('711719051275', 57, '349.99', 'https://www.upcitemdb.com/norob/alink/?id=u2r223t2w2y28484z2&tid=1&seq=1588874902&plt=e36e0a2f535361e8052fcda8886164e7'),
('711719051275', 78, '629.96', 'https://www.upcitemdb.com/norob/alink/?id=13q2x2z2z233d444&tid=1&seq=1588874902&plt=61629258763189a53792f2fac2b52786'),
('711719051275', 86, '399.99', 'https://www.upcitemdb.com/norob/alink/?id=y2t2x2t243y284c4&tid=1&seq=1588874902&plt=9be2425fe5cdf828adeb6266dceab081'),
('711719051275', 91, '399.99', 'https://www.upcitemdb.com/norob/alink/?id=u2p2y2x243y2b464w2&tid=1&seq=1588874902&plt=d1d92c3d05b4cf74e94aa1c469776bee'),
('711719051275', 92, '431.99', 'https://www.upcitemdb.com/norob/alink/?id=w2r263z2v20384a4&tid=1&seq=1588874902&plt=049032035526057066002b1e247c022b'),
('711719051275', 95, '454.25', 'https://www.upcitemdb.com/norob/alink/?id=v2x223w2w2z2f494&tid=1&seq=1588874902&plt=de2424ebf3dd39653aca1573a2293ff0'),
('711719051275', 96, '533.25', 'https://www.upcitemdb.com/norob/alink/?id=u2p2z2t2x233c4a4q2&tid=1&seq=1588874902&plt=5d23b7d374fca9997bc0bc60a6cf25c8'),
('711719051275', 100, '437.53', 'https://www.upcitemdb.com/norob/alink/?id=u2p203u243638444u2&tid=1&seq=1588874902&plt=2ae5320af544f0ae311dc4c2969894e4'),
('711719051275', 103, '604.43', 'https://www.upcitemdb.com/norob/alink/?id=y2x21303x2x2d4d4&tid=1&seq=1588874902&plt=5724544378b717d1f6ea3051ea709e5a'),
('711719051275', 104, '399.99', 'https://www.upcitemdb.com/norob/alink/?id=13p213034363e444&tid=1&seq=1588874902&plt=3178e6db778def01715041be6c3fe524'),
('711719051275', 105, '399.99', 'https://www.upcitemdb.com/norob/alink/?id=13v213z21363e444&tid=1&seq=1588874902&plt=96f5c15fafb73fe63db665a763c1e12f'),
('711719051275', 106, '169.99', 'https://www.upcitemdb.com/norob/alink/?id=x2q233w203x2b494s2&tid=1&seq=1588874902&plt=3ae72be073783a023032352aa6f030bc'),
('711719051275', 108, '533.25', 'https://www.upcitemdb.com/norob/alink/?id=u2q223v2v203a464v2&tid=1&seq=1588874902&plt=e43ab938f8654c85c7d97d95a9c33b74'),
('887276236452', 2, '179.99', 'https://www.upcitemdb.com/norob/alink/?id=x2q2z2v24333c4d4r2&tid=1&seq=1588874935&plt=3abc1058fad5b8f0e145f3ba4eb960a6'),
('887276236452', 3, '134.99', 'https://www.upcitemdb.com/norob/alink/?id=w2r243y213237484u2&tid=1&seq=1588874935&plt=d3ce1d96fb816a4b671bd08991f52acd'),
('887276236452', 9, '199.00', 'https://www.upcitemdb.com/norob/alink/?id=x2v203134303e4b4v2&tid=1&seq=1588874935&plt=c7fe66442073eb99d58f924fb8afd807'),
('887276236452', 11, '147.97', 'https://www.upcitemdb.com/norob/alink/?id=v2x253w243x28464v2&tid=1&seq=1588874935&plt=e92646d37e55055972ed56ac0ea8d01c'),
('887276236452', 14, '48.95', 'https://www.upcitemdb.com/norob/alink/?id=w2s2y2v2x2038484y2&tid=1&seq=1588874935&plt=749fa2960beb080e5fdc054346c52cc4'),
('887276236452', 16, '179.99', 'https://www.upcitemdb.com/norob/alink/?id=v2v2y2w233y2e4d4x2&tid=1&seq=1588874935&plt=9798a5541c547c0e9049e49bdb085731'),
('887276236452', 17, '134.99', 'https://www.upcitemdb.com/norob/alink/?id=w2w213y233x27484z2&tid=1&seq=1588874935&plt=f7772daeaf49d9aa6f927f9092c545fb'),
('887276236452', 19, '169.49', 'https://www.upcitemdb.com/norob/alink/?id=v2x253t2x23374c4r2&tid=1&seq=1588874935&plt=cd318475a893cf3d2767726a15d0a9bd'),
('887276236452', 21, '134.99', 'https://www.upcitemdb.com/norob/alink/?id=w2o223x223139474y2&tid=1&seq=1588874935&plt=a1ecea044fc4d3580cff4b47528155d0'),
('887276236452', 22, '199.00', 'https://www.upcitemdb.com/norob/alink/?id=w2w223z23363f4c4y2&tid=1&seq=1588874935&plt=bd7973d8c6a819d8d52c9e64a61ebdda'),
('887276236452', 24, '199.99', 'https://www.upcitemdb.com/norob/alink/?id=w2q20323x2x29454t2&tid=1&seq=1588874935&plt=90cebc8c86a295d6883a52ceaa5feea2'),
('887276236452', 25, '307.81', 'https://www.upcitemdb.com/norob/alink/?id=w2v23313y2z27464r2&tid=1&seq=1588874935&plt=93aebd372d5c893ebacdd9866f652e42'),
('887276236452', 26, '279.99', 'https://www.upcitemdb.com/norob/alink/?id=x2q2z2w2v223d444x2&tid=1&seq=1588874935&plt=40743ae33a9f6cdc5cd963dfec714e5d'),
('887276236452', 28, '169.01', 'https://www.upcitemdb.com/norob/alink/?id=x2p203x2x2336454x2&tid=1&seq=1588874935&plt=8ce89119ba6fe2618e787aea948bf31c'),
('887276395968', 1, '1149.88', 'https://www.upcitemdb.com/norob/alink/?id=y2u243u20323a4a4y2&tid=1&seq=1588874957&plt=f262d2edd916dfbe9f1d00eb91caa1f0'),
('887276395968', 2, '1199.99', 'https://www.upcitemdb.com/norob/alink/?id=y2v2y2z2w2y2c464r2&tid=1&seq=1588874957&plt=b07982dfef39ccfef5b37eb75a318fe7'),
('887276395968', 3, '1266.99', 'https://www.upcitemdb.com/norob/alink/?id=y2v253x2w2638474x2&tid=1&seq=1588874957&plt=7b7bff93c68bc0ec90b0bd1f938e74d0'),
('887276395968', 9, '999.99', 'https://www.upcitemdb.com/norob/alink/?id=y2v263t23313b4b4r2&tid=1&seq=1588874957&plt=a0a3949e5dc80c19349aaab073e211a2'),
('887276395968', 14, '1304.72', 'https://www.upcitemdb.com/norob/alink/?id=y2w2z2t2w23394b4u2&tid=1&seq=1588874957&plt=79644d4e5a379cfe464528141aba1323'),
('887276395968', 16, '33.34', 'https://www.upcitemdb.com/norob/alink/?id=y2r21313w2437474r2&tid=1&seq=1588874957&plt=a3869140187bd817f790f9aab0ccbd45'),
('887276395968', 29, '1198.00', 'https://www.upcitemdb.com/norob/alink/?id=y2w2x2t2235384d4u2&tid=1&seq=1588874957&plt=e4ee09245c85c0b903c51bf482cc11f4'),
('887276395968', 36, '1199.99', 'https://www.upcitemdb.com/norob/alink/?id=y2r2131343x2d4a4q2&tid=1&seq=1588874957&plt=3ee95033d8724dc13ff8a921e0f39cf7');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `name` varchar(256) NOT NULL,
  `upc` varchar(20) NOT NULL,
  `brandId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `msrp` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`name`, `upc`, `brandId`, `catId`, `image`, `msrp`) VALUES
('iPhone 8 Plus 256GB Gold (SIM-free)', '190198453907', 3, 3, NULL, NULL),
('AirPods Pro', '190199246850', 3, 2, NULL, NULL),
('Over-Ear Wireless Noise-Cancelling Headphones (WH1000XM3/B)', '27242911574', 2, 2, NULL, NULL),
('Switch Console with Neon Blue & Red Joy-Con', '45496882174', 1, 1, NULL, NULL),
('Sony - Playstation 4 (500gb)', '711719051275', 2, 1, NULL, NULL),
('Samsung Gear IconX (2018 Edition)', '887276236452', 4, 2, NULL, NULL),
('Galaxy S20+ 5G Enabled 128GB (Unlocked) - Cosmic Black', '887276395968', 4, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `retailers`
--

CREATE TABLE `retailers` (
  `retailerId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `retailers`
--

INSERT INTO `retailers` (`retailerId`, `name`) VALUES
(108, '11 Main'),
(36, 'Best Buy'),
(111, 'Bloomingdales UK'),
(1, 'BrandsMart USA'),
(67, 'Dell.com'),
(72, 'eGlobal Central US'),
(17, 'Focus Camera & aSavings'),
(57, 'Frys Electronics'),
(106, 'GameStop, Inc.'),
(103, 'Hook Bag'),
(24, 'Icuracao.com'),
(76, 'Indigo Books & Music'),
(61, 'Kohl\'s'),
(84, 'Macy\'s'),
(28, 'MassGenie'),
(26, 'Microsoft Canada'),
(2, 'Microsoft Store'),
(22, 'Musician\'s Friend'),
(95, 'Mwave'),
(11, 'Newegg Business'),
(25, 'Newegg Canada'),
(3, 'Newegg.com'),
(91, 'NeweggFlash.com'),
(119, 'Office Depot'),
(126, 'OnBuy.com'),
(100, 'pcRUSH.com'),
(78, 'QVC.com'),
(14, 'Rakuten(Buy.com)'),
(29, 'Sam\'s Club'),
(16, 'Samsung.com'),
(92, 'Sears'),
(104, 'Sony'),
(79, 'Staples'),
(12, 'Target'),
(19, 'Tech For Less'),
(63, 'TheSource.ca'),
(86, 'TigerDirect'),
(105, 'Toys R Us'),
(96, 'UnbeatableSale.com'),
(9, 'Wal-Mart.com'),
(87, 'WalMart Canada'),
(21, 'Walmart Marketplace');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brandId`),
  ADD UNIQUE KEY `unique_brand` (`name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`catId`),
  ADD UNIQUE KEY `unique_cat` (`name`);

--
-- Indexes for table `categoryBrand`
--
ALTER TABLE `categoryBrand`
  ADD PRIMARY KEY (`catId`,`brandId`),
  ADD KEY `brandId` (`brandId`);

--
-- Indexes for table `productRetailer`
--
ALTER TABLE `productRetailer`
  ADD PRIMARY KEY (`upc`,`retailerId`),
  ADD KEY `retailerId` (`retailerId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`upc`),
  ADD UNIQUE KEY `unique_prod` (`name`),
  ADD KEY `catId` (`catId`),
  ADD KEY `brandId` (`brandId`);

--
-- Indexes for table `retailers`
--
ALTER TABLE `retailers`
  ADD PRIMARY KEY (`retailerId`),
  ADD UNIQUE KEY `unique_ret` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `retailers`
--
ALTER TABLE `retailers`
  MODIFY `retailerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=364;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categoryBrand`
--
ALTER TABLE `categoryBrand`
  ADD CONSTRAINT `categoryBrand_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`catId`),
  ADD CONSTRAINT `categoryBrand_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brands` (`brandId`);

--
-- Constraints for table `productRetailer`
--
ALTER TABLE `productRetailer`
  ADD CONSTRAINT `productRetailer_ibfk_1` FOREIGN KEY (`upc`) REFERENCES `products` (`upc`) ON DELETE CASCADE,
  ADD CONSTRAINT `productRetailer_ibfk_2` FOREIGN KEY (`retailerId`) REFERENCES `retailers` (`retailerId`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `categories` (`catId`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brands` (`brandId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
