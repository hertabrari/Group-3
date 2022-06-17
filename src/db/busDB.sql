SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



CREATE TABLE IF NOT EXISTS `bg` (
  `BloodG` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `bg` (`BloodG`) VALUES
('A+'),
('A-'),
('AB+'),
('AB-'),
('B+'),
('B-'),
('O+'),
('O-');


CREATE TABLE IF NOT EXISTS `bus_instances` (
  `BID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `Seats_Left` int(11) NOT NULL,
  `BusDate` date DEFAULT NULL,
  `DepTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `bus_instances` (`BID`, `RID`, `Seats_Left`, `BusDate`, `DepTime`) VALUES
(10, 11540, 50, '2019-09-08', '15:40:00'),
(11, 21615, 50, '2019-09-08', '16:15:00'),
(12, 21655, 50, '2019-09-08', '16:55:00'),
(13, 11720, 50, '2019-09-08', '17:20:00'),
(14, 11750, 50, '2019-09-08', '17:50:00'),
(15, 21830, 50, '2019-09-08', '18:30:00'),
(16, 11940, 50, '2019-09-08', '19:40:00'),
(17, 22020, 50, '2019-09-08', '20:20:00'),
(18, 12100, 50, '2019-09-08', '21:00:00'),
(19, 22140, 50, '2019-09-08', '21:40:00'),
(70, 11540, 48, '2019-09-07', '15:40:00'),
(71, 21615, 50, '2019-09-07', '16:15:00'),
(72, 21655, 48, '2019-09-07', '16:55:00'),
(73, 11720, 50, '2019-09-07', '17:20:00'),
(74, 11750, 50, '2019-09-07', '17:50:00'),
(75, 21830, 50, '2019-09-07', '18:30:00'),
(76, 11940, 50, '2019-09-07', '19:40:00'),
(77, 22020, 50, '2019-09-07', '20:20:00'),
(78, 12100, 50, '2019-09-07', '21:00:00'),
(79, 22140, 50, '2019-09-07', '21:40:00');



CREATE TABLE IF NOT EXISTS `department` (
  `DCode` varchar(5) NOT NULL,
  `DName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `department` (`DCode`, `DName`) VALUES
('CSE', 'Computer Science and Engineering'),
('DS', 'Design'),
('ECE', 'Electronics and Communication Engineering'),
('ME', 'Mechanical Engineering'),
('NS', 'Natural Sciences');

CREATE TABLE IF NOT EXISTS `faculty` (
  `FID` int(11) NOT NULL,
  `FName` varchar(30) DEFAULT NULL,
  `Dept` varchar(5) NOT NULL,
  `BloodG` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `faculty` (`FID`, `FName`, `Dept`, `BloodG`) VALUES
(50215, 'Alex Jones', 'CSE', 'A+');



CREATE TABLE IF NOT EXISTS `guest` (
  `GID` int(11) NOT NULL,
  `GName` varchar(30) NOT NULL,
  `HostID` int(11) NOT NULL,
  `HostType` varchar(15) NOT NULL,
  `BloodG` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE IF NOT EXISTS `passenger` (
  `ID` int(11) NOT NULL,
  `Type` varchar(15) NOT NULL,
  `Pwd` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `passenger` (`ID`, `Type`, `Pwd`) VALUES
(102, 'Student', '827ccb0eea8a706c4c34a16891f84e7b'),
(105, 'Student', 'e10adc3949ba59abbe56e057f20f883e'),
(204, 'Staff', 'e10adc3949ba59abbe56e057f20f883e'),
(503, 'Staff', 'fcea920f7412b5da7be0cf42b8c93759'),
(1001, 'Staff', '827ccb0eea8a706c4c34a16891f84e7b'),
(1005, 'Staff', 'e10adc3949ba59abbe56e057f20f883e'),
(1021, 'Staff', 'test3'),
(5021, 'Student', 'e10adc3949ba59abbe56e057f20f883e'),
(50215, 'Faculty', 'test2'),
(2017324, 'Student', 'test2'),
(2017333, 'Student', 'test');



CREATE TABLE IF NOT EXISTS `p_type` (
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `p_type` (`type`) VALUES
('Faculty'),
('Guest'),
('Staff'),
('Student');



CREATE TABLE IF NOT EXISTS `routes` (
  `RID` int(11) NOT NULL,
  `STime` time DEFAULT NULL,
  `DTime` time DEFAULT NULL,
  `Src` varchar(20) DEFAULT NULL,
  `Dst` varchar(20) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `routes` (`RID`, `STime`, `DTime`, `Src`, `Dst`, `Capacity`) VALUES
(11540, '07:40:00', '08:45:00', 'Tirana', 'Campus', 50),
(11720, '09:55:00', '10:35:00', 'Campus', 'Tirana', 50),
(11750, '11:30:00', '12:30:00', 'Campus', 'Durres', 50),
(11940, '11:55:00', '12:35:00', 'Tirana', 'Campus', 50),
(12100, '12:00:00', '13:10:00', 'Durres', 'Campus', 50),
(21615, '12:55:00', '13:30:00', 'Campus', 'Tirana', 50),
(21655, '13:40:00', '14:30:00', 'Tirana', 'Campus', 50),
(21830, '15:55:00', '16:40:00', 'Campus', 'Tirana', 50),
(22020, '15:55:00', '16:25:00', 'Campus', 'Qendra Ring', 50),
(22140, '16:40:00', '17:30:00', 'Tirana', 'Campus', 50);


CREATE TABLE IF NOT EXISTS `seat_matrix` (
  `BID` int(11) NOT NULL,
  `RID` int(11) NOT NULL,
  `SeatNo` int(11) NOT NULL,
  `Passenger` int(11) DEFAULT NULL,
  `BusDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `seat_matrix` (`BID`, `RID`, `SeatNo`, `Passenger`, `BusDate`) VALUES
(10, 11540, 1, NULL, '2019-09-08'),
(10, 11540, 2, NULL, '2019-09-08'),
(10, 11540, 3, NULL, '2019-09-08'),
(10, 11540, 4, NULL, '2019-09-08'),
(10, 11540, 5, NULL, '2019-09-08'),
(10, 11540, 6, NULL, '2019-09-08'),
(10, 11540, 7, NULL, '2019-09-08'),
(10, 11540, 8, NULL, '2019-09-08'),
(10, 11540, 9, NULL, '2019-09-08'),
(10, 11540, 10, NULL, '2019-09-08'),
(10, 11540, 11, NULL, '2019-09-08'),
(10, 11540, 12, NULL, '2019-09-08'),
(10, 11540, 13, NULL, '2019-09-08'),
(10, 11540, 14, NULL, '2019-09-08'),
(10, 11540, 15, NULL, '2019-09-08'),
(10, 11540, 16, NULL, '2019-09-08'),
(10, 11540, 17, NULL, '2019-09-08'),
(10, 11540, 18, NULL, '2019-09-08'),
(10, 11540, 19, NULL, '2019-09-08'),
(10, 11540, 20, NULL, '2019-09-08'),
(10, 11540, 21, NULL, '2019-09-08'),
(10, 11540, 22, NULL, '2019-09-08'),
(10, 11540, 23, NULL, '2019-09-08'),
(10, 11540, 24, NULL, '2019-09-08'),
(10, 11540, 25, NULL, '2019-09-08'),
(10, 11540, 26, NULL, '2019-09-08'),
(10, 11540, 27, NULL, '2019-09-08'),
(10, 11540, 28, NULL, '2019-09-08'),
(10, 11540, 29, NULL, '2019-09-08'),
(10, 11540, 30, NULL, '2019-09-08'),
(10, 11540, 31, NULL, '2019-09-08'),
(10, 11540, 32, NULL, '2019-09-08'),
(64, 11750, 18, NULL, '2019-09-06'),
(64, 11750, 19, NULL, '2019-09-06'),
(64, 11750, 20, NULL, '2019-09-06'),
(64, 11750, 21, NULL, '2019-09-06'),
(64, 11750, 22, NULL, '2019-09-06'),
(64, 11750, 23, NULL, '2019-09-06'),
(64, 11750, 24, NULL, '2019-09-06'),
(64, 11750, 25, NULL, '2019-09-06'),
(64, 11750, 26, NULL, '2019-09-06'),
(64, 11750, 27, NULL, '2019-09-06'),
(64, 11750, 28, NULL, '2019-09-06'),
(64, 11750, 29, NULL, '2019-09-06'),
(64, 11750, 30, NULL, '2019-09-06'),
(64, 11750, 31, NULL, '2019-09-06'),
(64, 11750, 32, NULL, '2019-09-06'),
(64, 11750, 33, NULL, '2019-09-06'),
(64, 11750, 34, NULL, '2019-09-06'),
(64, 11750, 35, NULL, '2019-09-06'),
(64, 11750, 36, NULL, '2019-09-06'),
(64, 11750, 37, NULL, '2019-09-06'),
(64, 11750, 38, NULL, '2019-09-06'),'2019-09-07'),

(75, 21830, 11, NULL, '2019-09-07'),
(75, 21830, 12, NULL, '2019-09-07'),
(75, 21830, 13, NULL, '2019-09-07'),
(75, 21830, 14, NULL, '2019-09-07'),
(75, 21830, 15, NULL, '2019-09-07'),
(75, 21830, 16, NULL, '2019-09-07'),
(78, 12100, 18, NULL, '2019-09-07'),
(78, 12100, 19, NULL, '2019-09-07'),
(78, 12100, 20, NULL, '2019-09-07'),
(78, 12100, 21, NULL, '2019-09-07'),
(78, 12100, 22, NULL, '2019-09-07'),
(78, 12100, 23, NULL, '2019-09-07'),
(78, 12100, 24, NULL, '2019-09-07'),
(78, 12100, 25, NULL, '2019-09-07'),
(78, 12100, 26, NULL, '2019-09-07'),
(78, 12100, 27, NULL, '2019-09-07'),
(78, 12100, 28, NULL, '2019-09-07'),
(78, 12100, 29, NULL, '2019-09-07'),
(78, 12100, 30, NULL, '2019-09-07'),
(78, 12100, 31, NULL, '2019-09-07'),
(78, 12100, 32, NULL, '2019-09-07'),
(78, 12100, 33, NULL, '2019-09-07');
INSERT INTO `seat_matrix` (`BID`, `RID`, `SeatNo`, `Passenger`, `BusDate`) VALUES
(78, 12100, 34, NULL, '2019-09-07'),
(78, 12100, 35, NULL, '2019-09-07'),
(78, 12100, 36, NULL, '2019-09-07'),
(78, 12100, 37, NULL, '2019-09-07'),
(78, 12100, 38, NULL, '2019-09-07'),
(78, 12100, 39, NULL, '2019-09-07'),
(78, 12100, 40, NULL, '2019-09-07'),
(78, 12100, 41, NULL, '2019-09-07'),
(78, 12100, 42, NULL, '2019-09-07'),
(78, 12100, 43, NULL, '2019-09-07'),
(78, 12100, 44, NULL, '2019-09-07'),
(78, 12100, 45, NULL, '2019-09-07'),
(78, 12100, 46, NULL, '2019-09-07'),
(78, 12100, 47, NULL, '2019-09-07'),
(78, 12100, 48, NULL, '2019-09-07'),
(78, 12100, 49, NULL, '2019-09-07'),
(78, 12100, 50, NULL, '2019-09-07'),
(79, 22140, 1, NULL, '2019-09-07'),
(79, 22140, 2, NULL, '2019-09-07'),
(79, 22140, 3, NULL, '2019-09-07'),
(79, 22140, 4, NULL, '2019-09-07'),
(79, 22140, 5, NULL, '2019-09-07'),
(79, 22140, 6, NULL, '2019-09-07'),
(

CREATE TABLE IF NOT EXISTS `staff` (
  `EID` int(11) NOT NULL,
  `EName` varchar(30) DEFAULT NULL,
  `BloodG` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `staff` (`EID`, `EName`, `BloodG`) VALUES
(204, 'nirmal', 'A+'),
(503, 'kiran kumar', 'A+'),
(1001, 'shyam', 'AB-'),
(1005, 'Ramkishan', 'B+'),
(1021, 'John Doe', 'A+');



CREATE TABLE IF NOT EXISTS `stops` (
  `StopName` varchar(20) NOT NULL,
  `StopType` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `stops` (`StopName`, `StopType`) VALUES
('CIMT', 'Institute'),
('CSIT', 'Institute'),
('GATE NO.2', 'Institute'),
('Nescafe (Hall 1)', 'Institute'),
('NIT Raipur', 'Institute'),
('PG Hostel', 'Institute'),
('Phool Chowk', 'City'),
('Powerhouse', 'City'),
('Railway Station', 'City'),
('RIng Road', 'City');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `RollNo` int(11) NOT NULL,
  `SName` varchar(30) DEFAULT NULL,
  `Batch` year(4) NOT NULL,
  `Branch` varchar(5) NOT NULL,
  `BloodG` varchar(5) DEFAULT NULL

INSERT INTO `student` (`RollNo`, `SName`, `Batch`, `Branch`, `BloodG`) VALUES
(102, 'karan', 2019, 'CSE', 'B+'),
(105, 'naresh', 2019, 'CSE', 'B-'),
(5021, 'Shridevi', 0000, 'ME', 'A-'),
(2017324, 'Kaushal Sharma', 2018, 'CSE', 'A+'),
(2017333, 'Ajwad Shaikh', 2017, 'CSE', 'B+');


ALTER TABLE `bg`
 ADD PRIMARY KEY (`BloodG`);

ALTER TABLE `bus_instances`
 ADD PRIMARY KEY (`BID`), ADD KEY `RID` (`RID`), ADD KEY `Capacity` (`Seats_Left`), ADD KEY `DepTime` (`DepTime`);


ALTER TABLE `department`
 ADD PRIMARY KEY (`DCode`);


ALTER TABLE `faculty`
 ADD PRIMARY KEY (`FID`), ADD KEY `BloodG` (`BloodG`), ADD KEY `Dept` (`Dept`);


ALTER TABLE `guest`
 ADD PRIMARY KEY (`GID`), ADD KEY `BloodG` (`BloodG`), ADD KEY `HostID` (`HostID`), ADD KEY `HostType` (`HostType`);


ALTER TABLE `passenger`
 ADD PRIMARY KEY (`ID`,`Type`), ADD KEY `Type` (`Type`);


ALTER TABLE `p_type`
 ADD PRIMARY KEY (`type`);

ALTER TABLE `routes`
 ADD PRIMARY KEY (`RID`), ADD KEY `Src` (`Src`), ADD KEY `Dst` (`Dst`), ADD KEY `d_time` (`DTime`), ADD KEY `cap` (`Capacity`), ADD KEY `STime_index` (`STime`);


ALTER TABLE `seat_matrix`
 ADD PRIMARY KEY (`BID`,`RID`,`SeatNo`), ADD KEY `RID` (`RID`), ADD KEY `Passenger` (`Passenger`);

ALTER TABLE `staff`
 ADD PRIMARY KEY (`EID`), ADD KEY `BloodG` (`BloodG`);


ALTER TABLE `stops`
 ADD PRIMARY KEY (`StopName`);


ALTER TABLE `student`
 ADD PRIMARY KEY (`RollNo`), ADD KEY `Branch` (`Branch`), ADD KEY `BloodG` (`BloodG`);


ALTER TABLE `seat_matrix`
ADD CONSTRAINT `seat_matrix_ibfk_1` FOREIGN KEY (`RID`) REFERENCES `routes` (`RID`),
ADD CONSTRAINT `seat_matrix_ibfk_2` FOREIGN KEY (`Passenger`) REFERENCES `passenger` (`ID`);

