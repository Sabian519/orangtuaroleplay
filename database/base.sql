-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2022 at 02:22 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `base`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_tokens`
--

CREATE TABLE `access_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(32) NOT NULL,
  `token` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL DEFAULT 'None',
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `angel` float NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`id`, `model`, `name`, `posx`, `posy`, `posz`, `angel`, `world`, `interior`) VALUES
(9, 141, 'Bank Teller', 1373.64, -28.0635, 1000.87, 269.23, 0, 0),
(0, 0, '', 0, 0, 0, 0, 0, 0),
(2, 72, 'Juragan Bambang', -2186.22, -209.491, 36.5156, 278.245, 0, 0),
(3, 73, 'Bono', -1819.32, -149.463, 9.39844, 177.014, 0, 0),
(4, 16, 'Sutrisno', -1920.36, -1712.72, 21.7687, 231.965, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `atms`
--

CREATE TABLE `atms` (
  `id` int(11) NOT NULL,
  `posx` float NOT NULL,
  `posy` float NOT NULL,
  `posz` float NOT NULL,
  `posrx` float NOT NULL,
  `posry` float NOT NULL,
  `posrz` float NOT NULL,
  `interior` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `atms`
--

INSERT INTO `atms` (`id`, `posx`, `posy`, `posz`, `posrx`, `posry`, `posrz`, `interior`, `world`, `status`) VALUES
(0, -2043.45, -104.151, 35.556, 0, 0, 0, 0, 0, 0),
(1, -1950.4, 301.297, 34.9788, 0, 0.899999, -90.3001, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banneds`
--

CREATE TABLE `banneds` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(24) DEFAULT 'None',
  `ip` varchar(24) DEFAULT 'None',
  `longip` int(11) DEFAULT 0,
  `ban_expire` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `ban_date` varchar(30) NOT NULL DEFAULT '',
  `last_activity_timestamp` varchar(30) NOT NULL DEFAULT '',
  `admin` varchar(40) DEFAULT 'Server',
  `reason` varchar(128) DEFAULT 'None'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banneds`
--

INSERT INTO `banneds` (`id`, `name`, `ip`, `longip`, `ban_expire`, `ban_date`, `last_activity_timestamp`, `admin`, `reason`) VALUES
(27, 'Horoushi_Miyamura', '114.79.3.42', 0, 0, '1642849939', '', 'Sabian', 'Fly HACK'),
(33, 'Surmok123', '255.255.255.255', 0, 0, '1644994047', '', 'Sabian', 'Ganti jadi nama ic');

-- --------------------------------------------------------

--
-- Table structure for table `bisnis`
--

CREATE TABLE `bisnis` (
  `ID` int(11) NOT NULL,
  `owner` varchar(40) NOT NULL DEFAULT '-',
  `name` varchar(40) NOT NULL DEFAULT 'Bisnis',
  `price` int(11) NOT NULL DEFAULT 500000,
  `type` int(11) NOT NULL DEFAULT 1,
  `locked` int(11) NOT NULL DEFAULT 1,
  `money` int(11) NOT NULL DEFAULT 0,
  `prod` int(11) NOT NULL DEFAULT 50,
  `bprice0` int(11) NOT NULL DEFAULT 500,
  `bprice1` int(11) NOT NULL DEFAULT 500,
  `bprice2` int(11) NOT NULL DEFAULT 500,
  `bprice3` int(11) NOT NULL DEFAULT 500,
  `bprice4` int(11) NOT NULL DEFAULT 500,
  `bprice5` int(11) NOT NULL DEFAULT 500,
  `bprice6` int(11) NOT NULL DEFAULT 500,
  `bprice7` int(11) NOT NULL DEFAULT 500,
  `bprice8` int(11) NOT NULL DEFAULT 500,
  `bprice9` int(11) NOT NULL DEFAULT 500,
  `bint` int(11) NOT NULL DEFAULT 0,
  `extposx` float NOT NULL DEFAULT 0,
  `extposy` float NOT NULL DEFAULT 0,
  `extposz` float NOT NULL DEFAULT 0,
  `extposa` float NOT NULL DEFAULT 0,
  `intposx` float NOT NULL DEFAULT 0,
  `intposy` float NOT NULL DEFAULT 0,
  `intposz` float NOT NULL DEFAULT 0,
  `intposa` float NOT NULL DEFAULT 0,
  `pointx` float DEFAULT 0,
  `pointy` float DEFAULT 0,
  `pointz` float DEFAULT 0,
  `visit` bigint(16) NOT NULL DEFAULT 0,
  `restock` tinyint(2) NOT NULL DEFAULT 0,
  `song` varchar(70) NOT NULL DEFAULT '-',
  `ph` mediumint(8) UNSIGNED NOT NULL,
  `employe0` varchar(25) NOT NULL DEFAULT '-',
  `employe1` varchar(25) NOT NULL DEFAULT '-',
  `employe2` varchar(25) NOT NULL DEFAULT '-'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bisnis`
--

INSERT INTO `bisnis` (`ID`, `owner`, `name`, `price`, `type`, `locked`, `money`, `prod`, `bprice0`, `bprice1`, `bprice2`, `bprice3`, `bprice4`, `bprice5`, `bprice6`, `bprice7`, `bprice8`, `bprice9`, `bint`, `extposx`, `extposy`, `extposz`, `extposa`, `intposx`, `intposy`, `intposz`, `intposa`, `pointx`, `pointy`, `pointz`, `visit`, `restock`, `song`, `ph`, `employe0`, `employe1`, `employe2`) VALUES
(0, 'Miles_Morales', 'Doherty', 1, 3, 0, 5100, 639223724, 1500, 500, 1000, 1000, 0, 0, 0, 0, 0, 0, 15, -2050.07, -60.8743, 35.3138, 184.933, 207.55, -110.67, 1005.13, 0.159997, 207.403, -101.161, 1005.26, 1644632084, 0, '-', 0, '-', '-', '-'),
(1, 'Miles_Morales', 'Ocean Flats', 10, 4, 0, 0, 100000099, 3000, 5000, 2000, 2000, 5000, 1000, 1000, 100, 0, 0, 4, -2626.51, 208.429, 4.8125, 350.903, 285.93, -86, 1001.52, 352.95, 291.506, -83.8397, 1001.52, 1644632276, 0, '-', 0, '-', '-', '-'),
(2, 'Miles_Morales', '[ Easter Bay 24/7 ]', 1, 2, 0, 1041270, 276447176, 50, 30, 2000, 1000, 1500, 2500, 5, 100, 1500, 5000, 6, -1415.71, -292.108, 14.1484, 135.637, -26.68, -57.92, 1003.54, 357.58, -23.8074, -55.548, 1003.55, 1644631783, 0, '-', 0, '-', '-', '-'),
(3, 'Miles_Morales', 'Ocean Flats', 1, 1, 0, 0, 54876871, 300, 500, 800, 100, 0, 0, 0, 0, 0, 0, 5, -2672.15, 258.421, 4.63281, 357.907, 372.34, -133.25, 1001.49, 4.8, 373.823, -119.36, 1001.49, 1644731992, 0, '-', 0, '-', '-', '-'),
(4, 'Miles_Morales', 'Esplanade North', 1, 4, 0, 0, 23228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, -2085.15, 1376.31, 7.60937, 259.867, 316.34, -169.6, 999.6, 357.73, 313.017, -165.802, 999.601, 0, 0, '-', 0, '-', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `ID` int(12) DEFAULT 0,
  `contactID` int(12) NOT NULL,
  `contactName` varchar(32) DEFAULT NULL,
  `contactNumber` int(12) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`ID`, `contactID`, `contactName`, `contactNumber`) VALUES
(244, 181, 'Admin', 3628);

-- --------------------------------------------------------

--
-- Table structure for table `dealership`
--

CREATE TABLE `dealership` (
  `ID` int(11) NOT NULL,
  `owner` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT '-',
  `name` varchar(40) CHARACTER SET latin1 NOT NULL DEFAULT 'Dealership',
  `price` int(11) NOT NULL DEFAULT 1,
  `type` int(11) NOT NULL DEFAULT 1,
  `locked` int(11) NOT NULL DEFAULT 1,
  `money` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 100,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `posa` float NOT NULL DEFAULT 0,
  `pointx` float DEFAULT 0,
  `pointy` float DEFAULT 0,
  `pointz` float DEFAULT 0,
  `restock` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dealership`
--

INSERT INTO `dealership` (`ID`, `owner`, `name`, `price`, `type`, `locked`, `money`, `stock`, `posx`, `posy`, `posz`, `posa`, `pointx`, `pointy`, `pointz`, `restock`) VALUES
(0, 'Jhon_Lestender', 'CITY PRIDE DEALERSHIP', 55000, 2, 1, 5780, 49, 1216.48, -1811.99, 16.5938, 3.71894, 1231.76, -1829.16, 13.3965, 0),
(1, 'Bryan_Steven', 'Little Mexico', 120000, 4, 1, 7650, 49, 1113.2, -922.481, 43.3906, 11.2013, 1109.37, -931.849, 43.1864, 0),
(5, 'Caca_Zeline', 'CL`O Dealership', 120000, 2, 1, 0, 0, 2131.81, -1151.32, 24.0602, 194.212, 2128.91, -1138.32, 25.4295, 0),
(6, '-', 'Rodeo', 10000000, 1, 1, 0, 0, 334.891, -1338.25, 14.5078, 26.8133, 340.601, -1349, 14.5078, 0),
(2, 'Aftah_Reyzz', 'Rodeo', 1, 1, 1, 13558, 7, 552.556, -1293.89, 17.2422, 171.083, 552.1, -1283.01, 17.2422, 0),
(3, '-', 'Rodeo', 900000, 2, 1, 0, 50, 562.09, -1506.7, 14.5417, 261.013, 552.511, -1511.25, 14.5674, 0),
(4, 'Leone_Deffrend', 'Downtown Los Santos', 500000, 3, 1, 0, 100, 1658.58, -1342.11, 17.4448, 276.722, 1643.27, -1349.17, 17.4531, 0),
(7, 'Ina', 'Queens', 1, 3, 1, 25500, 9, -2435.6, 506.582, 29.9293, 160.889, -2425.56, 510.611, 29.9297, 0),
(8, 'Dio', 'Downtown', 10000000, 5, 1, 285600, 58, -1955.19, 303.02, 35.4688, 316.242, -1978.48, 262.226, 35.1719, 0);

-- --------------------------------------------------------

--
-- Table structure for table `doors`
--

CREATE TABLE `doors` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT 'None',
  `password` varchar(50) DEFAULT '',
  `icon` int(11) DEFAULT 19130,
  `locked` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `vip` int(11) NOT NULL DEFAULT 0,
  `faction` int(11) NOT NULL DEFAULT 0,
  `family` int(11) NOT NULL DEFAULT -1,
  `garage` tinyint(3) NOT NULL DEFAULT 0,
  `custom` int(11) NOT NULL DEFAULT 0,
  `extvw` int(11) DEFAULT 0,
  `extint` int(11) DEFAULT 0,
  `extposx` float DEFAULT 0,
  `extposy` float DEFAULT 0,
  `extposz` float DEFAULT 0,
  `extposa` float DEFAULT 0,
  `intvw` int(11) DEFAULT 0,
  `intint` int(11) NOT NULL DEFAULT 0,
  `intposx` float DEFAULT 0,
  `intposy` float DEFAULT 0,
  `intposz` float DEFAULT 0,
  `intposa` float DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doors`
--

INSERT INTO `doors` (`ID`, `name`, `password`, `icon`, `locked`, `admin`, `vip`, `faction`, `family`, `garage`, `custom`, `extvw`, `extint`, `extposx`, `extposy`, `extposz`, `extposa`, `intvw`, `intint`, `intposx`, `intposy`, `intposz`, `intposa`) VALUES
(0, 'San Andreas Police Departement', '', 19130, 0, 0, 0, 0, -1, 0, 1, 0, 0, -1605.57, 710.274, 13.8672, 179.114, 0, 10, 246.327, 107.473, 1003.22, 11.6004),
(11, 'Bandara San Fiero', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1421.29, -287.064, 14.1484, 137.277, 0, 0, 1755.21, -1862.09, 13.6466, 271.967),
(12, '[Abandoned Building]', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -431.162, 2240.9, 42.9834, 171.907, 0, 1, -3799.66, 1318.92, 75.5875, 85.7822),
(10, '[Marital Arts Gym]', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -2270.27, -155.987, 35.3203, 270.095, 0, 6, 774.155, -50.3702, 1000.59, 357.163),
(9, '[Department Motor of Vehicle]', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -2041.16, -117.918, 35.9079, 76.3321, 0, 3, 1494.43, 1303.68, 1093.29, 350.787),
(7, '[San Andreas News Helipad]', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1858.92, 487.816, 108.488, 267.488, 0, 1, 2473.28, 2278.06, 91.6868, 166.875),
(8, '[San Fiero Medical Center]', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -2655.15, 640.033, 14.4545, 181.364, 0, 1, 1429.39, -14.425, 1000.92, 269.51),
(6, '[San Andreas News Studio]', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 1, 2467.6, 2252.39, 91.6868, 85.9906, 0, 1, 253.473, 1780.43, 701.086, 90.5452),
(5, '[San Andreas News Network]', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1896.65, 487.122, 35.1719, 90.6724, 0, 1, 2451.84, 2282.28, 91.6744, 221.923),
(4, '[SAPD Basement]', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1594.1, 716.17, -4.90625, 277.077, 0, 0, 0, 0, 0, 0),
(3, '[SAPD Helipad]', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1642.15, 693.722, 38.2422, 83.1627, 0, 10, 218.415, 123.561, 1007.18, 273.098),
(2, 'Bank of San Fiero', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -2056.53, 455.023, 35.1719, 311.015, 0, 0, 1388.32, -26.6738, 1000.87, 92.0591),
(1, 'San Fierro City Hall', '', 19130, 0, 0, 0, 0, -1, 0, 0, 0, 0, -2420.39, -723.221, 134.467, 1.33207, 0, 3, 390.272, 173.807, 1008.38, 88.2452);

-- --------------------------------------------------------

--
-- Table structure for table `familys`
--

CREATE TABLE `familys` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT 'None',
  `leader` varchar(50) NOT NULL DEFAULT 'None',
  `motd` varchar(100) NOT NULL DEFAULT 'None',
  `color` int(11) DEFAULT 0,
  `extposx` float DEFAULT 0,
  `extposy` float DEFAULT 0,
  `extposz` float DEFAULT 0,
  `extposa` float DEFAULT 0,
  `intposx` float DEFAULT 0,
  `intposy` float DEFAULT 0,
  `intposz` float DEFAULT 0,
  `intposa` float DEFAULT 0,
  `fint` int(11) NOT NULL DEFAULT 0,
  `Weapon1` int(11) NOT NULL DEFAULT 0,
  `Ammo1` int(11) NOT NULL DEFAULT 0,
  `Weapon2` int(11) NOT NULL DEFAULT 0,
  `Ammo2` int(11) NOT NULL DEFAULT 0,
  `Weapon3` int(11) NOT NULL DEFAULT 0,
  `Ammo3` int(11) NOT NULL DEFAULT 0,
  `Weapon4` int(11) NOT NULL DEFAULT 0,
  `Ammo4` int(11) NOT NULL DEFAULT 0,
  `Weapon5` int(11) NOT NULL DEFAULT 0,
  `Ammo5` int(11) NOT NULL DEFAULT 0,
  `Weapon6` int(11) NOT NULL DEFAULT 0,
  `Ammo6` int(11) NOT NULL DEFAULT 0,
  `Weapon7` int(11) NOT NULL DEFAULT 0,
  `Ammo7` int(11) NOT NULL DEFAULT 0,
  `Weapon8` int(11) NOT NULL DEFAULT 0,
  `Ammo8` int(11) NOT NULL DEFAULT 0,
  `Weapon9` int(11) NOT NULL DEFAULT 0,
  `Ammo9` int(11) NOT NULL DEFAULT 0,
  `Weapon10` int(11) NOT NULL DEFAULT 0,
  `Ammo10` int(11) NOT NULL DEFAULT 0,
  `safex` float DEFAULT 0,
  `safey` float DEFAULT 0,
  `safez` float DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `marijuana` int(11) NOT NULL DEFAULT 0,
  `component` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `familys`
--

INSERT INTO `familys` (`ID`, `name`, `leader`, `motd`, `color`, `extposx`, `extposy`, `extposz`, `extposa`, `intposx`, `intposy`, `intposz`, `intposa`, `fint`, `Weapon1`, `Ammo1`, `Weapon2`, `Ammo2`, `Weapon3`, `Ammo3`, `Weapon4`, `Ammo4`, `Weapon5`, `Ammo5`, `Weapon6`, `Ammo6`, `Weapon7`, `Ammo7`, `Weapon8`, `Ammo8`, `Weapon9`, `Ammo9`, `Weapon10`, `Ammo10`, `safex`, `safey`, `safez`, `money`, `marijuana`, `component`, `material`) VALUES
(0, 'LatinKing', 'Doy_Camorra', 'None', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `farm`
--

CREATE TABLE `farm` (
  `id` int(11) NOT NULL,
  `owner` varchar(25) NOT NULL DEFAULT '-',
  `name` varchar(26) NOT NULL DEFAULT '-',
  `price` int(11) NOT NULL DEFAULT 0,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `seeds` int(11) NOT NULL DEFAULT 0,
  `potato` int(11) NOT NULL DEFAULT 0,
  `wheat` int(11) NOT NULL DEFAULT 0,
  `orange` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `employe0` varchar(25) NOT NULL DEFAULT '-',
  `employe1` varchar(25) NOT NULL DEFAULT '-',
  `employe2` varchar(25) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `ID` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `password` varchar(36) NOT NULL DEFAULT '',
  `admin` tinyint(3) NOT NULL DEFAULT 0,
  `vip` tinyint(3) NOT NULL DEFAULT 0,
  `faction` tinyint(3) NOT NULL DEFAULT 0,
  `family` int(10) NOT NULL DEFAULT -1,
  `speed` float NOT NULL DEFAULT 2,
  `cX` float NOT NULL,
  `cY` float NOT NULL,
  `cZ` float NOT NULL,
  `cRX` float NOT NULL,
  `cRY` float NOT NULL,
  `cRZ` float NOT NULL,
  `oX` float NOT NULL,
  `oY` float NOT NULL,
  `oZ` float NOT NULL,
  `oRX` float NOT NULL,
  `oRY` float NOT NULL,
  `oRZ` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gstations`
--

CREATE TABLE `gstations` (
  `id` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 10000,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `ID` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL DEFAULT '-',
  `address` varchar(50) DEFAULT 'None',
  `price` int(11) NOT NULL DEFAULT 500000,
  `type` int(11) NOT NULL DEFAULT 1,
  `locked` int(11) NOT NULL DEFAULT 1,
  `money` int(11) NOT NULL DEFAULT 0,
  `houseint` int(11) NOT NULL DEFAULT 0,
  `extposx` float NOT NULL DEFAULT 0,
  `extposy` float NOT NULL DEFAULT 0,
  `extposz` float NOT NULL DEFAULT 0,
  `extposa` float NOT NULL DEFAULT 0,
  `intposx` float NOT NULL DEFAULT 0,
  `intposy` float NOT NULL DEFAULT 0,
  `intposz` float NOT NULL DEFAULT 0,
  `intposa` float NOT NULL DEFAULT 0,
  `visit` bigint(16) DEFAULT 0,
  `houseWeapon1` int(12) DEFAULT 0,
  `houseAmmo1` int(12) DEFAULT 0,
  `houseWeapon2` int(12) DEFAULT 0,
  `houseAmmo2` int(12) DEFAULT 0,
  `houseWeapon3` int(12) DEFAULT 0,
  `houseAmmo3` int(12) DEFAULT 0,
  `houseWeapon4` int(12) DEFAULT 0,
  `houseAmmo4` int(12) DEFAULT 0,
  `houseWeapon5` int(12) DEFAULT 0,
  `houseAmmo5` int(12) DEFAULT 0,
  `houseWeapon6` int(12) DEFAULT 0,
  `houseAmmo6` int(12) DEFAULT 0,
  `houseWeapon7` int(12) DEFAULT 0,
  `houseAmmo7` int(12) DEFAULT 0,
  `houseWeapon8` int(12) DEFAULT 0,
  `houseAmmo8` int(12) DEFAULT 0,
  `houseWeapon9` int(12) DEFAULT 0,
  `houseAmmo9` int(12) DEFAULT 0,
  `houseWeapon10` int(12) DEFAULT 0,
  `houseAmmo10` int(12) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lockers`
--

CREATE TABLE `lockers` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lockers`
--

INSERT INTO `lockers` (`id`, `type`, `posx`, `posy`, `posz`, `interior`) VALUES
(0, 1, 261.699, 111.026, 1004.62, 10),
(1, 2, 1402.26, -17.4339, 1000.98, 1),
(2, 3, 1468.85, -14.5867, 1000.92, 1),
(3, 4, 2465.24, 2252.1, 91.6868, 1),
(4, 5, -4121.16, 867.069, 10.0237, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loglogin`
--

CREATE TABLE `loglogin` (
  `no` int(11) NOT NULL,
  `username` varchar(40) NOT NULL DEFAULT 'None',
  `reg_id` int(11) NOT NULL DEFAULT 0,
  `password` varchar(40) NOT NULL DEFAULT 'None',
  `time` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loglogin`
--

INSERT INTO `loglogin` (`no`, `username`, `reg_id`, `password`, `time`) VALUES
(8880, 'Miles_Morales', 250, '1357900', '2022-02-12 09:48:52'),
(8879, 'Miles_Morales', 250, '1357900', '2022-02-12 09:45:23'),
(8878, 'Miles_Morales', 250, '1357900', '2022-02-12 09:30:21'),
(8877, 'Kevin_McKnight', 255, '1357900', '2022-02-12 09:27:44'),
(8876, 'Miles_Morales', 250, '1357900', '2022-02-12 09:06:45'),
(8875, 'Miles_Morales', 250, '1357900', '2022-02-12 09:01:31'),
(8874, 'Miles_Morales', 250, '1357900', '2022-02-12 04:34:49'),
(8873, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-12 04:24:30'),
(8872, 'Miles_Morales', 250, '1357900', '2022-02-12 04:23:48'),
(8871, 'Miles_Morales', 250, '1357900', '2022-02-12 04:23:23'),
(8870, 'Miles_Morales', 250, '1357900', '2022-02-12 04:20:20'),
(8869, 'Miles_Morales', 250, '1357900', '2022-02-12 04:19:13'),
(8868, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-12 04:07:23'),
(8867, 'Miles_Morales', 250, '1357900', '2022-02-12 04:07:03'),
(8866, 'Miles_Morales', 250, '1357900', '2022-02-12 03:59:48'),
(8865, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-12 03:58:35'),
(8864, 'Miles_Morales', 250, '1357900', '2022-02-12 03:56:22'),
(8863, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-12 03:42:15'),
(8862, 'Miles_Morales', 250, '1357900', '2022-02-12 03:41:46'),
(8861, 'Miles_Morales', 250, '1357900', '2022-02-12 03:38:42'),
(8860, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-12 03:20:33'),
(8859, 'Miles_Morales', 250, '1357900', '2022-02-12 03:20:20'),
(8881, 'Leo_Molena', 258, '135700', '2022-02-12 10:33:51'),
(8882, 'Leo_Molena', 258, '135700', '2022-02-12 10:42:49'),
(8883, 'Miles_Morales', 250, '1357900', '2022-02-12 10:44:05'),
(8884, 'Miles_Morales', 250, '1357900', '2022-02-12 13:28:33'),
(8885, 'Miles_Morales', 250, '1357900', '2022-02-13 11:05:25'),
(8886, 'Miles_Morales', 250, '1357900', '2022-02-13 11:15:49'),
(8887, 'Miles_Morales', 250, '1357900', '2022-02-13 11:22:08'),
(8888, 'Miles_Morales', 250, '1357900', '2022-02-13 11:50:13'),
(8889, 'Miles_Morales', 250, '1357900', '2022-02-13 11:53:27'),
(8890, 'Miles_Morales', 250, '1357900', '2022-02-13 11:58:00'),
(8891, 'Miles_Morales', 250, '1357900', '2022-02-13 12:03:04'),
(8892, 'Miles_Morales', 250, '1357900', '2022-02-13 12:05:45'),
(8893, 'Miles_Morales', 250, '1357900', '2022-02-13 12:15:35'),
(8894, 'Miles_Morales', 250, '1357900', '2022-02-13 12:21:52'),
(8895, 'Miles_Morales', 250, '1357900', '2022-02-13 12:27:51'),
(8896, 'Miles_Morales', 250, '1357900', '2022-02-13 12:43:32'),
(8897, 'Miles_Morales', 250, '1357900', '2022-02-13 12:57:25'),
(8898, 'Miles_Morales', 250, '1357900', '2022-02-13 13:06:00'),
(8899, 'Miles_Morales', 250, '1357900', '2022-02-13 14:30:16'),
(8900, 'Miles_Morales', 250, '1357900', '2022-02-13 14:34:56'),
(8901, 'Miles_Morales', 250, '1357900', '2022-02-13 14:39:58'),
(8902, 'Miles_Morales', 250, '1357900', '2022-02-13 16:00:57'),
(8903, 'Miles_Morales', 250, '1357900', '2022-02-13 16:03:21'),
(8904, 'Miles_Morales', 250, '1357900', '2022-02-13 16:33:10'),
(8905, 'Miles_Morales', 250, '1357900', '2022-02-13 16:38:35'),
(8906, 'Miles_Morales', 250, '1357900', '2022-02-13 16:53:56'),
(8907, 'Miles_Morales', 250, '1357900', '2022-02-13 17:00:28'),
(8908, 'Miles_Morales', 250, '1357900', '2022-02-13 17:03:51'),
(8909, 'Miles_Morales', 250, '1357900', '2022-02-13 17:20:53'),
(8910, 'Miles_Morales', 250, '1357900', '2022-02-13 17:21:44'),
(8911, 'Miles_Morales', 250, '1357900', '2022-02-13 17:25:27'),
(8912, 'Miles_Morales', 250, '1357900', '2022-02-13 17:29:59'),
(8913, 'Miles_Morales', 250, '1357900', '2022-02-13 18:16:37'),
(8914, 'Leo_Molena', 258, '135700', '2022-02-13 18:19:01'),
(8915, 'Leo_Molena', 258, '135700', '2022-02-13 18:25:35'),
(8916, 'Miles_Morales', 250, '1357900', '2022-02-13 18:26:22'),
(8917, 'Miles_Morales', 250, '1357900', '2022-02-13 18:31:28'),
(8918, 'Leo_Molena', 258, '135700', '2022-02-13 18:31:50'),
(8919, 'Miles_Morales', 250, '1357900', '2022-02-13 18:43:22'),
(8920, 'Miles_Morales', 250, '1357900', '2022-02-13 18:58:08'),
(8921, 'Miles_Morales', 250, '1357900', '2022-02-13 19:02:27'),
(8922, 'Miles_Morales', 250, '1357900', '2022-02-13 19:06:55'),
(8923, 'Miles_Morales', 250, '1357900', '2022-02-14 03:52:44'),
(8924, 'Miles_Morales', 250, '1357900', '2022-02-14 04:03:03'),
(8925, 'Leo_Molena', 258, '135700', '2022-02-14 04:07:36'),
(8926, 'Miles_Morales', 250, '1357900', '2022-02-14 04:17:35'),
(8927, 'Miles_Morales', 250, '1357900', '2022-02-14 04:23:27'),
(8928, 'Miles_Morales', 250, '1357900', '2022-02-14 04:42:17'),
(8929, 'Miles_Morales', 250, '1357900', '2022-02-14 05:03:05'),
(8930, 'Miles_Morales', 250, '1357900', '2022-02-14 05:09:15'),
(8931, 'Miles_Morales', 250, '1357900', '2022-02-14 05:12:22'),
(8932, 'Miles_Morales', 250, '1357900', '2022-02-14 05:16:23'),
(8933, 'Miles_Morales', 250, '1357900', '2022-02-14 05:20:21'),
(8934, 'Miles_Morales', 250, '1357900', '2022-02-14 05:25:21'),
(8935, 'Miles_Morales', 250, '1357900', '2022-02-14 05:42:05'),
(8936, 'Miles_Morales', 250, '1357900', '2022-02-14 05:46:55'),
(8937, 'Miles_Morales', 250, '1357900', '2022-02-14 08:12:40'),
(8938, 'Miles_Morales', 250, '1357900', '2022-02-14 08:21:22'),
(8939, 'Miles_Morales', 250, '1357900', '2022-02-14 08:37:14'),
(8940, 'Miles_Morales', 250, '1357900', '2022-02-14 10:28:11'),
(8941, 'Miles_Morales', 250, '1357900', '2022-02-14 11:01:06'),
(8942, 'Miles_Morales', 250, '1357900', '2022-02-14 11:07:33'),
(8943, 'Miles_Morales', 250, '1357900', '2022-02-14 11:21:57'),
(8944, 'Miles_Morales', 250, '1357900', '2022-02-14 11:24:31'),
(8945, 'Miles_Morales', 250, '1357900', '2022-02-14 13:32:07'),
(8946, 'Miles_Morales', 250, '1357900', '2022-02-14 13:34:27'),
(8947, 'Miles_Morales', 250, '1357900', '2022-02-14 20:23:09'),
(8948, 'Leo_Molena', 258, '135700', '2022-02-14 20:53:55'),
(8949, 'Miles_Morales', 250, '1357900', '2022-02-14 21:00:32'),
(8950, 'Miles_Morales', 250, '1357900', '2022-02-14 21:54:15'),
(8951, 'Miles_Morales', 250, '1357900', '2022-02-14 22:25:18'),
(8952, 'Dominique_Vallerio', 230, 'Makaroni', '2022-02-16 05:43:36'),
(8953, 'Miles_Morales', 250, '1357900', '2022-02-16 05:47:50'),
(8954, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-16 05:52:07'),
(8955, 'Miles_Morales', 250, '1357900', '2022-02-16 05:59:01'),
(8956, 'Ricky_Alexander', 252, 'rickyalexander060306', '2022-02-16 06:07:38'),
(8957, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-16 06:07:47'),
(8958, 'Almero_Adrian', 265, 'putravernanda', '2022-02-16 06:11:13'),
(8959, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 06:13:43'),
(8960, 'Hugo_Madrazo', 281, 'HUGO10', '2022-02-16 06:14:57'),
(8961, 'Anwar_Congo', 269, 'danyahmad', '2022-02-16 06:15:20'),
(8962, 'Aleex_Lawrance', 272, 'Faisalakbar', '2022-02-16 06:16:13'),
(8963, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 06:16:19'),
(8964, 'Alfred_Hernandez', 289, 'Alfredganz09', '2022-02-16 06:16:38'),
(8965, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 06:17:34'),
(8966, 'Alvaro_Sky', 296, 'varoez', '2022-02-16 06:18:23'),
(8967, 'Hugo_Madrazo', 281, 'HUGO10', '2022-02-16 06:18:32'),
(8968, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 06:18:39'),
(8969, 'Charles_Sutherland', 291, 'angga123456', '2022-02-16 06:20:11'),
(8970, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 06:20:24'),
(8971, 'Hugo_Madrazo', 281, 'HUGO10', '2022-02-16 06:21:32'),
(8972, 'Hans_Aciel', 262, 'rashid', '2022-02-16 06:21:44'),
(8973, 'Anwar_Congo', 269, 'danyahmad', '2022-02-16 06:21:59'),
(8974, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 06:21:59'),
(8975, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 06:22:36'),
(8976, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 06:22:40'),
(8977, 'Wahyu_Novel', 274, 'fadhil', '2022-02-16 06:22:42'),
(8978, 'Eki_Laoly', 307, 'mantap123', '2022-02-16 06:22:43'),
(8979, 'Aleex_Lawrance', 272, 'Faisalakbar', '2022-02-16 06:23:02'),
(8980, 'Bondan_Obrael', 268, 'iyaiya', '2022-02-16 06:23:47'),
(8981, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 06:23:58'),
(8982, 'Venzyy_Word', 273, 'dedegblk', '2022-02-16 06:24:30'),
(8983, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 06:24:50'),
(8984, 'Fredo_Vintage', 287, 'gakkenek', '2022-02-16 06:24:59'),
(8985, 'Bondan_Obrael', 268, 'iyaiya', '2022-02-16 06:26:04'),
(8986, 'Nathan_Putra', 306, 'jonathan', '2022-02-16 06:26:24'),
(8987, 'Wann_Robertz', 299, 'AWANKNZ', '2022-02-16 06:26:30'),
(8988, 'Charles_Sutherland', 291, 'angga123456', '2022-02-16 06:26:43'),
(8989, 'Rexxy_Junior', 304, 'farel123', '2022-02-16 06:27:03'),
(8990, 'Felix_Conner', 292, 'Papimami', '2022-02-16 06:27:06'),
(8991, 'Aleex_Lawrance', 272, 'Faisalakbar', '2022-02-16 06:27:10'),
(8992, 'Alfred_Hernandez', 289, 'Alfredganz09', '2022-02-16 06:27:22'),
(8993, 'Pablo_Shances', 300, 'apang454', '2022-02-16 06:27:22'),
(8994, 'Marchel_Steven', 264, 'shark_win321', '2022-02-16 06:27:23'),
(8995, 'Kenz_Alexander', 293, 'vito190205', '2022-02-16 06:27:49'),
(8996, 'Fredo_Vintage', 287, 'gakkenek', '2022-02-16 06:28:30'),
(8997, 'Arhan_Malik', 302, 'ARHANAJA', '2022-02-16 06:29:05'),
(8998, 'Pablo_Shances', 300, 'apang454', '2022-02-16 06:29:32'),
(8999, 'Johan_Rick', 308, 'aji12345', '2022-02-16 06:30:17'),
(9000, 'Granger_Escobar', 311, 'AGHITS123456', '2022-02-16 06:31:03'),
(9001, 'David_Tony', 315, 'akugabriel', '2022-02-16 06:31:17'),
(9002, 'Joseph_Jason', 278, 'mhmdadnan28', '2022-02-16 06:31:29'),
(9003, 'Hymooni', 322, 'changeme', '2022-02-16 06:31:42'),
(9004, 'Fredo_Vintage', 287, 'gakkenek', '2022-02-16 06:32:27'),
(9005, 'Charles_Sutherland', 291, 'angga123456', '2022-02-16 06:34:18'),
(9006, 'Billy_Ardabiel', 260, 'pokopow', '2022-02-16 06:34:24'),
(9007, 'Johan_Rick', 308, 'aji12345', '2022-02-16 06:34:32'),
(9008, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-16 06:34:37'),
(9009, 'Rexxy_Junior', 304, 'farel123', '2022-02-16 06:34:54'),
(9010, 'Bondan_Obrael', 268, 'iyaiya', '2022-02-16 06:34:55'),
(9011, 'Ucep_Dargombes', 277, 'widarto50515', '2022-02-16 06:34:56'),
(9012, 'Marchel_Steven', 264, 'shark_win321', '2022-02-16 06:34:59'),
(9013, 'Samuel_Celifford', 266, 'nando123ajh', '2022-02-16 06:35:14'),
(9014, 'Kenz_Alexander', 293, 'vito190205', '2022-02-16 06:35:15'),
(9015, 'Wann_Robertz', 299, 'AWANKNZ', '2022-02-16 06:35:41'),
(9016, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 06:36:03'),
(9017, 'Felix_Conner', 292, 'Papimami', '2022-02-16 06:36:14'),
(9018, 'Esha_Nagata', 279, 'berok123', '2022-02-16 06:36:14'),
(9019, 'Samuel_Zucresen', 310, 'bayuus17', '2022-02-16 06:36:18'),
(9020, 'Vertez_Zenzix', 319, 'jirehjoy09', '2022-02-16 06:36:23'),
(9021, 'Alfred_Hernandez', 289, 'Alfredganz09', '2022-02-16 06:36:35'),
(9022, 'Miles_Morales', 250, '1357900', '2022-02-16 06:36:42'),
(9023, 'Ming_Jhonson', 313, 'zufryx99', '2022-02-16 06:37:16'),
(9024, 'Venzyy_Word', 273, 'dedegblk', '2022-02-16 06:37:18'),
(9025, 'Rey_Ocanner', 317, 'arcelio', '2022-02-16 06:37:34'),
(9026, 'Nathan_Putra', 306, 'jonathan', '2022-02-16 06:37:41'),
(9027, 'Surmok123', 321, 'alfasindo', '2022-02-16 06:37:47'),
(9028, 'Eki_Laoly', 307, 'mantap123', '2022-02-16 06:37:53'),
(9029, 'Pablo_Shances', 300, 'apang454', '2022-02-16 06:37:59'),
(9030, 'Bayu_Noekip', 312, 'qwerty94', '2022-02-16 06:38:12'),
(9031, 'Anwar_Congo', 269, 'danyahmad', '2022-02-16 06:38:14'),
(9032, 'Dominique_Vallerio', 230, 'Makaroni', '2022-02-16 06:38:18'),
(9033, 'Agung_Discovired', 252, 'rickyalexander060306', '2022-02-16 06:38:25'),
(9034, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 06:38:31'),
(9035, 'Han_Torreto', 320, 'wahyu12', '2022-02-16 06:38:38'),
(9036, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 06:38:42'),
(9037, 'Hugo_Madrazo', 281, 'HUGO10', '2022-02-16 06:38:47'),
(9038, 'Dempster_Harryson', 316, 'Rendy123', '2022-02-16 06:38:57'),
(9039, 'Carlos_Yamaguchi', 275, 'carlosyoo', '2022-02-16 06:39:31'),
(9040, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 06:39:31'),
(9041, 'Arya_Wiski', 298, 'aryakrg123', '2022-02-16 06:39:58'),
(9042, 'Hans_Aciel', 262, 'rashid', '2022-02-16 06:40:04'),
(9043, 'Vertez_Zenzix', 319, 'jirehjoy09', '2022-02-16 06:40:58'),
(9044, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 06:41:00'),
(9045, 'Dominique_Vallerio', 230, 'Makaroni', '2022-02-16 06:41:10'),
(9046, 'Maccer_Corleone', 318, 'SKOCODO', '2022-02-16 06:41:15'),
(9047, 'Hanz_Takahashi', 280, 'RAFFA257', '2022-02-16 06:41:28'),
(9048, 'Eki_Laoly', 307, 'mantap123', '2022-02-16 06:41:40'),
(9049, 'Surmok123', 321, 'alfasindo', '2022-02-16 06:41:42'),
(9050, 'Carlos_Yamaguchi', 275, 'carlosyoo', '2022-02-16 06:42:25'),
(9051, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 06:42:54'),
(9052, 'Rey_Ocanner', 317, 'arcelio', '2022-02-16 06:43:43'),
(9053, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 06:44:01'),
(9054, 'Tokoyo_Hiro', 284, 'adit1020', '2022-02-16 06:45:18'),
(9055, 'Carlos_Yamaguchi', 275, 'carlosyoo', '2022-02-16 06:45:38'),
(9056, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 06:45:49'),
(9057, 'Fredo_Vintage', 287, 'gakkenek', '2022-02-16 06:48:31'),
(9058, 'Han_Torreto', 320, 'wahyu12', '2022-02-16 06:50:01'),
(9059, 'Esha_Nagata', 279, 'berok123', '2022-02-16 06:50:08'),
(9060, 'Miles_Morales', 250, '1357900', '2022-02-16 06:59:46'),
(9061, 'Dominique_Vallerio', 230, 'Makaroni', '2022-02-16 07:01:34'),
(9062, 'Agung_Discovired', 252, 'rickyalexander060306', '2022-02-16 07:01:49'),
(9063, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-16 07:02:28'),
(9064, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-16 07:08:31'),
(9065, 'Kenz_Alexander', 293, 'vito190205', '2022-02-16 07:16:02'),
(9066, 'Samuel_Celifford', 266, 'nando123ajh', '2022-02-16 07:16:13'),
(9067, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 07:16:16'),
(9068, 'Ucep_Dargombes', 277, 'widarto50515', '2022-02-16 07:16:16'),
(9069, 'Hugo_Madrazo', 281, 'HUGO10', '2022-02-16 07:16:19'),
(9070, 'Rey_Ocanner', 317, 'arcelio', '2022-02-16 07:16:20'),
(9071, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 07:16:20'),
(9072, 'Hanz_Takahashi', 280, 'RAFFA257', '2022-02-16 07:16:23'),
(9073, 'Felix_Conner', 292, 'Papimami', '2022-02-16 07:16:23'),
(9074, 'Arya_Wiski', 298, 'aryakrg123', '2022-02-16 07:16:24'),
(9075, 'Vertez_Zenzix', 319, 'jirehjoy09', '2022-02-16 07:16:26'),
(9076, 'Rodriguez_Verozlav', 248, 'rickyalexander060306', '2022-02-16 07:16:29'),
(9077, 'Wann_Robertz', 299, 'AWANKNZ', '2022-02-16 07:16:37'),
(9078, 'Jhonatt_Dhelogan', 333, 'kalapia12345', '2022-02-16 07:16:39'),
(9079, 'Ming_Jhonson', 313, 'zufryx99', '2022-02-16 07:16:41'),
(9080, 'Dempster_Harryson', 316, 'Rendy123', '2022-02-16 07:16:44'),
(9081, 'Billy_Ardabiel', 260, 'pokopow', '2022-02-16 07:16:53'),
(9082, 'Dominique_Vallerio', 230, 'Makaroni', '2022-02-16 07:16:53'),
(9083, 'Fredo_Vintage', 287, 'gakkenek', '2022-02-16 07:16:53'),
(9084, 'Miles_Morales', 250, '1357900', '2022-02-16 07:16:56'),
(9085, 'Bondan_Obrael', 268, 'iyaiya', '2022-02-16 07:16:58'),
(9086, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 07:17:03'),
(9087, 'Venzyy_Word', 273, 'dedegblk', '2022-02-16 07:17:06'),
(9088, 'Tokoyo_Hiro', 284, 'adit1020', '2022-02-16 07:17:07'),
(9089, 'Nelson_Wizzly', 328, 'azhiem123', '2022-02-16 07:17:13'),
(9090, 'Anwar_Congo', 269, 'danyahmad', '2022-02-16 07:17:13'),
(9091, 'Ron_Weasley', 335, 'keyword90', '2022-02-16 07:17:25'),
(9092, 'Hans_Aciel', 262, 'rashid', '2022-02-16 07:17:51'),
(9093, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 07:18:07'),
(9094, 'Agung_Discovired', 252, 'rickyalexander060306', '2022-02-16 07:18:09'),
(9095, 'Charles_Sutherland', 291, 'angga123456', '2022-02-16 07:18:53'),
(9096, 'Samuel_Zucresen', 310, 'bayuus17', '2022-02-16 07:19:09'),
(9097, 'Arya_Wiski', 298, 'aryakrg123', '2022-02-16 07:20:41'),
(9098, 'Hans_Aciel', 262, 'rashid', '2022-02-16 07:20:49'),
(9099, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 07:20:50'),
(9100, 'Samuel_Celifford', 266, 'nando123ajh', '2022-02-16 07:21:09'),
(9101, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 07:21:39'),
(9102, 'Nathan_Putra', 306, 'jonathan', '2022-02-16 07:21:59'),
(9103, 'Venzyy_Word', 273, 'dedegblk', '2022-02-16 07:22:09'),
(9104, 'Bondan_Obrael', 268, 'iyaiya', '2022-02-16 07:23:02'),
(9105, 'Mick_Hemswort', 324, 'yusufgtg', '2022-02-16 07:23:57'),
(9106, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 07:25:11'),
(9107, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 07:26:45'),
(9108, 'Kenz_Alexander', 293, 'vito190205', '2022-02-16 07:27:03'),
(9109, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 07:27:56'),
(9110, 'Arleon_Xyzen', 343, 'muplii22', '2022-02-16 07:28:36'),
(9111, 'Bayu_Noekip', 312, 'qwerty94', '2022-02-16 07:30:23'),
(9112, 'Yoru_Yamaguchi', 263, 'dwibahtiar24', '2022-02-16 07:31:31'),
(9113, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 07:31:55'),
(9114, 'Kenz_Alexander', 293, 'vito190205', '2022-02-16 07:34:01'),
(9115, 'Esha_Nagata', 279, 'berok123', '2022-02-16 07:34:08'),
(9116, 'Rodrigo_Ignacio', 339, 'tegar1209', '2022-02-16 07:34:27'),
(9117, 'Asura_Taka', 347, 'banyubiru', '2022-02-16 07:35:20'),
(9118, 'Rolly', 349, 'galang', '2022-02-16 07:35:36'),
(9119, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 07:35:50'),
(9120, 'Marchel_Steven', 264, 'shark_win321', '2022-02-16 07:37:14'),
(9121, 'Vertez_Zenzix', 319, 'jirehjoy09', '2022-02-16 07:37:30'),
(9122, 'Hanz_Takahashi', 280, 'RAFFA257', '2022-02-16 07:38:05'),
(9123, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 07:38:21'),
(9124, 'Marco_Rubio', 334, 'mrzack', '2022-02-16 07:38:54'),
(9125, 'Franqlin_Addison', 283, 'Surakarta09', '2022-02-16 07:39:05'),
(9126, 'Samuel_Celifford', 266, 'nando123ajh', '2022-02-16 07:39:54'),
(9127, 'Bondan_Obrael', 268, 'iyaiya', '2022-02-16 07:40:15'),
(9128, 'Deva_Wallker', 346, 'vadava1', '2022-02-16 07:40:57'),
(9129, 'Hanz', 350, 'riskiaulia23', '2022-02-16 07:41:12'),
(9130, 'Nelson_Wizzly', 328, 'azhiem123', '2022-02-16 07:41:34'),
(9131, 'Surmok_Ozora', 340, 'alfasindo', '2022-02-16 07:42:12'),
(9132, 'Hans_Aciel', 262, 'rashid', '2022-02-16 07:43:30'),
(9133, 'Jhonatt_Dhelogan', 333, 'kalapia12345', '2022-02-16 07:45:04'),
(9134, 'Ucep_Dargombes', 277, 'widarto50515', '2022-02-16 07:45:08'),
(9135, 'Billy_Ardabiel', 260, 'pokopow', '2022-02-16 07:45:08'),
(9136, 'Venzyy_Word', 273, 'dedegblk', '2022-02-16 07:45:28'),
(9137, 'Raymond_Arthur', 345, 'rusland0512', '2022-02-16 07:45:37'),
(9138, 'Ace_Sawn', 294, 'bifrig123', '2022-02-16 07:45:46'),
(9139, 'Wann_Robertz', 299, 'AWANKNZ', '2022-02-16 07:45:53'),
(9140, 'Samuel_Celifford', 266, 'nando123ajh', '2022-02-16 07:46:34'),
(9141, 'Nurul_Anam', 353, 'Anam16', '2022-02-16 07:46:49'),
(9142, 'Nelson_Wizzly', 328, 'azhiem123', '2022-02-16 07:47:54'),
(9143, 'Renzo_Dexied', 358, 'akusiapa1891', '2022-02-16 07:48:11'),
(9144, 'Mick_Hemswort', 324, 'yusufgtg', '2022-02-16 07:48:52'),
(9145, 'Santiago_Daniel', 357, '120720111', '2022-02-16 07:54:59'),
(9146, 'Bondan_Obrael', 268, 'iyaiya', '2022-02-16 07:56:24'),
(9147, 'Dominique_Vallerio', 230, 'Makaroni', '2022-02-16 07:56:25'),
(9148, 'Vertez_Zenzix', 319, 'jirehjoy09', '2022-02-16 07:56:38'),
(9149, 'Surmok_Ozora', 340, 'alfasindo', '2022-02-16 07:56:39'),
(9150, 'Bondan_Obrael', 268, 'iyaiya', '2022-02-16 08:00:25'),
(9151, 'Fredo_Vintage', 287, 'gakkenek', '2022-02-16 08:02:42'),
(9152, 'Billy_Ardabiel', 260, 'pokopow', '2022-02-16 08:02:46'),
(9153, 'Fredo_Vintage', 287, 'gakkenek', '2022-02-16 08:03:25');

-- --------------------------------------------------------

--
-- Table structure for table `logpay`
--

CREATE TABLE `logpay` (
  `player` varchar(40) NOT NULL DEFAULT 'None',
  `playerid` int(11) NOT NULL DEFAULT 0,
  `toplayer` varchar(40) NOT NULL DEFAULT 'None',
  `toplayerid` int(11) NOT NULL DEFAULT 0,
  `ammount` int(11) NOT NULL DEFAULT 0,
  `time` bigint(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logstaff`
--

CREATE TABLE `logstaff` (
  `command` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL,
  `adminid` int(11) NOT NULL,
  `player` varchar(50) NOT NULL DEFAULT '*',
  `playerid` int(11) NOT NULL DEFAULT -1,
  `str` varchar(50) NOT NULL DEFAULT '*',
  `time` bigint(15) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logstaff`
--

INSERT INTO `logstaff` (`command`, `admin`, `adminid`, `player`, `playerid`, `str`, `time`) VALUES
('SETADMINLEVEL', 'Gara_Anggara(None)', 6178, 'Josse_Hachiro', 6179, '1', 1636028486),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '0', 1636077249),
('SETADMINLEVEL', 'Gara_Anggara(Gar.)', 6178, 'Jackie_Kimberly', 6181, '6', 1636154447),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '50000', 1636155512),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Zolotov_Vasiliy', 6183, '50000', 1636155561),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Kai_Helfrich', 6180, '50000', 1636155582),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Josse_Hachiro', 6179, '50000', 1636157083),
('SETLEADER', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '1', 1636159089),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Jordy_Geats', 6188, '30000', 1636163256),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Jordy_Geats', 6188, '300000', 1636163295),
('SETADMINLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'Banjo_Kennedy', 6189, '5', 1636163370),
('SETHELPERLEVEL', 'Banjo_Kennedy(Agen)', 6189, 'Alex_Kristo', 6190, '3', 1636163703),
('SETADMINLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'Alex_Kristo', 6190, '4', 1636163775),
('SETMONEY', 'Banjo_Kennedy(Agen)', 6189, 'Banjo_Kennedy', 6189, '1000000', 1636164210),
('SETLEADER', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '1', 1636196415),
('SETCOMPONENT', 'Banjo_Kennedy(Agen)', 6189, 'Banjo_Kennedy', 6189, '100000', 1636196466),
('SETLEADER', 'Banjo_Kennedy(Agen)', 6189, 'Banjo_Kennedy', 6189, '1', 1636196628),
('SETVIP', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '3(3 days)', 1636196959),
('SETVIP', 'Banjo_Kennedy(Agen)', 6189, 'Banjo_Kennedy', 6189, '3(0 days)', 1636196981),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '100000', 1636197106),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '200000', 1636197118),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '200000', 1636197135),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '5000', 1636201880),
('SETLEADER', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '0', 1636229653),
('SETMONEY', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '2500000', 1636230947),
('SETMATERIAL', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '100', 1636245829),
('SETMATERIAL', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '400', 1636245866),
('SETMATERIAL', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '100', 1636245886),
('SETLEADER', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '2', 1636246090),
('SETLEADER', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '3', 1636246100),
('SETADMINLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'David_Alexandes', 6205, '1', 1636246497),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '4500000', 1636247555),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '450', 1636247570),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '5100', 1636258943),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '500000', 1636310312),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '5000', 1636310394),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '30000', 1636313167),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '500000', 1636436740),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '5000000', 1636436747),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '500000', 1636436892),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '5000000', 1636436895),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '7500000', 1636436986),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '7500000', 1636437353),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '7500000', 1636437438),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '50000000', 1636437921),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '0', 1636438640),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '5000000', 1636438787),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '20000', 1636469035),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '1', 1636600636),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '1', 1636601547),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '1', 1636602508),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '2', 1636602515),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '3', 1636602521),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '4', 1636602526),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '3', 1636602534),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '1', 1636602557),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '100', 1636718132),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '1', 1636718425),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '0', 1636773686),
('SETLEADER', 'Banjo_Kennedy(Agen)', 6189, 'Banjo_Kennedy', 6189, '2', 1636960205),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '1', 1636986977),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '0', 1636998305),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '0', 1636998312),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '1', 1636998314),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '50000', 1637007013),
('SETADMINLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'David_Alexandes', 6205, '1', 1637015562),
('SETLEADER', 'Jackie_Kimberly(Jek)', 6181, 'Alaros_Charos', 6211, '1', 1637015719),
('SETADMINLEVEL', 'Gara_Anggara(Gar.)', 6178, 'David_Alexandes', 6205, '4', 1637016292),
('SETLEADER', 'Gara_Anggara(Gar.)', 6178, 'Gara_Anggara', 6178, '0', 1637017199),
('SETHELPERLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'James_Moore', 6184, '1', 1637018858),
('SETHELPERLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'James_Moore', 6184, '2', 1637019142),
('SETHELPERLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'James_Moore', 6184, '3', 1637019179),
('SETADMINLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'Josse_Hachiro', 6179, '2', 1637019231),
('SETADMINLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'Josse_Hachiro', 6179, '4', 1637019250),
('SETADMINLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'James_Moore', 6184, '1', 1637019262),
('SETADMINLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'Ricardo_Kimberly', 6182, '1', 1637060965),
('SETLEADER', 'Josse_Hachiro(MassEkaa)', 6179, 'Josse_Hachiro', 6179, '0', 1637085936),
('SETMONEY', 'Gara_Anggara(Gar.)', 6178, 'Jeffry_Jerry', 6212, '10000', 1637104195),
('GIVEMONEY', 'Gara_Anggara(Steryro)', 6178, 'Memet_Prakasa', 6221, '200', 1637158448),
('GIVEMONEY', 'Gara_Anggara(Steryro)', 6178, 'Memet_Prakasa', 6221, '20000', 1637158472),
('SETCOMPONENT', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '1000', 1637165077),
('SETMATERIAL', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '100', 1637165089),
('SETMARI', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '24', 1637165102),
('SETLEADER', 'Jackie_Kimberly(Jek)', 6181, 'Jackie_Kimberly', 6181, '0', 1637169565),
('SETADMINLEVEL', 'Jackie_Kimberly(Jek)', 6181, 'Mizuki_Ryugucin', 6202, '1', 1637170583),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '70000', 1637175115),
('SETCOMPONENT', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '1000', 1637175135),
('SETMATERIAL', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '1000', 1637175145),
('SETMARI', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '500', 1637175157),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '500', 1637175470),
('SETCOMPONENT', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '150', 1637175501),
('SETMATERIAL', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '45', 1637175514),
('SETMARI', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '10', 1637175522),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '100', 1637176819),
('SETMATERIAL', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '100', 1637176861),
('SETMARI', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '200', 1637176872),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '25000', 1637178304),
('SETCOMPONENT', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '200', 1637178329),
('SETMATERIAL', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '100', 1637178338),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '250', 1637181376),
('SETMATERIAL', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '100', 1637181410),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '70000', 1637182685),
('SETMARI', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '150', 1637184943),
('SETADMINLEVEL', 'Gara_Anggara(Steryro)', 6178, 'Tryese_Rallywest', 6217, '1', 1637252439),
('SETGOLD', 'Gara_Anggara(Steryro)', 6178, 'Ricardo_Kimberly', 6182, '700', 1637258974),
('SETGOLD', 'Gara_Anggara(Steryro)', 6178, 'James_Moore', 6184, '700', 1637258978),
('SETLEADER', 'Gara_Anggara(Steryro)', 6178, 'James_Moore', 6184, '2', 1637259376),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '70000', 1637261197),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '70000', 1637272487),
('GIVEMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '200', 1637366263),
('GIVEMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '20000', 1637366267),
('SETMATERIAL', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '120', 1637375289),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '20000', 1637375325),
('SETCOMPONENT', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '75', 1637375366),
('SETMARI', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '35', 1637375379),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '25000', 1637375958),
('SETMATERIAL', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '200', 1637379199),
('SETCOMPONENT', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '1000', 1637380102),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '20000', 1637382956),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '500000', 1637387697),
('SETLEADER', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '4', 1637391900),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '500000', 1637392187),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '5000', 1637392241),
('SETMONEY', 'Gara_Anggara(Steryro)', 6178, 'Gara_Anggara', 6178, '500000', 1637394806),
('SETADMINLEVEL', 'Gara_Anggara(Steryro.)', 6231, 'Jackie_Kimberly', 6234, '6', 1637439598),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Tryese_Rallywest', 6236, '1', 1637439793),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Josse_Hachiro', 6235, '5', 1637439899),
('SETADMINLEVEL', 'Gara_Anggara(Steryro.)', 6231, 'Josse_Hachiro', 6235, '4', 1637440072),
('SETADMINLEVEL', 'Gara_Anggara(Steryro.)', 6231, 'Treshawn_Kareem', 6232, '1', 1637440738),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'David_Alexandes', 6240, '4', 1637442127),
('SETMATERIAL', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '500', 1637442342),
('SETPASSWORD', 'Gara_Anggara(Steryro.)', 6231, '*', -1, '12345678', 1637448845),
('SETPASSWORD', 'Gara_Anggara(Steryro.)', 6231, '*', -1, '12345678', 1637448855),
('SETCOMPONENT', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '1000', 1637450546),
('SETCOMPONENT', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '1000', 1637451297),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '20000', 1637457530),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '20000', 1637457531),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '20000', 1637457533),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '20000', 1637457535),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '20000', 1637457540),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457724),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457725),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457726),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457728),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457976),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457978),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457980),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457981),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457985),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637457987),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637458160),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637458161),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637458162),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637458163),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637458167),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '200', 1637458168),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 6234, 'Alaros_Charos', 6250, '1', 1637462927),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Banjo_Kennedy', 6256, '3', 1637510846),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Ricardo_Kimberly', 6252, '1', 1637510875),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Banjo_Kennedy', 6256, '4', 1637510890),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Banjo_Kennedy', 6256, '5', 1637516339),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 6234, 'Alaros_Charos', 6250, '0', 1637527506),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 6234, 'Randal_Vaggor', 6249, '1', 1637527641),
('SETCOMPONENT', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '500', 1637539567),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 6234, 'Jackie_Kimberly', 6234, '1000', 1637545695),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 6234, 'Jackie_Kimberly', 6234, '700', 1637545707),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 6234, 'Jackie_Kimberly', 6234, '70000', 1637545712),
('SETMONEY', 'Banjo_Kennedy(PUKI)', 6256, 'Banjo_Kennedy', 6256, '70000', 1637546088),
('SETMONEY', 'Banjo_Kennedy(PUKI)', 6256, 'Banjo_Kennedy', 6256, '70000', 1637546115),
('SETMONEY', 'Banjo_Kennedy(PUKI)', 6256, 'Banjo_Kennedy', 6256, '70000', 1637546264),
('SETMONEY', 'Banjo_Kennedy(PUKI)', 6256, 'Banjo_Kennedy', 6256, '70000', 1637546265),
('SETMONEY', 'Banjo_Kennedy(PUKI)', 6256, 'Banjo_Kennedy', 6256, '70000', 1637546266),
('SETMONEY', 'Banjo_Kennedy(PUKI)', 6256, 'Banjo_Kennedy', 6256, '70000', 1637546304),
('SETMONEY', 'Banjo_Kennedy(PUKI)', 6256, 'Banjo_Kennedy', 6256, '70000', 1637546305),
('SETMONEY', 'Banjo_Kennedy(PUKI)', 6256, 'Banjo_Kennedy', 6256, '70000', 1637546306),
('SETMONEY', 'Banjo_Kennedy(PUKI)', 6256, 'Banjo_Kennedy', 6256, '70000', 1637546307),
('SETMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '10000', 1637564609),
('SETMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '20000', 1637590787),
('SETMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '140000', 1637591309),
('SETMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '100000', 1637591379),
('SETMATERIAL', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '0', 1637624636),
('SETFACTION', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '1(6 rank)', 1637629941),
('SETCOMPONENT', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '1000', 1637630108),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Jackie_Kimberly', 6234, '3', 1637648865),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Jackie_Kimberly', 6234, '2', 1637648874),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Jackie_Kimberly', 6234, '1', 1637648883),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '2', 1637648889),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '3', 1637648898),
('SETMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '70000', 1637648990),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '2', 1637655891),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '1', 1637667961),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '0', 1637672294),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '1', 1637672329),
('SETLEADER', 'David_Alexandes(Vid)', 6240, 'David_Alexandes', 6240, '2', 1637712455),
('SETLEADER', 'David_Alexandes(Vid)', 6240, 'David_Alexandes', 6240, '3', 1637712921),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 6234, 'Muhta_Isma', 6271, '1', 1637899533),
('SETVIP', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '1(1 days)', 1637900954),
('SETMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '0', 1637921111),
('SETMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '0', 1637921451),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Jackie_Kimberly', 6234, '0', 1637922982),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Jackie_Kimberly', 6234, '0', 1637923307),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 6234, 'Dirga_Jontor', 6273, '5000', 1637927193),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 6234, 'Jackie_Kimberly', 6234, '500', 1637927280),
('GIVEMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '2000', 1637928576),
('SETMONEY', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '20000', 1637930013),
('SETHELPERLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Logan_Cooper', 6277, '3', 1637942387),
('SETHELPERLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Arleon_Xyzen', 6276, '2', 1637942557),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Logan_Cooper', 6277, '0', 1637943106),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 6234, 'Logan_Cooper', 6277, '4', 1637943133),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 6234, 'Ricardo_Kimberly', 6252, '0', 1638341468),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Jackie_Kimberly', 6234, '1', 1638343381),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Ricardo_Kimberly', 6252, '1', 1638344633),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 6234, 'Jackie_Kimberly', 6234, '2000', 1638383703),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 6234, 'Jackie_Kimberly', 6234, '20000', 1638383706),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 6234, 'Jackie_Kimberly', 6234, '10000', 1638428506),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '0', 1638446788),
('SETLEADER', 'Gara_Anggara(Steryro.)', 6231, 'Gara_Anggara', 6231, '0', 1638448395),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 6234, 'Xan_Khalifa', 6249, '0', 1638454930),
('SETADMINLEVEL', 'Gara_Anggara(None)', 2, 'Jackie_Kimberly', 6, '6', 1638556741),
('SETMONEY', 'Gara_Anggara(Steryro.)', 2, 'Gara_Anggara', 2, '70000', 1638558155),
('SETLEADER', 'Gara_Anggara(Steryro.)', 0, 'Gara_Anggara', 0, '1', 1638743325),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Kai_Rommel', 12, '10000', 1638781316),
('SETLEADER', 'Gara_Anggara(Steryro.)', 0, 'Gara_Anggara', 0, '1', 1638811162),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '20000', 1638855333),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Vladimir_Theo', 34, '20000', 1638855516),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Vladimir_Theo', 34, '5000', 1638856873),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Rhudi_Cibana', 32, '5000', 1638857156),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Vladimir_Theo', 34, '5000', 1638857192),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Josse_Hachiro', 33, '5000', 1638857291),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Mamad_Ahmex', 28, '1', 1638858413),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Mamad_Ahmex', 28, '0', 1638858441),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Mamad_Ahmex', 28, '2', 1638858447),
('SETADMINLEVEL', 'Jackie_Kimberly(Jekx)', 22, 'Alaros_Charos', 9, '5', 1638858545),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Alaros_Charos', 9, '1', 1638858650),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Mamad_Ahmex', 28, '0', 1638858664),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Mamad_Ahmex', 28, '2', 1638858668),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '0', 1638858675),
('SETLEADER', 'Gara_Anggara(Steryro.)', 0, 'Gara_Anggara', 0, '2', 1638877966),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '30000', 1638892290),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Nicholas_Anderson', 39, '20000', 1638892643),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Nicholas_Anderson', 39, '20000', 1638892696),
('SETMONEY', 'Gara_Anggara(Steryro.)', 0, 'Gara_Anggara', 0, '5000', 1638895378),
('SETMONEY', 'Gara_Anggara(Steryro.)', 0, 'Gara_Anggara', 0, '1000', 1638901849),
('SETMONEY', 'Gara_Anggara(Steryro.)', 0, 'Gara_Anggara', 0, '50000', 1638901883),
('SETMONEY', 'Gara_Anggara(Steryro.)', 0, 'Gara_Anggara', 0, '1000', 1638907423),
('SETMONEY', 'Gara_Anggara(Steryro.)', 0, 'Gara_Anggara', 0, '500', 1638916701),
('SETLEADER', 'Gara_Anggara(Steryro.)', 0, 'Gara_Anggara', 0, '1', 1638916945),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Ricardo_Kimberly', 7, '3', 1638932553),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Samuel_Kelly', 40, '20000', 1638934641),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Samuel_Kelly', 40, '20000', 1638934741),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Samuel_Kelly', 40, '20000', 1638934839),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Loren_Hakeem', 44, '20000', 1638972375),
('SETCOMPONENT', 'Alaros_Charos(Sopo)', 9, 'Alaros_Charos', 9, '500', 1639097702),
('SETLEADER', 'Alaros_Charos(Sopo)', 9, 'Ricardo_Kimberly', 7, '0', 1639121693),
('SETLEADER', 'Alaros_Charos(Sopo)', 9, 'Jordy_Geats', 24, '3', 1639121962),
('SETFACTION', 'Alaros_Charos(Sopo)', 9, 'Ricardo_Kimberly', 7, '3(1 rank)', 1639121997),
('SETBANKMONEY', 'Alaros_Charos(Sopo)', 9, 'Vanis_Senju', 65, '700', 1639123262),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Alaros_Charos', 9, '7000', 1639135790),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Alaros_Charos', 9, '70000', 1639135792),
('SETFACTION', 'Alaros_Charos(Aros)', 9, 'Oceana_Skyrumi', 10, '3(1 rank)', 1639138585),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Alaros_Charos', 9, '700', 1639138651),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Alaros_Charos', 9, '70000', 1639138653),
('SETFACTION', 'Alaros_Charos(Aros)', 9, 'Loren_Hakeem', 44, '1(1 rank)', 1639140240),
('SETCOMPONENT', 'Alaros_Charos(Aros)', 9, 'Michael_Jarkey', 79, '200', 1639143152),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Kai_Rommel', 12, '4', 1639222314),
('SETLEADER', 'Jackie_Kimberly(Jekx)', 22, 'Ricardo_Kimberly', 7, '0', 1639226072),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Rafi_Madewa', 20, '1000', 1639231803),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Rafi_Madewa', 20, '10000', 1639231808),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Rafi_Madewa', 20, '70000', 1639231820),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Rafi_Madewa', 20, '70000', 1639231823),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Alaros_Charos', 9, '70000', 1639231848),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Alaros_Charos', 9, '700', 1639234203),
('SETMONEY', 'Alaros_Charos(Aros)', 9, 'Alaros_Charos', 9, '70000', 1639234207),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '2000', 1639244650),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '20000', 1639244658),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '20000', 1639273007),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '50000', 1639284399),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '50000', 1639284461),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '50000', 1639295675),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '70000', 1639296279),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '70000', 1639296303),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '70000', 1639296334),
('SETMONEY', 'Jackie_Kimberly(Jekx)', 22, 'Jackie_Kimberly', 22, '70000', 1639296348),
('SETMONEY', 'Alaros_Charos(Badut)', 9, 'Alaros_Charos', 9, '70000', 1639323309),
('GIVEMONEY', 'Alaros_Charos(Aros)', 9, 'Alaros_Charos', 9, '20000', 1639378176),
('SETBANKMONEY', 'Alaros_Charos(Aros)', 9, 'Alaros_Charos', 9, '10000', 1639378194),
('GIVEMONEY', 'Alaros_Charos(Aros)', 9, 'Ringo_Day', 1, '500', 1639386433),
('GIVEMONEY', 'Alaros_Charos(Aros)', 9, 'Ringo_Day', 1, '5000', 1639386438),
('GIVEMONEY', 'Alaros_Charos(Aros)', 9, 'Ringo_Day', 1, '10000', 1639386455),
('SETMONEY', 'Stance_LoneLy(None)', 1, 'Stance_LoneLy', 1, '0', 1639450258),
('SETMONEY', 'Stance_LoneLy(None)', 1, 'Stance_LoneLy', 1, '5000', 1639450342),
('SETADMINLEVEL', 'Stance_LoneLy(None)', 1, 'Kamron_Wessel', 5, '6', 1639461036),
('SETMONEY', 'Stance_LoneLy(None)', 1, 'Anshor_Udin', 7, '1254500', 1639461229),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '208', 1639461659),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '2000', 1639461666),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '20000', 1639461670),
('SETCOMPONENT', 'Stance_LoneLy(LoneLy.)', 1, 'Anshor_Udin', 7, '500', 1639461744),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Vanis_Senju', 8, '65000', 1639461996),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '5000', 1639461999),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '5000', 1639462004),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '5000', 1639462006),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '5000', 1639462008),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '5000', 1639462010),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '5000', 1639462012),
('SETGOLD', 'Stance_LoneLy(LoneLy.)', 1, 'Vanis_Senju', 8, '800', 1639462013),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '70000', 1639462041),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Shayid_Lukman', 6, '70000', 1639462054),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Vanis_Senju', 8, '70000', 1639462118),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Vanis_Senju', 8, '70000', 1639462120),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '70000', 1639462150),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Coby_Onconor', 9, '350000', 1639462529),
('SETLEADER', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '1', 1639463009),
('SETADMINLEVEL', 'Stance_LoneLy(LoneLy.)', 1, 'Melvin_Albert', 4, '4', 1639463026),
('SETLEADER', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '0', 1639463074),
('SETLEADER', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '1', 1639468523),
('SETLEADER', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '1', 1639469555),
('SETLEADER', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '0', 1639469560),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Shayid_Lukman', 6, '2500000', 1639472810),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Shayid_Lukman', 6, '70000', 1639472841),
('SETLEADER', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '3', 1639542059),
('SETBANKMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '10000', 1639542151),
('SETMATERIAL', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '500', 1639542201),
('SETCOMPONENT', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '500', 1639542211),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '9000', 1639542224),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '10000', 1639591579),
('SETCOMPONENT', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '500', 1639591592),
('SETMATERIAL', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '500', 1639591597),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '1', 1639591843),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '57350', 1639591996),
('SETCOMPONENT', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '1000', 1639592123),
('SETCOMPONENT', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '1000', 1639592887),
('SETGOLD', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '1600', 1639601712),
('SETGOLD', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '1650', 1639601718),
('SETGOLD', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '2000', 1639601764),
('SETMATERIAL', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '50', 1639602254),
('SETMATERIAL', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '50', 1639604249),
('SETGOLD', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '5', 1639608904),
('SETGOLD', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '50', 1639608916),
('SETGOLD', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '200', 1639608943),
('SETGOLD', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '200', 1639608954),
('SETLEADER', 'Stance_LoneLy(LoneLy.)', 1, 'Stance_LoneLy', 1, '1', 1639625158),
('SETLEADER', 'Stance_LoneLy(LoneLy.)', 1, 'Bryant_Smith', 21, '1', 1639625203),
('SETLEADER', 'Melvin_Albert(Melvin)', 4, 'Shayid_Lukman', 6, '1', 1639625316),
('SETMATERIAL', 'Stance_LoneLy(LoneLy.)', 1, 'Bryant_Smith', 21, '500', 1639625624),
('SETCOMPONENT', 'Stance_LoneLy(LoneLy.)', 1, 'Bryant_Smith', 21, '500', 1639625629),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Bryant_Smith', 21, '12000', 1639625678),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '300', 1639625881),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Bryant_Smith', 21, '100', 1639625904),
('SETLEADER', 'Melvin_Albert(Melvin)', 4, 'Melvin_Albert', 4, '2', 1639625919),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '3000', 1639625924),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '30000', 1639625928),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639625938),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639625940),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639625942),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639625943),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639625947),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639625950),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639626103),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639626105),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639626108),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639626111),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '50000', 1639626113),
('SETLEADER', 'Melvin_Albert(Melvin)', 4, 'Melvin_Albert', 4, '3', 1639626155),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626162),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626182),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626184),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626185),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626187),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626188),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626189),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626191),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626193),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626207),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626238),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626262),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626275),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626277),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626281),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626304),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626453),
('SETLEADER', 'Melvin_Albert(Melvin)', 4, 'Melvin_Albert', 4, '0', 1639626455),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626464),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626473),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626474),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626478),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626499),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626501),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626504),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626516),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626518),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626519),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626525),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626526),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626528),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626540),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626541),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626543),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626545),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626570),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626588),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626620),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626640),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '70000', 1639626657),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '70000', 1639626660),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '70000', 1639626664),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626670),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626704),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626717),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626719),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626721),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626722),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626723),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626725),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626726),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626727),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626728),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626729),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '20000', 1639626731),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626743),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626761),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626783),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639626784),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626806),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626807),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626808),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626810),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626830),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626832),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626833),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626835),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626837),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626838),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626840),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626841),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626843),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626844),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626845),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626846),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626847),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626849),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639626850),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Bryant_Smith', 21, '2500', 1639626857),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '7000', 1639626901),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '70000', 1639626939),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '70000', 1639626943),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '0', 1639627013),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '70000', 1639627034),
('GIVEMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '3700', 1639627225),
('GIVEMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '3700', 1639627259),
('GIVEMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '3700', 1639627285),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '70000', 1639627359),
('SETLEADER', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '3', 1639627503),
('SETLEADER', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '3', 1639627510),
('SETLEADER', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '0', 1639627524),
('SETFACTION', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '3(1 rank)', 1639627546),
('SETVIP', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '3(15 days)', 1639627899),
('SETVIP', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '2(15 days)', 1639627905),
('SETGOLD', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '200', 1639627961),
('SETVIP', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '3(0 days)', 1639627971),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Daichi_Tokoyo', 23, '20', 1639628067),
('GIVEMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Daichi_Tokoyo', 23, '200', 1639628072),
('SETMONEY', 'Stance_LoneLy(LoneLy.)', 1, 'Lucky_Luciano', 12, '70000', 1639628076),
('SETADMINLEVEL', 'Stance_LoneLy(LoneLy.)', 1, 'Shayid_Lukman', 6, '1', 1639632512),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639633894),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Lucky_Luciano', 12, '70000', 1639633935),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639633966),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639633968),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639633969),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '20000', 1639633973),
('SETMONEY', 'Kamron_Wessel(Vrenzy)', 5, 'Kamron_Wessel', 5, '70000', 1639633997),
('SETLEADER', 'Melvin_Albert(Melvin)', 4, 'Melvin_Albert', 4, '2', 1639634370),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Rudi_Brian', 27, '6', 1640064851),
('SETHELPERLEVEL', 'Rudi_Brian(HEEM)', 27, 'Ken_Dexter', 28, '1', 1640065051),
('SETHELPERLEVEL', 'Rudi_Brian(HEEM)', 27, 'Ken_Dexter', 28, '2', 1640065059),
('SETHELPERLEVEL', 'Rudi_Brian(HEEM)', 27, 'Ken_Dexter', 28, '3', 1640065066),
('SETHELPERLEVEL', 'Rudi_Brian(HEEM)', 27, 'Ken_Dexter', 28, '1', 1640065075),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Ken_Dexter', 28, '1', 1640065102),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Vito_Cannio', 26, '1', 1640065121),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Aryy_Fellix', 25, '1', 1640065138),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Mamad_Ahmex', 29, '1', 1640065144),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Aryy_Fellix', 25, '1', 1640065270),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Aryy_Fellix', 25, '4', 1640065455),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Aryy_Fellix', 25, '6', 1640065490),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Ken_Dexter', 28, '6', 1640065597),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Ken_Dexter', 28, '1', 1640065694),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '33251', 1640065738),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '1000', 1640065815),
('SETGOLD', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '17000', 1640065822),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'Ken_Dexter', 28, '1', 1640065837),
('SETGOLD', 'Aryy_Fellix(Aryy)', 25, 'Rudi_Brian', 27, '1700', 1640065893),
('SETGOLD', 'Aryy_Fellix(Aryy)', 25, 'Ken_Dexter', 28, '1650', 1640066310),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '10000', 1640066654),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '70000', 1640066689),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Jhone_Mikbet', 31, '6', 1640067415),
('SETLEADER', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '1', 1640067432),
('SETBANKMONEY', 'Jhone_Mikbet(Mikbet)', 31, 'Jhone_Mikbet', 31, '500', 1640067911),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '1', 1640068095),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '0', 1640068206),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '50000', 1640079557),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '50000', 1640079561),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Kuro_Mclyore', 64, '6', 1640079851),
('SETADMINLEVEL', 'Kuro_Mclyore(None)', 64, 'Izumi_Miyamura', 34, '2', 1640080564),
('SETMONEY', 'Kuro_Mclyore(None)', 64, 'Kuro_Mclyore', 64, '700', 1640080628),
('SETMONEY', 'Kuro_Mclyore(None)', 64, 'Kuro_Mclyore', 64, '7000', 1640080631),
('SETMONEY', 'Kuro_Mclyore(None)', 64, 'Kuro_Mclyore', 64, '70000', 1640080634),
('SETMONEY', 'Kuro_Mclyore(None)', 64, 'Kuro_Mclyore', 64, '70000', 1640080640),
('SETMONEY', 'Kuro_Mclyore(None)', 64, 'Kuro_Mclyore', 64, '70000', 1640080645),
('SETMONEY', 'Kuro_Mclyore(None)', 64, 'Kuro_Mclyore', 64, '70000', 1640080648),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '70000', 1640080909),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '70000', 1640080910),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '70000', 1640080912),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '70000', 1640080945),
('SETMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Kuro_Mclyore', 64, '70000', 1640081556),
('SETMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Kuro_Mclyore', 64, '70000', 1640081720),
('SETHELPERLEVEL', 'Kuro_Mclyore(KULI JAWA)', 64, 'Frank_Richardo', 32, '2', 1640081947),
('SETLEADER', 'Kuro_Mclyore(KULI JAWA)', 64, 'Kuro_Mclyore', 64, '1', 1640081980),
('SETFACTION', 'Kuro_Mclyore(KULI JAWA)', 64, 'Frank_Richardo', 32, '1(3 rank)', 1640082034),
('SETFACTION', 'Kuro_Mclyore(KULI JAWA)', 64, 'Kuro_Mclyore', 64, '1(1 rank)', 1640082056),
('SETMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Kuro_Mclyore', 64, '70000', 1640082425),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '7000', 1640083752),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '7000', 1640083755),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '70000', 1640083759),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Rudi_Brian', 27, '70000', 1640083765),
('SETMONEY', 'Jhone_Mikbet(Mikbet)', 31, 'Rudolf_Dcarlos', 42, '350', 1640084116),
('SETBANKMONEY', 'Jhone_Mikbet(Mikbet)', 31, 'Rudolf_Dcarlos', 42, '350', 1640084283),
('GIVEMONEY', 'Jhone_Mikbet(Mikbet)', 31, 'Rudolf_Dcarlos', 42, '3500', 1640085319),
('SETMONEY', 'Jhone_Mikbet(Mikbet)', 31, 'Rudolf_Dcarlos', 42, '3500', 1640085352),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '2', 1640088870),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '1', 1640089024),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '3', 1640089571),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '4', 1640089697),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '1', 1640090054),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '7000', 1640095342),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '70000', 1640095348),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '70000', 1640095350),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '70000', 1640095357),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '70000', 1640096940),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Putra_Alamsyah', 39, '4400', 1640102103),
('SETMONEY', 'Rudi_Brian(HEEM)', 27, 'Vin_Michel', 89, '1000', 1640102589),
('SETADMINLEVEL', 'Rudi_Brian(HEEM)', 27, 'Ken_Dexter', 28, '6', 1640102849),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Dimitry_Sidrov', 55, '100', 1640103101),
('SETFACTION', 'Ken_Dexter(Arii-Xyz)', 28, 'Dimitry_Sidrov', 55, '2(1 rank)', 1640103133),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Frank_Richardo', 32, '14000', 1640103292),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Frank_Richardo', 32, '1400', 1640103330),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Qiplyy_Xeros', 82, '870', 1640103697),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Qiplyy_Xeros', 82, '8700', 1640103702),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Qiplyy_Xeros', 82, '8700', 1640103740),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '1000', 1640103957),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '10000', 1640103962),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Putra_Alamsyah', 39, '44000', 1640104087),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '100000', 1640104186),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Guslay_Fetral', 45, '100', 1640104199),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Putra_Alamsyah', 39, '701', 1640104388),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '10000000', 1640104516),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '10000000', 1640104549),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Fadhil_Shelby', 91, '2000', 1640104633),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Frank_Richardo', 32, '10000', 1640104751),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Habib_Lubis', 92, '10000', 1640104968),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '100000', 1640105502),
('SETCOMPONENT', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '500', 1640106392),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Vito_Cannio', 26, '10000', 1640106647),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '1000000', 1640106706),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '1000000', 1640106709),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '10000000', 1640106713),
('SETCOMPONENT', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '1000', 1640106759),
('SETCOMPONENT', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '1000', 1640106820),
('SETCOMPONENT', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '1000', 1640106832),
('SETVIP', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '3(100 days)', 1640107348),
('SETMATERIAL', 'Ken_Dexter(Arii-Xyz)', 28, 'Ken_Dexter', 28, '1000', 1640137347),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Caca_Zeline', 48, '200000', 1640137600),
('SETMONEY', 'Ken_Dexter(Arii-Xyz)', 28, 'Akbar_Dilmore', 58, '100000', 1640139019),
('SETVIP', 'Ken_Dexter(Arii-Xyz)', 28, 'Edo_Austin', 86, '1(15 days)', 1640147892),
('SETFACTION', 'Ken_Dexter(Arii-Xyz)', 28, 'Exa_Razorz', 41, '3(2 rank)', 1640148206),
('SETFACTION', 'Ken_Dexter(Arii-Xyz)', 28, 'Zenn_Salvador', 97, '4(1 rank)', 1640148336),
('SETFACTION', 'Ken_Dexter(Arii-Xyz)', 28, 'Zenn_Salvador', 97, '2(1 rank)', 1640148348),
('SETFACTION', 'Ken_Dexter(Arii X Caca)', 28, 'Dimitry_Sidrov', 55, '2(5 rank)', 1640160589),
('SETLEADER', 'Ken_Dexter(Arii X Caca)', 28, 'Ken_Dexter', 28, '2', 1640160836),
('SETLEADER', 'Ken_Dexter(Arii X Caca)', 28, 'Ken_Dexter', 28, '1', 1640160972),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '600000', 1640175199),
('SETVIP', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '3(30 days)', 1640175232),
('SETVIP', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '3(0 days)', 1640175256),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '70000', 1640177594),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '700000', 1640177652),
('SETHELPERLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Gustavo_Salvatore', 66, '1', 1640177828),
('SETHELPERLEVEL', 'Jhone_Mikbet(Mikbet)', 31, 'Gustavo_Salvatore', 66, '2', 1640179305),
('SETHELPERLEVEL', 'Jhone_Mikbet(Mikbet)', 31, 'Gustavo_Salvatore', 66, '1', 1640179318),
('SETMONEY', 'Jhone_Mikbet(Mikbet)', 31, 'Jun_Giobarak', 38, '133261', 1640179556),
('SETMONEY', 'Jhone_Mikbet(Mikbet)', 31, 'Jun_Giobarak', 38, '49000', 1640179826),
('SETMONEY', 'Ken_Dexter(Arii X Caca)', 28, 'Ken_Dexter', 28, '100000', 1640179859),
('SETMONEY', 'Ken_Dexter(Arii X Caca)', 28, 'Ken_Dexter', 28, '100000', 1640179883),
('SETMONEY', 'Ken_Dexter(Arii X Caca)', 28, 'Ken_Dexter', 28, '100000', 1640179890),
('SETMONEY', 'Ken_Dexter(Arii X Caca)', 28, 'Ken_Dexter', 28, '1000000', 1640179918),
('SETVIP', 'Ken_Dexter(Arii X Caca)', 28, 'Vhano_Dvinci', 111, '2(30 days)', 1640179965),
('SETMONEY', 'Jhone_Mikbet(Mikbet)', 31, 'Jhone_Mikbet', 31, '1332600', 1640180029),
('GIVEMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Kuro_Mclyore', 64, '20000', 1640181752),
('SETHELPERLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Gustavo_Salvatore', 66, '1', 1640181766),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Qiplyy_Xeros', 82, '113100', 1640182027),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Bima_Dinata', 49, '568000', 1640182131),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Akbar_Dilmore', 58, '650000', 1640182154),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Akbar_Dilmore', 58, '560000', 1640182340),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Akbar_Dilmore', 58, '100000', 1640182630),
('GIVEMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Bryan_Steven', 59, '6900', 1640182639),
('GIVEMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Jun_Giobarak', 38, '20000', 1640183343),
('GIVEMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Jun_Giobarak', 38, '10000', 1640183351);
INSERT INTO `logstaff` (`command`, `admin`, `adminid`, `player`, `playerid`, `str`, `time`) VALUES
('GIVEMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Jun_Giobarak', 38, '10000', 1640183358),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Gara_Anggara', 115, '6', 1640187830),
('SETMONEY', 'Gara_Anggara(None)', 115, 'Gara_Anggara', 115, '20000', 1640187869),
('SETMONEY', 'Gara_Anggara(None)', 115, 'Gara_Anggara', 115, '2000', 1640187904),
('SETADMINLEVEL', 'Ken_Dexter(Arii X Caca)', 28, 'Vito_Cannio', 26, '6', 1640188855),
('SETMONEY', 'Gara_Anggara(None)', 115, 'Gara_Anggara', 115, '50000', 1640189222),
('SETMONEY', 'Gara_Anggara(None)', 115, 'Gara_Anggara', 115, '55000', 1640189231),
('SETMONEY', 'Gara_Anggara(None)', 115, 'Gara_Anggara', 115, '10000', 1640189249),
('SETMONEY', 'Gara_Anggara(None)', 115, 'Gara_Anggara', 115, '45000', 1640190010),
('SETMONEY', 'Gara_Anggara(None)', 115, 'Gara_Anggara', 115, '45000', 1640190098),
('SETMONEY', 'Gara_Anggara(None)', 115, 'Gara_Anggara', 115, '45000', 1640190134),
('SETHELPERLEVEL', 'Ken_Dexter(Arii X Caca)', 28, 'Vito_Cannio', 26, '3', 1640192401),
('SETHELPERLEVEL', 'Ken_Dexter(Arii X Caca)', 28, 'Vito_Cannio', 26, '2', 1640192404),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '100000000', 1640192537),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'Aryy_Fellix', 25, '0', 1640193028),
('SETADMINLEVEL', 'Ken_Dexter(Arii X Caca)', 28, 'Vito_Cannio', 26, '1', 1640193154),
('SETADMINLEVEL', 'Ken_Dexter(Arii X Caca)', 28, 'Vito_Cannio', 26, '6', 1640193199),
('SETLEADER', 'Ken_Dexter(Arii X Caca)', 28, 'Ken_Dexter', 28, '3', 1640197512),
('SETLEADER', 'Ken_Dexter(Arii X Caca)', 28, 'Ken_Dexter', 28, '0', 1640197696),
('SETMONEY', 'Ken_Dexter(Arii X Caca)', 28, 'Rudolf_Dcarlos', 42, '10000', 1640199897),
('SETLEADER', 'Vito_Cannio(Vitoo)', 26, 'Vito_Cannio', 26, '3', 1640200982),
('SETLEADER', 'Vito_Cannio(Vitoo)', 26, 'Vito_Cannio', 26, '0', 1640201092),
('SETMONEY', 'Vito_Cannio(Vitoo)', 26, 'Vito_Cannio', 26, '5000000', 1640205269),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Richard_Bryan', 114, '2', 1640220260),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Juna_Mirza', 33, '1', 1640220270),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Richard_Bryan', 114, '145000', 1640220959),
('SETGOLD', 'Aryy_Fellix(Aryy)', 25, 'Richard_Bryan', 114, '800', 1640221130),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '2', 1640221168),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Richard_Bryan', 114, '200000', 1640221303),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Richard_Bryan', 114, '2500000', 1640221357),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Richard_Bryan', 114, '4', 1640221424),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '4', 1640221428),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'Juna_Mirza', 33, '3', 1640221431),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '2500000', 1640221759),
('SETGOLD', 'Aryy_Fellix(Aryy)', 25, 'Juna_Mirza', 33, '800', 1640221793),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '2500000', 1640221814),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '0', 1640221869),
('SETMONEY', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '62500000', 1640221889),
('SETFACTION', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '2(6 rank)', 1640229471),
('SETFACTION', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '3(6 rank)', 1640229483),
('SETLEADER', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '1', 1640229731),
('SETLEADER', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '2', 1640229797),
('SETLEADER', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '2', 1640229813),
('SETLEADER', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '2', 1640229820),
('SETLEADER', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '1', 1640230171),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640230208),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '1000', 1640230211),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '1000', 1640230215),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '1000', 1640230217),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640230224),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640230228),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640230249),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640230284),
('GIVEMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640230391),
('GIVEMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640230438),
('GIVEMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640230450),
('GIVEMONEY', 'Vito_Cannio(Vitoo)', 26, 'Vito_Cannio', 26, '10000', 1640232342),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640236144),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640236146),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640236803),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640236813),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640236827),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640236830),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640236831),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '1000', 1640237234),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Richarrd_Bryan', 119, '1000', 1640237299),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Richarrd_Bryan', 119, '10000', 1640237313),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640237339),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640237355),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640237361),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640237365),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Akbar_Dilmore', 58, '100000', 1640237386),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640238180),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '1000', 1640238365),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640238376),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640238382),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640238395),
('SETADMINLEVEL', 'Ken_Dexter(Arii)', 28, 'Richarrd_Bryan', 119, '2', 1640238739),
('SETLEADER', 'Ken_Dexter(Arii)', 28, 'Lezzy_Marrveric', 99, '3', 1640241344),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Lezzy_Marrveric', 99, '1000', 1640241398),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Lezzy_Marrveric', 99, '10000', 1640241401),
('SETLEADER', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '3', 1640245437),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640245461),
('SETLEADER', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '1', 1640245524),
('SETGOLD', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '1000', 1640245543),
('SETMONEY', 'Vito_Cannio(Vitoo)', 26, 'Vito_Cannio', 26, '100000000', 1640254960),
('SETCOMPONENT', 'Vito_Cannio(Vitoo)', 26, 'Vito_Cannio', 26, '1000', 1640255194),
('SETMONEY', 'Vito_Cannio(Vitoo)', 26, 'Vito_Cannio', 26, '1000000', 1640255248),
('SETGOLD', 'Aryy_Fellix(Aryy)', 25, 'Izumi_Miyamura', 34, '200', 1640256684),
('SETGOLD', 'Aryy_Fellix(Aryy)', 25, 'Richarrd_Bryan', 119, '800', 1640257078),
('SETLEADER', 'Vito_Cannio(Vitoo)', 26, 'Vito_Cannio', 26, '3', 1640259412),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '10000', 1640262435),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640262450),
('SETADMINLEVEL', 'Ken_Dexter(Arii)', 28, 'Thomas_Kaizo', 30, '1', 1640262510),
('SETADMINLEVEL', 'Ken_Dexter(Arii)', 28, 'Vito_Cannio', 26, '1', 1640262792),
('SETADMINLEVEL', 'Ken_Dexter(Arii)', 28, 'Vito_Cannio', 26, '0', 1640262886),
('SETMONEY', 'Ken_Dexter(Arii)', 28, 'Ken_Dexter', 28, '100000', 1640263084),
('GIVEMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Kuro_Mclyore', 64, '20000', 1640266448),
('GIVEMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Kuro_Mclyore', 64, '20000', 1640266469),
('GIVEMONEY', 'Kuro_Mclyore(KULI JAWA)', 64, 'Kuro_Mclyore', 64, '20000', 1640266515),
('SETVIP', 'Ken_Dexter(Arii)', 28, 'Caca_Zeline', 48, '2(30 days)', 1640266780),
('SETGOLD', 'Ken_Dexter(Arii)', 28, 'Caca_Zeline', 48, '500', 1640266808),
('SETGOLD', 'Ken_Dexter(Arii)', 28, 'Caca_Zeline', 48, '800', 1640270402),
('SETVIP', 'Ken_Dexter(Arii)', 28, 'Caca_Zeline', 48, '2(3 days)', 1640270427),
('SETVIP', 'Ken_Dexter(Arii)', 28, 'Caca_Zeline', 48, '2(30 days)', 1640270430),
('SETLEADER', 'Aryy_Fellix(Aryy)', 25, 'William_Schofield', 35, '2', 1640271148),
('SETADMINLEVEL', 'Aryy_Fellix(Aryy)', 25, 'William_Schofield', 35, '4', 1640271166),
('SETMONEY', 'Salsa_Caca(Salsa)', 28, 'Salsa_Caca', 28, '10000', 1640276442),
('SETMONEY', 'Salsa_Caca(Salsa)', 28, 'Salsa_Caca', 28, '100000', 1640276446),
('SETMONEY', 'Salsa_Caca(Salsa)', 28, 'Salsa_Caca', 28, '1000000', 1640276448),
('SETMONEY', 'Salsa_Caca(Salsa)', 28, 'Salsa_Caca', 28, '10000000', 1640276451),
('SETADMINLEVEL', 'Ken_Marley(Arii(:)', 28, 'Ken_Dexter', 129, '6', 1640307271),
('SETFACTION', 'Ken_Dexter(None)', 129, 'Ken_Dexter', 129, '2(6 rank)', 1640308848),
('SETFACTION', 'Ken_Dexter(None)', 129, 'Ken_Dexter', 129, '1(6 rank)', 1640308857),
('SETMONEY', 'Ken_Dexter(Develover )', 129, 'Ken_Dexter', 129, '1000000', 1640310968),
('SETMONEY', 'Ken_Dexter(Develover )', 129, 'Ken_Dexter', 129, '10000000', 1640310970),
('SETADMINLEVEL', 'Ken_Dexter(Develover )', 129, 'Gustavo_Salvatore', 66, '0', 1640311150),
('SETADMINLEVEL', 'Ken_Dexter(Develover )', 129, 'Gustavo_Salvatore', 66, '0', 1640311163),
('SETADMINLEVEL', 'Ken_Dexter(Develover )', 129, 'Juna_Mirza', 33, '6', 1640314185),
('SETCOMPONENT', 'Ken_Dexter(Develover )', 129, 'Ken_Dexter', 129, '1000', 1640318506),
('SETCOMPONENT', 'Ken_Dexter(Develover )', 129, 'Ken_Dexter', 129, '1000', 1640318524),
('SETCOMPONENT', 'Ken_Dexter(Develover )', 129, 'Ken_Dexter', 129, '1000', 1640318537),
('SETGOLD', 'Ken_Dexter(Devloper)', 129, 'Evan_Flurry', 87, '300', 1640326121),
('SETGOLD', 'Ken_Dexter(Devloper)', 129, 'Evan_Flurry', 87, '700', 1640326135),
('SETADMINLEVEL', 'Ken_Dexter(Devloper)', 129, 'Jeck_Wilson', 104, '2', 1640326376),
('SETADMINLEVEL', 'Ken_Dexter(Devloper)', 129, 'Jeck_Wilson', 104, '3', 1640327374),
('SETADMINLEVEL', 'Ken_Dexter(Devloper)', 129, 'Juna_Mirza', 33, '2', 1640328352),
('SETMATERIAL', 'Aryy_Fellix(Moch Aryy)', 25, 'Ken_Dexter', 129, '1000', 1640334848),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Ken_Dexter', 129, '1000', 1640334856),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640334865),
('SETMATERIAL', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640334873),
('SETLEADER', 'Ken_Dexter(Devloper)', 129, 'Ken_Dexter', 129, '0', 1640335748),
('SETADMINLEVEL', 'Ken_Dexter(Arii-Xyz)', 129, 'Fuzura_Velaquez', 135, '3', 1640418204),
('SETADMINLEVEL', 'Ken_Dexter(Arii-Xyz)', 129, 'Fuzura_Velaquez', 135, '1', 1640429087),
('SETADMINLEVEL', 'Ken_Dexter(Arii-Xyz)', 129, 'Fuzura_Velaquez', 135, '1', 1640429481),
('SETADMINLEVEL', 'Ken_Dexter(Arii-Xyz)', 129, 'Fuzura_Velaquez', 135, '3', 1640429522),
('SETVIP', 'Ken_Dexter(Arii-Xyz)', 129, 'Ken_Dexter', 129, '3(1 days)', 1640432177),
('SETVIP', 'Jhone_Mikbet(Mikbet)', 31, 'Jhone_Mikbet', 31, '3(0 days)', 1640432229),
('SETHELPERLEVEL', 'Ken_Dexter(Arii-Xyz)', 129, 'Frank_Richardo', 32, '2', 1640437638),
('SETHELPERLEVEL', 'Ken_Dexter(Arii-Xyz)', 129, 'Thomas_Kaizo', 30, '2', 1640438622),
('SETADMINLEVEL', 'Ken_Dexter(Arii-Xyz)', 129, 'Fuzura_Velaquez', 135, '1', 1640438691),
('SETVIP', 'Ken_Dexter(Arii-Xyz)', 129, 'Ken_Dexter', 129, '3(30 days)', 1640445283),
('SETGOLD', 'Ken_Dexter(Arii-Xyz)', 129, 'Ken_Dexter', 129, '1', 1640450717),
('SETHELPERLEVEL', 'Ken_Marley(Arii(:)', 28, 'Mamad_Ahmex', 29, '2', 1640476712),
('SETADMINLEVEL', 'Aryy_Fellix(Moch Aryy)', 25, 'Richarrd_Bryan', 119, '4', 1640482269),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Izumi_Miyamura', 34, '100', 1640482406),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '500', 1640506528),
('SETLEADER', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '2', 1640509895),
('SETLEADER', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '3', 1640509899),
('SETLEADER', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '0', 1640512861),
('SETLEADER', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '3', 1640512868),
('SETLEADER', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '0', 1640513784),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Mamad_Ahmex', 29, '1', 1640522621),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640526462),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640527174),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640527450),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640528495),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640531542),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640531543),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640532774),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Jhon_Lestender', 133, '3', 1640537982),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Jhon_Lestender', 133, '3', 1640538489),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Jhon_Lestender', 133, '0', 1640538976),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640598774),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1000', 1640599104),
('SETADMINLEVEL', 'Aryy_Fellix(Moch Aryy)', 25, 'Fuzura_Velaquez', 135, '3', 1640611420),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '1', 1640613886),
('SETCOMPONENT', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '10000', 1640613892),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Bryson_Potts', 147, '4', 1640660332),
('SETVIP', 'William_Schofield(MOZART)', 35, 'William_Schofield', 35, '2(7 days)', 1640697785),
('SETGOLD', 'Aryy_Fellix(Moch Aryy)', 25, 'Richarrd_Bryan', 119, '1200', 1640715327),
('SETGOLD', 'Aryy_Fellix(Moch Aryy)', 25, 'Qiplyy_Xeros', 82, '250', 1640715344),
('SETVIP', 'Aryy_Fellix(Moch Aryy)', 25, 'Aryy_Fellix', 25, '3(0 days)', 1640757872),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Bryson_Potts', 147, '0', 1640767091),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Bryson_Potts', 147, '2', 1640767103),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Bryson_Potts', 147, '0', 1640767201),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Bryson_Potts', 147, '3', 1640767204),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Bryson_Potts', 147, '0', 1640767211),
('SETLEADER', 'Richarrd_Bryan(Wibu.)', 119, 'Bryson_Potts', 147, '4', 1640767214),
('SETMONEY', 'Aryy_Fellix(Moch Aryy)', 25, 'Izumi_Miyamura', 34, '300000', 1640836651),
('SETMONEY', 'Aryy_Fellix(Moch Aryy)', 25, 'Izumi_Miyamura', 34, '3000000', 1640836725),
('SETMONEY', 'Aryy_Fellix(Moch Aryy)', 25, 'Izumi_Miyamura', 34, '30000000', 1640836799),
('SETGOLD', 'Aryy_Fellix(Moch Aryy)', 25, 'Izumi_Miyamura', 34, '1500', 1640836856),
('SETADMINLEVEL', 'Toruhara_Kenndo(None)', 155, 'Lamar_Binks', 158, '6', 1642169662),
('SETVIP', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '3(0 days)', 1642170108),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '50000', 1642170126),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '500000', 1642170129),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '100000', 1642170142),
('SETLEADER', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '3', 1642170184),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '1000000', 1642170197),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Toruhara_Kenndo', 155, '1000000', 1642170288),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Toruhara_Kenndo', 155, '10000000', 1642170290),
('SETVIP', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '3(0 days)', 1642171235),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Izumi_Miyamura', 162, '1000000', 1642171666),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Izumi_Miyamura', 162, '10000000', 1642171669),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Izumi_Miyamura', 162, '35000000', 1642171697),
('SETGOLD', 'Lamar_Binks(Lilpen)', 158, 'Izumi_Miyamura', 162, '2500', 1642171919),
('SETVIP', 'Lamar_Binks(Lilpen)', 158, 'Izumi_Miyamura', 162, '3(0 days)', 1642171966),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Pandega_Albert', 151, '6', 1642172555),
('SETMONEY', 'Pandega_Albert(None)', 151, 'Ricard_Bryan', 165, '20000000', 1642173216),
('SETADMINLEVEL', 'Pandega_Albert(None)', 151, 'Ricard_Bryan', 165, '2', 1642173315),
('SETMONEY', 'Pandega_Albert(dep mapping)', 151, 'Pandega_Albert', 151, '200000', 1642173939),
('SETVIP', 'Pandega_Albert(dep mapping)', 151, 'Aftah_Reyzz', 163, '3(30 days)', 1642174181),
('SETMONEY', 'Pandega_Albert(dep mapping)', 151, 'Aftah_Reyzz', 163, '1240000', 1642174231),
('SETVIP', 'Pandega_Albert(dep mapping)', 151, 'Aftah_Reyzz', 163, '2(30 days)', 1642174282),
('SETVIP', 'Pandega_Albert(dep mapping)', 151, 'Aftah_Reyzz', 163, '1(30 days)', 1642174295),
('SETVIP', 'Pandega_Albert(dep mapping)', 151, 'Aftah_Reyzz', 163, '2(30 days)', 1642174299),
('SETBANKMONEY', 'Pandega_Albert(dep mapping)', 151, 'Aftah_Reyzz', 163, '50000', 1642174844),
('SETBANKMONEY', 'Pandega_Albert(dep mapping)', 151, 'Aftah_Reyzz', 163, '0', 1642174896),
('SETGOLD', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '2500', 1642176592),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '20000000', 1642176803),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '20000000', 1642176926),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Qiplyy_Xeros', 167, '6', 1642183684),
('SETMONEY', 'Qiplyy_Xeros(Raply)', 167, 'Brian_Walkers', 168, '2000', 1642183990),
('SETMONEY', 'Qiplyy_Xeros(Raply)', 167, 'Brian_Walkers', 168, '200000', 1642183995),
('SETPASSWORD', 'Qiplyy_Xeros(Raply)', 167, '*', -1, 'skot123', 1642185939),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Skot_Juniorz', 171, '6', 1642218577),
('SETVIP', 'Lamar_Binks(Lilpen)', 158, 'Aftah_Reyzz', 163, '3(0 days)', 1642218984),
('SETGOLD', 'Lamar_Binks(Lilpen)', 158, 'Aftah_Reyzz', 163, '2500', 1642218990),
('GIVEMONEY', 'Skot_Juniorz(Qiplly)', 171, 'Skot_Juniorz', 171, '20000', 1642220049),
('GIVEMONEY', 'Skot_Juniorz(Qiplly)', 171, 'Skot_Juniorz', 171, '20000', 1642220067),
('SETMONEY', 'Skot_Juniorz(Qiplly)', 171, 'Skot_Juniorz', 171, '70000000', 1642220337),
('SETMONEY', 'Skot_Juniorz(Qiplly)', 171, 'Skot_Juniorz', 171, '70000000', 1642220354),
('SETMONEY', 'Skot_Juniorz(Qiplly)', 171, 'Skot_Juniorz', 171, '20000', 1642220374),
('SETMONEY', 'Skot_Juniorz(Qiplly)', 171, 'Skot_Juniorz', 171, '200000', 1642220381),
('SETMONEY', 'Skot_Juniorz(Qiplly)', 171, 'Skot_Juniorz', 171, '2000000', 1642220384),
('SETLEADER', 'Lamar_Binks(Lilpen)', 158, 'Jeck_Wilson', 169, '2', 1642221474),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Jeck_Wilson', 169, '1000000', 1642221528),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Jeck_Wilson', 169, '10000000', 1642221530),
('SETMONEY', 'Skot_Juniorz(Qiplly)', 171, 'Horoushi_Miyamura', 152, '10800000', 1642225380),
('SETMONEY', 'Skot_Juniorz(Qiplly)', 171, 'Black_Bins', 161, '3000000', 1642230747),
('SETMONEY', 'Skot_Juniorz(SkotZ)', 171, 'Albern_Smitch', 154, '700000', 1642239046),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Pablo_Eximer', 153, '1', 1642239888),
('SETFACTION', 'Lamar_Binks(Lilpen)', 158, 'Pablo_Eximer', 153, '1(5 rank)', 1642239924),
('SETMONEY', 'Skot_Juniorz(SkotZ)', 171, 'Lux_Senju', 156, '1400000', 1642245060),
('SETCOMPONENT', 'Skot_Juniorz(SkotZ)', 171, 'Izumi_Miyamura', 162, '500', 1642246359),
('SETCOMPONENT', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '10000', 1642249656),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Skot_Juniorz', 171, '3', 1642257056),
('SETCOMPONENT', 'Skot_Juniorz(SkotZ)', 171, 'Skot_Juniorz', 171, '500', 1642266582),
('SETCOMPONENT', 'Skot_Juniorz(SkotZ)', 171, 'Skot_Juniorz', 171, '500', 1642266772),
('SETCOMPONENT', 'Skot_Juniorz(SkotZ)', 171, 'Skot_Juniorz', 171, '500', 1642266774),
('SETCOMPONENT', 'Skot_Juniorz(SkotZ)', 171, 'Skot_Juniorz', 171, '500', 1642266803),
('SETCOMPONENT', 'Skot_Juniorz(SkotZ)', 171, 'Skot_Juniorz', 171, '500', 1642266990),
('SETCOMPONENT', 'Skot_Juniorz(SkotZ)', 171, 'Skot_Juniorz', 171, '500', 1642267002),
('SETMONEY', 'Pandega_Albert(dep mapping)', 151, 'Pandega_Albert', 151, '700000', 1642267044),
('SETCOMPONENT', 'Skot_Juniorz(SkotZ)', 171, 'Skot_Juniorz', 171, '500', 1642267129),
('SETCOMPONENT', 'Skot_Juniorz(SkotZ)', 171, 'Skot_Juniorz', 171, '500', 1642268675),
('SETLEADER', 'Lamar_Binks(Lilpen)', 158, 'Albern_Smitch', 154, '1', 1642302017),
('SETLEADER', 'Lamar_Binks(Lilpen)', 158, 'Horoushi_Miyamura', 152, '0', 1642302066),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Skot_Juniorz', 171, '3', 1642309521),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Skot_Juniorz', 171, '3', 1642309544),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Skot_Juniorz', 171, '2', 1642309548),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Skot_Juniorz', 171, '3', 1642309559),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Skot_Juniorz', 171, '0', 1642309659),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Pablo_Eximer', 153, '2', 1642387897),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Pablo_Eximer', 153, '3', 1642387992),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Skot_Juniorz', 171, '1', 1642389633),
('SETVIP', 'Lamar_Binks(Lilpen)', 158, 'Devin_Stone', 192, '2(20 days)', 1642417748),
('SETGOLD', 'Lamar_Binks(Lilpen)', 158, 'Devin_Stone', 192, '1800', 1642417757),
('SETVIP', 'Lamar_Binks(Lilpen)', 158, 'Ricard_Bryan', 165, '2(20 days)', 1642428793),
('SETGOLD', 'Lamar_Binks(Lilpen)', 158, 'Ricard_Bryan', 165, '500', 1642428808),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Izumi_Miyamura', 162, '1', 1642429172),
('SETCOMPONENT', 'Lamar_Binks(Lilpen)', 158, 'Leamar_Kenric', 206, '500', 1642437133),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Izumi_Miyamura', 162, '0', 1642471460),
('SETLEADER', 'Lamar_Binks(Lilpen)', 158, 'Jeck_Wilson', 169, '2', 1642472673),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Jeck_Wilson', 169, '1', 1642472691),
('SETMARI', 'Lamar_Binks(Lilpen)', 158, 'Leamar_Kenric', 206, '100', 1642474039),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '20000', 1642479459),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Aryy_Fellix', 214, '6', 1642491628),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '100000', 1642507735),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '100000', 1642507737),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '100000000', 1642507759),
('GIVEGOLD', 'Lamar_Binks(Lilpen)', 158, 'Devin_Stone', 192, '200', 1642507910),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Tempeny_Pulasky', 205, '6', 1642509885),
('SETLEADER', 'Lamar_Binks(Lilpen)', 158, 'Ryuunosuke_Seiha', 219, '1', 1642510165),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Leone_Deffrend', 220, '6', 1642510889),
('SETMONEY', 'Leone_Deffrend(None)', 220, 'Udin_Subarjo', 218, '2000000', 1642511038),
('SETMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '5000000', 1642518137),
('SETGOLD', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '5000', 1642518381),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '10000', 1642519661),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '1000', 1642523127),
('SETGOLD', 'Lamar_Binks(Lilpen)', 158, 'Leo_Ryouta', 150, '2100', 1642523181),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '1000', 1642523284),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '100000', 1642523295),
('SETVIP', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '3(0 days)', 1642541893),
('SETCOMPONENT', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '100000', 1642542064),
('SETCOMPONENT', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '100000', 1642542066),
('SETCOMPONENT', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '100000', 1642542068),
('SETBANKMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '9999', 1642543465),
('SETBANKMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '700', 1642543492),
('SETBANKMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '7000', 1642543496),
('SETHELPERLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Jeck_Wilson', 169, '2', 1642555885),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '1000000', 1642576701),
('SETMONEY', 'Lamar_Binks(Lilpen)', 158, 'Lamar_Binks', 158, '100000000', 1642576722),
('SETLEADER', 'Lamar_Binks(Lilpen)', 158, 'Paul_Lakovsky', 223, '4', 1642603521),
('SETMONEY', 'Aryy_Fellix(None)', 214, 'Aryy_Fellix', 214, '100000', 1642603672),
('SETMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '500000', 1642622517),
('SETMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '50000', 1642631481),
('SETMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '5000000', 1642632631),
('SETMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '10000', 1642633073),
('SETMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '500000', 1642633090),
('SETGOLD', 'Leone_Deffrend(Luxury2k22)', 220, 'Jezzy_Mogilevich', 234, '700', 1642661122),
('SETGOLD', 'Leone_Deffrend(Luxury2k22)', 220, 'Jezzy_Mogilevich', 234, '150', 1642661159),
('SETMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Leone_Deffrend', 220, '500000', 1642661173),
('SETMONEY', 'Leone_Deffrend(Luxury2k22)', 220, 'Jezzy_Mogilevich', 234, '500000', 1642661185),
('SETVIP', 'Leone_Deffrend(Luxury2k22)', 220, 'Jezzy_Mogilevich', 234, '3(31 days)', 1642661209),
('SETADMINLEVEL', 'Dominique_Vallerio(Sabian)', 230, 'Skot_Juniorz', 171, '2', 1642765748),
('SETADMINLEVEL', 'Lamar_Binks(Lilpen)', 158, 'Jackie_Kimberly', 232, '3', 1642770562),
('SETFACTION', 'Leone_Deffrend(Luxury2k22)', 220, 'Dominique_Vallerio', 230, '1(2 rank)', 1642794336),
('SETCOMPONENT', 'Leone_Deffrend(Luxury2k22)', 220, 'Izumi_Miyamura', 162, '1000', 1642794566),
('SETCOMPONENT', 'Leone_Deffrend(Luxury2k22)', 220, 'Izumi_Miyamura', 162, '1000', 1642794567),
('SETCOMPONENT', 'Leone_Deffrend(Luxury2k22)', 220, 'Izumi_Miyamura', 162, '1000', 1642794569),
('SETCOMPONENT', 'Leone_Deffrend(Luxury2k22)', 220, 'Izumi_Miyamura', 162, '1000', 1642794570),
('SETCOMPONENT', 'Leone_Deffrend(Luxury2k22)', 220, 'Izumi_Miyamura', 162, '10000', 1642794571),
('SETCOMPONENT', 'Leone_Deffrend(Luxury2k22)', 220, 'Izumi_Miyamura', 162, '100000', 1642794573),
('SETFACTION', 'Dominique_Vallerio(Sabian)', 230, 'Dominique_Vallerio', 230, '0(6 rank)', 1642796733),
('SETLEADER', 'Leone_Deffrend(Luxury2k22)', 220, 'Dominique_Vallerio', 230, '0', 1642796756),
('SETVIP', 'Leone_Deffrend(Luxury2k22)', 220, 'Skot_Juniorz', 171, '3(12 days)', 1642799056),
('SETVIP', 'Leone_Deffrend(Luxury2k22)', 220, 'Skot_Juniorz', 171, '3(332 days)', 1642799064),
('SETVIP', 'Lamar_Binks(Lilpen)', 158, 'Skot_Juniorz', 171, '0(0 days)', 1642802856),
('SETCOMPONENT', 'Dominique_Vallerio(Sabian)', 230, 'Skot_Juniorz', 171, '13000', 1642806640),
('SETADMINLEVEL', 'Dominique_Vallerio(Sabian)', 230, 'Ricky_Alexander', 248, '4', 1644070129),
('SETADMINLEVEL', 'Dominique_Vallerio(Sabian)', 230, 'Rares_Alnadif', 249, '4', 1644070867),
('SETVIP', 'Rares_Alnadif(Rares)', 249, 'Rares_Alnadif', 249, '3(7 days)', 1644071920),
('SETLEADER', 'Dominique_Vallerio(Sabian)', 230, 'Dominique_Vallerio', 230, '2', 1644073279),
('SETLEADER', 'Asep_CBug(DioProSotot)', 248, 'Asep_CBug', 248, '0', 1644074207),
('SETLEADER', 'Asep_CBug(DioProSotot)', 248, 'Asep_CBug', 248, '1', 1644074272),
('SETADMINLEVEL', 'Dominique_Vallerio(Sabian)', 230, 'Miles_Morales', 250, '4', 1644075050),
('SETVIP', 'Jackson_Shillinford(Dio)', 248, 'Jackson_Shillinford', 248, '3(0 days)', 1644150043),
('SETADMINLEVEL', 'Dominique_Vallerio(Sabian)', 230, 'Rares_Alnadif', 251, '4', 1644220859),
('GIVEMONEY', 'Dominique_Vallerio(Sabian)', 230, 'Dominique_Vallerio', 230, '100', 1644303712),
('SETLEADER', 'Dominique_Vallerio(Sabian)', 230, 'Dominique_Vallerio', 230, '1', 1644387779),
('SETLEADER', 'Dominique_Vallerio(Sabian)', 230, 'Dominique_Vallerio', 230, '0', 1644394907),
('SETPASSWORD', 'Rodriguez_Verozlav(AdminRamah)', 248, '*', -1, 'funtex123', 1644495725),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '100000', 1644521740),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '1000000', 1644521744),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '10000000', 1644521748),
('GIVEMONEY', 'Rodriguez_Verozlav(AdminRamah)', 248, 'Miles_Morales', 250, '2000', 1644521750),
('GIVEMONEY', 'Rodriguez_Verozlav(AdminRamah)', 248, 'Miles_Morales', 250, '20000', 1644521754),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '100000000', 1644521756),
('SETMONEY', 'Rodriguez_Verozlav(AdminRamah)', 248, 'Miles_Morales', 250, '1000000', 1644521762),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Rodriguez_Verozlav', 248, '10000000', 1644521773),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Rodriguez_Verozlav', 248, '100000000', 1644521780),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Rodriguez_Verozlav', 248, '1000000', 1644521788),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Rodriguez_Verozlav', 248, '100000', 1644521790),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '100000', 1644521795),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Rodriguez_Verozlav', 248, '100000000', 1644521798),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '100000000', 1644521817),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Rodriguez_Verozlav', 248, '10000', 1644522812),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '10000', 1644522816),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Rodriguez_Verozlav', 248, '100000000', 1644522819),
('SETLEADER', 'Miles_Morales(MasPuur)', 250, 'Ricky_Alexander', 252, '1', 1644551773),
('SETLEADER', 'Miles_Morales(MasPuur)', 250, 'Ricky_Alexander', 252, '0', 1644552878),
('SETADMINLEVEL', 'Miles_Morales(MasPuur)', 250, 'Ina_Lidya', 253, '4', 1644561363),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Ina_Lidya', 253, '100000', 1644562435),
('SETVIP', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '3(0 days)', 1644565177),
('SETLEADER', 'Miles_Morales(MasPuur)', 250, 'Rodriguez_Verozlav', 248, '2', 1644606069),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '1000000', 1644631991),
('SETMONEY', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '100000', 1644632083),
('SETLEADER', 'Miles_Morales(MasPuur)', 250, 'Miles_Morales', 250, '3', 1644632182),
('SETADMINLEVEL', 'Rodriguez_Verozlav(Dio)', 248, 'Agung_Discovired', 252, '2', 1644991710),
('GIVEMONEY', 'Rodriguez_Verozlav(Dio)', 248, 'Agung_Discovired', 252, '20000', 1644995020),
('GIVEMONEY', 'Rodriguez_Verozlav(Dio)', 248, 'Agung_Discovired', 252, '20000', 1644995021),
('GIVEMONEY', 'Rodriguez_Verozlav(Dio)', 248, 'Agung_Discovired', 252, '20000', 1644995022),
('GIVEMONEY', 'Rodriguez_Verozlav(Dio)', 248, 'Agung_Discovired', 252, '20000', 1644995023),
('GIVEMONEY', 'Dominique_Vallerio(Sabian)', 230, 'Agung_Discovired', 252, '1000', 1644995092),
('GIVEMONEY', 'Dominique_Vallerio(Sabian)', 230, 'Agung_Discovired', 252, '10000', 1644995096),
('SETMONEY', 'Dominique_Vallerio(Sabian)', 230, 'Agung_Discovired', 252, '20000', 1644995217),
('GIVEMONEY', 'Rodriguez_Verozlav(Dio)', 248, 'Wann_Robertz', 299, '200', 1644995942);

