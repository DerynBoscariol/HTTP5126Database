-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 10, 2024 at 04:57 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Animal_sanctuary`
--

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `animal_id` int(3) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(3) NOT NULL,
  `arrival_date` date NOT NULL,
  `total_donations` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`animal_id`, `type`, `name`, `age`, `arrival_date`, `total_donations`) VALUES
(1, 'Zebra', 'Zane', 16, '2020-07-21', '390.60'),
(2, 'Elephant', 'Elizabeth', 25, '2015-03-15', '690.00'),
(3, 'Flamingo', 'Fredrick', 9, '2017-09-22', '350.00'),
(4, 'Lion', 'Layla', 4, '2023-11-14', '310.50'),
(5, 'Penguin', 'Priscilla', 7, '2022-11-04', '305.75'),
(6, 'Giraffe', 'Georgie', 17, '2014-10-02', '276.35'),
(7, 'Gorilla', 'Gracie', 27, '2010-08-17', '565.00'),
(8, 'Boa constrictor', 'Billy', 8, '2016-04-21', '182.50'),
(9, 'Hippo', 'Helena', 30, '2004-01-10', '270.00'),
(10, 'Tiger', 'Terry', 4, '2024-02-18', '480.75');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `donation_id` int(4) NOT NULL,
  `donor_id` int(4) NOT NULL,
  `animal_id` int(3) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date_donated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`donation_id`, `donor_id`, `animal_id`, `amount`, `date_donated`) VALUES
(1001, 21, 4, '45.50', '2024-03-03'),
(1002, 19, 8, '32.00', '2022-06-17'),
(1003, 1, 3, '90.00', '2023-08-14'),
(1004, 2, 9, '100.00', '2023-02-09'),
(1015, 3, 7, '25.00', '2023-06-02'),
(1016, 4, 1, '85.00', '2022-08-24'),
(1017, 5, 6, '65.00', '2023-01-30'),
(1018, 6, 2, '90.00', '2022-12-28'),
(1019, 7, 1, '150.00', '2023-07-21'),
(1020, 8, 5, '120.00', '2024-01-13'),
(1021, 9, 10, '90.00', '2024-03-27'),
(1022, 10, 4, '70.00', '2024-03-27'),
(1023, 11, 10, '80.00', '2022-11-16'),
(1024, 12, 7, '140.00', '2024-02-26'),
(1025, 13, 1, '45.00', '2023-05-11'),
(1026, 14, 8, '70.00', '2022-04-22'),
(1027, 15, 3, '130.00', '2022-06-28'),
(1028, 16, 7, '200.00', '2022-02-10'),
(1029, 17, 2, '500.00', '2023-05-11'),
(1030, 18, 10, '80.00', '2023-01-04'),
(1031, 19, 1, '25.00', '2023-08-11'),
(1032, 20, 3, '90.00', '2023-02-09'),
(1033, 21, 8, '50.00', '2023-06-14'),
(1034, 22, 5, '85.75', '2022-10-14'),
(1035, 23, 6, '65.55', '2024-03-11'),
(1036, 24, 10, '80.75', '2024-01-03'),
(1037, 25, 6, '45.80', '2023-05-04'),
(1038, 7, 6, '100.00', '2024-02-20'),
(1039, 18, 7, '125.00', '2023-11-24'),
(1040, 14, 1, '85.60', '2023-09-28'),
(1041, 2, 4, '160.00', '2023-10-16'),
(1042, 11, 8, '30.50', '2023-03-20'),
(1043, 1, 9, '80.00', '2022-11-08'),
(1044, 5, 4, '35.00', '2023-04-06'),
(1045, 4, 2, '100.00', '2023-12-13'),
(1046, 8, 10, '150.00', '2023-11-06'),
(1047, 17, 9, '90.00', '2024-04-08'),
(1048, 5, 7, '75.00', '2024-04-09'),
(1049, 12, 3, '40.00', '2024-04-09'),
(1050, 22, 5, '100.00', '2024-04-10');

--
-- Triggers `donations`
--
DELIMITER $$
CREATE TRIGGER `update_animalDonation_new` AFTER INSERT ON `donations` FOR EACH ROW UPDATE animals
SET total_donations = total_donations + NEW.amount
WHERE animals.animal_id = NEW.animal_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `donor_id` int(4) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `total_donations` decimal(10,2) DEFAULT NULL,
  `date_last_donated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`donor_id`, `first_name`, `last_name`, `email`, `total_donations`, `date_last_donated`) VALUES
