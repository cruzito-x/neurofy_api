-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: neurofy
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id_answer` int NOT NULL AUTO_INCREMENT,
  `id_test` int NOT NULL,
  `id_question` int NOT NULL,
  `answer` int NOT NULL,
  PRIMARY KEY (`id_answer`),
  KEY `id_test` (`id_test`),
  KEY `id_question` (`id_question`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`id_test`) REFERENCES `tests` (`id_test`),
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_area`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (2,'Desafíos al socializar'),(3,'Dificultad de atención'),(4,'Intereses específicos'),(1,'Lecto escritura atípica'),(5,'Reacciones atípicas');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conditions` (
  `id_condition` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_condition`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id_faq` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  PRIMARY KEY (`id_faq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_diagnosis` int NOT NULL,
  `diagnosis_date` date NOT NULL,
  `test_date` date NOT NULL,
  PRIMARY KEY (`id_history`),
  KEY `id_user` (`id_user`),
  KEY `id_diagnosis` (`id_diagnosis`),
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `history_ibfk_2` FOREIGN KEY (`id_diagnosis`) REFERENCES `tests` (`id_test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_options`
--

DROP TABLE IF EXISTS `question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_options` (
  `id_option` int NOT NULL AUTO_INCREMENT,
  `id_question` int NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `option_value` int NOT NULL,
  PRIMARY KEY (`id_option`),
  KEY `id_question` (`id_question`),
  CONSTRAINT `question_options_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id_question`),
  CONSTRAINT `question_options_chk_1` CHECK ((`option_value` between 1 and 4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_options`
--

