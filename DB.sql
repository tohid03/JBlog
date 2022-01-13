/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.25 : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `blog`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cName` varchar(100) NOT NULL,
  `cDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `categories` */

insert  into `categories`(`cid`,`cName`,`cDescription`) values 
(1,'java','oops language'),
(2,'python','intepreted language'),
(3,'c++','oops'),
(3,'JavaScript','Scripting Language');


/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pImage` varchar(100) DEFAULT NULL,
  `pCreatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `catId_idx` (`catId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `catId` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


/*Table structure for table `post_comments` */

DROP TABLE IF EXISTS `post_comments`;

CREATE TABLE `post_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `postId` int NOT NULL,
  `userId` int NOT NULL,
  `commentOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `postId` (`postId`),
  KEY `userId` (`userId`),
  CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_comments_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `about` varchar(100) NOT NULL DEFAULT 'hey i am using this blog',
  `image` varchar(100) NOT NULL DEFAULT 'deafult.jpg',
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
