-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: web_prog
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Breakfast'),(2,'Lunch'),(3,'Dinner'),(4,'Dessert');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,2,1,'2023-06-29 21:26:26'),(2,3,2,'2023-06-29 21:26:26'),(6,8,3,'2023-07-06 19:45:30'),(8,8,7,'2023-07-06 23:45:26'),(9,9,6,'2023-07-07 08:39:41'),(11,12,2,'2024-06-11 19:13:26'),(12,14,2,'2024-06-11 19:36:04');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,1,'Eggs','3'),(2,1,'Milk','1/4 cup'),(3,1,'Salt','1/2 tsp'),(4,2,'Chicken Breast','2'),(5,2,'Fettuccine Pasta','8 oz'),(6,2,'Heavy Cream','1 cup'),(7,1,'Butter','1 tbsp'),(8,1,'Black Pepper','1/4 tsp'),(9,1,'Cheddar Cheese','1/2 cup'),(10,2,'Olive Oil','2 tbsp'),(11,2,'Garlic','3 cloves'),(12,2,'Parmesan Cheese','1/4 cup'),(13,3,'Ripe Avocado','2'),(14,3,'Lime Juice','2 tbsp'),(15,3,'Onion','1/4 cup, diced'),(16,4,'Spaghetti','8 oz'),(17,4,'Ground Beef','1 lb'),(18,4,'Onion','1, chopped'),(19,5,'Tomatoes','3'),(20,5,'Fresh Mozzarella','8 oz'),(21,5,'Fresh Basil','1/4 cup, chopped'),(22,6,'Beef Sirloin','1 lb'),(23,6,'Soy Sauce','2 tbsp'),(24,6,'Vegetables (e.g., broccoli, bell peppers)','2 cups');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `instructions` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `prep_time` varchar(100) DEFAULT NULL,
  `calories` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,2,'Scrambled Eggs','Classic breakfast dish','1. Heat a non-stick pan...','2023-06-29 21:21:21',1,'https://images.pexels.com/photos/16556110/pexels-photo-16556110/free-photo-of-delicious-breakfast-with-scrambled-eggs-and-bacon.jpeg?auto=compress&cs=tinysrgb&w=800','10 minutes',NULL),(2,3,'Chicken Alfredo','Creamy pasta with grilled chicken','1. Cook pasta according to instructions...','2023-06-29 21:21:21',1,'https://images.pexels.com/photos/16667026/pexels-photo-16667026/free-photo-of-hen-walking-in-countryside.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',NULL,NULL),(3,2,'Chocolate Chip Cookies','Homemade cookies with chocolate chips','1. Preheat the oven to 350°F (175°C). ...','2023-06-29 21:39:39',1,'https://images.pexels.com/photos/4110528/pexels-photo-4110528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',NULL,NULL),(4,3,'Margherita Pizza','Classic Italian pizza with tomato, mozzarella, and basil','1. Preheat the oven to the highest temperature...','2023-06-29 21:39:39',1,'https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&w=800',NULL,NULL),(5,2,'Guacamole','Fresh and creamy avocado dip','1. In a bowl, mash the avocados with a fork...','2023-06-29 21:39:39',1,'https://images.pexels.com/photos/1321942/pexels-photo-1321942.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',NULL,NULL),(6,3,'Spaghetti Bolognese','Traditional Italian pasta dish with meat sauce','1. Heat olive oil in a large pan over medium heat...','2023-06-29 21:39:39',1,'https://images.pexels.com/photos/1373915/pexels-photo-1373915.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',NULL,NULL),(7,2,'Caprese Salad','Simple and refreshing salad with tomatoes, mozzarella, and basil','1. Slice the tomatoes and mozzarella into...','2023-06-29 21:39:39',1,'https://images.pexels.com/photos/13241857/pexels-photo-13241857.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',NULL,NULL),(8,3,'Beef Stir-Fry','Quick and flavorful beef and vegetable stir-fry','1. Thinly slice the beef and marinate it in soy sauce...','2023-06-29 21:39:39',0,'https://images.pexels.com/photos/6065919/pexels-photo-6065919.jpeg?auto=compress&cs=tinysrgb&w=800',NULL,NULL),(9,10,'papa','papa','papa','2023-07-07 13:14:51',1,'papa','21',NULL),(10,10,'hahu','hahu','hahu','2023-07-07 13:17:18',1,'hahu','231',NULL),(11,10,'hahu','hahu','hahu','2023-07-07 13:19:06',1,'hahu','213',NULL),(12,12,'Pizza Italiano','Pizza Italiano very delicious!','Testing instructions','2024-06-11 18:21:50',2,'url123','122',NULL),(15,12,'Pizza Tonno','Pizza - test','Pizza - test','2024-06-11 19:12:28',2,'pizza123','15','423'),(16,14,'Apple Pie','Apple Pie - test','Apple Pie - test','2024-06-11 19:33:15',4,'applepie123','10','321');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','adminpassword',NULL,NULL,'admin@example.com'),(2,'john','john123','John','Doe','john@example.com'),(3,'jane','jane456','Jon','Edo','jane@example.com'),(4,'sama','7f463d8cf144268ee9bf9f241b5c9d9f',NULL,NULL,'sama@example.com'),(6,'amr2','f679623f5fbd26e1a0064af261a8f4e7','amr2','amr','amr2@gmail.com'),(7,'test','098f6bcd4621d373cade4e832627b4f6','test','test','test@test.com'),(8,'adma','d41d8cd98f00b204e9800998ecf8427e','adma2','adma','admaa@gmail.com'),(9,'adma5','d41d8cd98f00b204e9800998ecf8427e','Adma2','Adma','adma3@gmail.com'),(10,'adma2','853a30cbcdf66158810fe4f5bdf090c2','adma2','adma2','adma2@gmail.com'),(12,'jane3','d41d8cd98f00b204e9800998ecf8427e','Jane','Wright','jane@jane.com'),(13,'admir2','6952e8517294fd00277340e64701cba0','Admir','Nedzibovic','admir2@gmail.com'),(14,'admir5','d41d8cd98f00b204e9800998ecf8427e','Admir','Nedzibovic','admir3@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 21:48:41
