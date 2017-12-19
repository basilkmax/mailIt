-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.19-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema basil_db
--

CREATE DATABASE IF NOT EXISTS basil_db;
USE basil_db;

--
-- Definition of table `admin_tb`
--

DROP TABLE IF EXISTS `admin_tb`;
CREATE TABLE `admin_tb` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_tb`
--

/*!40000 ALTER TABLE `admin_tb` DISABLE KEYS */;
INSERT INTO `admin_tb` (`username`,`password`) VALUES 
 ('admin','admin');
/*!40000 ALTER TABLE `admin_tb` ENABLE KEYS */;


--
-- Definition of table `age_tb`
--

DROP TABLE IF EXISTS `age_tb`;
CREATE TABLE `age_tb` (
  `factor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `min_age` varchar(45) NOT NULL,
  `max_age` varchar(45) NOT NULL,
  `factor_name` varchar(45) NOT NULL,
  PRIMARY KEY (`factor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `age_tb`
--

/*!40000 ALTER TABLE `age_tb` DISABLE KEYS */;
INSERT INTO `age_tb` (`factor_id`,`min_age`,`max_age`,`factor_name`) VALUES 
 (1,'10','30','AgeFactor1'),
 (2,'30','40','AgeFactor2'),
 (3,'10','35','AgeFactor1.1');
/*!40000 ALTER TABLE `age_tb` ENABLE KEYS */;


--
-- Definition of table `blacklist_tb`
--

DROP TABLE IF EXISTS `blacklist_tb`;
CREATE TABLE `blacklist_tb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` varchar(45) NOT NULL,
  `to_id` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blacklist_tb`
--

/*!40000 ALTER TABLE `blacklist_tb` DISABLE KEYS */;
INSERT INTO `blacklist_tb` (`id`,`from_id`,`to_id`,`date`) VALUES 
 (2,'sanju@g.com','basil@gg.com','2017-11-17'),
 (5,'sanju@g.com','basil@gg.com','2017-11-17'),
 (6,'sanju@g.com','basil@gg.com','2017-11-17'),
 (7,'sanju@g.com','basil@gg.com','2017-11-17'),
 (8,'arvind@g.com','basil@gg.com','2017-11-17'),
 (9,'sanju@g.com','basil@gg.com','2017-11-17'),
 (10,'arvind@g.com','basil@gg.com','2017-11-17'),
 (11,'arvind@g.com','basil@gg.com','2017-11-17'),
 (12,'arvind@g.com','basil@gg.com','2017-11-17'),
 (13,'arvind@g.com','basil@gg.com','2017-11-17'),
 (14,'sanju@g.com','basil@gg.com','2017-11-17'),
 (15,'abhi@gmail.com','basil@gg.com','2017-11-13'),
 (16,'arvind@g.com','basil@gg.com','2017-11-20'),
 (17,'sanju@g.com','basil@gg.com','2017-11-20'),
 (18,'arvind@g.com','basil@gg.com','2017-11-20'),
 (19,'sanju@g.com','basil@gg.com','2017-11-20'),
 (20,'sanju@g.com','basil@gg.com','2017-11-20'),
 (21,'arvind@g.com','basil@gg.com','2017-11-20'),
 (22,'amjad@gmail.com','basil@gg.com','2017-11-21'),
 (23,'amjad@gmail.com','basil@gg.com','2017-11-21'),
 (24,'basil@gg.com','abhi@gmail.com','2017-11-16'),
 (25,'amjad@gmail.com','basil@gg.com','2017-11-21'),
 (26,'arvind@g.com','basil@gg.com','2017-11-21');
/*!40000 ALTER TABLE `blacklist_tb` ENABLE KEYS */;


--
-- Definition of table `contacts_tb`
--

DROP TABLE IF EXISTS `contacts_tb`;
CREATE TABLE `contacts_tb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `mail_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts_tb`
--

/*!40000 ALTER TABLE `contacts_tb` DISABLE KEYS */;
INSERT INTO `contacts_tb` (`id`,`username`,`mail_id`,`name`,`address`,`phone`,`status`) VALUES 
 (1,'basilk','sanju@g.com','Sanju','kannur','65146851698','WHITELISTED'),
 (2,'basilk','arvind@g.com','Arvind','talap','5475875','BLACKLISTED'),
 (3,'basilk','amjad@gmail.com','AMJAD','VARAM','6565666','BLACKLISTED'),
 (4,'abhi','sam@g.com','SAM SUNDER','kausb','36735624532','WHITELISTED');
/*!40000 ALTER TABLE `contacts_tb` ENABLE KEYS */;


--
-- Definition of table `country_tb`
--

DROP TABLE IF EXISTS `country_tb`;
CREATE TABLE `country_tb` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cname` varchar(45) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_tb`
--

/*!40000 ALTER TABLE `country_tb` DISABLE KEYS */;
INSERT INTO `country_tb` (`cid`,`cname`) VALUES 
 (1,'India'),
 (2,'Pakistan'),
 (3,'SriLanka'),
 (4,'China');
/*!40000 ALTER TABLE `country_tb` ENABLE KEYS */;


--
-- Definition of table `feedback_tb`
--

DROP TABLE IF EXISTS `feedback_tb`;
CREATE TABLE `feedback_tb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback_tb`
--

/*!40000 ALTER TABLE `feedback_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_tb` ENABLE KEYS */;


--
-- Definition of table `feedbackreply_tb`
--

DROP TABLE IF EXISTS `feedbackreply_tb`;
CREATE TABLE `feedbackreply_tb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feedback_id` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `about` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbackreply_tb`
--

/*!40000 ALTER TABLE `feedbackreply_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbackreply_tb` ENABLE KEYS */;


--
-- Definition of table `fs`
--

DROP TABLE IF EXISTS `fs`;
CREATE TABLE `fs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `k1` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fs`
--

/*!40000 ALTER TABLE `fs` DISABLE KEYS */;
INSERT INTO `fs` (`id`,`username`,`ip`,`k1`) VALUES 
 (1,'abhi','DESKTOP-30F4NH7/192.168.61.1',1),
 (7,'basilk','DESKTOP-30F4NH7/192.168.61.1',0);
/*!40000 ALTER TABLE `fs` ENABLE KEYS */;


--
-- Definition of table `ft`
--

DROP TABLE IF EXISTS `ft`;
CREATE TABLE `ft` (
  `username` varchar(45) NOT NULL,
  `k2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ft`
--

/*!40000 ALTER TABLE `ft` DISABLE KEYS */;
INSERT INTO `ft` (`username`,`k2`) VALUES 
 ('abhi',2),
 ('basilk',15);
/*!40000 ALTER TABLE `ft` ENABLE KEYS */;


--
-- Definition of table `hobby_tb`
--

DROP TABLE IF EXISTS `hobby_tb`;
CREATE TABLE `hobby_tb` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `hobby_id` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hobby_tb`
--

/*!40000 ALTER TABLE `hobby_tb` DISABLE KEYS */;
INSERT INTO `hobby_tb` (`user_id`,`username`,`hobby_id`) VALUES 
 (3,'basilk','1'),
 (4,'basilk','2'),
 (5,'basilk','3'),
 (6,'abhi','2'),
 (7,'abhi','3');
/*!40000 ALTER TABLE `hobby_tb` ENABLE KEYS */;


--
-- Definition of table `hobbydetails_tb`
--

DROP TABLE IF EXISTS `hobbydetails_tb`;
CREATE TABLE `hobbydetails_tb` (
  `hobby_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hobby_name` varchar(45) NOT NULL,
  PRIMARY KEY (`hobby_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hobbydetails_tb`
--

/*!40000 ALTER TABLE `hobbydetails_tb` DISABLE KEYS */;
INSERT INTO `hobbydetails_tb` (`hobby_id`,`hobby_name`) VALUES 
 (1,'Reading '),
 (2,'Singing'),
 (3,'Danciing');
/*!40000 ALTER TABLE `hobbydetails_tb` ENABLE KEYS */;


--
-- Definition of table `hobbyfactor_tb`
--

DROP TABLE IF EXISTS `hobbyfactor_tb`;
CREATE TABLE `hobbyfactor_tb` (
  `factor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hobby_id` int(10) unsigned NOT NULL,
  `factor_name` varchar(45) NOT NULL,
  PRIMARY KEY (`factor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hobbyfactor_tb`
--

/*!40000 ALTER TABLE `hobbyfactor_tb` DISABLE KEYS */;
INSERT INTO `hobbyfactor_tb` (`factor_id`,`hobby_id`,`factor_name`) VALUES 
 (9,1,'Novel'),
 (10,2,'Classical'),
 (11,3,'Break dance'),
 (12,2,'Western singing'),
 (13,1,'Comics');
/*!40000 ALTER TABLE `hobbyfactor_tb` ENABLE KEYS */;


--
-- Definition of table `location_tb`
--

DROP TABLE IF EXISTS `location_tb`;
CREATE TABLE `location_tb` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned NOT NULL,
  `p_name` varchar(45) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location_tb`
--

/*!40000 ALTER TABLE `location_tb` DISABLE KEYS */;
INSERT INTO `location_tb` (`pid`,`sid`,`p_name`) VALUES 
 (1,2,'Kannur'),
 (2,2,'Kozhikode'),
 (3,2,'Kasargod'),
 (4,1,'South Delhi'),
 (5,1,'JantarMantar'),
 (6,4,'Columbia');
/*!40000 ALTER TABLE `location_tb` ENABLE KEYS */;


--
-- Definition of table `log_tb`
--

DROP TABLE IF EXISTS `log_tb`;
CREATE TABLE `log_tb` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `security_question` varchar(45) NOT NULL,
  `answer` varchar(45) NOT NULL,
  `alternate_mailid` varchar(45) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_tb`
--

/*!40000 ALTER TABLE `log_tb` DISABLE KEYS */;
INSERT INTO `log_tb` (`log_id`,`username`,`password`,`security_question`,`answer`,`alternate_mailid`) VALUES 
 (11,'basilk','123','Your License number','5a84sd','basil@gg.com'),
 (12,'abhi','123','Your Grandfathers name','ahmed','abhi@gmail.com');
/*!40000 ALTER TABLE `log_tb` ENABLE KEYS */;


--
-- Definition of table `register_tb`
--

DROP TABLE IF EXISTS `register_tb`;
CREATE TABLE `register_tb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 PACK_KEYS=1;

--
-- Dumping data for table `register_tb`
--

/*!40000 ALTER TABLE `register_tb` DISABLE KEYS */;
INSERT INTO `register_tb` (`id`,`name`,`age`,`gender`,`username`,`country`,`state`,`location`) VALUES 
 (7,'BASIL K','22','Male','basilk','India','Delhi','South Delhi'),
 (8,'abhi','34','Female','abhi','India','Kerala','Kozhikode');
/*!40000 ALTER TABLE `register_tb` ENABLE KEYS */;


--
-- Definition of table `season_tb`
--

DROP TABLE IF EXISTS `season_tb`;
CREATE TABLE `season_tb` (
  `season_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season_name` varchar(45) NOT NULL,
  PRIMARY KEY (`season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `season_tb`
--

/*!40000 ALTER TABLE `season_tb` DISABLE KEYS */;
INSERT INTO `season_tb` (`season_id`,`season_name`) VALUES 
 (1,'Winter'),
 (2,'Summer'),
 (3,'Autumn'),
 (4,'Spring'),
 (5,'Super');
/*!40000 ALTER TABLE `season_tb` ENABLE KEYS */;


--
-- Definition of table `seasoncountry_tb`
--

DROP TABLE IF EXISTS `seasoncountry_tb`;
CREATE TABLE `seasoncountry_tb` (
  `seacou_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(10) NOT NULL,
  `state_id` varchar(10) NOT NULL,
  `season_id` varchar(10) NOT NULL,
  `month_id` varchar(10) NOT NULL,
  PRIMARY KEY (`seacou_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seasoncountry_tb`
--

/*!40000 ALTER TABLE `seasoncountry_tb` DISABLE KEYS */;
INSERT INTO `seasoncountry_tb` (`seacou_ID`,`country_id`,`state_id`,`season_id`,`month_id`) VALUES 
 (1,'1','1','1','11'),
 (2,'1','2','2','11'),
 (3,'3','4','2','8');
/*!40000 ALTER TABLE `seasoncountry_tb` ENABLE KEYS */;


--
-- Definition of table `seasonfactor_tb`
--

DROP TABLE IF EXISTS `seasonfactor_tb`;
CREATE TABLE `seasonfactor_tb` (
  `factor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season_id` varchar(45) NOT NULL,
  `factor_name` varchar(45) NOT NULL,
  PRIMARY KEY (`factor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seasonfactor_tb`
--

/*!40000 ALTER TABLE `seasonfactor_tb` DISABLE KEYS */;
INSERT INTO `seasonfactor_tb` (`factor_id`,`season_id`,`factor_name`) VALUES 
 (1,'1','WinterFactor1'),
 (2,'1','WinterFactor2'),
 (3,'1','WinterFactor3'),
 (4,'1','winterfactor4'),
 (5,'2','summer factor1'),
 (6,'2','summer factor2'),
 (7,'3','autumn factor1'),
 (8,'3','autmn factor2');
/*!40000 ALTER TABLE `seasonfactor_tb` ENABLE KEYS */;


--
-- Definition of table `state_tb`
--

DROP TABLE IF EXISTS `state_tb`;
CREATE TABLE `state_tb` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL,
  `sname` varchar(45) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state_tb`
--

/*!40000 ALTER TABLE `state_tb` DISABLE KEYS */;
INSERT INTO `state_tb` (`sid`,`cid`,`sname`) VALUES 
 (1,1,'Delhi'),
 (2,1,'Kerala'),
 (3,2,'Karachi'),
 (4,3,'Dhaka'),
 (5,4,'Beijing'),
 (6,4,'XuimJaung');
/*!40000 ALTER TABLE `state_tb` ENABLE KEYS */;


--
-- Definition of table `tempdata_tb`
--

DROP TABLE IF EXISTS `tempdata_tb`;
CREATE TABLE `tempdata_tb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` varchar(45) NOT NULL,
  `to_id` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `message` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `viewstatus` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tempdata_tb`
--

/*!40000 ALTER TABLE `tempdata_tb` DISABLE KEYS */;
INSERT INTO `tempdata_tb` (`id`,`from_id`,`to_id`,`subject`,`message`,`date`,`status`,`viewstatus`) VALUES 
 (26,'basil@gg.com','abhi@gmail.com','asd','Classical','2017-11-13','FILTERED','SEND'),
 (27,'abhi@gmail.com','basil@gg.com','hey','Factor1 Novel','2017-11-13','TRASH','VIEWED'),
 (28,'abhi@gmail.com','basil@gg.com','reply','as Factor1 asdfd','2017-11-13','FILTERED','VIEWED'),
 (29,'abhi@gmail.com','basil@gg.com','forward','fprwardd Factor2','2017-11-13','TRASH','SEND'),
 (30,'basil@gg.com','abhi@gmail.com','reply1','asd Factor2 asdasf Novel','2017-11-13','FILTERED','SEND'),
 (31,'abhi@gmail.com','basil@gg.com','reply2','relpy2 Factor3','2017-11-13','TRASH','SEND'),
 (35,'basil@gg.com','abhi@gg.com','r3','Novel','2017-11-13','PENDING','SEND'),
 (36,'abhi@gmail.com','basil@gg.com','sfsa','Classical heye','2017-11-13','FILTERED','VIEWED'),
 (39,'basil@gg.com','abhi@gmail.com','trail1','Break dance','2017-11-16','FILTERED','SEND'),
 (40,'abhi@gmail.com','basil@gg.com','FIrst Standard Message SUbject','Subect is 1.Factor1','2017-11-16','TRASH','VIEWED'),
 (41,'basil@gg.com','abhi@gmail.com','Standard reply from Basil','Reply via Break dance','2017-11-16','FILTERED','SEND'),
 (42,'abhi@gmail.com','basil@gg.com','Forward from Basil',' Reply via Break dance','2017-11-16','FILTERED','VIEWED'),
 (43,'abhi@gmail.com','basil@gg.com','qwe','AgEFactor1','2017-11-16','FILTERED','VIEWED'),
 (44,'basil@gg.com','abhi@gmail.com','Test22','agefactor2 hhk','2017-11-16','FILTERED','SEND'),
 (45,'abhi@gmail.com','basil@gg.com','shit','shits','2017-11-16','SPAM','SEND'),
 (46,'basil@gg.com','abhi@gmail.com','shits','Factor3','2017-11-16','SPAM','SEND'),
 (47,'basil@gg.com','abhi@gmail.com','qweasd','Factor2','2017-11-16','FILTERED','SEND'),
 (48,'basil@gg.com','abhi@gmail.com','lols','Factor2','2017-11-16','FILTERED','SEND'),
 (49,'abhi@gmail.com','basil@gg.com','asd','qweqwe','2017-11-16','SPAM','SEND'),
 (50,'abhi@gmail.com','basil@gg.com','dasdasd','asdasd','2017-11-16','SPAM','SEND'),
 (51,'sanju@g.com','basil@gg.com','outer message','yeg','2017-11-17','CONTACTS','VIEWED'),
 (52,'arvind@g.com','basil@gg.com','Outermessage1','asd','2017-11-17','SPAM','SEND'),
 (53,'sanju@g.com','basil@gg.com','outer2','sdgfslkudhf','2017-11-17','CONTACTS','VIEWED'),
 (54,'amjad@gmail.com','basil@gg.com','Hey its from amjad','So hoqw r u ???','2017-11-21','SPAM','SEND'),
 (55,'abhi@gmail.com','basil@gg.com','new test','Factor2','2017-11-21','FILTERED','VIEWED'),
 (56,'abhi@gmail.com','basil@gg.com','qaz','Factor2','2017-11-21','TRASH','VIEWED'),
 (57,'abhi@gmail.com','basil@gg.com','Test4','Factor3','2017-11-21','TRASH','VIEWED'),
 (58,'abhi@gmail.com','basil@gg.com','','Factor2','2017-11-21','TRASH','VIEWED'),
 (59,'abhi@gmail.com','basil@gg.com','test5','Factor3','2017-11-22','TRASH','VIEWED'),
 (60,'abhi@gmail.com','basil@gg.com','Test6','Factor3','2017-11-22','TRASH','VIEWED'),
 (61,'abhi@gmail.com','basil@gg.com','Test7','Factor3','2017-11-22','SPAM','VIEWED'),
 (62,'abhi@gmail.com','basil@gg.com','Test8','Factor3','2017-11-22','TRASH','VIEWED'),
 (63,'abhi@gmail.com','basil@gg.com','Test9','Factor3','2017-11-22','TRASH','VIEWED'),
 (64,'abhi@gmail.com','basil@gg.com','Test10','Factor3','2017-11-22','TRASH','VIEWED'),
 (65,'abhi@gmail.com','basil@gg.com','Test11','Factor3 asd','2017-11-22','TRASH','SEND'),
 (66,'abhi@gmail.com','basil@gg.com','Test12','Agefactor1.1 asd','2017-11-22','TRASH','VIEWED'),
 (67,'abhi@gmail.com','basil@gg.com','Test13 spam','asjdgh','2017-11-22','SPAM','VIEWED'),
 (68,'abhi@gmail.com','basil@gg.com','Test14','Agefactor1.1','2017-11-22','TRASH','VIEWED'),
 (69,'abhi@gmail.com','basil@gg.com','Test15','ageFactor1 asdfa','2017-11-22','TRASH','VIEWED'),
 (70,'abhi@gmail.com','basil@gg.com','hobbby1','Western','2017-11-22','SPAM','VIEWED'),
 (71,'abhi@gmail.com','basil@gg.com','hobbycheck1','Western','2017-11-22','SPAM','VIEWED'),
 (72,'abhi@gmail.com','basil@gg.com','check1','Western Singing','2017-11-22','TRASH','VIEWED'),
 (73,'abhi@gmail.com','basil@gg.com','check2','Western Singing','2017-11-22','SPAM','VIEWED'),
 (74,'abhi@gmail.com','basil@gg.com','check3','comics','2017-11-22','TRASH','VIEWED'),
 (75,'abhi@gmail.com','basil@gg.com','check4','comics','2017-11-22','TRASH','VIEWED'),
 (76,'basil@gg.com','abhi@gmail.com','check5','novel','2017-11-22','SPAM','VIEWED'),
 (77,'basil@gg.com','abhi@gmail.com','check7','comics','2017-11-22','SPAM','VIEWED'),
 (78,'basil@gg.com','abhi@gmail.com','check8','classical','2017-11-22','FILTERED','VIEWED'),
 (79,'basil@gg.com','abhi@gmail.com','check9','Break dance','2017-11-22','FILTERED','VIEWED'),
 (81,'abhi@gmail.com','basil@gg.com','okok','asdjasd','2017-11-27','SPAM','SEND'),
 (82,'abhi@gmail.com','basil@gg.com','chek1','novel','2017-11-27','SPAM','SEND'),
 (83,'basil@gg.com','abhi@gmail.com','chk2','factor1','2017-11-27','SPAM','SEND'),
 (84,'abhi@gmail.com','basil@gg.com','check51','nocel ','2017-11-27','SPAM','VIEWED'),
 (85,'abhi@gmail.com','basil@gg.com','asdu','classical dance','2017-11-27','TRASH','VIEWED');
/*!40000 ALTER TABLE `tempdata_tb` ENABLE KEYS */;


--
-- Definition of table `useragecustom_tb`
--

DROP TABLE IF EXISTS `useragecustom_tb`;
CREATE TABLE `useragecustom_tb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `factorid` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useragecustom_tb`
--

/*!40000 ALTER TABLE `useragecustom_tb` DISABLE KEYS */;
INSERT INTO `useragecustom_tb` (`id`,`username`,`factorid`) VALUES 
 (5,'basilk','1'),
 (7,'abhi','2'),
 (8,'abhi','3');
/*!40000 ALTER TABLE `useragecustom_tb` ENABLE KEYS */;


--
-- Definition of table `userhobbycustom_tb`
--

DROP TABLE IF EXISTS `userhobbycustom_tb`;
CREATE TABLE `userhobbycustom_tb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `factorid` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userhobbycustom_tb`
--

/*!40000 ALTER TABLE `userhobbycustom_tb` DISABLE KEYS */;
INSERT INTO `userhobbycustom_tb` (`id`,`username`,`factorid`) VALUES 
 (1,'basilk','13'),
 (3,'abhi','12'),
 (4,'basilk','10');
/*!40000 ALTER TABLE `userhobbycustom_tb` ENABLE KEYS */;


--
-- Definition of table `userseasoncustom_tb`
--

DROP TABLE IF EXISTS `userseasoncustom_tb`;
CREATE TABLE `userseasoncustom_tb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `factorid` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userseasoncustom_tb`
--

/*!40000 ALTER TABLE `userseasoncustom_tb` DISABLE KEYS */;
INSERT INTO `userseasoncustom_tb` (`id`,`username`,`factorid`) VALUES 
 (42,'basilk','1'),
 (45,'basilk','5'),
 (46,'basilk','6');
/*!40000 ALTER TABLE `userseasoncustom_tb` ENABLE KEYS */;


--
-- Definition of table `w`
--

DROP TABLE IF EXISTS `w`;
CREATE TABLE `w` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `w`
--

/*!40000 ALTER TABLE `w` DISABLE KEYS */;
INSERT INTO `w` (`id`,`username`,`ip`) VALUES 
 (20,'basilk','DESKTOP-30F4NH7/192.168.61.1'),
 (22,'abhi','DESKTOP-30F4NH7/192.168.61.1');
/*!40000 ALTER TABLE `w` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
