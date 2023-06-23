-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: saledb
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (16,'99999'),(10,'DEMO123'),(12,'DEMO333'),(13,'DEMO444'),(3,'Desktop'),(4,'Laptop'),(1,'Mobile'),(6,'PHU KIEN'),(2,'Tablet');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_idx` (`product_id`),
  KEY `fk_user_idx` (`user_id`),
  CONSTRAINT `fk_product2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Good',5,1,'2022-03-03 12:12:12','2022-03-03 12:12:12'),(2,'Nice',5,1,'2022-03-15 08:12:12','2022-03-15 08:12:12'),(12,'Ok',13,1,'2022-03-26 10:19:33','2022-03-26 10:19:33'),(13,'Excellent',13,1,'2022-03-26 10:19:47','2022-03-26 10:19:47');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_tag`
--

DROP TABLE IF EXISTS `prod_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tag_idx` (`tag_id`),
  KEY `fk_product_idx` (`product_id`),
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_tag`
--

LOCK TABLES `prod_tag` WRITE;
/*!40000 ALTER TABLE `prod_tag` DISABLE KEYS */;
INSERT INTO `prod_tag` VALUES (1,12,1),(2,12,2),(3,14,2),(4,14,1),(5,16,6),(6,17,1),(7,17,2);
/*!40000 ALTER TABLE `prod_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category_idx` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5,'iPhone 7 plus',14000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',1),(6,'iPad Pro 2021',24000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',2),(7,'iPhone 13 ProMax',35000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',3),(9,'iPhone 14 ProMax',35000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',4),(10,'iPhone 8',15000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',1),(11,'iPad Pro 2022',24000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',2),(12,'iPad Pro 2020',24000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',2),(13,'iPhone X',18000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1647056432/sxewt71mnse6uqpqzsoi.jpg',1),(14,'iPhone 14',31000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1647056432/sxewt71mnse6uqpqzsoi.jpg',1),(15,'iphone 14 pro',35000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',1),(16,'iphone 14 pro',35000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',1),(17,'iPhone 14 ProMax',40000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',1),(18,'Galaxy Tab S8',50000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',2),(19,'iPhone 14 Plus',20000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',1),(20,'Galaxy S23 Ultra',50000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',1),(24,'Galaxy Z-Fold 4',30000000,_binary '','https://res.cloudinary.com/dxxwcby8l/image/upload/v1646729638/dl0rkkgjtzsjyneod3m5.jpg',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (4,'luxury'),(6,'luxury2'),(2,'new'),(3,'new 99%'),(1,'promotion');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Thanh ','admin','$2a$10$gV2R.JyMr3hv4feROghRb.jeCDQZImHOfMISTlI99Q7HGyJmsJwBW','https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248722/r8sjly3st7estapvj19u.jpg','ROLE_ADMIN',''),(2,'Nguyen Van A','doremon','$2a$10$gV2R.JyMr3hv4feROghRb.jeCDQZImHOfMISTlI99Q7HGyJmsJwBW','https://res.cloudinary.com/dxxwcby8l/image/upload/v1648257422/gs28hr0rgoay0gzzlsen.png','ROLE_USER','doremon@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-23 12:46:09
