-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: lifestyle
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `bestworkouts`
--
USE lifestyle;
DROP TABLE IF EXISTS `bestworkouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bestworkouts` (
  `workout_name` varchar(255) NOT NULL,
  `duration_minutes` int NOT NULL,
  `frequency_per_week` int NOT NULL,
  `calories_burned` int DEFAULT NULL,
  `intensity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestworkouts`
--

LOCK TABLES `bestworkouts` WRITE;
/*!40000 ALTER TABLE `bestworkouts` DISABLE KEYS */;
INSERT INTO `bestworkouts` VALUES ('Running',30,3,300,'High'),('Cycling',45,4,350,'Medium'),('Yoga',60,5,200,'Low'),('Strength Training',60,3,400,'High'),('Swimming',30,2,250,'Medium'),('HIIT',30,4,400,'High');
/*!40000 ALTER TABLE `bestworkouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal` (
  `user_id` int DEFAULT NULL,
  `sleep` varchar(255) DEFAULT NULL,
  `workout` varchar(255) DEFAULT NULL,
  `meal` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (1,'340','354576','100','2025-03-26 18:50:37'),(1,'30','324','234','2025-03-28 15:45:41');
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meals` (
  `user_id` int DEFAULT NULL,
  `meal_type` varchar(100) NOT NULL,
  `calories` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (1,'breakfast','30','2025-03-25 17:17:58'),(1,'breakfast','100','2025-03-26 19:15:34');
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrition`
--

DROP TABLE IF EXISTS `nutrition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrition` (
  `food_item` varchar(255) DEFAULT NULL,
  `calories` int DEFAULT NULL,
  `protein` float DEFAULT NULL,
  `carbs` float DEFAULT NULL,
  `fat` float DEFAULT NULL,
  `fiber` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrition`
--

LOCK TABLES `nutrition` WRITE;
/*!40000 ALTER TABLE `nutrition` DISABLE KEYS */;
INSERT INTO `nutrition` VALUES ('Apple',95,0.5,25,0.3,4.4),('Banana',105,1.3,27,0.3,3.1),('Orange',62,1.2,15.4,0.2,3.1),('Strawberries',49,1,12,0.5,2),('Blueberries',57,0.7,14,0.3,2.4),('Carrot',25,0.6,6,0.1,1.7),('Tomato',22,1.1,4.8,0.2,1.5),('Broccoli',55,3.7,11.2,0.6,5.1),('Spinach',23,2.9,3.6,0.4,2.2),('Cucumber',16,0.7,3.8,0.1,0.5),('Almonds',579,21.2,21.6,49.9,12.2),('Cashews',553,18.2,30.2,43.9,3.3),('Peanut Butter',588,25,20,50,6),('Chicken Breast',165,31,0,3.6,0),('Egg',68,6.3,0.6,4.8,0),('Salmon',206,22.1,0,12.4,0),('Tofu',70,8,1.9,4.2,0.3),('Greek Yogurt',59,10,3.6,0.4,0),('Oatmeal',68,2.4,12,1.4,1.7),('Quinoa',120,4.1,21.3,1.9,2.8),('Brown Rice',111,2.6,23,0.9,1.8),('Sweet Potato',103,2.3,23.6,0.2,3.8),('Avocado',160,2,8.5,14.7,6.7),('Olive Oil',119,0,0,13.5,0),('Coconut Oil',117,0,0,13.6,0),('Cheddar Cheese',113,7.1,0.4,9.4,0),('Mozzarella Cheese',85,6.3,1.2,6.3,0),('Butter',102,0.1,0.1,11.5,0),('Milk',122,8,12,4.8,0),('Whole Wheat Bread',80,3.6,13.8,1,1.9),('White Bread',66,2,12,1,0.6),('Pasta',131,5,25,1,1.2),('Couscous',112,3.8,23,0.2,1.4),('Popcorn',31,1,6,0.4,1.2),('Chia Seeds',137,4.7,12.3,8.7,10.6),('Flax Seeds',141,5,8,10.5,7.7),('Chickpeas',164,8.9,27.4,2.6,7.6),('Lentils',116,9,20,0.4,7.9),('Kidney Beans',127,8.7,22.8,0.5,6.4),('Black Beans',114,7.6,20,0.9,8.7),('Peas',81,5.4,14.5,0.4,5.5),('Mango',99,0.8,25,0.6,2.6),('Pineapple',50,0.5,13.1,0.1,1.4),('Grapes',62,0.6,16,0.3,0.9),('Watermelon',30,0.6,8,0.2,0.4),('Peach',58,1,14,0.3,2),('Plum',46,0.7,11.3,0.2,1),('Apricot',48,0.5,12,0.1,1.4),('Kiwi',42,0.8,10,0.4,2.1),('Papaya',59,0.9,15,0.2,1.7),('Cantaloupe',34,0.8,8.2,0.2,0.9),('Zucchini',17,1.2,3.1,0.3,1),('Bell Pepper',31,1,7.5,0.3,2.5),('Asparagus',27,3,5.2,0.2,2.1),('Brussels Sprouts',43,3.4,8,0.3,3.8),('Cauliflower',25,1.9,4.9,0.1,2),('Eggplant',20,1,4.8,0.2,2.5),('Mushrooms',22,3.1,3.3,0.3,1),('Beetroot',43,1.6,9.6,0.2,2.8),('Pumpkin',26,1,6.5,0.1,1.1),('Artichoke',60,4.2,13,0.2,5.4),('Cabbage',25,1.3,5.8,0.1,2),('Kale',33,2.9,6.7,0.5,1.3),('Radish',16,0.8,3.4,0.1,1.6),('Leeks',61,1.5,14,0.3,1.8),('Fennel',31,1.2,7,0.2,3),('Celery',16,0.7,3,0.2,1.6),('Ginger',80,1.8,17.8,0.8,2),('Garlic',4,0.2,1,0,0.1),('Onion',40,1.1,9.3,0.1,1.7),('Chili Pepper',40,2,9,0.2,1.5),('Cilantro',1,0.1,0.2,0,0.1),('Basil',5,0.5,1.1,0.1,0.3),('Mint',6,0.3,1.5,0.1,0.8),('Rosemary',1,0.1,0.2,0,0.1),('Thyme',1,0.1,0.2,0,0.1),('Parsley',1,0.2,0.4,0,0.3),('Sage',3,0.1,0.6,0.1,0.2),('Turmeric',29,0.9,6.3,0.3,1.9),('Cumin',8,0.4,1,0.5,0.7),('Oregano',4,0.3,0.9,0.2,0.5);
/*!40000 ALTER TABLE `nutrition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleep_habits`
--

DROP TABLE IF EXISTS `sleep_habits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleep_habits` (
  `sleep_duration_hours` int NOT NULL,
  `optimal_sleep_duration_hours` int DEFAULT NULL,
  `sleep_quality` varchar(50) DEFAULT NULL,
  `sleep_time` time DEFAULT NULL,
  `wake_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleep_habits`
--

LOCK TABLES `sleep_habits` WRITE;
/*!40000 ALTER TABLE `sleep_habits` DISABLE KEYS */;
INSERT INTO `sleep_habits` VALUES (7,8,'Good','23:00:00','07:00:00'),(8,8,'Good','22:30:00','06:30:00'),(6,8,'Poor','00:00:00','06:00:00'),(7,8,'Average','23:30:00','06:30:00'),(8,8,'Good','22:00:00','06:00:00');
/*!40000 ALTER TABLE `sleep_habits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleep_logs`
--

DROP TABLE IF EXISTS `sleep_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleep_logs` (
  `user_id` int DEFAULT NULL,
  `sleep_duration` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleep_logs`
--

LOCK TABLES `sleep_logs` WRITE;
/*!40000 ALTER TABLE `sleep_logs` DISABLE KEYS */;
INSERT INTO `sleep_logs` VALUES (1,'8','2025-03-25 17:18:04');
/*!40000 ALTER TABLE `sleep_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workouts`
--

DROP TABLE IF EXISTS `workouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workouts` (
  `user_id` int DEFAULT NULL,
  `workout_type` varchar(100) NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workouts`
--

LOCK TABLES `workouts` WRITE;
/*!40000 ALTER TABLE `workouts` DISABLE KEYS */;
INSERT INTO `workouts` VALUES (1,'exercising','30','2025-03-25 17:17:45'),(1,'jogging','25','2025-03-26 01:33:43');
/*!40000 ALTER TABLE `workouts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-29 10:07:51