-- --------------------------------------------------------

--
-- Table structure for table `ores`
--

CREATE TABLE `ores` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `posrx` float DEFAULT 0,
  `posry` float DEFAULT 0,
  `posrz` float DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ores`
--

INSERT INTO `ores` (`id`, `type`, `posx`, `posy`, `posz`, `posrx`, `posry`, `posrz`) VALUES
(0, 0, 464.381, 866.534, -28.387, 0, 0, 0),
(1, 1, 555.939, 928.367, -43.5709, 0, 0, 0),
(2, 0, 613.141, 865.3, -43.5509, 0, 0, 0),
(3, 1, 637.747, 831.97, -43.6309, 0, 0, 0),
(4, 0, 671.772, 927.05, -41.4543, 0, 0, 0),
(5, 0, 652.36, 738.067, -11.904, 0, 0, 0),
(6, 1, 640.83, 731.161, -2.64683, 0, 0, 0),
(7, 1, 500.121, 781.126, -21.9991, 0, 0, 0),
(8, 0, 488.845, 785.109, -22.3256, 0, 0, 0),
(9, 1, 685.946, 820.716, -28.3049, 0, 0, 0),
(10, 0, 562.108, 982.26, -7.96277, 0, 0, 0),
(11, 0, 535.467, 909.043, -43.4109, 0, 0, 0),
(12, 0, 539.144, 882.115, -36.6565, 0, 0, 0),
(13, 1, 461.884, 884.778, -28.8179, 0, 0, 0),
(14, 1, 698.502, 841.609, -28.2711, 0, 0, 0),
(15, 1, 487.904, 800.007, -22.22, 0, 0, 0),
(16, 0, 546.501, 824.598, -29.9684, 0, 0, 0),
(17, 1, 576.64, 805.685, -29.4404, 0, 0, 0),
(18, 1, 554.326, 786.207, -19.1056, 0, 0, 0),
(19, 1, 709.745, 921.678, -19.4611, 0, 0, 0),
(20, 0, 714.078, 913.618, -19.2864, 0, 0, 0),
(21, 1, 744.818, 776.606, -8.06283, 0, 0, 0),
(22, 0, 600.437, 932.102, -41.5237, 0, 0, 0),
(23, 0, 597.532, 829.781, -43.959, 0, 0, 0),
(24, 1, 540.974, 842.47, -42.1793, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `parks`
--

CREATE TABLE `parks` (
  `id` int(11) DEFAULT 0,
  `posx` float DEFAULT 0,
  `posy` float DEFAULT 0,
  `posz` float DEFAULT 0,
  `interior` int(11) DEFAULT 0,
  `world` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parks`