(1, 'Jane', 'Watson', 'janewatson64@gmail.com', '170.00', '2023-08-14'),
(2, 'Mike', 'Lee', 'mikelee28@gmail.com', '260.00', '2023-10-16'),
(3, 'Chris', 'Walton', 'chriswalton93@gmail.com', '25.00', '2023-06-02'),
(4, 'Brett', 'Alderson', 'brettalderson92@gmail.com', '185.00', '2023-12-13'),
(5, 'Tina', 'Pauly', 'tinapauly68@gmail.com', '100.00', '2023-04-06'),
(6, 'Bonnie', 'Wang', 'bonniewang29@gmail.com', '90.00', '2022-12-28'),
(7, 'Alexis', 'Gilmore', 'alexisgilmore33@gmail.com', '250.00', '2024-02-20'),
(8, 'Rory', 'Bledel', 'rorybledel80@gmail.com', '270.00', '2024-01-13'),
(9, 'Dan', 'Hawkins', 'danhawkins63@gmail.com', '90.00', '2024-03-27'),
(10, 'Grant', 'Humphries', 'granthumphries47@gmail.com', '70.00', '2024-03-27'),
(11, 'Celia', 'Jones', 'celiajones21@gmail.com', '110.50', '2023-03-20'),
(12, 'Cory', 'Henderson', 'coryhenderson59@gmail.com', '140.00', '2024-02-26'),
(13, 'Greg', 'Lawson', 'greglawson18@gmail.com', '45.00', '2023-05-11'),
(14, 'Timothy', 'Sharp', 'timothysharp38@gmail.com', '155.60', '2023-09-28'),
(15, 'Dianne', 'McKenna', 'diannemckenna72@gmail.com', '130.00', '2022-06-28'),
(16, 'Sylvia', 'Birkin', 'sylviabirkin99@gmail.com', '200.00', '2022-02-10'),
(17, 'Simon', 'Phillips', 'simonphillips77@gmail.com', '500.00', '2024-04-08'),
(18, 'Cedric', 'Weston', 'cedricweston82@gmail.com', '205.00', '2023-11-24'),
(19, 'Caitlyn', 'Benson', 'caitlynbenson53@gmail.com', '57.00', '2023-08-11'),
(20, 'Benjamin', 'Rodrigez', 'benjaminrodrigez28@gmail.com', '90.00', '2023-02-09'),
(21, 'Garrett', 'Price', 'garrettprice35@gmail.com', '95.50', '2024-03-03'),
(22, 'Kyle', 'Davis', 'kyledavis41@gmail.com', '85.75', '2022-10-14'),
(23, 'Bryce', 'Kelly', 'brycekelly88@gmail.com', '65.55', '2024-03-11'),
(24, 'David', 'Hutchison', 'davidhutchison@gmail.com', '80.75', '2024-01-03'),
(25, 'Howard', 'Clarkson', 'howardclarkson29@gmail.com', '45.80', '2023-05-04');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vip_program`
-- (See below for the actual view)
--
CREATE TABLE `vip_program` (
`donor_id` int(4)
,`first_name` varchar(50)
,`last_name` varchar(50)
,`total_donations` decimal(10,2)
,`date_last_donated` date
);

-- --------------------------------------------------------

--
-- Structure for view `vip_program`
--
DROP TABLE IF EXISTS `vip_program`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vip_program`  AS SELECT `donors`.`donor_id` AS `donor_id`, `donors`.`first_name` AS `first_name`, `donors`.`last_name` AS `last_name`, `donors`.`total_donations` AS `total_donations`, `donors`.`date_last_donated` AS `date_last_donated` FROM `donors` WHERE (`donors`.`total_donations` >= 200)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`animal_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`donation_id`),
  ADD KEY `animal_id` (`animal_id`),
  ADD KEY `donor_id` (`donor_id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`donor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `animal_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `donation_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1051;

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `donor_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`),
  ADD CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`donor_id`) REFERENCES `donors` (`donor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