LOCK TABLES `question_options` WRITE;
/*!40000 ALTER TABLE `question_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id_question` int NOT NULL AUTO_INCREMENT,
  `id_area` int NOT NULL,
  `question` varchar(255) NOT NULL,
  PRIMARY KEY (`id_question`),
  KEY `questions_ibfk_1_idx` (`id_area`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'¿Tienes dificultad para comprender palabras complejas en un texto?'),(2,1,'¿Sueles omitir palabras o frases al leer en voz alta?'),(3,1,'¿Escribes las letras en un orden incorrecto frecuentemente?'),(4,1,'¿Tienes problemas para mantenerte concentrado mientras lees?'),(5,1,'¿Te resulta complicado distinguir sonidos similares en palabras?'),(6,1,'¿Es común que confundan tu caligrafía por ser difícil de leer?'),(7,1,'¿Tienes problemas para identificar palabras que riman?'),(8,1,'¿Sientes que tardas más tiempo que otros en leer un texto?'),(9,1,'¿Es común que olvides palabras que acabas de leer?'),(10,1,'¿Tienes problemas para leer letras pequeñas o textos densos?'),(11,2,'¿Te sientes ansioso o incómodo al hablar con personas nuevas?'),(12,2,'¿Evitas reuniones sociales porque te resultan abrumadoras?'),(13,2,'¿Es difícil para ti interpretar el lenguaje corporal de otros?'),(14,2,'¿Tienes problemas para identificar sarcasmo o bromas?'),(15,2,'¿Prefieres actividades individuales en lugar de en grupo?'),(16,2,'¿Te cuesta expresar tus emociones de manera clara?'),(17,2,'¿A menudo te sientes agotado después de socializar?'),(18,2,'¿Sueles hablar sobre tus intereses sin notar si otros están interesados?'),(19,2,'¿Te resulta difícil mantener una conversación fluida?'),(20,2,'¿Es común que te malinterpreten cuando intentas comunicarte?'),(21,3,'¿Te cuesta mantenerte enfocado en una tarea durante mucho tiempo?'),(22,3,'¿Es común que olvides lo que estabas haciendo hace un momento?'),(23,3,'¿Sueles necesitar recordatorios para completar tareas diarias?'),(24,3,'¿Tienes problemas para seguir instrucciones con varios pasos?'),(25,3,'¿Te distraes fácilmente por ruidos o movimientos a tu alrededor?'),(26,3,'¿Te resulta difícil escuchar atentamente durante reuniones o clases?'),(27,3,'¿Cambias de tema rápidamente en conversaciones o pensamientos?'),(28,3,'¿Te cuesta organizar tus ideas o priorizar tareas?'),(29,3,'¿Tienes problemas para trabajar en un entorno con distracciones?'),(30,3,'¿Evitas actividades que requieren concentración prolongada?'),(31,4,'¿Te apasiona profundamente un tema específico?'),(32,4,'¿Sueles investigar mucho sobre tus intereses, más de lo usual?'),(33,4,'¿Te resulta difícil cambiar de tema cuando hablas de algo que te interesa?'),(34,4,'¿Encuentras más placer en tus intereses que en socializar?'),(35,4,'¿Repites actividades relacionadas con tus intereses con frecuencia?'),(36,4,'¿Dedicas la mayor parte de tu tiempo libre a un solo tema o hobby?'),(37,4,'¿Te resulta difícil comprender cómo otros no comparten tu interés?'),(38,4,'¿Prefieres investigar sobre tus intereses en lugar de hacer nuevas actividades?'),(39,4,'¿Te emocionas al encontrar pequeños detalles relacionados con tu pasión?'),(40,4,'¿Te resulta fácil recordar mucha información sobre tus intereses?'),(41,5,'¿Te molestan sonidos que otros parecen no notar?'),(42,5,'¿Te sientes abrumado por luces brillantes o patrones visuales?'),(43,5,'¿Tienes reacciones intensas a olores o sabores específicos?'),(44,5,'¿Sientes la ropa incómoda por su textura o etiquetas?'),(45,5,'¿Evitas tocar ciertos materiales por cómo se sienten?'),(46,5,'¿Sueles repetir ciertos movimientos como una forma de calmarte?'),(47,5,'¿Te sientes abrumado en lugares muy concurridos?'),(48,5,'¿Es común que necesites tiempo a solas después de una experiencia sensorial intensa?'),(49,5,'¿Tienes reacciones emocionales intensas ante cambios inesperados?'),(50,5,'¿Te resulta difícil ignorar sensaciones físicas que otros pasan por alto?'),(51,1,'¿Tienes dificultad para recordar lo que acabas de leer?'),(52,1,'¿Sueles confundir letras como \"b\" y \"d\" al leer o escribir?'),(53,1,'¿Te resulta complicado dividir palabras en sílabas al leer?'),(54,1,'¿Encuentras difícil identificar el significado de palabras nuevas?'),(55,1,'¿Es común que cometas errores al copiar un texto?'),(56,1,'¿Te cuesta seguir el hilo de un párrafo largo?'),(57,1,'¿Te resulta más fácil entender un texto si alguien lo lee en voz alta?'),(58,1,'¿Sueles olvidar cómo escribir palabras que usas frecuentemente?'),(59,1,'¿Te resulta difícil escribir frases completas sin errores?'),(60,1,'¿Tienes problemas para identificar las letras en diferentes tipos de letra?'),(61,2,'¿Sueles sentirte incómodo en situaciones donde no conoces a nadie?'),(62,2,'¿Es común que evites hacer contacto visual durante una conversación?'),(63,2,'¿Te resulta difícil encontrar el momento adecuado para hablar en una conversación grupal?'),(64,2,'¿Prefieres escuchar en lugar de participar activamente en una charla?'),(65,2,'¿Te cuesta iniciar conversaciones con desconocidos?'),(66,2,'¿Te sientes ansioso al tratar de expresar tus ideas en público?'),(67,2,'¿Te resulta complicado comprender los chistes o juegos de palabras?'),(68,2,'¿Prefieres comunicarte por texto en lugar de cara a cara?'),(69,2,'¿Te molesta cuando alguien invade tu espacio personal?'),(70,2,'¿Evitas participar en eventos sociales espontáneos?'),(71,3,'¿Te resulta difícil concentrarte en una tarea cuando hay ruidos de fondo?'),(72,3,'¿Te distraes con facilidad incluso en un ambiente tranquilo?'),(73,3,'¿Es común que olvides detalles importantes de algo que acabas de escuchar?'),(74,3,'¿Te resulta difícil completar tareas largas o con varios pasos?'),(75,3,'¿Pierdes interés rápidamente en actividades que no te entusiasman?'),(76,3,'¿Tienes problemas para recordar cosas simples como nombres o fechas?'),(77,3,'¿Sueles postergar tareas hasta el último momento?'),(78,3,'¿Te cuesta seguir conversaciones largas sin perder el hilo?'),(79,3,'¿Sientes que tu mente divaga cuando deberías estar concentrado?'),(80,3,'¿Te resulta difícil organizar tus tareas diarias de manera efectiva?'),(81,4,'¿Sientes que tu interés por un tema a veces domina tus pensamientos?'),(82,4,'¿Te resulta más fácil recordar datos relacionados con tus intereses que otros temas?'),(83,4,'¿Dedicas mucho tiempo a perfeccionar habilidades relacionadas con tus intereses?'),(84,4,'¿Te resulta emocionante encontrar a alguien que comparte tus intereses?'),(85,4,'¿Prefieres aprender más sobre tus intereses que explorar otros temas?'),(86,4,'¿A menudo hablas de tus intereses incluso si otros no parecen interesados?'),(87,4,'¿Es común que te pierdas en tus pensamientos sobre un tema que te apasiona?'),(88,4,'¿Te resulta difícil cambiar de actividad cuando estás enfocado en tu interés?'),(89,4,'¿Prefieres actividades solitarias relacionadas con tus intereses?'),(90,4,'¿Te emociona compartir lo que sabes sobre tus intereses con otros?'),(91,5,'¿Te resulta difícil soportar ruidos repetitivos como el tic-tac de un reloj?'),(92,5,'¿Te sientes abrumado en ambientes con muchas luces o sonidos?'),(93,5,'¿Evitas lugares concurridos debido a los estímulos sensoriales?'),(94,5,'¿Sientes malestar por ciertas texturas de ropa o materiales?'),(95,5,'¿Te resultan incómodos los olores fuertes o intensos?'),(96,5,'¿Prefieres un ambiente tranquilo y ordenado para sentirte cómodo?'),(97,5,'¿Sueles sentirte incómodo al tocar ciertos objetos?'),(98,5,'¿Te cuesta tolerar situaciones en las que hay demasiados estímulos?'),(99,5,'¿Sientes que algunas sensaciones físicas son más intensas para ti que para otros?'),(100,5,'¿Te molesta mucho que las personas interrumpan tu espacio personal?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_conditions`
--

DROP TABLE IF EXISTS `resource_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_conditions` (
  `id_resource` int NOT NULL,
  `id_condition` int NOT NULL,
  PRIMARY KEY (`id_resource`,`id_condition`),
  KEY `id_condition` (`id_condition`),
  CONSTRAINT `resource_conditions_ibfk_1` FOREIGN KEY (`id_resource`) REFERENCES `resources` (`id_resource`),
  CONSTRAINT `resource_conditions_ibfk_2` FOREIGN KEY (`id_condition`) REFERENCES `conditions` (`id_condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_conditions`
--

LOCK TABLES `resource_conditions` WRITE;
/*!40000 ALTER TABLE `resource_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `id_resource` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` enum('tdah','tea','toc','ddd','st','dam') NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id_resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id_settings` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `dark_mode` int NOT NULL DEFAULT '0',
  `notifications` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_settings`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id_test` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `date` date NOT NULL,
  `time` int NOT NULL,
  `conditions` text,
  `diagnosis` varchar(255) NOT NULL,
  `percentage_areas_evaluated` decimal(5,2) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_test`),
  UNIQUE KEY `id_test` (`id_test`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_conditions`
--

DROP TABLE IF EXISTS `user_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_conditions` (
  `id_user` int NOT NULL,
  `id_condition` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_condition`),
  KEY `id_condition` (`id_condition`),
  CONSTRAINT `user_conditions_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `user_conditions_ibfk_2` FOREIGN KEY (`id_condition`) REFERENCES `conditions` (`id_condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_conditions`
--

LOCK TABLES `user_conditions` WRITE;
/*!40000 ALTER TABLE `user_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `support_phone` varchar(15) DEFAULT NULL,
  `timestamp` date NOT NULL,
  `role` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'David Cruz','dcruzer92@gmail.com','e805cbba152a17e3ab2eb1b367c16f97','2002-03-22','74150122','2024-11-25','0');
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

-- Dump completed on 2024-11-26  0:25:28
