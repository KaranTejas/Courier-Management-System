DROP DATABASE IF EXISTS courier_management_system;
CREATE DATABASE courier_management_system;
USE courier_management_system;

CREATE TABLE `courier_distribution_centre` (
  `centre_id` int PRIMARY KEY AUTO_INCREMENT ,
  `centre_name` varchar(25) NOT NULL,
  `centre_address` longtext NOT NULL,
  `centre_pincode` int NOT NULL,
  `centre_latitude` float8 NOT NULL,
  `centre_longitude` float8 NOT NULL
  
);

CREATE TABLE `user` (
  `user_id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email_id` varchar(50),
  `contact_num` bigint NOT NULL,
  `user_role` int  NOT NULL,
  `first_name` varchar(25)  NOT NULL,
  `middle_name` varchar(25),
  `last_name` varchar(25) NOT NULL,
  `centre_id` int NOT NULL,
  FOREIGN KEY (`centre_id`) REFERENCES `courier_distribution_centre` (`centre_id`) ON DELETE CASCADE ON UPDATE CASCADE
  
);

CREATE TABLE `user_address` (
  `user_id` int,
  `address` VARCHAR(255) NOT NULL,
  PRIMARY KEY ( `user_id` , `address`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
  
);

CREATE TABLE `recepient` (
  `email_id` varchar(50),
  `contact_num` bigint NOT NULL,
  `address` longtext NOT NULL,
  `tracking_id` int NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `middle_name` varchar(25),
  `last_name` varchar(25) NOT NULL,
  PRIMARY KEY (`email_id`)
);

CREATE TABLE `courier` (
  `order_num` int PRIMARY KEY AUTO_INCREMENT,
  `weight` int NOT NULL,
  `type_of_service` int NOT NULL, -- (handling, speed of delivery) = 1-normal,normal , 2-normal,speedpost , 3-fragile,normal , 4-fragile,speedpost
  `type_of_transaction` int NOT NULL, -- 1-Online,2-cash , 
  `order_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `order_cost` int NOT NULL,
  `order_status` int NOT NULL, -- (payment status, delivery status) = 1-paid,delivered , 2-paid,undelivered , 3-unpaid,undelivered
  `return` bool NOT NULL,
  `employee_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `centre_id` int NOT NULL,
  `recepient_email` varchar(50) NOT NULL,
  FOREIGN KEY (`centre_id`) REFERENCES `courier_distribution_centre` (`centre_id`) ON DELETE CASCADE,
  FOREIGN KEY (`employee_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`recepient_email`) REFERENCES `recepient` (`email_id`) ON DELETE CASCADE,
  FOREIGN KEY (`customer_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
);
INSERT INTO `courier_management_system`.`courier_distribution_centre` (`centre_id`, `centre_name`, `centre_address`, `centre_pincode`, `centre_latitude`, `centre_longitude`) VALUES ('1', 'Mumbai', '234/10,Kapoor towers, Mumbai', '400001', '19.0759', '72.8773');
INSERT INTO `courier_management_system`.`courier_distribution_centre` (`centre_id`, `centre_name`, `centre_address`, `centre_pincode`, `centre_latitude`, `centre_longitude`) VALUES ('2', 'Delhi', 'Dr No. 189 Ayur Vigyan Nagar, New Delhi', '110001', '28.7041', '77.1025');
INSERT INTO `courier_management_system`.`courier_distribution_centre` (`centre_id`, `centre_name`, `centre_address`, `centre_pincode`, `centre_latitude`, `centre_longitude`) VALUES ('3', 'Bangalore', 'HIG - 77 1st Block 1st Cross, Rammurthy nagar, Bangalore', '560016', '12.9791', '77.5912');
INSERT INTO `courier_management_system`.`courier_distribution_centre` (`centre_id`, `centre_name`, `centre_address`, `centre_pincode`, `centre_latitude`, `centre_longitude`) VALUES ('4', 'Hyderabad', 'HIG - 30 KPHB Colony, Kukatpally, Hyderabad', '500085', '17.3617', '78.4751');
INSERT INTO `courier_management_system`.`courier_distribution_centre` (`centre_id`, `centre_name`, `centre_address`, `centre_pincode`, `centre_latitude`, `centre_longitude`) VALUES ('5', 'Mangalore', 'Lohith Nagar, Derebail, Mangaluru', '575001', '12.9141', '74.8560');
INSERT INTO `courier_management_system`.`courier_distribution_centre` (`centre_id`, `centre_name`, `centre_address`, `centre_pincode`, `centre_latitude`, `centre_longitude`) VALUES ('6', 'Dhanbad', '32/21 Gandhinagar, Dhanbad', '826001', '23.7998', '86.4305');
INSERT INTO `courier_management_system`.`courier_distribution_centre` (`centre_id`, `centre_name`, `centre_address`, `centre_pincode`, `centre_latitude`, `centre_longitude`) VALUES ('7', 'Kanpur', 'Dr No 18 Patel Street, Kanpur, UP', '208001', '26.4499', '80.3318');INSERT INTO `courier_management_system`.`courier_distribution_centre` (`centre_id`, `centre_name`, `centre_address`, `centre_pincode`, `centre_latitude`, `centre_longitude`) VALUES ('8', 'Bikaner', '21/15 Sardar Nagar, Bikaner', '334001', '28.0229', '73.3119');

INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('1', 'LBJ', 'LBJ123', 'james@gmail.com', '8234567890', '1', 'Lebron', 'Raymone', 'James' ,'1');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('2', 'Kobe', 'KB123', 'kb23@gmail.com', '9234567992', '1', 'Kobe', 'Bean', 'Bryant' ,'2');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('3', 'Dame', 'DL44', 'dl44@gmail.com', '9784894318', '1', 'Damian', 'Lillard', '3');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('4', 'Steph', 'Steph30', 'sc30@gmail.com', '7423424211', '1', 'Stephen', 'Curry', '4');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('5', 'SteveK', 'SK123', 'steve@gmail.com', '8242423422', '1', 'Steve', 'Kerr', '5');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('6', 'Scotty', 'ST132', 'scotty@gmail.com', '8768322436', '1', 'Scotty', 'Pippen', '6');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('7', 'Jammo', 'jammo24', 'jammo@gmail.com', '8423245563', '1', 'Ja', 'Morrant', '7');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('8', 'Johm', 'JN24', 'john@gmail.com', '9232423462', '1', 'John', 'Morrison', 'Wick', '8');

INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('9', 'Ron', 'rn23', 'ron@gmail.com', '8434252432', '2', 'Ron', 'Telly', '1');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('10', 'Holly', 'hd26', 'holly@gmail.com', '8436356334', '2', 'Holly', 'Marshal', '1');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('11', 'Selena', 'SL54', 'sele@gmail.con', '8342340234', '2', 'Selena', 'Abbot', '2');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('12', 'Ashwin', 'AS234', 'ashwin@gmail.com', '9534345342', '2', 'Ashwin', 'Rao', '2');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('13', 'Achintya', 'AY343', 'achintya@gmail.com', '9453434227', '2', 'Achintya ', 'K', 'N', '3');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('14', 'Lane', 'LL234', 'lane@gmail.com', '6233584234', '2', 'Lane', 'Lucas', '3');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('15', 'Pauly', 'pl242', 'pauly@gmail.com', '6925234223', '2', 'Pauly', 'Clem', '4');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('16', 'Sady', 'sd2357', 'sady@gmail.com', '7457475651', '2', 'Sady ', 'Warren', '4');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('17', 'Donald', 'DT54', 'donald@gmail.com', '9435324166', '2', 'Donald', 'J', 'Trump', '5');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('18', 'Nithin', 'LN363', 'nithin@gmail.com', '7282422562', '2', 'Nithin', 'L', 'N', '5');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('19', 'Pranit', 'PP3535', 'pranit@gmail.com', '9242242168', '2', 'Pranit', 'Malagi', '6');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('20', 'Sameer', 'SM346', 'sameer@gmail.com', '6456224223', '2', 'Sameer', 'Mujawar', '6');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('21', 'Grant', 'gp3242', 'grant@gmail.com', '9342155632', '2', 'Grant', 'Pierce', '7');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('22', 'Clara', 'cd633', 'clara@gmail.com', '9453343452', '2', 'Clara', 'Doyle', '7');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('23', 'Sally', 'ss945', 'sally@gmail.com', '9635224211', '2', 'Sally', 'Faye', 'Hunter', '8');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('24', 'Shawn', 'sh964', 'shawn@gmail.com', '6546544633', '2', 'Shawn', 'Carroll', '8');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('25', 'Karan', 'kt623', 'karan@gmail.com', '9545422432', '3', 'Karan', 'J', 'Tejas', '1');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('26', 'Harsha', 'hw324', 'harsha@gmail.com', '8353527321', '3', 'Harshawardhan', 'D', '2');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('27', 'Sujay', 'sc123', 'sujay@gmail.com', '9352234221', '3', 'Sujay', 'Chuttar', '4');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('28', 'Aditya', 'ad249', 'adity@gmail.com', '6732492432', '3', 'Bhaskar', 'Aditya', 'Sriram', '5');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `middle_name`, `last_name`, `centre_id`) VALUES ('29', 'Shashank', 'SP242', 'shashank@gmail.com', '9245242262', '3', 'Shashank', 'Shekar', 'Panda', '7');
INSERT INTO `courier_management_system`.`user` (`user_id`, `username`, `password`, `email_id`, `contact_num`, `user_role`, `first_name`, `last_name`, `centre_id`) VALUES ('30', 'Albert', 'af254', 'albert@gmail.com', '9234553831', '3', 'Albert', 'Freeman', '8');

INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('1', 'AAAAAAA, Mumbai');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('2', 'CCCCCCC, Delhi');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('3', 'BBBBBBBB, Bangalore');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('4', 'DDDDDD, Hyderabad');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('5', 'XXXXXXXX, Mangalore');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('6', 'TTTTTTTT, Dhanbad');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('7', 'GGGGGGG, Kanpur');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('8', 'IIIIIIIIII, Bikaner');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('9', 'OOOOOO, Mumbai');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('10', 'EEEEEEE, Mumbai');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('11', 'EUUUUU, Delhi');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('12', 'SSSSSSDFF, Delhi');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('13', 'YYYYYSS, Bangalore');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('14', 'HHHHHHHFF, Bangalore');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('15', 'HHHHHHWW, Hyderabad');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('16', 'UUUUUUURRR, Hyderabad');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('17', 'JJJJJJRYYY, Mangalore');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('18', 'RRRRRRYY, Mangalore');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('19', 'PPPPPPPPPRR, Dhanbad');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('20', 'WWWWWWE, Dhanbad');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('21', 'NNNNNNNNEE, Kanpur');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('22', 'MMMMMMMMF, Kanpur');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('23', 'LLLLGGGGG, Bikaner');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('24', 'UUUUUUWW, Bikaner');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('25', 'UUUUUUWW, Mumbai');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('26', 'YUYUYUYUYU, Delhi');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('27', 'GGGGGGGGG, Hyderabad');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('28', 'AAAAAAAA, Mangalore');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('29', 'KKKKKKKK, Kanpur');
INSERT INTO `courier_management_system`.`user_address` (`user_id`, `address`) VALUES ('30', 'DDDDDDD, Bikaner');

INSERT INTO `courier_management_system`.`recepient` (`email_id`, `contact_num`, `address`, `tracking_id`, `first_name`, `middle_name`, `last_name`) VALUES ('patricia@gmail.com', '4589632158', 'sdvdsfq, Bangalore', '1', 'Patricia', 'Ava', 'Hill');
INSERT INTO `courier_management_system`.`recepient` (`email_id`, `contact_num`, `address`, `tracking_id`, `first_name`, `last_name`) VALUES ('sigmund@gmail.com', '4596328715', 'srghaae, Mumbai', '2', 'Sigmund', 'Norman');
INSERT INTO `courier_management_system`.`recepient` (`email_id`, `contact_num`, `address`, `tracking_id`, `first_name`, `middle_name`, `last_name`) VALUES ('gavin@gmail.com', '7856231498', 'sgdasafs, Bikaner', '3', 'Gavin', 'Tree', 'Houle');
INSERT INTO `courier_management_system`.`recepient` (`email_id`, `contact_num`, `address`, `tracking_id`, `first_name`, `last_name`) VALUES ('lark@gmail.com', '2345789612', 'dmgkdfg, Kanpur', '4', 'Lark', 'Frost');
INSERT INTO `courier_management_system`.`recepient` (`email_id`, `contact_num`, `address`, `tracking_id`, `first_name`, `last_name`) VALUES ('pearl@gmail.com', '4556897812', 'kggchd, Mangalore', '5', 'Pearl', 'Vega');
INSERT INTO `courier_management_system`.`recepient` (`email_id`, `contact_num`, `address`, `tracking_id`, `first_name`, `middle_name`, `last_name`) VALUES ('neil@gmail.com', '7356891245', 'kgkgjgc, Hyderabad', '6', 'Neil', 'Aiken', 'Maxwell');

INSERT INTO `courier_management_system`.`courier` (`order_num`, `weight`, `type_of_service`, `type_of_transaction`, `order_date`, `delivery_date`, `order_cost`, `order_status`, `return`, `employee_id`, `customer_id`, `centre_id`, `recepient_email`) VALUES ('1', '20', '1', '1', '2021-03-11', '2021-03-21', '1', '1', '0', '9', '1', '1', 'patricia@gmail.com');
INSERT INTO `courier_management_system`.`courier` (`order_num`, `weight`, `type_of_service`, `type_of_transaction`, `order_date`, `delivery_date`, `order_cost`, `order_status`, `return`, `employee_id`, `customer_id`, `centre_id`, `recepient_email`) VALUES ('2', '40', '1', '1', '2021-03-15', '2021-03-25', '1', '1', '0', '10', '2', '1', 'sigmund@gmail.com');
INSERT INTO `courier_management_system`.`courier` (`order_num`, `weight`, `type_of_service`, `type_of_transaction`, `order_date`, `delivery_date`, `order_cost`, `order_status`, `return`, `employee_id`, `customer_id`, `centre_id`, `recepient_email`) VALUES ('3', '56', '2', '1', '2021-03-11', '2021-03-16', '1', '2', '0', '11', '3', '2', 'gavin@gmail.com');
INSERT INTO `courier_management_system`.`courier` (`order_num`, `weight`, `type_of_service`, `type_of_transaction`, `order_date`, `delivery_date`, `order_cost`, `order_status`, `return`, `employee_id`, `customer_id`, `centre_id`, `recepient_email`) VALUES ('4', '78', '3', '1', '2021-03-14', '2021-03-24', '1', '2', '0', '12', '4', '5', 'lark@gmail.com');
INSERT INTO `courier_management_system`.`courier` (`order_num`, `weight`, `type_of_service`, `type_of_transaction`, `order_date`, `delivery_date`, `order_cost`, `order_status`, `return`, `employee_id`, `customer_id`, `centre_id`, `recepient_email`) VALUES ('5', '59', '4', '1', '2021-03-11', '2021-03-16', '1', '1', '0', '13', '5', '3', 'pearl@gmail.com');
INSERT INTO `courier_management_system`.`courier` (`order_num`, `weight`, `type_of_service`, `type_of_transaction`, `order_date`, `delivery_date`, `order_cost`, `order_status`, `return`, `employee_id`, `customer_id`, `centre_id`, `recepient_email`) VALUES ('6', '165', '2', '2', '2021-03-13', '2021-03-18', '1', '3', '1', '14', '6', '7', 'neil@gmail.com');
