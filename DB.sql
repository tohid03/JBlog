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
(3,'c++','oops');

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

/*Data for the table `post` */

insert  into `post`(`pid`,`pTitle`,`pContent`,`pImage`,`pCreatedOn`,`catId`,`userId`) values 
(1,'Hello world','<h1>Hello Eorld</h1>\r\n<p><b>Hello World</b> <i>\r\ndhih ahiuahdiuashd ioauhsiashdhasui iu iagiufgaf\r\naf af gfggdsfgsd\r\ndfgfd hfhgshs\r\ndhdhsghsf\r\nsdgsdhgfhsf\r\nsdhfsfhfsghsf\r\nsdfh shghfd\r\nsfgh grhdjhfn\r\n sfghgrhfdgf\r\nd fhdjhjghj tdhjfhj\r\ngrdjtyjtyjtyjdgjdtbjtdh\r\n\r\n</i>\r\n</p>','01234_HD.jpg','2021-09-27 15:48:42',2,2),
(5,'c++','C programming is a general-purpose, procedural, imperative computer programming language developed in 1972 by Dennis M. Ritchie at the Bell Telephone Laboratories to develop the UNIX operating system. C is the most widely used computer language. It keeps fluctuating at number one scale of popularity along with Java programming language, which is also equally popular and most widely used among modern software programmers.','01605_HD.jpg','2021-09-28 18:12:33',1,2),
(6,'hello','dsvs dfdsvsddv sdvd sdv dsv vds svdsd sd vs','49038.jpg','2021-10-04 16:34:59',1,2),
(7,'post test3','vsvfs gwdvs svsvsa','03757_BG.jpg','2021-10-04 16:47:30',3,2),
(8,'Java','Once a class is established, you can make as many objects of that class as you like, and then \r\nmanipulate those objects as if they are the elements that exist in the problem you are trying \r\nto solve. Indeed, one of the challenges of object-oriented programming is to create a one-to-\r\none mapping between the elements in the problem space and objects in the solution space.  \r\nBut how do you get an object to do useful work for you? There needs to be a way to make a \r\nrequest of the object so that it will do something, such as complete a transaction, draw \r\nsomething on the screen, or turn on a switch. And each object can satisfy only certain \r\nrequests. The requests you can make of an object are defined by its interface, and the type is \r\nwhat determines the interface. A simple example might be a representation of a light bulb:  \r\n \r\nLight lt = new Light(); \r\nlt.on();','1627975036877.png','2021-10-16 15:38:13',1,2),
(9,'C++','hey this is c++ programming language block here we disscuss about c++ ','code_lines_programming_130775_3840x2400.jpg','2021-10-20 17:28:19',3,2);

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

/*Data for the table `post_comments` */

insert  into `post_comments`(`id`,`comment`,`postId`,`userId`,`commentOn`) values 
(1,'hey hello',1,2,'2021-10-25 17:32:03'),
(2,'hey whats up',1,1,'2021-10-25 17:32:29'),
(3,'nice contents',1,3,'2021-10-25 17:32:53'),
(4,'hello',9,2,'2021-10-26 17:14:00'),
(5,'hey can u hep me',9,2,'2021-10-26 17:23:37'),
(6,'test comment 3',9,2,'2021-10-26 17:24:08'),
(7,'',9,2,'2021-10-26 17:24:34');

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

/*Data for the table `user` */

insert  into `user`(`uid`,`name`,`email`,`password`,`about`,`image`,`createdOn`) values 
(1,'tohid','mdtohid@gmail.com','asd','hello','01605_HD.jpg','2021-09-02 16:31:25'),
(2,'tohid ','tohid4@gmail.com','123456','hey i am using this blog.','10134462.jpg','2021-09-02 16:31:25'),
(3,'tohid chhipa','tohidchhipa@gmail.com','123456','hey i am using blog..','Face_in_the_Crowd-wallpaper-11305808.jpg','2021-09-25 16:50:39');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