--

INSERT INTO `parks` (`id`, `posx`, `posy`, `posz`, `interior`, `world`) VALUES
(9, 827.448, -492.818, 17.3359, 0, 0),
(10, 2207.18, 56.3136, 27.5703, 0, 0),
(11, 2360.26, 122.297, 27.5039, 0, 0),
(12, 2326.48, 122.317, 27.6851, 0, 0),
(13, 2377.33, 77.4576, 27.5473, 0, 0),
(14, 2449.81, 58.5926, 27.5975, 0, 0),
(15, 2486.22, 72.0449, 26.4844, 0, 0),
(16, 2469.18, 131.625, 26.4766, 0, 0),
(17, 2520.28, -1673.81, 14.7739, 0, 0),
(1, -2438.28, -636.445, 133.078, 0, 0),
(0, -2105.4, 892.825, 76.7031, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `reg_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(24) NOT NULL DEFAULT '',
  `adminname` varchar(24) NOT NULL DEFAULT 'None',
  `ip` varchar(24) NOT NULL DEFAULT '',
  `password` char(64) NOT NULL DEFAULT '',
  `salt` char(16) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT 'None',
  `admin` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `helper` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `levelup` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `vip` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `vip_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `gold` int(11) NOT NULL DEFAULT 0,
  `reg_date` varchar(30) NOT NULL DEFAULT '',
  `last_login` varchar(30) NOT NULL DEFAULT '',
  `money` int(11) NOT NULL DEFAULT 0,
  `bmoney` int(11) NOT NULL DEFAULT 0,
  `brek` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `phone` mediumint(8) UNSIGNED NOT NULL,
  `phoneoff` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `phonecredit` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `phonebook` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `wt` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `hours` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `minutes` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `seconds` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `paycheck` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `skin` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `facskin` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `age` varchar(30) NOT NULL DEFAULT '',
  `indoor` mediumint(8) NOT NULL DEFAULT -1,
  `inbiz` mediumint(8) NOT NULL DEFAULT -1,
  `inhouse` mediumint(8) NOT NULL DEFAULT -1,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `posa` float NOT NULL DEFAULT 0,
  `interior` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `world` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `health` float NOT NULL DEFAULT 100,
  `armour` float NOT NULL DEFAULT 0,
  `hunger` smallint(5) NOT NULL DEFAULT 100,
  `bladder` smallint(5) NOT NULL DEFAULT 100,
  `energy` smallint(5) NOT NULL DEFAULT 100,
  `sick` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hospital` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `injured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `duty` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `dutytime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `faction` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `factionrank` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `factionlead` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `family` tinyint(3) NOT NULL DEFAULT -1,
  `familyrank` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `jail` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `jail_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `arrest` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `arrest_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `warn` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `job` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `job2` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `jobtime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `sidejobtime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `bustime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `forklifttime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `pizzatime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `exitjob` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `taxitime` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `starterpack` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `medicine` mediumint(8) NOT NULL DEFAULT 0,
  `medkit` mediumint(8) NOT NULL DEFAULT 0,
  `mask` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `helmet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `snack` mediumint(8) NOT NULL DEFAULT 0,
  `sprunk` mediumint(8) NOT NULL DEFAULT 0,
  `gas` mediumint(8) NOT NULL DEFAULT 0,
  `bandage` mediumint(8) NOT NULL DEFAULT 0,
  `gps` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `material` mediumint(8) NOT NULL DEFAULT 0,
  `component` mediumint(8) NOT NULL DEFAULT 0,
  `food` mediumint(8) NOT NULL DEFAULT 0,
  `seed` mediumint(8) NOT NULL DEFAULT 0,
  `potato` mediumint(8) NOT NULL DEFAULT 0,
  `wheat` mediumint(8) NOT NULL DEFAULT 0,
  `orange` mediumint(8) NOT NULL DEFAULT 0,
  `price1` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `price2` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `price3` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `price4` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `marijuana` mediumint(8) NOT NULL DEFAULT 0,
  `plant` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `plant_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `fishtool` tinyint(3) NOT NULL DEFAULT 0,
  `fish` mediumint(8) NOT NULL DEFAULT 0,
  `worm` mediumint(8) NOT NULL DEFAULT 0,
  `idcard` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `idcard_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `drivelic` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `drivelic_time` bigint(16) UNSIGNED NOT NULL DEFAULT 0,
  `hbemode` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `togtweet` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `tnames` varchar(24) NOT NULL DEFAULT '',
  `akuntw` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `togpm` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `toglog` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togads` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `togwt` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Gun1` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun2` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun3` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun4` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun5` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun6` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun7` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun8` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun9` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun10` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun11` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun12` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Gun13` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo1` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo2` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo3` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo4` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo5` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo6` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo7` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo8` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo9` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo10` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo11` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo12` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `Ammo13` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`reg_id`, `username`, `adminname`, `ip`, `password`, `salt`, `email`, `admin`, `helper`, `level`, `levelup`, `vip`, `vip_time`, `gold`, `reg_date`, `last_login`, `money`, `bmoney`, `brek`, `phone`, `phoneoff`, `phonecredit`, `phonebook`, `wt`, `hours`, `minutes`, `seconds`, `paycheck`, `skin`, `facskin`, `gender`, `age`, `indoor`, `inbiz`, `inhouse`, `posx`, `posy`, `posz`, `posa`, `interior`, `world`, `health`, `armour`, `hunger`, `bladder`, `energy`, `sick`, `hospital`, `injured`, `duty`, `dutytime`, `faction`, `factionrank`, `factionlead`, `family`, `familyrank`, `jail`, `jail_time`, `arrest`, `arrest_time`, `warn`, `job`, `job2`, `jobtime`, `sidejobtime`, `bustime`, `forklifttime`, `pizzatime`, `exitjob`, `taxitime`, `starterpack`, `medicine`, `medkit`, `mask`, `helmet`, `snack`, `sprunk`, `gas`, `bandage`, `gps`, `material`, `component`, `food`, `seed`, `potato`, `wheat`, `orange`, `price1`, `price2`, `price3`, `price4`, `marijuana`, `plant`, `plant_time`, `fishtool`, `fish`, `worm`, `idcard`, `idcard_time`, `drivelic`, `drivelic_time`, `hbemode`, `togtweet`, `tnames`, `akuntw`, `togpm`, `toglog`, `togads`, `togwt`, `Gun1`, `Gun2`, `Gun3`, `Gun4`, `Gun5`, `Gun6`, `Gun7`, `Gun8`, `Gun9`, `Gun10`, `Gun11`, `Gun12`, `Gun13`, `Ammo1`, `Ammo2`, `Ammo3`, `Ammo4`, `Ammo5`, `Ammo6`, `Ammo7`, `Ammo8`, `Ammo9`, `Ammo10`, `Ammo11`, `Ammo12`, `Ammo13`) VALUES
(230, 'Dominique_Vallerio', 'Sabian', '255.255.255.255', '84C65588C324C965199DCFD2FE399C4F4D4F62911FDAD5F294F5652E8BD2982C', 'S/&?#mMs-:j^3VAw', 'None', 6, 0, 2, 13, 0, 0, 10, '2022-01-19 06:34:30', '2022-02-16 07:43:52', 128392, 3000, 321659, 0, 0, 0, 0, 0, 21, 29, 21, 77361, 2, 0, 1, '07/07/1997', -1, -1, -1, -78.1009, -1123.74, 1.37812, 218.253, 0, 0, 163, 0, 60, 39, 50, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645081452, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646291009, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(258, 'Leo_Molena', 'None', '255.255.255.255', '3ECC5E908D67C224819E0F204A20FA7D5E22E8DEE585919E6E9A978BA774FA3B', 'el#,;g=3XPO/bbbW', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-12 09:56:04', '2022-02-14 20:59:26', 3500, 3000, 867119, 0, 0, 0, 0, 0, 0, 14, 52, 892, 8, 0, 1, '28/11/1999', -1, -1, -1, -2059.99, -83.6205, 35.6203, 191.826, 0, 0, 100, 0, 96, 93, 94, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(255, 'Kevin_McKnight', 'None', '255.255.255.255', '58DEA8BD870BF5457F3423530CAB2074FB126BF936E294BC7090269587980978', ']*|=kp-xp:S^e|lL', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-12 09:23:19', '2022-02-12 09:28:05', 7000, 3000, 270685, 0, 0, 0, 0, 0, 0, 0, 58, 58, 5, 0, 1, '28/11/1999', -1, -1, -1, 1633.57, -2331.13, 13.8469, 33.9972, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(253, 'Ina_Lidya', 'Ina', '180.242.214.85', 'EC5901ADE33836DD6B0EA87456B3CBC780C66E9D06B13F8011803FBE50856422', '/r(Z%S%jPUln%a_H', 'None', 4, 0, 1, 2, 0, 0, 10, '2022-02-11 13:31:30', '2022-02-11 15:55:14', 70000, 3000, 425299, 0, 0, 0, 0, 0, 2, 3, 44, 7424, 172, 0, 2, '12/07/1998', -1, -1, -1, -640.117, 864.644, 2.3, 136.804, 0, 0, 82, 0, 54, 28, 41, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(252, 'Agung_Discovired', 'AgunK', '182.2.136.74', 'B4A33F367C6F5DF980131AD65BE20EFAD50615C084ED606E0E84DA18F47E77D8', ';2r$qIP+b2CM|~s1', 'None', 2, 0, 1, 1, 0, 0, 10, '2022-02-07 15:03:07', '2022-02-16 07:32:59', 12000, 189, 229133, 0, 0, 0, 0, 0, 1, 37, 18, 1325, 2, 300, 1, '06/03/1997', 1, -1, -1, 359.714, 173.747, 1008.69, 272.902, 3, 0, 100, 73, 26, 13, 19, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645081980, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289624, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 490, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(247, 'Sabian', 'None', '255.255.255.255', 'D44ACD55A15EED47576FCB8F565BE9370FBBD8297B73BB36FEC6ED6197E22B61', 'Fj1x-DcsaQW^0:[4', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-01-22 11:24:38', '2022-01-22 11:25:09', 2500, 3000, 408030, 0, 0, 0, 0, 0, 0, 0, 31, 31, 1, 0, 1, '07/07/1997', -1, -1, -1, 1634.02, -2332.22, 13.8469, 81.7698, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(248, 'Rodriguez_Verozlav', 'Dio', '66.96.225.86', '7C14E95FB17B3DFB237837F0E57A233DB87FB24906CBC0FF19FFD7EE8ED54514', 'pYy[;S*#i-%Zog]l', 'None', 6, 0, 5, 7, 3, 0, 0, '2022-02-05 14:07:17', '2022-02-16 07:46:00', 82746700, 3000, 212807, 0, 0, 0, 0, 0, 7, 0, 0, 25200, 2, 300, 1, '06/03/1997', -1, -1, -1, -1981.21, 268.558, 35.4719, 69.7359, 0, 0, 72, 93, 61, 37, 51, 0, 0, 0, 0, 10642, 1, 6, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 214, 0, 0, 374, 0, 0, 0, 0, 0, 0, 0),
(249, 'Mas_Aris', 'Kentayam20', '255.255.255.255', 'ECE94291CACB761E659B93CAAA5B676CD5E365E4445BF065B189D677D4EAFEFA', 'g{^X/kGMiAp[?pI_', 'None', 4, 0, 1, 1, 3, 1644676720, 0, '2022-02-05 14:17:34', '2022-02-05 15:57:33', 1800, 3000, 333027, 0, 0, 0, 0, 0, 1, 39, 58, 5998, 2, 0, 1, '20/03/2000', -1, -1, -1, 1590.46, -1727.67, 15.273, 218.589, 0, 0, 4, 0, 62, 42, 52, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 23, 25, 0, 31, 34, 0, 0, 0, 0, 0, 0, 0, 0, 135, 245, 0, 150, 220, 0, 0, 0, 0, 0, 0),
(250, 'Miles_Morales', 'MasPuur', '255.255.255.255', '1A063E644CB2D0437164F536BD64525DE3AF810A6EF904395F69D07374706106', ')Q*kDgenW|:l#0m+', 'None', 6, 0, 2, 3, 3, 0, 10, '2022-02-05 15:28:42', '2022-02-16 07:44:01', 121298, 3000, 383253, 0, 0, 0, 0, 0, 11, 23, 11, 40991, 2, 0, 1, '28/11/1999', -1, -1, -1, -1903.61, -1697.52, 24.4216, 143.748, 0, 0, 100, 0, 65, 46, 54, 0, 0, 0, 0, 0, 3, 6, 3, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1646041397, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 286, 0, 0, 491, 0, 0, 0, 0, 0, 0, 0),
(254, 'Purz_Walker', 'None', '182.1.67.0', '56D4E9CDC47D1A3C33053D2D677155E6601968C9BCEDB214A1EC12AF4546D49E', ':-;b<%5Fs%^d:t7-', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-12 02:55:31', '2022-02-12 02:57:16', 2500, 3000, 570890, 0, 0, 0, 0, 0, 0, 1, 45, 105, 2, 0, 1, '28/11/1999', -1, -1, -1, -2050.45, 462.303, 35.4719, 38.2572, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(251, 'Rares_Alnadif', 'None', '255.255.255.255', '215943F53E2A2C17F666014069A5A613C5A6D630BAE484034EBA76C4DC1D421C', ';3&t<RlRj1|+`n8x', 'None', 4, 0, 1, 1, 0, 0, 0, '2022-02-06 00:10:22', '2022-02-07 12:19:40', 1200, 3000, 611173, 0, 0, 0, 0, 0, 1, 15, 10, 4510, 2, 0, 1, '20/03/2000', -1, -1, -1, 1621.31, -1881.01, 13.7331, 266.271, 0, 0, 98, 0, 78, 62, 70, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(259, 'Inem_Mariam', 'None', '255.255.255.255', 'C290E413CAF09A66E39DC35324F56A2023612703F06413402DDDE76844DEA938', '7_~C-QTGhx4\"z+w%', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-14 21:47:13', '2022-02-14 22:24:20', 1295, 2500, 734810, 8752, 0, 5, 0, 1, 0, 37, 6, 2226, 13, 0, 2, '28/11/1999', -1, -1, -1, -1888.6, -1699.09, 22.05, 125.064, 0, 0, 93, 0, 86, 78, 82, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1646146251, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(260, 'Billy_Ardabiel', 'None', '255.255.255.255', '0226DF841E9880E9A47CA37706603FD694956E65C519C580D697CD3EF0EFFC86', 'tF]e_D):Ww|;4t=\'', 'None', 0, 0, 1, 1, 0, 0, 10, '2022-02-16 06:03:27', '2022-02-16 08:01:29', 48500, 3000, 535649, 0, 0, 0, 0, 0, 1, 28, 40, 5320, 2, 0, 1, '07/07/2000', 8, -1, -1, 1443.17, -14.425, 693.341, 269.51, 1, 0, 98, 0, 68, 51, 58, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289416, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(261, 'Jack_Walker', 'None', '36.85.221.250', '080AEC7E0FB82AD09C551E48A234EF1E4A92C89457E392C55487EA4B4DEFF514', '}>[o9dIW6o!uc*.Q', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:03:49', '2022-02-16 06:04:04', 2500, 3000, 522486, 0, 0, 0, 0, 0, 0, 0, 14, 14, 0, 0, 0, '', -1, -1, -1, 1745.38, -1861.59, 13.8761, 267.749, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(262, 'Hans_Aciel', 'None', '255.255.255.255', '685A292CFE8005C4C5320C5F84DED49C7C79E407EADDB3F887D13A2051497520', 'mF0Z-!8&D1H\'7U[d', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:03:58', '2022-02-16 07:43:44', 48500, 3000, 650157, 0, 0, 0, 0, 0, 0, 57, 40, 3460, 2, 0, 1, '10/01/2000', -1, -1, -1, -1930.63, -1766.35, 27.577, 346.612, 0, 0, 69, 0, 80, 68, 73, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289642, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(263, 'Yoru_Yamaguchi', 'None', '61.5.71.4', '149E732876C236A8DB8E4A6D507372D949F8A103AD6A73709C06EC8EEC51EA19', 'Y$p=KcP&t]>=5tza', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:04:18', '2022-02-16 07:32:32', 6500, 3000, 848422, 0, 0, 0, 0, 0, 0, 39, 47, 2387, 2, 0, 1, '24/07/1998', -1, -1, -1, -72.5087, -1107.33, 1.37812, 0.132704, 0, 0, 91, 0, 92, 84, 89, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292108, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(264, 'Marchel_Steven', 'None', '255.255.255.255', 'DF74D0C555617BE5943DECBB81450DD1FEB8C3306420A128E6F2C9058155F43B', 'D}TP/335b\"v(g]z*', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:04:25', '2022-02-16 07:44:57', 23500, 3000, 761042, 0, 0, 0, 0, 0, 0, 52, 16, 3136, 2, 0, 1, '22 1 1991', -1, -1, -1, -1975.79, 263.421, 35.865, 7.30662, 0, 0, 51, 0, 81, 71, 75, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 1645080271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289333, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(265, 'Almero_Adrian', 'None', '125.166.8.177', '411A333E2AA14C882C0E6E5A238128570BCD116F57560C477E5A14AE840A530A', 'AN8B696cqgIrH7|(', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:04:41', '2022-02-16 06:14:00', 2500, 3000, 734419, 0, 0, 0, 0, 0, 0, 7, 53, 473, 2, 0, 1, '09/02/2001', -1, -1, -1, -1434.26, -293.63, 14.3, 64.2028, 0, 0, 96, 0, 98, 97, 97, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(315, 'David_Tony', 'None', '180.252.161.214', '8D0F803868D93A4F2A5C1020E2D2E42179508D3F520D61491236FBB68176CE05', 'FX:n)&o5Ylc$sk&`', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:23:26', '2022-02-16 06:33:44', 2200, 3000, 453596, 0, 0, 0, 0, 0, 0, 5, 43, 343, 2, 0, 1, '12/03/1999', -1, -1, -1, 735.234, -1315.59, 13.2041, 223.79, 0, 0, 98, 0, 99, 98, 98, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(266, 'Samuel_Celifford', 'None', '255.255.255.255', 'B8181C0BFFE664F38FE4AC15F4CD4457FD3944A5CB48C5B48AE5E4483452A157', 'G^#u6Ib\"Uu#6aNd~', 'None', 0, 0, 1, 1, 0, 0, 10, '2022-02-16 06:04:43', '2022-02-16 07:54:18', 20500, 3000, 437548, 0, 0, 0, 0, 0, 1, 18, 35, 4715, 2, 0, 1, '22/10/1998', -1, -1, -1, -1883.9, -195.78, 18.696, 98.302, 0, 0, 54, 0, 71, 56, 64, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082690, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289445, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(267, 'Renz_Delopez', 'None', '140.213.219.149', '32F5E2C53D92ECD200DDFF6E55C1CFAC859A7A06982307494A840BBCEEF3A4C2', '{^AL~QzY9(@^-92P', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:05:02', '2022-02-16 06:15:17', 2500, 3000, 555997, 0, 0, 0, 0, 0, 0, 10, 16, 616, 2, 0, 1, '11/11/1922', -1, -1, -1, -1435.61, -292.881, 14.3, 51.4147, 0, 0, 96, 0, 96, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(268, 'Bondan_Obrael', 'None', '36.65.71.21', '583B7A2097DE5548575A82061F8D866EC150CEA91B59CC603D739D346DD29A57', '9>;:XH8UI=k-=6j;', 'None', 0, 0, 1, 1, 0, 0, 10, '2022-02-16 06:06:20', '2022-02-16 07:56:49', 22900, 3000, 965377, 0, 0, 0, 0, 0, 1, 8, 3, 4083, 2, 0, 1, '2/5/1999', -1, -1, -1, -1918.08, -1701.53, 22.57, 232.904, 0, 0, 53, 0, 77, 63, 69, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289336, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(269, 'Anwar_Congo', 'None', '92.118.228.234', '91FDB4937759D38EBF10A8322C344F1925F0004E753CB943E5D40F7DA1327A00', 'cH.4rw~K1|3xX[wQ', 'None', 0, 0, 1, 1, 0, 0, 10, '2022-02-16 06:08:44', '2022-02-16 07:43:11', 23500, 3000, 177828, 0, 0, 0, 0, 0, 1, 1, 10, 3670, 2, 0, 1, '08/05/1996', -1, -1, -1, -1886.72, -1759.42, 29.9174, 210.676, 0, 0, 50, 0, 78, 66, 72, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289527, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(270, 'Steven_Keizo', 'None', '114.5.254.134', '103C60ECCD87B3F65EBDEC66ED066A04C6C5D45BD7207738975C26D01A9A42EE', '{Q;mD\\O@bf[&BYEs', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:09:19', '2022-02-16 06:16:02', 2500, 3000, 599827, 0, 0, 0, 0, 0, 0, 6, 44, 404, 2, 0, 1, '12/01/2002', -1, -1, -1, -1434.25, -293.259, 14.3, 58.9543, 0, 0, 98, 0, 98, 97, 97, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(271, 'Borneo_Sirait', 'None', '36.75.25.194', '486601F1E338C45D79A452256BF290659B52AB2B15CAEE6D503036CFF336E88A', ';4fZ>h\\@d*U3Exkh', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:09:37', '2022-02-16 06:33:44', 2500, 3000, 983932, 0, 0, 0, 0, 0, 0, 24, 3, 1443, 2, 0, 1, '09/06/2000', -1, -1, -1, -2430.62, -695.543, 133.606, 117.971, 0, 0, 87, 0, 91, 86, 89, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(272, 'Aleex_Lawrance', 'None', '125.161.77.35', '1275F5C71B4403F6C12B9E46E31414BBD47F579D4DC151CF25D15EB84A1BC856', 'ubuHFp*v:!m],0-=', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:09:57', '2022-02-16 06:33:44', 7000, 3000, 987630, 0, 0, 0, 0, 0, 0, 19, 44, 1184, 2, 0, 1, '15/12/2000', -1, -1, -1, -2426.77, -695.689, 133.606, 120.283, 0, 0, 129, 0, 94, 90, 92, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(273, 'Venzyy_Word', 'None', '36.72.42.250', 'E603195054B42184B4D1A76D7366BFC1D5BF7E25FCB8AD888B63E6E78385E4B8', 'JsX&m-e\\s\'#*ASQ=', 'None', 0, 0, 1, 1, 0, 0, 10, '2022-02-16 06:09:58', '2022-02-16 07:49:15', 47300, 3000, 488542, 0, 0, 0, 0, 0, 1, 8, 3, 4083, 2, 0, 1, '12/06/1999', -1, -1, -1, -1881.98, -1698.68, 22.0422, 270.474, 0, 0, 70, 0, 76, 62, 70, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 1645080347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289469, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(274, 'Wahyu_Novel', 'None', '255.255.255.255', '5F20647C66CF0C7E46322623AA73B116A6DE7390FC778AEA764C4E94CDCBE54E', '8:|$!C4T^d)76&[_', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:10:49', '2022-02-16 06:32:59', 7000, 3000, 748327, 0, 0, 0, 0, 0, 0, 21, 40, 1300, 2, 0, 1, '21/09/2003', -1, -1, -1, -2435.6, -700.147, 150.79, 284.013, 0, 0, 43, 0, 92, 88, 90, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(275, 'Carlos_Yamaguchi', 'None', '114.10.8.242', '8EC832EDB03F584B76B181EC6D9E6621106824CB66E9672C93205B50DE6F7EB8', 'IO\\v-*1Uh}:UI.~G', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:11:13', '2022-02-16 06:48:15', 2500, 3000, 736559, 0, 0, 0, 0, 0, 0, 29, 43, 1783, 2, 0, 1, '15/02/2008', -1, -1, -1, -72.9551, -1116.33, 0.886914, 43.8597, 0, 0, 55, 0, 90, 84, 87, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(276, 'Memet_Lazovsky', 'None', '114.10.6.131', 'D065E4526F4CF2DDD0F69F9DB10D4DCBCF145A88DBC09DFFD9E134E80F7BCDAD', 'Digt\'\'5^l8OD)cn9', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:11:16', '2022-02-16 06:16:20', 7000, 3000, 178804, 0, 0, 0, 0, 0, 0, 5, 4, 304, 2, 0, 1, '15/01/2000', -1, -1, -1, -1431.38, -294.759, 14.3, 98.4324, 0, 0, 100, 0, 99, 98, 98, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(277, 'Ucep_Dargombes', 'None', '255.255.255.255', 'E92990D31BDE1E3CB322D2FF4537D07AB2FB4E6BA3ECF2F9B39AD0D8304B3A3E', 'x}#n)M(>lqq)~]/p', 'None', 0, 0, 1, 1, 0, 0, 10, '2022-02-16 06:11:39', '2022-02-16 07:51:23', 45500, 3000, 743014, 0, 0, 0, 0, 0, 1, 12, 26, 4346, 2, 0, 1, '07/11/1995', -1, -1, -1, -1941.9, -1767.92, 27.2516, 85.9257, 0, 0, 47, 0, 73, 59, 65, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289119, 0, 0, 1, 0, '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(278, 'Joseph_Jason', 'None', '180.251.177.158', '75BB4CF4C18CF5BEA993A1313A389B4BD5EC7292456405AEDF4099A152DB030E', '\\o8W*D%g#YAE<5]I', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:11:59', '2022-02-16 06:33:47', 2500, 3000, 407373, 0, 0, 0, 0, 0, 0, 20, 28, 1228, 2, 0, 1, '01/01/2001', -1, -1, -1, -2426.94, -695.017, 133.606, 127.657, 0, 0, 95, 0, 93, 89, 90, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(279, 'Esha_Nagata', 'None', '180.242.42.111', 'C2484E1A3A1C346FA734F7C66586C2C00942F6175FB6E267AE9EE34BB054EAD5', '@<6I~vt`ekMgO(uK', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:12:38', '2022-02-16 07:44:40', 6500, 3000, 623815, 0, 0, 0, 0, 0, 0, 40, 48, 2448, 2, 0, 1, '27/11/2003', -1, -1, -1, -75.7331, -1121.73, 1.37812, 309.194, 0, 0, 94, 0, 85, 77, 81, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645083515, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289404, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(280, 'Hanz_Takahashi', 'None', '103.105.55.116', '2D1279BD954EA602AC1A6B5B1F9038F5CBDEE18CD1F0B6B6C74EC664CBD9A1BA', 'zbp!ocYk!{\";6RPA', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:12:57', '2022-02-16 07:42:30', 50995, 3000, 311959, 8452, 0, 5, 1, 1, 0, 42, 19, 2539, 2, 0, 1, '28/02/1999', -1, -1, -1, -69.6319, -1107.59, 1.37812, 231.02, 0, 0, 66, 0, 86, 77, 81, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292199, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(281, 'Hugo_Madrazo', 'None', '120.188.93.17', '29D497C3079BD3515079C3DDA57C09C5A6BA9D427AE3C6F577A11AC347707FA8', 'lA2Gt*<j*x-hyk|R', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:12:58', '2022-02-16 07:42:55', 2000, 3000, 136948, 0, 0, 0, 0, 0, 0, 57, 7, 3427, 2, 0, 1, '09/10/1999', -1, -1, -1, -76.9651, -1119.56, 1.37812, 328.394, 0, 0, 92, 0, 81, 69, 75, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 1645083721, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289558, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(282, 'Fahri_Shalih', 'None', '103.217.217.106', '6F613ACD3F6C8B501E71299DDF71FDCEAF5EE27585F542458B8A40A7C3A245BC', 'WrI;eJ47Y1T/Wx:8', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:13:33', '2022-02-16 06:22:54', 7000, 3000, 984309, 0, 0, 0, 0, 0, 0, 9, 21, 561, 2, 0, 1, '15/02/2008', -1, -1, -1, -1629.1, -457.386, 13.6431, 90.3488, 0, 0, 94, 0, 97, 95, 96, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(283, 'Franqlin_Addison', 'None', '114.142.169.19', '23E6EFFDF06C962E345E3543FDAC8BBC696205E6F734481E649F42761C26FA08', '`N[m(?N1_Ea(yDYy', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:13:37', '2022-02-16 07:44:09', 23000, 3000, 919105, 0, 0, 0, 0, 0, 0, 55, 20, 3320, 2, 0, 1, '21/04/1998', -1, -1, -1, -1998.7, 251.737, 30.9035, 0.03964, 0, 0, 69, 0, 82, 73, 79, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 1645082998, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289715, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(284, 'Tokoyo_Hiro', 'None', '255.255.255.255', '38103593DA4364A36B0E0B21536EB2957F2D985693B7789C0F2D48A78BBE17A2', 'sQ2^5J?s}YZ^P^2|', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:13:43', '2022-02-16 07:43:48', 22900, 3000, 149377, 0, 0, 0, 0, 0, 0, 52, 21, 3141, 2, 0, 1, '20/02/2000', -1, -1, -1, -1918.69, -1722.23, 22.05, 321.464, 0, 0, 65, 0, 81, 70, 76, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080597, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646290057, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(285, 'Grac_Wande', 'None', '114.79.57.23', 'EBB15914CDD075344B75FD4459B3419C087D94FF78ECBC288F56BE2E6F18BAD5', '|@#,4xW]P{OJ$u;j', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:14:15', '2022-02-16 06:26:16', 7000, 3000, 181684, 0, 0, 0, 0, 0, 0, 12, 1, 721, 2, 0, 1, '02/12/2000', -1, -1, -1, -2421.39, -711.981, 133.556, 90.3796, 0, 0, 77, 0, 96, 93, 95, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(286, 'Frankie_Barayev', 'None', '101.255.164.130', '361E77D9DCE0AC66E555BC6A90B83B4486CBD952D21DFBE09FB7D0A99342C3FD', '0gkgJ:Mkd35zLbRG', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:14:16', '2022-02-16 06:26:55', 7000, 3000, 834156, 0, 0, 0, 0, 0, 0, 12, 39, 759, 2, 0, 1, '23/01/2001', -1, -1, -1, -2392.96, -701.909, 133.553, 87.7982, 0, 0, 96, 0, 96, 93, 94, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(287, 'Fredo_Vintage', 'None', '125.167.82.109', 'CF5FE92C2E99A17C8FC932AFA0FDB1F0690D23D5BD8286B4AC75D355EDDDF734', 'O|*n<Vs3cV)[q91~', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:14:47', '2022-02-16 08:02:53', 50600, 3000, 925163, 0, 0, 0, 0, 0, 0, 38, 34, 2314, 2, 0, 1, '19/02/2000', -1, -1, -1, -1879.23, -1689.96, 22.3456, 16.3199, 0, 0, 100, 0, 86, 80, 82, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082592, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646291922, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(288, 'Brent_Caldwell', 'None', '114.124.195.44', 'DC30DED8B47ED5EE77F310914E0F83E214AAC89199A7AD5DB9BDF3EB852AC70C', 'LU*x=Y]ZQcs1%_Cp', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:15:02', '2022-02-16 06:26:36', 7000, 3000, 263818, 0, 0, 0, 0, 0, 0, 11, 34, 694, 2, 0, 1, '17/01/2002', -1, -1, -1, -2399.63, -709.135, 133.631, 93.1636, 0, 0, 91, 0, 96, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(289, 'Alfred_Hernandez', 'None', '182.3.101.49', '1AEC9E0107DD981AF611DC302B3327D399341C35EEA1A8AC9B09D1626C5959C5', 'A@QE>{k0\\jCMDRo_', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:15:14', '2022-02-16 06:51:04', 6500, 3000, 672692, 0, 0, 0, 0, 0, 0, 31, 14, 1874, 2, 0, 1, '09/2/1999', -1, -1, -1, -87.1644, -1121.4, 1.37938, 350.076, 0, 0, 55, 0, 90, 84, 86, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080239, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289431, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(290, 'Ziell_Lazovsky', 'None', '202.67.42.20', 'A166226F9337B105DB1BCA3EEC4D2D5296DC797723183F893249CF056E2EF0E6', '[wGd!2LC!VeO&TMp', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:15:19', '2022-02-16 06:24:23', 7000, 3000, 612259, 0, 0, 0, 0, 0, 0, 9, 4, 544, 2, 0, 1, '22/04/2003', -1, -1, -1, -1618.5, -427.788, 14.251, 44.2597, 0, 0, 100, 0, 97, 95, 96, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(291, 'Charles_Sutherland', 'None', '103.108.32.70', '948DEFA25FF80058DEABB3BF802DC41B9DE3F489061A8CF33AC16CFAB08853DB', 'Mm7]EHPE}0&)z<3Z', 'None', 0, 0, 1, 1, 0, 0, 10, '2022-02-16 06:15:46', '2022-02-16 07:46:14', 23500, 3000, 358927, 0, 0, 0, 0, 0, 1, 1, 21, 3681, 2, 0, 1, '29/05/2002', -1, -1, -1, -1981.51, 267.445, 35.4719, 130.407, 0, 0, 88, 0, 80, 67, 73, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080495, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289342, 0, 0, 1, 0, '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(292, 'Felix_Conner', 'None', '110.137.73.178', '55381DCE1F715B1C90F37E647854603AFF266706FFD3F168936E777891D4BEB0', '&9H\'2q?[=Lz0Q~!+', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:15:53', '2022-02-16 07:43:37', 23500, 3000, 371353, 0, 0, 0, 0, 0, 0, 58, 48, 3528, 2, 0, 1, '12/4/2000', -1, -1, -1, -2092.19, -1880.37, 109.433, 292.271, 0, 0, 96, 0, 80, 68, 73, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 1645082209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646288875, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(293, 'Kenz_Alexander', 'None', '255.255.255.255', '19D053F9C85D4EE23D4F0DD2A7E10996DD2BEF723BE0E0B51A77B6FC8EF1517A', '>7n[0=Lp/eGig]$&', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:16:01', '2022-02-16 07:44:49', 40500, 3000, 991889, 0, 0, 0, 0, 0, 0, 58, 50, 3530, 2, 0, 1, '19/02/1999', -1, -1, -1, -2096.74, -1886.7, 110.71, 322.16, 0, 0, 59, 0, 79, 68, 75, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289456, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(294, 'Ace_Sawn', 'None', '140.213.54.58', '23164AE1E03B66EFB31CE5C78C210A5F3D118860C7523CAB8545934CE6CAD3D0', 'H\'a)r+f~iri*O*`l', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:16:37', '2022-02-16 07:47:50', 14800, 3000, 637207, 0, 0, 0, 0, 0, 0, 57, 17, 3437, 2, 0, 1, '30/10/1999', -1, -1, -1, -1880.44, -1699.48, 22.4412, 227.135, 0, 0, 87, 0, 83, 72, 75, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289416, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(295, 'Jun_Junior', 'None', '8.30.234.106', 'B9A89FBA00AA31C4448C943FAC4817BF7B5FF4B28A92186B81D7F41C9F61ED93', '#d,E>dTgj9\\PPK%U', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:16:41', '2022-02-16 06:21:56', 2500, 3000, 755809, 0, 0, 0, 0, 0, 0, 5, 15, 315, 2, 0, 1, '24/05/2000', -1, -1, -1, -1483.12, -275.797, 14.4002, 345.652, 0, 0, 100, 0, 99, 98, 98, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(296, 'Alvaro_Sky', 'None', '36.74.44.154', 'BB3D5A970983BDDAD42A6F8749DFA90D986424E7C154E003C64A0BBBF2D2B962', 's6/6Mn5*6bOiqc*r', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:16:42', '2022-02-16 06:19:31', 2500, 3000, 121170, 0, 0, 0, 0, 0, 0, 2, 24, 144, 2, 0, 1, '06/09/2001', -1, -1, -1, 1754.33, -1862.06, 13.9404, 271.122, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(297, 'Bay', 'None', '125.160.236.6', '89ACBC91C32766517354760943A9A2D02E3FE7092EFAE77104F1478AE7FFB797', 'fJSu\'#*h~b=_p~Ai', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:17:10', '2022-02-16 06:18:04', 2500, 3000, 764573, 0, 0, 0, 0, 0, 0, 0, 55, 55, 2, 0, 1, '1/1/2001', -1, -1, -1, 1744.94, -1861.55, 13.8798, 267.749, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(298, 'Arya_Wiski', 'None', '182.2.165.212', '1AA0789AD0C61316188B42ABB3307A1329931D609C6C8986729273B4C2D15A35', '3n},cZZ,E7?_Yb&q', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:17:14', '2022-02-16 07:43:38', 47900, 3000, 368694, 0, 0, 0, 0, 0, 0, 54, 18, 3258, 2, 0, 1, '15/07/1999', -1, -1, -1, -1911.3, -1707.68, 22.05, 301.053, 0, 0, 63, 0, 80, 70, 75, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 1645082481, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289792, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(299, 'Wann_Robertz', 'None', '120.188.64.94', 'CF665930D2881CD458BBEE5D0664BFA4C79F007EF0B25EB6C1A6C1EFDE87F113', 'mjaSaK$2RQXi^.q`', 'None', 0, 0, 1, 1, 0, 0, 0, '2022-02-16 06:17:20', '2022-02-16 07:47:20', 4997000, 0, 728656, 0, 0, 0, 0, 0, 1, 1, 24, 3684, 2, 0, 1, '10/02/1998', -1, -1, -1, -1900.82, -1702.82, 22.05, 61.3371, 0, 0, 100, 0, 78, 65, 72, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289384, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(300, 'Pablo_Shances', 'None', '202.80.217.115', '10595052637DE80D620B49BA87BF5FE4F9FEB7681A407C4A245C44587089587D', '}pn$&-K(CD-+frJl', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:18:03', '2022-02-16 06:51:05', 2500, 3000, 299229, 0, 0, 0, 0, 0, 0, 25, 26, 1526, 2, 0, 1, '06/06/1996', -1, -1, -1, -72.6643, -1109.63, 1.37812, 181.182, 0, 0, 59, 0, 91, 87, 89, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(301, 'Ryu', 'None', '114.125.11.200', 'F659260C855FBE5409176CDA7A605B18D27646DF398BDD09094B945571188F68', '@BHkQ<wd!_]igtq`', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:18:05', '2022-02-16 06:18:36', 2500, 3000, 449960, 0, 0, 0, 0, 0, 0, 0, 31, 31, 98, 0, 1, '19/06/1999', -1, -1, -1, 1745.24, -1861.58, 13.8798, 267.749, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(302, 'Arhan_Malik', 'None', '36.85.58.183', '429C6E1BF57E5807C5067801A3DF30CD4F62807F6A3CC8CB7ACE8B107751A5B0', 'vleYJm>kF@M/$05*', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:18:06', '2022-02-16 06:29:53', 2500, 3000, 831777, 0, 0, 0, 0, 0, 0, 7, 14, 434, 2, 0, 1, '07/08/2000', -1, -1, -1, -2214.62, -534.048, 49.8102, 101.462, 0, 0, 100, 0, 98, 97, 97, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(303, 'Dimas_Dzaky', 'None', '180.246.172.214', 'B069DAEB163B68BEC92B0C92456E7142BD8A9A3BE369665EE0FDECD98CCFBA0C', 's)0[hmQk,NYU7Qp1', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:19:18', '2022-02-16 06:20:05', 2500, 3000, 969109, 0, 0, 0, 0, 0, 0, 0, 47, 47, 2, 0, 1, '12/2/2000', -1, -1, -1, 1745.67, -1863.2, 13.8801, 120.556, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(304, 'Rexxy_Junior', 'None', '116.206.42.121', '2EB67E7457032E9D6CF0393699CD8424338C682FFBEB03003CF0D0C5F9E1017A', 'IN8B!8z7YD2EE85&', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:19:34', '2022-02-16 06:51:03', 2000, 3000, 944581, 0, 0, 0, 0, 0, 0, 28, 40, 1720, 2, 0, 1, '02/02/2000', -1, -1, -1, -75.8033, -1112.9, 1.37812, 338.907, 0, 0, 61, 0, 90, 84, 87, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 1645080272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289465, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(305, 'Bryan_Alexander', 'None', '114.125.11.200', '11DA9B6ADDA6AF8E53D2045CAF561CC493AE9A60EECE96451F535E8D8E918593', 'v)up~_)}f{R1=~&q', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:19:35', '2022-02-16 06:23:28', 2500, 3000, 309295, 0, 0, 0, 0, 0, 0, 3, 52, 232, 2, 0, 1, '19/06/1999', -1, -1, -1, -1751.28, -579.643, 16.7356, 90.5032, 0, 0, 100, 0, 99, 98, 99, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(306, 'Nathan_Putra', 'None', '125.167.156.180', '0AFCAFF47C3385C81E62FE06E599CACD39B1812304C146A1CF919CAE50BAF904', '4R?bI#<;?ttNwpKr', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:20:13', '2022-02-16 07:54:45', 27000, 3000, 697810, 0, 0, 0, 0, 0, 0, 59, 17, 3557, 2, 0, 1, '15/04/1998', -1, -1, -1, -1575.99, 949.216, 7.00131, 69.6646, 0, 0, 16, 0, 78, 66, 73, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289492, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(307, 'Eki_Laoly', 'None', '120.188.65.199', '73F87AFC522D2150DAAA0221B35F837C4E79E5CB2E2B306F81A901EAF61DF528', 'V7g(uqmAOfFOw39\"', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:20:14', '2022-02-16 06:51:05', 2000, 3000, 614920, 0, 0, 0, 0, 0, 0, 25, 35, 1535, 2, 0, 1, '01/02/2006', -1, -1, -1, -70.7059, -1112.56, 1.37812, 325.473, 0, 0, 77, 0, 92, 86, 90, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289509, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(308, 'Johan_Rick', 'None', '116.206.42.108', '635FDA8C222385E503214D0C00CCAEE8A6D1227589ABE14471D9B156C76D71E6', 'D\\SFrON:<W4NR&\'%', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:20:45', '2022-02-16 06:46:40', 6500, 3000, 360057, 0, 0, 0, 0, 0, 0, 19, 54, 1194, 2, 0, 1, '14/01/2000', 1, -1, -1, -2424.89, -705.032, 133.606, 14.6146, 0, 0, 129, 0, 95, 92, 93, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289457, 0, 0, 1, 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(309, 'Isco_Lezovsky', 'None', '103.172.1.51', 'EC22EC1AD7E43255E696056052429F6D6A9E4BD8EA08DD2C64A983EB10077C05', '/4[~-T=vxeL6>2Ki', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:21:02', '2022-02-16 06:33:47', 7000, 3000, 169046, 0, 0, 0, 0, 0, 0, 12, 37, 757, 2, 0, 1, '23/03/2000', -1, -1, -1, -2425.57, -696.151, 133.433, 119.761, 0, 0, 100, 0, 96, 93, 94, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(310, 'Samuel_Zucresen', 'None', '255.255.255.255', '4914BC68ADE9F012A3567DE38C4FB7A326ABC57069A5BC197C9A0551F3DF6591', '(86e`PQ+uzt&^5oj', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:21:07', '2022-02-16 07:44:30', 2000, 3000, 749147, 0, 0, 0, 0, 0, 0, 52, 20, 3140, 2, 0, 1, '17/12/1995', -1, -1, -1, -77.6107, -1122.62, 0.902956, 120.206, 0, 0, 55, 0, 81, 70, 75, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289512, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(311, 'Granger_Escobar', 'None', '125.162.114.52', 'D9AF8A219DEEE0BEC32DEC13DA50484D7DCA4011B309E5C5FE0EF5C2D7C8B8A1', '*fiM5k^ZUM1DZ$pk', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:21:33', '2022-02-16 06:33:45', 6500, 3000, 266900, 0, 0, 0, 0, 0, 0, 11, 35, 695, 2, 0, 1, '25/05/2000', -1, -1, -1, 390.573, 174.02, 1008.68, 278.47, 3, 0, 91, 0, 96, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289175, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(312, 'Bayu_Noekip', 'None', '140.213.218.70', '53FDA6D1C595C8137E4935CA9A815BE335CBD9321F26135D6979B1F22901029F', 'U!eNye2E1*nOMFEg', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:22:36', '2022-02-16 07:39:44', 44000, 3000, 369861, 0, 0, 0, 0, 0, 0, 32, 36, 1956, 2, 0, 1, '02/08/1994', -1, -1, -1, -75.3724, -1111.03, 1.37812, 344.97, 0, 0, 129, 0, 89, 83, 86, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289095, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(313, 'Ming_Jhonson', 'None', '255.255.255.255', '14FEBEDBF98601315129372CD21A4ABCD5D93A1B56515F46A8AF5D3EE1D944A2', '@_4Ak,W%aDJTY\\A6', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:22:46', '2022-02-16 07:31:36', 500, 3000, 508411, 0, 0, 0, 0, 0, 0, 39, 35, 2375, 2, 0, 1, '27/04/2000', -1, -1, -1, -75.3409, -1108.27, 1.37812, 338.488, 0, 0, 24, 0, 38, 31, 34, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289734, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(314, 'Herman_Belito', 'None', '36.68.53.222', '88F9D6C1629AE5A03026701D17612060679F3DDCB974442B958C27B7263CF48A', 'aq\";t\\Iiu!\":?mk8', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:23:00', '2022-02-16 06:33:47', 2000, 3000, 704162, 0, 0, 0, 0, 0, 0, 10, 39, 639, 2, 0, 1, '15/04/1995', -1, -1, -1, -2426.55, -694.612, 133.433, 66.0353, 0, 0, 98, 0, 96, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(316, 'Dempster_Harryson', 'None', '103.144.80.113', '557FEB076305A4DAFAB28D761904BC244B71A1965E1184990409DA6DEF7D880D', 'ANkQb^pmSQ||oW)a', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:25:04', '2022-02-16 07:43:33', 44000, 3000, 525366, 0, 0, 0, 0, 0, 0, 46, 25, 2785, 2, 0, 1, '5/3/1998', -1, -1, -1, -1930.02, -1781.33, 31.4769, 82.5484, 0, 0, 39, 0, 83, 74, 78, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289578, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(317, 'Rey_Ocanner', 'None', '255.255.255.255', 'F4EA7B3E4A6886CDE280D682998AE18E1A5D247DC5E07EDBCA8A588F5BF9D47B', '!1:)JX2>]w??>k#X', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:25:23', '2022-02-16 07:44:33', 48500, 3000, 719798, 0, 0, 0, 0, 0, 0, 49, 28, 2968, 2, 0, 1, '12/04/2000', -1, -1, -1, -2000.89, 248.93, 30.6024, 178.197, 0, 0, 63, 0, 82, 73, 77, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 1645082220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289499, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(318, 'Maccer_Corleone', 'None', '118.96.164.253', 'EE04818305FB82A41F46AC00391FF5D80B64F2BF2659D7E84948536B1852B148', 'QEjA<b6$VSjRD^8H', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:27:27', '2022-02-16 06:51:06', 6500, 3000, 719713, 0, 0, 0, 0, 0, 0, 16, 0, 960, 2, 0, 1, '12/5/2000', -1, -1, -1, -73.8608, -1114.62, 1.37812, 4.93439, 0, 0, 68, 0, 95, 92, 93, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289729, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(319, 'Vertez_Zenzix', 'None', '255.255.255.255', '461C4F6C84B9A6C848C4E09000AB0AB94C89DB807122B32E4FC876A1D0BA0B73', 'fkGu*J]zeNFyoy\\6', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:28:42', '2022-02-16 07:44:03', 13700, 3000, 348229, 0, 0, 0, 0, 0, 0, 43, 44, 2624, 2, 0, 1, '29/10/2002', -1, -1, -1, -1917.82, -1711.06, 22.57, 23.7908, 0, 0, 98, 0, 85, 78, 82, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080490, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289680, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(320, 'Han_Torreto', 'None', '202.67.47.21', 'F2B49CFA87DDB90CC3B1EFA9A67942C298ABB8A1488B4DC72906B613B766064B', '<^_LU-uV[1*CD16P', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:28:54', '2022-02-16 06:51:04', 6500, 3000, 882172, 0, 0, 0, 0, 0, 0, 16, 35, 995, 2, 0, 1, '16/05/2000', -1, -1, -1, -71.1565, -1111.4, 1.37812, 345.571, 0, 0, 81, 0, 95, 92, 93, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289593, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(321, 'Surmok123', 'None', '255.255.255.255', '53D84230ADA2A0A603FE45CB72465BECB2ED8F064E1B7F457EE35BF19D7A35CB', '?FpJ+@),C-a\'p<tU', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:29:50', '2022-02-16 06:47:13', 2000, 3000, 946939, 0, 0, 0, 0, 0, 0, 12, 42, 762, 2, 0, 1, '12/1/1999', -1, -1, -1, -72.0334, -1117.75, 1.37812, 349.867, 0, 0, 95, 0, 96, 93, 96, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289791, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(322, 'Hymooni', 'None', '182.2.71.240', 'F9CA4466BEB843ADD1BB07D4D963D750B7EC9F099DB54D65F04631C95777A76F', '8rn\\S?ivT%dZk$w-', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:30:49', '2022-02-16 06:33:44', 2500, 3000, 683219, 0, 0, 0, 0, 0, 0, 2, 30, 150, 2, 0, 1, '18/08/2002', -1, -1, -1, -1915.37, -503.143, 49.28, 110.901, 0, 0, 95, 0, 100, 99, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(323, 'Febi_Yanto', 'None', '103.166.10.133', '4331916467CE4B591D61C18EE93596C2DB6B03C606F7CB1364EA62C44A5EA3E6', '/IwApzTGJ$6(hjnD', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:32:49', '2022-02-16 06:33:47', 2500, 3000, 155160, 0, 0, 0, 0, 0, 0, 0, 51, 51, 2, 0, 1, '27/04/2004', -1, -1, -1, 1745.24, -1861.58, 13.8798, 267.749, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `players` (`reg_id`, `username`, `adminname`, `ip`, `password`, `salt`, `email`, `admin`, `helper`, `level`, `levelup`, `vip`, `vip_time`, `gold`, `reg_date`, `last_login`, `money`, `bmoney`, `brek`, `phone`, `phoneoff`, `phonecredit`, `phonebook`, `wt`, `hours`, `minutes`, `seconds`, `paycheck`, `skin`, `facskin`, `gender`, `age`, `indoor`, `inbiz`, `inhouse`, `posx`, `posy`, `posz`, `posa`, `interior`, `world`, `health`, `armour`, `hunger`, `bladder`, `energy`, `sick`, `hospital`, `injured`, `duty`, `dutytime`, `faction`, `factionrank`, `factionlead`, `family`, `familyrank`, `jail`, `jail_time`, `arrest`, `arrest_time`, `warn`, `job`, `job2`, `jobtime`, `sidejobtime`, `bustime`, `forklifttime`, `pizzatime`, `exitjob`, `taxitime`, `starterpack`, `medicine`, `medkit`, `mask`, `helmet`, `snack`, `sprunk`, `gas`, `bandage`, `gps`, `material`, `component`, `food`, `seed`, `potato`, `wheat`, `orange`, `price1`, `price2`, `price3`, `price4`, `marijuana`, `plant`, `plant_time`, `fishtool`, `fish`, `worm`, `idcard`, `idcard_time`, `drivelic`, `drivelic_time`, `hbemode`, `togtweet`, `tnames`, `akuntw`, `togpm`, `toglog`, `togads`, `togwt`, `Gun1`, `Gun2`, `Gun3`, `Gun4`, `Gun5`, `Gun6`, `Gun7`, `Gun8`, `Gun9`, `Gun10`, `Gun11`, `Gun12`, `Gun13`, `Ammo1`, `Ammo2`, `Ammo3`, `Ammo4`, `Ammo5`, `Ammo6`, `Ammo7`, `Ammo8`, `Ammo9`, `Ammo10`, `Ammo11`, `Ammo12`, `Ammo13`) VALUES
(359, 'hasbullah', 'None', '255.255.255.255', '4581319776841D06463CE0B43B4C5E4D8C3EA7117C25170E57CB4A802135A30F', 'qB*prnE.4dU|DL-A', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 07:46:11', '2022-02-16 07:47:18', 2500, 3000, 524515, 0, 0, 0, 0, 0, 0, 1, 6, 66, 299, 0, 1, '23/09/1997', -1, -1, -1, -1421.11, -293.73, 14.4484, 249.502, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(324, 'Mick_Hemswort', 'None', '182.2.43.131', '804EF1E02A99B2331B6A16804A24A0F91CC883F2852C3BFC12DBC04B2689370B', 'Khg}|HknY!gd1</K', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:34:21', '2022-02-16 07:57:15', 41000, 3000, 966186, 0, 0, 0, 0, 0, 0, 49, 30, 2970, 2, 0, 1, '03/12/2000', -1, -1, -1, -1867.28, -210.505, 18.6884, 265.037, 0, 0, 93, 0, 82, 72, 76, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289362, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(325, 'Sweet_Blezensky', 'None', '114.5.213.152', '6B784D4D7AC98B00546C389B83422F72CA9EC07040E4B68D3E1BCA34663DACBE', '=+[.)Z4E4j/uDR@#', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:37:31', '2022-02-16 06:39:12', 7000, 3000, 748714, 0, 0, 0, 0, 0, 0, 1, 41, 101, 2, 0, 1, '30/09/1999', -1, -1, -1, -1426.69, -286.627, 14.4484, 58.9878, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(326, 'Edwin_Chelmist', 'None', '180.252.87.106', 'D09AD700EF5801C690F7F8BEFA75D1D2F273684CE62981FC047595F223DF4D71', ')gt^r5\"2^&!x>cr(', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:40:10', '2022-02-16 06:51:06', 2000, 3000, 489442, 0, 0, 0, 0, 0, 0, 10, 52, 652, 2, 0, 1, '27/09/2004', -1, -1, -1, -74.5684, -1112.98, 1.37812, 291.099, 0, 0, 100, 0, 96, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645080263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646289715, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(327, 'Reoon_Finch', 'None', '114.10.20.48', 'DA436EDF2A9AF35E5BDB63887665A7DFF0B20FC591341CB92D5B54E9D1C07422', 'j|=,/{ByGqJ`j/*e', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:40:34', '2022-02-16 06:51:05', 4050, 3000, 804036, 6149, 0, 0, 0, 0, 0, 10, 28, 628, 2, 0, 1, '20/11/2000', -1, -1, -1, -73.4561, -1115.23, 1.37812, 350.728, 0, 0, 97, 0, 96, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(328, 'Nelson_Wizzly', 'None', '114.5.250.79', '17724D44BA69365BB414FCD396983E55EA32C76BF978CF0585111CB9F178DE97', '@?|\"=)sGazh>8RZ>', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:41:16', '2022-02-16 07:48:02', 43000, 3000, 697532, 0, 0, 0, 0, 0, 0, 35, 16, 2116, 2, 0, 1, '10/11/2000', -1, -1, -1, -1980.87, 265.076, 36.962, 169.007, 0, 0, 100, 0, 87, 80, 85, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 1645083014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292455, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(329, 'Leon_Johnson', 'None', '140.213.11.12', '4520277FA2F017FC7197497EAD283D59B77DA68FC9F1CDDBCD370C0EA9B91A69', 'a6R3bp0h<B|7T!<B', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:41:27', '2022-02-16 06:51:06', 1000, 3000, 525809, 0, 0, 0, 0, 0, 0, 9, 35, 575, 2, 0, 1, '10/01/2000', -1, -1, -1, -69.5264, -1114.36, 1.37812, 141.723, 0, 0, 76, 0, 97, 95, 96, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(330, 'Jacky_Hoopers', 'None', '114.122.102.23', '2B5B4DB650ED5EF31E256AF13ED1795D74F6BFBF630FE79EC9622BA0712E1EDC', 'SsdgQ)@U&fr{|[r?', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:42:19', '2022-02-16 06:50:53', 1650, 3000, 658355, 0, 0, 0, 0, 0, 0, 8, 34, 514, 2, 0, 1, '10/10/2001', -1, -1, -1, -74.9465, -1110.42, 1.37812, 341.368, 0, 0, 97, 0, 97, 95, 96, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(331, 'Joe_Joestar', 'None', '114.142.168.30', '96FA8AB26B1F13C130CB7B9756A14923122C7145679FEA7766DE7CCEDCA14FE4', '}I7=4ZIRXId_:L{-', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:43:18', '2022-02-16 06:51:06', 2500, 3000, 179770, 0, 0, 0, 0, 0, 0, 7, 44, 464, 2, 0, 1, '17/9/2000', -1, -1, -1, -69.7308, -1112.7, 1.37812, 2.62786, 0, 0, 83, 0, 98, 96, 97, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(332, 'Frederick_Montana', 'None', '140.213.35.78', '68BCC1EB38D0EE1BE2149FB27C0A8359DC11A5A5AA984697DC3BA64696344E1A', ':;p[S7~4#1W@Jw2E', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:43:37', '2022-02-16 06:51:04', 7000, 3000, 717431, 0, 0, 0, 0, 0, 0, 7, 24, 444, 2, 0, 1, '1/2/1999', -1, -1, -1, -72.6332, -1115.19, 1.37812, 13.3699, 0, 0, 100, 0, 98, 96, 97, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(333, 'Jhonatt_Dhelogan', 'None', '36.69.8.189', '4EA4D34181C27AF307085381F33D6C89DBFE0FBEA7915A311B7F1CEA518127AF', 'kCs^>4~Y&.79E5Or', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:43:41', '2022-02-16 07:44:28', 46700, 3000, 762876, 0, 0, 0, 0, 0, 0, 35, 10, 2110, 2, 0, 1, '19/03/2000', -1, -1, -1, -1904.89, -1700.16, 22.57, 39.3472, 0, 0, 96, 0, 87, 80, 84, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082860, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292145, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(334, 'Marco_Rubio', 'None', '183.171.29.204', '38B7BA6C565671B4AE63B77A0CF9EF66CC08B2FD63776A8B21D0D8B839A0F199', '+x^3FY7@b@W09wZi', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:44:54', '2022-02-16 07:43:41', 945, 3000, 111661, 4229, 0, 5, 0, 0, 0, 10, 54, 654, 7, 0, 1, '26/11/1998', -1, -1, -1, -1525.85, -1422.97, 41.1039, 357.804, 0, 0, 100, 0, 97, 95, 95, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'MarcoBhizer', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(356, 'Jordan_Rodriguez', 'None', '255.255.255.255', '8A4B3597B791105B26F2ACB012CA7B4D743713E3EAB329B6ECCBB51A027A33AB', 'R-8?7Mj9@>z2Vik!', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:38:34', '2022-02-16 07:42:20', 6550, 3000, 596488, 0, 0, 0, 0, 0, 0, 3, 46, 226, 5, 0, 1, '11/06/1998', -1, -1, -1, -1650.56, -511.233, 11.1624, 357.802, 0, 0, 100, 0, 99, 98, 99, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(335, 'Ron_Weasley', 'None', '36.65.94.135', 'D5B540666A934313F7D8AF019D6037CE690FF36CC88C50A4FAC645BA6171046B', 'nT(t&q:_Bc^7B4JD', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:45:31', '2022-02-16 07:42:53', 23500, 3000, 587287, 0, 0, 0, 0, 0, 0, 30, 59, 1859, 2, 0, 1, '6/10/1999', -1, -1, -1, -1929.34, -1780.92, 31.426, 14.8227, 0, 0, 78, 0, 88, 82, 86, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082710, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292120, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(336, 'Madison_Axton', 'None', '110.137.103.183', 'BAA07DFAF8B732D6889F1F1425CE8B1EF5E2EC89F0E423BF2DE155CC696CBA44', '-u5&T4ySvw:I1]Z+', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 06:47:38', '2022-02-16 06:51:02', 7000, 3000, 307325, 0, 0, 0, 0, 0, 0, 3, 24, 204, 2, 0, 1, '1/6/2000', -1, -1, -1, -1417.28, -293.601, 13.9685, 62.2031, 0, 0, 100, 0, 99, 99, 99, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(337, 'Khusnul_Khotimah', 'None', '103.144.80.113', 'EFF2E7665C24D34A69D8319255314E1037EEC34B4D4547B4D179BA65AD7BB986', 'TT|1}>56*65\\sAhU', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 06:50:29', '2022-02-16 06:51:05', 2500, 3000, 370328, 0, 0, 0, 0, 0, 0, 0, 33, 33, 0, 0, 0, '', -1, -1, -1, 1715.86, -1877.39, 13.8663, 267.749, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(338, 'Felix_Lorenz', 'None', '103.119.141.103', '5EC6130E9D3C227EB65AABA9D7D2E6C8D38E9573BF643F97E878E1E0FAF74E98', 'mav_}w~2slgQvySA', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:16:19', '2022-02-16 08:04:05', 48500, 3000, 618746, 0, 0, 0, 0, 0, 0, 47, 46, 2866, 2, 0, 1, '20/04/2000', -1, -1, -1, -2100.63, -1880.68, 110.817, 131.677, 0, 0, 33, 0, 81, 72, 77, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082611, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292165, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(339, 'Rodrigo_Ignacio', 'None', '103.160.68.154', '2B4681F2AD2D4C1396C791572FB1B504B4844FCA628871FFE1F483E02C0D12C9', '/f3pS*<P|z+AgC0u', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:16:19', '2022-02-16 07:46:02', 47000, 3000, 360714, 0, 0, 0, 0, 0, 0, 29, 18, 1758, 2, 0, 1, '12/09/1998', -1, -1, -1, -1544.2, 649.422, 44.3006, 106.827, 0, 0, 50, 0, 47, 45, 46, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292116, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340, 'Surmok_Ozora', 'None', '255.255.255.255', '080583660E337AF8B2A1D5E9A9A9568F8D0A1749D723754EDBDADB833D198A35', 'OUiTrBZn*wc~BW/H', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:16:48', '2022-02-16 07:42:14', 47350, 3000, 888573, 0, 0, 0, 0, 0, 0, 24, 17, 1457, 2, 0, 1, '12/1/1999', -1, -1, -1, -2007.35, -139.379, 36.0109, 0.137056, 0, 0, 100, 0, 91, 86, 88, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292065, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(341, 'Armando_Edgardo', 'None', '180.241.44.199', '65FF3F0AF3FA2062DE7009E2F31AFEFAE7D7155FA220FFFB17792BADD5047027', 'pvM<qF=r\"?]fd-X]', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:17:10', '2022-02-16 07:20:47', 6500, 3000, 454180, 0, 0, 0, 0, 0, 0, 3, 37, 217, 100, 0, 1, '14/2/2001', -1, -1, -1, -1429.84, -284.161, 14.4484, 44.301, 0, 0, 88, 0, 99, 98, 99, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(342, 'Febrian_Ryan', 'None', '255.255.255.255', 'B30730F4506F2E8438FCF4F6A5E0C9E9A9F26A158BC3E6C40E0D18311936C68D', 'N4|6CFUQ2m;h2Xw=', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:17:10', '2022-02-16 07:43:03', 23500, 3000, 769790, 0, 0, 0, 0, 0, 0, 25, 52, 1552, 2, 0, 1, '03/02/1999', -1, -1, -1, -1982.32, 262.579, 35.4719, 354.185, 0, 0, 67, 0, 90, 85, 88, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292285, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(343, 'Arleon_Xyzen', 'None', '120.188.82.146', '306B7816114B8EBBEF4D93D794FBBA773B7982992F7195EAC347D2B92058DFC3', 'B)N`\"&WecrGO=ofb', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:17:13', '2022-02-16 07:43:23', 44650, 3000, 903942, 0, 0, 0, 0, 0, 0, 25, 44, 1544, 2, 0, 1, '07/03/1999', -1, -1, -1, -1888.31, -1710.6, 22.4417, 143.398, 0, 0, 88, 0, 91, 86, 88, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082667, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292206, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(344, 'Rudolf_Vanzky', 'None', '114.5.145.19', '4930614AB02533FD9356AFA5E185C66C4211E312DE38D162A29047903AD085EF', '`NalsDPjo\\b-6U+9', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:18:01', '2022-02-16 07:43:21', 23500, 3000, 499259, 0, 0, 0, 0, 0, 0, 25, 20, 1520, 2, 0, 1, '30/09/1994', -1, -1, -1, -1899.82, -602.001, 39.1642, 249.061, 0, 0, 96, 0, 91, 86, 88, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082725, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292233, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(345, 'Raymond_Arthur', 'None', '36.88.148.27', 'CB5C8595BFEA09E0EFA452BC24BED78DD6BBA5D9D8E66872E7AF2F7AC3B6B7F3', 'dUk\"f>gVpo@V0z$(', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:19:58', '2022-02-16 07:44:01', 48500, 3000, 481519, 5053, 0, 0, 0, 0, 0, 24, 3, 1443, 2, 0, 1, '26/01/1995', -1, -1, -1, -2101.63, -1883.74, 110.823, 217.166, 0, 0, 96, 0, 91, 86, 89, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645083498, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292670, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(346, 'Deva_Wallker', 'None', '115.178.249.22', 'ABF28928CCCDBE038AE97ABB326F34030B276F1ED3BCA6BB68868BBBD9862B22', 'l|c\"28+K^;UkW]:U', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 07:22:54', '2022-02-16 07:48:06', 19000, 3000, 350975, 0, 0, 0, 0, 0, 0, 24, 43, 1483, 2, 0, 1, '1/1/2001', -1, -1, -1, -1903.49, -1764.34, 32.9183, 191.116, 0, 0, 94, 0, 92, 86, 89, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645082731, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292255, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(347, 'Asura_Taka', 'None', '36.72.216.40', 'B5E56E85FAA8DFAB0B6E40F374C57E22B35867CAABEAF2830F42072321D80DBA', '9i`|u@Y?^1tAsXU/', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:27:50', '2022-02-16 07:52:44', 5000, 3000, 957903, 0, 0, 0, 0, 0, 0, 20, 59, 1259, 2, 0, 1, '10/02/2000', -1, -1, -1, -2005.37, -150.384, 36.0373, 15.0451, 0, 0, 90, 0, 93, 88, 91, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645083729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292578, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(348, 'Marchel_Fransky', 'None', '255.255.255.255', 'E17E5AEA7B1D61B544BAC3CF6DF41557D5FEE76B64F51E15D6D6846AACE58BC8', 'O9QJI}<=E`:{\\N@+', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:28:22', '2022-02-16 07:44:29', 20895, 3000, 356587, 2405, 0, 5, 1, 0, 0, 16, 6, 966, 2, 0, 1, '30/11/2000', -1, -1, -1, -2000.89, 248.93, 30.6024, 348.204, 0, 0, 85, 0, 94, 91, 93, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1645083275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1646292825, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(349, 'Mario_Graciano', 'None', '255.255.255.255', '17604240F860768EA67AAA7C92D50359EC0B87DE9C2A11043DF442A36B1A2640', 'Gt~Gs6Z~T\'s/83D.', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:29:04', '2022-02-16 07:43:25', 6150, 3000, 205054, 0, 0, 0, 0, 0, 0, 8, 54, 534, 2, 0, 1, '04/03/1971', -1, -1, -1, -78.5274, -1119.88, 1.37812, 169.337, 0, 0, 96, 0, 97, 96, 97, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(350, 'Hanz', 'None', '255.255.255.255', '7485858B4EE2F118B8F94DADB0D43624131DB203BB48B9A778236F084FE28F40', 'xr8s9J^oSaFW*Ucn', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:30:03', '2022-02-16 07:42:46', 7000, 3000, 275465, 0, 0, 0, 0, 0, 0, 1, 55, 115, 2, 0, 1, '19/01/2007', -1, -1, -1, -1419.96, -292.286, 14.4484, 154.211, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(351, 'Kenzy_Roberto', 'None', '255.255.255.255', '5C106FDA77739E6315C06B9B3732B24DFCE298BD0CC450802ED329959704C3FE', 'ExQx,h7~to|(CIvu', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:31:57', '2022-02-16 07:44:23', 7000, 3000, 116283, 0, 0, 0, 0, 0, 0, 12, 26, 746, 299, 0, 1, '20/09/2000', -1, -1, -1, -1406.13, -429.759, 14.3, 200.88, 0, 0, 100, 0, 96, 93, 94, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(352, 'Vanx', 'None', '255.255.255.255', 'B08F2865A0CE8A2C94902DEABE88B75B5A13860084A6F80E5D80CFF4B345F1F6', 'XxI6<.wFYB5<;\"iv', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 07:33:18', '2022-02-16 07:33:20', 2500, 3000, 169565, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, '', -1, -1, -1, 1716.11, -1880.07, -9.7, 267.749, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(353, 'Nurul_Anam', 'None', '114.79.46.91', '86EBFAA089714B65E6836505876B53704C8AD1AF520A81185F1ACD0AEF6FA666', 'Z5[H;ZX:zC)TXi[/', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:33:55', '2022-02-16 07:47:56', 1385, 3000, 636263, 9839, 0, 15, 1, 1, 0, 11, 4, 664, 2, 0, 1, '12/01/1999', -1, -1, -1, -86.6269, -1122.39, 1.37821, 59.5399, 0, 0, 76, 0, 97, 95, 96, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(354, 'Asep_DeCosta', 'None', '255.255.255.255', 'CB3293D22B72D4210A252499C3A1CD188D2CA878B5CF7CAB5E6D1E86C49D73F3', '1wV@\\I]Uw5f96y&t', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:34:08', '2022-02-16 07:42:00', 1945, 3000, 701624, 3981, 0, 5, 1, 0, 0, 7, 53, 473, 2, 0, 1, '22/02/2000', -1, -1, -1, -1444.92, -290.721, 14.3, 325.471, 0, 0, 83, 0, 97, 96, 97, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(355, 'Kelltz', 'None', '103.213.129.174', '947E2292D32054318215D14967DC4905C0ECB773B4C2D60FAC6C08E99FAC328C', '.z_son]S,dUL__.t', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:36:06', '2022-02-16 07:42:23', 6350, 3000, 252374, 0, 0, 0, 0, 0, 0, 6, 17, 377, 7, 0, 1, '25/02/1999', -1, -1, -1, -1434.25, -291.583, 14.3, 93.8508, 0, 0, 100, 0, 98, 97, 98, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(357, 'Santiago_Daniel', 'None', '114.124.195.120', '89E5CA30DAF827B314726D5E317B45664DE15D1CC1C3D6501D2416C9626BE465', 'qS`Kq7\"8&kDQ@6{j', 'None', 0, 0, 1, 0, 0, 0, 10, '2022-02-16 07:39:25', '2022-02-16 07:55:29', 7000, 3000, 818065, 0, 0, 0, 0, 0, 0, 1, 9, 69, 4, 0, 1, '12/07/2000', -1, -1, -1, -1428.97, -285.508, 14.4484, 85.261, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(358, 'Renzo_Dexied', 'None', '36.90.88.217', '0D358F877E2797680770E4411E115857BBE6C84DAFA2D5EBF5625C3488DCA9E0', ',.$^3./N6|Pn7|7c', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 07:39:50', '2022-02-16 07:46:39', 2500, 3000, 681259, 0, 0, 0, 0, 0, 0, 6, 48, 408, 2, 0, 1, '27/02/2008', -1, -1, -1, -84.0263, -1122.86, 1.37812, 44.214, 0, 0, 94, 0, 98, 97, 97, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(360, 'kuro', 'None', '139.255.140.226', '429AD27739B2A0B0E373B7265DDE97E39914A78F2ECE5E0BDEAF7B1FAA5C25C1', 'O%/jD-7o^sr;Es^,', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 07:47:17', '2022-02-16 07:47:42', 2500, 3000, 406230, 0, 0, 0, 0, 0, 0, 0, 26, 26, 98, 0, 1, '15/9/1999', -1, -1, -1, 1745.24, -1861.58, 13.8798, 267.749, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(361, 'Hanz_Ozawa', 'None', '114.5.147.69', '56E5681406BAD606754E7CDE32A2EEE7932B013D1B99E94927D94FE9628CDFD5', 'MKQQE/5cP\'YYN?py', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 07:51:10', '2022-02-16 07:51:21', 2500, 3000, 124836, 0, 0, 0, 0, 0, 0, 0, 12, 12, 0, 0, 0, '', -1, -1, -1, 1745.3, -1861.59, 13.8773, 267.749, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(362, 'Arthur_Dawnskin', 'None', '115.178.250.35', '49C0C7620F49C0DB4817FC05143A3342ACA7EF7CEDCEBD05705B34B42D35A9B7', 'NY#p]]rsAoe]Q2Aa', 'None', 0, 0, 1, 0, 0, 0, 0, '2022-02-16 07:54:04', '2022-02-16 07:54:04', 0, 0, 839157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', -1, -1, -1, 0, 0, 0, 0, 0, 0, 100, 0, 100, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `playerucp`
--

CREATE TABLE `playerucp` (
  `ID` int(11) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `salt` varchar(16) NOT NULL,
  `discord` varchar(21) CHARACTER SET utf8 NOT NULL,
  `UCP` varchar(22) CHARACTER SET armscii8 NOT NULL,
  `token` int(24) NOT NULL,
  `extrac` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playerucp`
--

INSERT INTO `playerucp` (`ID`, `Password`, `salt`, `discord`, `UCP`, `token`, `extrac`) VALUES
(1, '3838E8BA717CF787FA6D84ABE6CE4EE197402B40068427E89511FD9E2A39B622', 'irMYJvc7,m*nW{Jg', '', 'Naomi', 0, 0),
(2, '1E1B665CB6221E7F4952091A194C587629C01699321BEADEC02A4E254149B3F0', '~`\\/D=,xGKa`en+^', '', 'Lamar_Binks', 0, 0),
(3, '6D05857740D091604BE31049C10AF869418BC57E94BC42B7E54D7D05D64E655C', '3L(/*t6pny\'!7vzD', '', 'Dominique_Vallerio', 0, 0),
(4, 'D5570884F4541085190D8D891DA5E923CCC55650AFB5BA64475BBC76722C2FAB', '-8_CT5J+Y.&`:C:{', '', 'Dominique_Valleriow', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `ID` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `posa` float NOT NULL DEFAULT 0,
  `pointx` float DEFAULT 0,
  `pointy` float DEFAULT 0,
  `pointz` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`ID`, `type`, `posx`, `posy`, `posz`, `posa`, `pointx`, `pointy`, `pointz`) VALUES
(0, 1, -1425.53, -286.474, 14.1484, 135.228, -1430.32, -283.415, 14.1484);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` bigint(20) NOT NULL,
  `owner` int(11) DEFAULT 0,
  `info` varchar(46) DEFAULT '',
  `money` int(11) NOT NULL DEFAULT 0,
  `date` varchar(36) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `owner`, `info`, `money`, `date`) VALUES
(17158, 250, 'Street Cleanner(Marina Beach)', 350, '2022-02-12 04:11:47'),
(17157, 250, 'Street Cleanner(bonus)', 10, '2022-02-12 04:11:41'),
(17156, 250, 'Street Cleanner(bonus)', 15, '2022-02-12 04:11:03'),
(17155, 250, 'Street Cleanner(bonus)', 13, '2022-02-12 04:09:20'),
(17154, 248, 'Street Cleanner(bonus)', 50, '2022-02-12 04:01:53'),
(17153, 248, 'Street Cleanner(bonus)', 34, '2022-02-12 04:00:29'),
(17152, 250, 'Street Cleanner(bonus)', 34, '2022-02-12 03:57:00'),
(17159, 250, 'Trucker Job(Crate Fish)', 450, '2022-02-13 16:48:28'),
(17160, 250, 'Trucker Job(Crate Fish)', 450, '2022-02-13 16:48:46'),
(17161, 250, 'Trucker Job(Crate Fish)', 450, '2022-02-13 16:48:53'),
(17162, 250, 'Trucker Job(Crate Fish)', 450, '2022-02-13 16:49:09'),
(17163, 250, 'Trucker Job(Crate Fish)', 450, '2022-02-13 16:49:16'),
(17164, 250, 'Trucker Job(Crate Fish)', 2500, '2022-02-13 17:17:16'),
(17165, 250, 'Trucker Job(Crate Fish)', 2500, '2022-02-13 17:26:08'),
(17166, 250, 'Trucker Job(Crate Material)', 650, '2022-02-13 18:59:23'),
(17167, 250, 'Trucker Job(Crate Material)', 650, '2022-02-13 19:07:39'),
(17168, 250, 'Trucker Job(Crate Component)', 3000, '2022-02-14 08:39:49'),
(17169, 250, 'Trucker Job(Crate Component)', 3000, '2022-02-14 21:10:36'),
(17170, 250, 'Trucker Job(Crate Component)', 3000, '2022-02-14 21:10:48'),
(17171, 250, 'Trucker Job(Crate Component)', 3000, '2022-02-14 21:11:03'),
(17172, 250, 'Trucker Job(Crate Component)', 3000, '2022-02-14 21:11:13'),
(17173, 250, 'Trucker Job(Crate Component)', 3000, '2022-02-14 21:11:23'),
(17174, 250, 'Trucker Job(Crate Component)', 3000, '2022-02-14 21:29:09'),
(17175, 266, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:53:20'),
(17176, 260, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:53:30'),
(17177, 266, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:53:37'),
(17178, 266, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:53:47'),
(17179, 266, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:53:55'),
(17180, 345, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:54:47'),
(17181, 260, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:54:58'),
(17182, 345, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:55:02'),
(17183, 324, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:56:12'),
(17184, 324, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:56:26'),
(17185, 324, 'Trucker Job(Crate Component)', 3000, '2022-02-16 07:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `id` int(11) NOT NULL DEFAULT 0,
  `servermoney` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 500,
  `materialprice` int(11) NOT NULL DEFAULT 10,
  `lumberprice` int(11) NOT NULL DEFAULT 800,
  `component` int(11) NOT NULL DEFAULT 500,
  `componentprice` int(11) NOT NULL DEFAULT 10,
  `metalprice` int(11) NOT NULL DEFAULT 500,
  `gasoil` int(11) NOT NULL DEFAULT 1000,
  `gasoilprice` int(11) NOT NULL DEFAULT 10,
  `coalprice` int(11) NOT NULL DEFAULT 500,
  `product` int(11) NOT NULL DEFAULT 500,
  `productprice` int(11) NOT NULL DEFAULT 20,
  `apotek` int(11) NOT NULL DEFAULT 500,
  `medicineprice` int(11) NOT NULL DEFAULT 300,
  `medkitprice` int(11) NOT NULL DEFAULT 500,
  `food` int(11) NOT NULL DEFAULT 500,
  `foodprice` int(11) NOT NULL DEFAULT 100,
  `seedprice` int(11) NOT NULL DEFAULT 10,
  `potatoprice` int(11) NOT NULL DEFAULT 10,
  `wheatprice` int(11) NOT NULL DEFAULT 10,
  `orangeprice` int(11) NOT NULL DEFAULT 10,
  `marijuana` int(11) NOT NULL DEFAULT 500,
  `marijuanaprice` int(11) NOT NULL DEFAULT 10,
  `fishprice` int(11) NOT NULL DEFAULT 100,
  `gstationprice` int(11) NOT NULL DEFAULT 100,
  `crate_fish` int(11) NOT NULL DEFAULT 5000,
  `fish_stock` int(11) NOT NULL DEFAULT 5000,
  `crate_compo` int(11) NOT NULL DEFAULT 5000,
  `crate_material` int(11) NOT NULL DEFAULT 5000
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`id`, `servermoney`, `material`, `materialprice`, `lumberprice`, `component`, `componentprice`, `metalprice`, `gasoil`, `gasoilprice`, `coalprice`, `product`, `productprice`, `apotek`, `medicineprice`, `medkitprice`, `food`, `foodprice`, `seedprice`, `potatoprice`, `wheatprice`, `orangeprice`, `marijuana`, `marijuanaprice`, `fishprice`, `gstationprice`, `crate_fish`, `fish_stock`, `crate_compo`, `crate_material`) VALUES
(0, 1517580444, 100, 4, 350, 17474, 50, 550, 31162, 3, 458, 2460, 8, 4537, 200, 300, 1944, 2, 5, 10, 50, 30, 144, 1280, 500, 1, 4974, 4053, 4612, 5232);

-- --------------------------------------------------------

--
-- Table structure for table `speedcameras`
--

CREATE TABLE `speedcameras` (
  `id` int(11) NOT NULL,
  `speedRange` float NOT NULL DEFAULT 0,
  `speedLimit` float NOT NULL DEFAULT 0,
  `speedX` float NOT NULL DEFAULT 0,
  `speedY` float NOT NULL DEFAULT 0,
  `speedZ` float NOT NULL DEFAULT 0,
  `speedAngle` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `toys`
--

CREATE TABLE `toys` (
  `Id` int(10) NOT NULL,
  `Owner` varchar(40) NOT NULL DEFAULT '',
  `Slot0_Model` int(8) NOT NULL DEFAULT 0,
  `Slot0_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot0_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_Model` int(8) NOT NULL DEFAULT 0,
  `Slot1_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot1_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_Model` int(8) NOT NULL DEFAULT 0,
  `Slot2_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot2_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_Model` int(8) NOT NULL DEFAULT 0,
  `Slot3_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot3_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_Model` int(8) NOT NULL DEFAULT 0,
  `Slot4_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot4_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot4_ZScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_Model` int(8) NOT NULL DEFAULT 0,
  `Slot5_Bone` int(8) NOT NULL DEFAULT 0,
  `Slot5_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_XScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_YScale` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot5_ZScale` float(20,3) NOT NULL DEFAULT 0.000
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toys`
--

INSERT INTO `toys` (`Id`, `Owner`, `Slot0_Model`, `Slot0_Bone`, `Slot0_XPos`, `Slot0_YPos`, `Slot0_ZPos`, `Slot0_XRot`, `Slot0_YRot`, `Slot0_ZRot`, `Slot0_XScale`, `Slot0_YScale`, `Slot0_ZScale`, `Slot1_Model`, `Slot1_Bone`, `Slot1_XPos`, `Slot1_YPos`, `Slot1_ZPos`, `Slot1_XRot`, `Slot1_YRot`, `Slot1_ZRot`, `Slot1_XScale`, `Slot1_YScale`, `Slot1_ZScale`, `Slot2_Model`, `Slot2_Bone`, `Slot2_XPos`, `Slot2_YPos`, `Slot2_ZPos`, `Slot2_XRot`, `Slot2_YRot`, `Slot2_ZRot`, `Slot2_XScale`, `Slot2_YScale`, `Slot2_ZScale`, `Slot3_Model`, `Slot3_Bone`, `Slot3_XPos`, `Slot3_YPos`, `Slot3_ZPos`, `Slot3_XRot`, `Slot3_YRot`, `Slot3_ZRot`, `Slot3_XScale`, `Slot3_YScale`, `Slot3_ZScale`, `Slot4_Model`, `Slot4_Bone`, `Slot4_XPos`, `Slot4_YPos`, `Slot4_ZPos`, `Slot4_XRot`, `Slot4_YRot`, `Slot4_ZRot`, `Slot4_XScale`, `Slot4_YScale`, `Slot4_ZScale`, `Slot5_Model`, `Slot5_Bone`, `Slot5_XPos`, `Slot5_YPos`, `Slot5_ZPos`, `Slot5_XRot`, `Slot5_YRot`, `Slot5_ZRot`, `Slot5_XScale`, `Slot5_YScale`, `Slot5_ZScale`) VALUES
(0, 'Lux_Senju', 18639, 2, 0.165, 0.000, -0.001, -180.000, -180.000, 179.000, 1.000, 1.000, 1.000, 19625, 2, 0.003, 0.093, 0.000, 200.000, 50.000, 0.000, 1.000, 1.000, 1.000, 19012, 2, 0.079, 0.050, 0.000, -100.000, 100.099, 190.000, 1.000, 1.100, 1.200, 11745, 1, -0.059, -0.079, 0.000, 90.000, 90.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Ken_Marley', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Isco_Yamaguchi', 0, 2, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Frank_Richardo', 19142, 1, 0.061, 0.012, 0.000, 0.000, -2.000, 0.000, 1.052, 1.328, 1.399, 19469, 4, 0.178, -0.048, -0.025, -103.200, -2.500, -11.900, 1.000, 1.948, 1.908, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Mamad_Ahmex', 0, 2, 0.009, 0.090, 0.000, 9.090, 1.000, 0.003, 1.320, 2.000, 2.000, 0, 18, -0.160, 0.190, -0.270, 0.000, 0.000, 0.000, 1.130, 1.000, 1.000, 0, 2, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Bryan_Steven', 19023, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 19006, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Michael_Haridzon', 19067, 2, 0.122, 0.021, 0.002, 28.300, 92.000, 59.300, 1.195, 1.110, 1.170, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Akbar_Dilmore', 336, 16, -0.020, 0.129, -0.020, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 336, 16, -0.080, 0.140, -0.020, 0.000, 0.000, 1.000, 1.000, 1.000, 1.000, 0, 2, 0.170, -0.090, -0.280, 0.000, 0.000, 0.000, 1.000, 0.900, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Thomas_Kaizo', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Qiplyy_Xeros', 336, 15, -0.260, 0.100, -0.010, 0.200, 136.000, 100.000, 1.000, 1.000, 1.000, 18912, 2, 0.080, 0.043, 0.003, 270.000, 0.000, 270.000, 1.000, 1.000, 1.000, 336, 16, -0.300, 0.140, 0.060, 0.000, 45.000, 0.000, 1.000, 1.000, 1.000, 19012, 2, 0.110, 0.060, 0.005, 100.000, 100.000, 349.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Aryy_Fellix', 336, 1, -0.190, -0.135, 0.200, 0.000, 125.000, 10.000, 1.000, 1.000, 1.000, 0, 2, 0.140, 0.010, 0.000, 100.000, 95.000, 0.000, 1.000, 1.000, 1.000, 336, 1, -0.075, -0.140, 0.200, 0.000, 125.000, 10.000, 1.000, 1.000, 1.000, 19012, 2, 0.105, 0.050, -0.006, 100.000, 100.000, -5.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Dits_Toreto', 19093, 2, 0.070, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.130, 1.100, 0, 2, 0.100, 0.030, 0.005, 270.000, 0.000, 270.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Caca_Zeline', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Black_Bins', 336, 15, 0.060, 0.150, 0.040, 180.000, 320.000, 0.000, 1.000, 1.000, 1.000, 11745, 1, -0.150, -0.100, 0.000, 90.000, 110.000, 0.000, 1.000, 1.000, 1.000, 336, 16, 0.030, 0.110, -0.020, 0.000, -40.000, 0.000, 1.000, 1.000, 1.000, 18913, 2, 0.081, 0.029, 0.000, 90.000, 180.000, 90.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Skot_Juniorz', 11745, 1, -0.150, -0.100, 0.000, 90.000, 110.000, 0.000, 1.000, 1.000, 1.000, 336, 15, -0.110, 0.130, 0.130, 0.000, 140.000, 0.000, 1.000, 1.000, 1.000, 18912, 2, 0.081, 0.023, -0.006, 90.000, 180.000, 90.000, 1.000, 1.000, 1.200, 18941, 2, 0.150, -0.010, 0.005, 180.000, 360.000, 20.000, 1.300, 1.200, 1.240, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Lamar_Binks', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Justin_Toretto', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Devin_Stone', 19904, 9, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Fatur_Zexy', 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Jezzy_Mogilevich', 19066, 2, 0.123, 0.020, 0.000, 90.000, 90.000, 0.000, 1.000, 1.000, 1.000, 18911, 2, 0.080, 0.020, 0.003, -95.000, 5.000, 270.000, 1.000, 1.000, 1.000, 371, 1, 0.060, -0.114, -0.011, -0.500, 85.690, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Jackie_Kimberly', 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Rafiqi_Miyamura', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Wiliam_Dom', 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Miles_Morales', 19140, 1, 0.110, 0.016, 0.000, 0.000, 0.000, 0.000, 1.000, 1.218, 1.229, 0, 2, 0.107, 0.017, 0.003, 0.000, 89.199, 99.100, 1.058, 1.100, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Dominique_Vallerio', 18967, 1, 0.519, 0.050, 0.000, 0.000, 89.600, -104.600, 1.204, 1.301, 1.159, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 1, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1.000, 1.000, 1.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(0, 'Ina_Lidya', 18967, 2, 0.110, 0.017, 0.003, 0.000, 90.000, 99.099, 1.057, 1.076, 1.000, 19422, 1, 0.236, 0.030, 0.004, 2.900, -40.200, 89.100, 1.212, 1.792, 2.739, 11745, 1, 0.193, 0.192, 0.013, 102.100, 173.500, -131.500, 0.360, 0.466, 0.405, 19422, 1, 0.190, 0.037, -0.022, 1.500, -32.700, -103.700, 1.064, 1.260, 2.661, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `trees`
--

CREATE TABLE `trees` (
  `id` int(11) NOT NULL,
  `posx` float DEFAULT NULL,
  `posy` float DEFAULT NULL,
  `posz` float DEFAULT NULL,
  `posrx` float DEFAULT NULL,
  `posry` float DEFAULT NULL,
  `posrz` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trunk`
--

CREATE TABLE `trunk` (
  `ID` int(10) NOT NULL,
  `Owner` int(11) NOT NULL DEFAULT 0,
  `money` int(11) DEFAULT 0,
  `component` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 0,
  `marijuana` int(11) NOT NULL DEFAULT 0,
  `fish` int(11) NOT NULL DEFAULT 0,
  `weapon1` int(12) DEFAULT 0,
  `ammo1` int(12) DEFAULT 0,
  `weapon2` int(12) DEFAULT 0,
  `ammo2` int(12) DEFAULT 0,
  `weapon3` int(12) DEFAULT 0,
  `ammo3` int(12) DEFAULT 0,
  `weapon4` int(12) DEFAULT 0,
  `ammo4` int(12) DEFAULT 0,
  `weapon5` int(12) DEFAULT 0,
  `ammo5` int(12) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trunk`
--

INSERT INTO `trunk` (`ID`, `Owner`, `money`, `component`, `material`, `marijuana`, `fish`, `weapon1`, `ammo1`, `weapon2`, `ammo2`, `weapon3`, `ammo3`, `weapon4`, `ammo4`, `weapon5`, `ammo5`) VALUES
(52, 601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ucp`
--

CREATE TABLE `ucp` (
  `id` int(11) NOT NULL,
  `name` varchar(24) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 NOT NULL,
  `discord` varchar(21) CHARACTER SET utf8 NOT NULL,
  `char_1` varchar(25) CHARACTER SET utf8 NOT NULL,
  `char_2` varchar(25) CHARACTER SET utf8 NOT NULL,
  `char_3` varchar(25) CHARACTER SET utf8 NOT NULL,
  `token` int(20) NOT NULL,
  `admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ucp`
--

INSERT INTO `ucp` (`id`, `name`, `password`, `email`, `discord`, `char_1`, `char_2`, `char_3`, `token`, `admin`) VALUES
(1, 'ucp_test', '', 'aspoidjhsnak@gmail.com', '0', '', 'Joni', '', 0, 0),
(8, 'Classy', 'd26f993e8f7e0593f51cc8d2e2898896', 'societyroleplay.samp@gmail.com', '-402522102', 'Traymore_Cloovt', 'Drolli_Marquez', 'Vrouline_Felanny', 13755, 6),
(10, 'Shin', '', '', '-1903558615', '', '', '', 24117, 0),
(11, 'Rey11', '57d80207dea34aec4dd5082b202c5bc7', 'raihanfaqih2005@gmail.com', '-1711144898', 'Davis_Stark', '', '', 18574, 6),
(21, 'HammieBoyDoThing', '', '', '-79560671', '', '', '', 22209, 0),
(22, 'Keizi', '', '', '1136918543', '', '', '', 44559, 0),
(23, 'vyn', '', '', '-435027957', '', '', '', 17154, 0),
(24, 'Rojali', '', '', '649884459394531361', '', '', '', 5940, 0),
(25, 'Daryl_Tyrone', 'd1bbb2af69fd350b6d6bd88655757b47', 'farhanozora0306@gmail.com', '674266880294518814', 'Daryl_Tyrone', '', '', 29541, 0),
(26, 'Radeetz', '', '', '778129735808581643', '', '', '', 24641, 0),
(27, 'STANLEY', '', '', '615367417467502594', '', '', '', 27805, 0),
(28, 'Dikaa', '', '', '707723396946984961', '', '', '', 30196, 0),
(29, 'kangafk', '', '', '791617975627153409', '', '', '', 32468, 0),
(30, 'Sandi', '45eff97c4369fa8b613a59ea80c0d54e', 'santuyy338@gmail.com', '815503736129716225', 'Sandi_Crips', '', '', 13403, 0),
(31, 'Doss', '', '', '642637127322173441', '', '', '', 12060, 0),
(32, 'Alex_Devalo', 'd0f632da98771015bb7a82d3fd829877', 'tbgatau@gmail.com', '827615139217670175', 'Alex_Devalo', '', '', 42354, 0),
(33, 'tray', '', '', '769823623309426689', '', '', '', 43158, 0),
(34, 'Dani_Luciano', '4d4975c0a6ed0b43c7425c03410703d7', 'danigaming1150@gmail.com', '565188464509714432', 'Dani_Luciano', '', '', 39381, 0),
(43, 'Satan', 'baac7793c63d3292d3d3c90533f96cd8', 'astagababi54@gmail.com', '882627470342381608', 'Kurt_Makanov', '', '', 22455, 0),
(44, 'Rehan', '874b53f4023d75e75384753620afbfa4', 'hau@gmail.com', '859582300090269706', 'Garry_Eastwood', '', '', 57002, 0),
(45, 'BngWiro', '', '', '776859682160508948', '', '', '', 41220, 0),
(46, 'Neroic', '', '', '682516257777385490', '', '', '', 43001, 0),
(47, 'Julius_Galilea', '', '', '740888741429903420', '', '', '', 49987, 0),
(48, 'Yourbae', '', '', '721758229541027982', '', '', '', 52686, 0),
(49, 'Willy wongka', '', '', '867500646701072414', '', '', '', 69185, 0),
(50, 'samuel_maximilano', '2916210952367a1b2798e9fb52e76159', 'palsuhekel@gmail.com', '633819101638426636', 'Samuel_Maximilano', '', '', 52072, 0),
(51, 'Juice', '', '', '797764668574662676', '', '', '', 63384, 0),
(52, 'Rifai', '', '', '847078857541550120', '', '', '', 62198, 0),
(53, 'Dhimas', '', '', '748925534968348822', '', '', '', 46774, 0),
(54, 'Helmi', 'c19af333a96c1ba57da75ee1de5c6c02', 'mihluis475@gmail.com', '714332475954036819', 'Helmi_Saputra', '', '', 26294, 0),
(55, 'Rangga_Febrian', '', '', '852755434468409355', '', '', '', 69909, 0),
(56, 'SugengGod', '', '', '558065851773878272', '', '', '', 85752, 0),
(57, 'Vito_Luiz', '', '', '725617978904805377', '', '', '', 61879, 0),
(58, 'Turisno', 'd3534061fd031b832aaaca2dc9c04563', 'reivensmith@gmail.com', '855029957574393878', 'Frank_Lucaslo', 'Chulo_Lucaslo', '', 32086, 0),
(59, 'Luke', '', '', '792629291572527134', '', '', '', 61197, 0),
(60, 'Falbimuhimin', '', '', '725222089816277022', '', '', '', 46324, 0),
(61, 'Zeins_Santacruz', 'ed57300ef7377af3b929ae7e6c229028', 'www.ainunnajib7@gmail.com', '784484453664948295', 'Zeins_Santacruz', '', '', 38199, 0),
(62, 'Zucca240', 'b38ad7f1a3115599148daab1d83454ea', 'barokjidjid@gmai.com', '805773476031234049', 'Mariano_Zucca', '', '', 45569, 0),
(63, 'Sabian', '', '', '516292618', '', '', '', 27533, 0),
(64, 'Arii', '', '', '486678540', '', '', '', 41620, 0),
(65, 'SkotZ', '', '', '-1836961742', '', '', '', 36142, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) UNSIGNED NOT NULL,
  `owner` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `color1` int(11) NOT NULL DEFAULT 0,
  `color2` int(11) NOT NULL DEFAULT 0,
  `paintjob` int(11) NOT NULL DEFAULT -1,
  `neon` int(11) NOT NULL DEFAULT 0,
  `locked` int(11) NOT NULL DEFAULT 0,
  `insu` int(11) NOT NULL DEFAULT 1,
  `claim` int(11) NOT NULL DEFAULT 0,
  `claim_time` bigint(15) NOT NULL DEFAULT 0,
  `plate` varchar(50) NOT NULL DEFAULT 'None',
  `plate_time` bigint(16) NOT NULL DEFAULT 0,
  `ticket` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 200000,
  `health` float NOT NULL DEFAULT 1000,
  `fuel` int(11) NOT NULL DEFAULT 1000,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `a` float NOT NULL DEFAULT 0,
  `int` int(11) NOT NULL DEFAULT 0,
  `vw` int(11) NOT NULL DEFAULT 0,
  `damage0` int(11) NOT NULL DEFAULT 0,
  `damage1` int(11) NOT NULL DEFAULT 0,
  `damage2` int(11) NOT NULL DEFAULT 0,
  `damage3` int(11) NOT NULL DEFAULT 0,
  `mod0` int(11) NOT NULL DEFAULT 0,
  `mod1` int(11) NOT NULL DEFAULT 0,
  `mod2` int(11) NOT NULL DEFAULT 0,
  `mod3` int(11) NOT NULL DEFAULT 0,
  `mod4` int(11) NOT NULL DEFAULT 0,
  `mod5` int(11) NOT NULL DEFAULT 0,
  `mod6` int(11) NOT NULL DEFAULT 0,
  `mod7` int(11) NOT NULL DEFAULT 0,
  `mod8` int(11) NOT NULL DEFAULT 0,
  `mod9` int(11) NOT NULL DEFAULT 0,
  `mod10` int(11) NOT NULL DEFAULT 0,
  `mod11` int(11) NOT NULL DEFAULT 0,
  `mod12` int(11) NOT NULL DEFAULT 0,
  `mod13` int(11) NOT NULL DEFAULT 0,
  `mod14` int(11) NOT NULL DEFAULT 0,
  `mod15` int(11) NOT NULL DEFAULT 0,
  `mod16` int(11) NOT NULL DEFAULT 0,
  `lumber` int(11) NOT NULL DEFAULT -1,
  `metal` int(11) NOT NULL DEFAULT 0,
  `coal` int(11) NOT NULL DEFAULT 0,
  `product` int(11) NOT NULL DEFAULT 0,
  `gasoil` int(11) NOT NULL DEFAULT 0,
  `rental` bigint(16) NOT NULL DEFAULT 0,
  `park` int(11) NOT NULL DEFAULT -1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `owner`, `model`, `color1`, `color2`, `paintjob`, `neon`, `locked`, `insu`, `claim`, `claim_time`, `plate`, `plate_time`, `ticket`, `price`, `health`, `fuel`, `x`, `y`, `z`, `a`, `int`, `vw`, `damage0`, `damage1`, `damage2`, `damage3`, `mod0`, `mod1`, `mod2`, `mod3`, `mod4`, `mod5`, `mod6`, `mod7`, `mod8`, `mod9`, `mod10`, `mod11`, `mod12`, `mod13`, `mod14`, `mod15`, `mod16`, `lumber`, `metal`, `coal`, `product`, `gasoil`, `rental`, `park`) VALUES
(572, 248, 578, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 200000, 1000, 1000, 1632.06, -1699.23, 13.5872, 181.955, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1),
(570, 248, 522, 250, 250, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 50000, 1000, 985, -2884.24, -979.756, 9.65151, 174.17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1),
(573, 250, 499, 126, 126, -1, 0, 0, 0, 1, 0, 'None', 0, 0, 200000, 1000, 1000, -2425.34, -712.35, 136.066, 350.992, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1),
(576, 250, 499, 123, 123, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 1000, 145, -2036.17, 464.596, 35.9352, 87.9353, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1),
(584, 328, 481, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 500, 1000, 1000, -73.5692, -1119.56, 0.687675, 330.026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645080144, -1),
(577, 259, 586, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 700, 504.365, 370, -1913.02, -1709.52, 21.3631, 347.251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1644936546, -1),
(622, 346, 499, 1, 1, -1, 0, 0, 2, 1, 1644997972, 'NoHave', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.3719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(581, 315, 509, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 300, 1000, 1000, 735.234, -1315.59, 13.0041, 271.528, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645079095, -1),
(582, 283, 481, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 500, 1000, 1000, -2625.54, -381.851, 38.2258, 1.7522, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645079106, -1),
(583, 314, 481, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 500, 1000, 1000, -2427.21, -702.334, 132.919, 38.7799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645079111, -1),
(586, 328, 481, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 500, 999, 1000, -1960.95, 289.83, 35.124, 175.718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645080166, -1),
(587, 327, 510, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 450, 1000, 1000, -1430.32, -283.415, 14.2484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645080209, -1),
(592, 250, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 1000, 850, -2009.93, 120.411, 27.7298, 183.008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(621, 294, 499, 1, 1, -1, 0, 1, 3, 0, 0, 'NoHave', 0, 0, 8000, 914.566, 835, -1880.44, -1699.48, 21.8412, 139.975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645080161, -1),
(635, 334, 586, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 700, 1000, 1000, -1430.32, -283.415, 14.1484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645083622, -1),
(593, 230, 499, 1, 1, -1, 0, 1, 3, 0, 0, 'NoHave', 0, 0, 8000, 995.605, 940, -2010.21, 127.352, 27.7289, 180.062, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(594, 248, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 1000, 1000, -1978.43, 268.302, 35.3624, 0.198821, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(595, 252, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 857.157, 730, -2009.45, 117.868, 27.6277, 181.04, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1),
(596, 340, 463, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 850, 955.213, 505, 366.423, 160.093, 1013.93, 200.268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645082248, -1),
(597, 340, 509, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 300, 1000, 1000, -2420.91, -714.798, 132.858, 128.405, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645082312, -1),
(598, 250, 499, 1, 1, -1, 0, 0, 2, 1, 1644997625, 'NoHave', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.2719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(642, 291, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 1000, 910, -2008.48, 122.758, 27.6238, 179.246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645082248, -1),
(600, 341, 481, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 500, 1000, 1000, -1430.32, -283.415, 14.2484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645082410, -1),
(601, 299, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 997.506, 790, -2020.65, 179.882, 28.734, 220.882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645082410, -1),
(602, 317, 499, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.1719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1),
(603, 260, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 300, 820, -1974.94, 56.3419, 28.8567, 203.088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(604, 298, 499, 1, 1, -1, 0, 0, 2, 1, 1644997633, 'NoHave', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.2719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(605, 316, 499, 1, 1, -1, 0, 0, 2, 1, 1644997961, 'NoHave', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.2719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(606, 293, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 956.329, 1000, -2009.56, 220.072, 27.992, 180.693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(607, 277, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 300, 865, -2007.39, 235.267, 28.883, 178.097, 0, 0, 35651584, 132099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(608, 273, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 774.27, 820, -1856.56, -1729.01, 21.9404, 119.773, 0, 0, 34603008, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(609, 262, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 300, 850, -2002.04, 153.761, 27.799, 178.769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(610, 293, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 1000, 880, -2009.04, 156.249, 27.6622, 180.506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645079106, -1),
(611, 338, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 300, 790, -1905.57, -1181.08, 39.2264, 178.86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(612, 339, 499, 1, 1, -1, 0, 0, 2, 1, 1644997630, 'NoHave', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.3719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(613, 343, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 300, 940, -2000.97, 167.072, 27.7369, 226.249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(614, 328, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 858.296, 895, -1914.83, -1717.1, 21.9413, 228.118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(615, 333, 499, 1, 1, -1, 0, 0, 2, 1, 1644997938, 'NoHave', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.2719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(616, 312, 499, 1, 1, -1, 0, 1, 2, 1, 1644997967, 'NoHave', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.2719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(617, 324, 499, 1, 1, -1, 0, 1, 3, 0, 0, 'NoHave', 0, 0, 8000, 526.127, 610, -1866.29, -211.588, 18.4776, 298.82, 0, 0, 0, 131072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(618, 292, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 396.116, 865, -1882.46, -1690.91, 21.8307, 182.072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(619, 287, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 757.034, 865, -1888.31, -1710.6, 21.9417, 143.398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645079106, -1),
(620, 335, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 991.755, 940, -1893.71, -1705.09, 21.8508, 260.32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(623, 340, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 928.829, 925, -2005.02, 166.44, 27.7295, 235.779, 0, 0, 34603024, 50528768, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(624, 348, 499, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.1719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1),
(625, 266, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 998, 940, -1999.13, -193.565, 36.1483, 191.528, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(633, 344, 499, 1, 1, -1, 0, 1, 3, 0, 0, 'NoHave', 0, 0, 8000, 1000, 955, -1900.54, -1706.39, 21.8465, 254.666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645083403, -1),
(636, 354, 462, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 650, 1000, 1000, -1431.71, -280.331, 13.6008, 71.9149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645083628, -1),
(628, 269, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 854.879, 895, -1886.72, -1759.42, 29.3174, 119.924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645080161, -1),
(629, 268, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 1000, 985, -2001.47, 182.677, 27.831, 176.22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(630, 284, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 405.992, 895, -1914.86, -1721.4, 21.8408, 279.338, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(631, 319, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 538, 895, -1909.8, -1099.74, 38.3254, 178.978, 0, 0, 18874369, 33554948, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(632, 345, 499, 1, 1, -1, 0, 1, 2, 1, 1644998213, 'NoHave', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.2719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0),
(634, 356, 510, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 450, 1000, 1000, -1430.32, -283.415, 14.1484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645083605, -1),
(637, 319, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 957.191, 955, -1916.65, -1713.99, 21.8452, 89.6642, 0, 0, 17825808, 33554944, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645080144, -1),
(638, 355, 462, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 650, 1000, 1000, -1430.32, -283.415, 14.2484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645083659, -1),
(641, 264, 499, 1, 1, -1, 0, 0, 3, 0, 0, 'NoHave', 0, 0, 8000, 985.615, 955, -1975.79, 263.421, 35.265, 7.30515, 0, 0, 1048576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645082248, -1),
(640, 283, 499, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.1719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1),
(643, 357, 463, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 850, 1000, 1000, -1430.32, -283.415, 14.1484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645084545, -1),
(644, 333, 499, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 8000, 1000, 1000, -1978.48, 262.226, 35.1719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1),
(645, 362, 509, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 300, 1000, 1000, -1430.32, -283.415, 14.1484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645084586, -1),
(646, 345, 586, 1, 1, -1, 0, 0, 1, 0, 0, 'None', 0, 0, 700, 1000, 1000, -1430.32, -283.415, 14.1484, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1645085009, -1);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL DEFAULT 0,
  `vip` int(11) NOT NULL DEFAULT 0,
  `vip_time` int(11) NOT NULL DEFAULT 0,
  `gold` int(11) NOT NULL DEFAULT 0,
  `admin` varchar(16) NOT NULL DEFAULT 'None',
  `donature` varchar(16) NOT NULL DEFAULT 'None',
  `claim` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vtoys`
--

CREATE TABLE `vtoys` (
  `id` int(10) NOT NULL,
  `Owner` int(11) NOT NULL DEFAULT 0,
  `Slot0_Modelid` int(8) NOT NULL DEFAULT 0,
  `Slot0_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot0_ZRot` float(20,3) NOT NULL,
  `Slot1_Modelid` int(8) NOT NULL DEFAULT 0,
  `Slot1_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot1_ZRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_Modelid` int(8) NOT NULL DEFAULT 0,
  `Slot2_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot2_ZRot` float(20,3) NOT NULL,
  `Slot3_Modelid` int(8) NOT NULL DEFAULT 0,
  `Slot3_XPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZPos` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_XRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_YRot` float(20,3) NOT NULL DEFAULT 0.000,
  `Slot3_ZRot` float(20,3) NOT NULL DEFAULT 0.000
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vtoys`
--

INSERT INTO `vtoys` (`id`, `Owner`, `Slot0_Modelid`, `Slot0_XPos`, `Slot0_YPos`, `Slot0_ZPos`, `Slot0_XRot`, `Slot0_YRot`, `Slot0_ZRot`, `Slot1_Modelid`, `Slot1_XPos`, `Slot1_YPos`, `Slot1_ZPos`, `Slot1_XRot`, `Slot1_YRot`, `Slot1_ZRot`, `Slot2_Modelid`, `Slot2_XPos`, `Slot2_YPos`, `Slot2_ZPos`, `Slot2_XRot`, `Slot2_YRot`, `Slot2_ZRot`, `Slot3_Modelid`, `Slot3_XPos`, `Slot3_YPos`, `Slot3_ZPos`, `Slot3_XRot`, `Slot3_YRot`, `Slot3_ZRot`) VALUES
(60, 434, 0, -0.050, -0.050, 0.650, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(61, 502, 19419, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(62, 502, 19419, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(63, 457, 0, -0.050, -0.050, 0.650, 0.000, 0.000, 0.000, 1007, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1001, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 1006, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(64, 527, 1146, 1.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(65, 527, 1146, 1.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(66, 527, 1146, 1.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000),
(67, 502, 19419, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `weaponsettings`
--

CREATE TABLE `weaponsettings` (
  `Owner` int(11) NOT NULL,
  `WeaponID` tinyint(4) NOT NULL,
  `PosX` float DEFAULT -0.116,
  `PosY` float DEFAULT 0.189,
  `PosZ` float DEFAULT 0.088,
  `RotX` float DEFAULT 0,
  `RotY` float DEFAULT 44.5,
  `RotZ` float DEFAULT 0,
  `Bone` tinyint(4) NOT NULL DEFAULT 1,
  `Hidden` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weaponsettings`
--

INSERT INTO `weaponsettings` (`Owner`, `WeaponID`, `PosX`, `PosY`, `PosZ`, `RotX`, `RotY`, `RotZ`, `Bone`, `Hidden`) VALUES
(171, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 15, 1),
(156, 30, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(161, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(163, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 16, 0),
(206, 24, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(171, 30, -0.116, 0.189, 0.088, 0, 44.5, 0, 15, 0),
(161, 28, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 1),
(171, 25, -0.116, 0.189, 0.088, 0, 44.5, 0, 15, 0),
(161, 30, -0.116, 0.189, 0.088, 0, 44.5, 0, 1, 0),
(248, 24, -0.115, 0.035, -0.209, 88.1, 175, -8.2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `workshop`
--

CREATE TABLE `workshop` (
  `id` int(11) NOT NULL,
  `owner` varchar(25) NOT NULL DEFAULT '-',
  `posx` float NOT NULL DEFAULT 0,
  `posy` float NOT NULL DEFAULT 0,
  `posz` float NOT NULL DEFAULT 0,
  `component` int(11) NOT NULL DEFAULT 0,
  `material` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL DEFAULT 0,
  `name` varchar(26) NOT NULL DEFAULT '-',
  `status` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `employe0` varchar(25) NOT NULL DEFAULT '-',
  `employe1` varchar(25) NOT NULL DEFAULT '-',
  `employe2` varchar(25) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_tokens`
--
ALTER TABLE `access_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `atms`
--
ALTER TABLE `atms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banneds`
--
ALTER TABLE `banneds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bisnis`
--
ALTER TABLE `bisnis`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contactID`);

--
-- Indexes for table `doors`
--
ALTER TABLE `doors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `familys`
--
ALTER TABLE `familys`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `farm`
--
ALTER TABLE `farm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gstations`
--
ALTER TABLE `gstations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lockers`
--
ALTER TABLE `lockers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loglogin`
--
ALTER TABLE `loglogin`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `ores`
--
ALTER TABLE `ores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `playerucp`
--
ALTER TABLE `playerucp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speedcameras`
--
ALTER TABLE `speedcameras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trees`
--
ALTER TABLE `trees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trunk`
--
ALTER TABLE `trunk`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ucp`
--
ALTER TABLE `ucp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vtoys`
--
ALTER TABLE `vtoys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weaponsettings`
--
ALTER TABLE `weaponsettings`
  ADD PRIMARY KEY (`Owner`,`WeaponID`),
  ADD UNIQUE KEY `Owner` (`Owner`,`WeaponID`);

--
-- Indexes for table `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_tokens`
--
ALTER TABLE `access_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banneds`
--
ALTER TABLE `banneds`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `loglogin`
--
ALTER TABLE `loglogin`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9154;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `reg_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=363;

--
-- AUTO_INCREMENT for table `playerucp`
--
ALTER TABLE `playerucp`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17186;

--
-- AUTO_INCREMENT for table `trunk`
--
ALTER TABLE `trunk`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `ucp`
--
ALTER TABLE `ucp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=647;

--
-- AUTO_INCREMENT for table `vtoys`
--
ALTER TABLE `vtoys`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
