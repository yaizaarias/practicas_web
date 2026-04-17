-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: musica_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `albumes`
--

DROP TABLE IF EXISTS `albumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albumes` (
  `id` int NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `ano` date DEFAULT NULL,
  `id_artista` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_artista` (`id_artista`),
  CONSTRAINT `albumes_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumes`
--

LOCK TABLES `albumes` WRITE;
/*!40000 ALTER TABLE `albumes` DISABLE KEYS */;
INSERT INTO `albumes` VALUES (1,'Eternal Sunshine','2024-03-08',1),(2,'Positions','2020-10-30',1),(3,'Anti','2016-01-28',2),(4,'Good Girl Gone Bad','2007-06-05',2),(5,'Motomami','2022-03-18',3),(6,'El Mal Querer','2018-11-02',3),(7,'Alpha','2023-09-22',4),(8,'11 Razones','2020-12-11',4),(9,'Future Nostalgia','2020-03-27',5),(10,'Radical Optimism','2024-05-03',5),(11,'Happier Than Ever','2021-07-30',6),(12,'When We All Fall Asleep','2019-03-29',6),(13,'Poster Girl','2021-03-05',7),(14,'BRAT','2024-06-07',8),(15,'Rare','2020-01-10',9),(16,'After Hours','2020-03-20',10),(17,'Dawn FM','2022-01-07',10),(18,'SOS','2022-12-09',11),(19,'Red Moon in Venus','2023-03-03',12),(20,'El Secreto','2024-02-15',13),(21,'Un Verano Sin Ti','2022-05-06',14),(22,'Nadie Sabe','2023-10-13',14),(23,'Mañana Será Bonito','2023-02-24',15),(24,'KG0516','2021-03-26',15),(25,'Colores','2020-03-19',16),(26,'El Hombre','2022-07-08',17),(27,'FERXXO','2020-09-11',18),(28,'Mor','2023-09-29',18),(29,'Saturno','2022-11-11',19),(30,'For All the Dogs','2023-10-06',20),(31,'Honestly Nevermind','2022-06-17',20),(32,'Mr Morale','2022-05-13',21),(33,'Music to Be Murdered By','2020-01-17',22),(34,'Utopia','2023-07-28',23),(35,'Pink Friday 2','2023-12-08',24),(36,'El Madrileño','2021-02-26',25),(37,'Donde Quiero Estar','2023-01-20',26),(38,'Tirador','2020-10-23',27),(39,'Versus','2021-03-26',28),(40,'Diseño de Interiores','2020-05-08',30);
/*!40000 ALTER TABLE `albumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_cancion`
--

DROP TABLE IF EXISTS `artista_cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista_cancion` (
  `id_artista` int NOT NULL,
  `id_cancion` int NOT NULL,
  PRIMARY KEY (`id_artista`,`id_cancion`),
  KEY `id_cancion` (`id_cancion`),
  CONSTRAINT `artista_cancion_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artista_cancion_ibfk_2` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_cancion`
--

LOCK TABLES `artista_cancion` WRITE;
/*!40000 ALTER TABLE `artista_cancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista_cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` int DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `productor` varchar(100) DEFAULT NULL,
  `oyentes_mensuales` int DEFAULT NULL,
  `biografia` text,
  `genero` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'Ariana Grande',33,'Estados Unidos','Max Martin',83000000,'Comenzó en la serie Victorious antes de centrarse en la música, donde destacó rápidamente por su rango vocal de soprano y su capacidad para moverse entre pop y R&B. Tras el atentado de Manchester en 2017, su concierto benéfico la consolidó como figura global más allá de la música.','Pop/R&B'),(2,'Rihanna',38,'Barbados','Kuk Harrell',70000000,'Descubierta en Barbados por Jay-Z, debutó con un sonido dancehall que evolucionó hacia el pop global. Ha construido una carrera marcada por la reinvención constante, alternando hits musicales con proyectos empresariales como Fenty Beauty.','Pop/R&B'),(3,'Rosalía',34,'España','El Guincho',50000000,'Formada en flamenco tradicional, su proyecto El Mal Querer la llevó a reinterpretar el género con estructuras del pop y el urbano. Ha trabajado con artistas internacionales como Travis Scott y The Weeknd, expandiendo su impacto global.','Flamenco/Pop'),(4,'Aitana',27,'España','Pablo Rouss',12000000,'Salió de Operación Triunfo 2017 como finalista y evolucionó de baladas pop a sonidos más urbanos y electrónicos. Ha logrado llenar estadios en España con una base de fans muy joven y fiel.','Pop'),(5,'Dua Lipa',30,'Reino Unido','Ian Kirkpatrick',90000000,'Antes de su debut, subía covers a YouTube mientras trabajaba como modelo. Su segundo álbum Future Nostalgia redefinió el pop-dance moderno con influencia disco.','Pop'),(6,'Billie Eilish',24,'Estados Unidos','Finneas',85000000,'Grabó su primer éxito en su habitación junto a su hermano Finneas. Su estética minimalista y su enfoque introspectivo la convirtieron en referente del pop alternativo contemporáneo.','Pop'),(7,'Zara Larsson',28,'Suecia','MNEK',30000000,'Ganó un concurso de talentos en Suecia siendo niña y firmó con grandes sellos europeos. Ha sido una de las voces clave del pop escandinavo internacional.','Pop'),(8,'Charli XCX',33,'Reino Unido','A. G. Cook',25000000,'Inició en la escena rave británica antes de entrar al pop comercial. Posteriormente se convirtió en referente del hyperpop y la experimentación digital.','Pop'),(9,'Selena Gomez',34,'Estados Unidos','Finneas',45000000,'Pasó de actriz infantil en Disney a artista pop global. Su música se centra en temas personales como salud mental y relaciones.','Pop'),(10,'The Weeknd',36,'Canadá','Max Martin',110000000,'Comenzó publicando música de forma anónima en internet en 2010. Su estilo mezcla R&B oscuro con pop experimental y estética cinematográfica.','R&B'),(11,'SZA',35,'Estados Unidos','Rob Bisel',65000000,'Su álbum Ctrl redefinió el R&B moderno con letras confesionales sobre identidad, amor y autoestima.','R&B'),(12,'Kali Uchis',31,'Colombia','Tainy',35000000,'Ha desarrollado una carrera bilingüe entre inglés y español, combinando soul, R&B y pop alternativo con estética retro-futurista.','R&B'),(13,'Juicy Bae',29,'España','PMP',450000,'Figura del underground español, combina R&B y trap con letras íntimas y una estética ligada a la escena alternativa digital.','R&B/Trap'),(14,'Bad Bunny',32,'Puerto Rico','Tainy',80000000,'Empezó subiendo música a SoundCloud mientras trabajaba en un supermercado. Su enfoque rompió estereotipos del reggaeton tradicional.','Reggaeton'),(15,'Karol G',35,'Colombia','Ovy on the Drums',75000000,'Tras años de esfuerzo en la industria urbana, logró consolidarse como una de las voces femeninas más importantes del reggaeton global.','Reggaeton'),(16,'J Balvin',40,'Colombia','Tainy',60000000,'Lideró la internacionalización del reggaeton moderno con un enfoque visual y colaboraciones globales.','Reggaeton'),(17,'El Alfa',34,'República Dominicana','Chael Produciendo',25000000,'Principal figura del dembow dominicano, ha llevado un género local a escenarios internacionales con un estilo energético y agresivo.','Reggaeton'),(18,'Feid',33,'Colombia','Sky Rompiendo',65000000,'Comenzó como compositor para otros artistas antes de convertirse en solista de éxito dentro del reggaeton melódico.','Reggaeton'),(19,'Rauw Alejandro',33,'Puerto Rico','Mr. NaisGai',70000000,'Fusiona reggaeton con R&B y dance, destacando también por su enfoque coreográfico y visual en sus presentaciones.','Reggaeton'),(20,'Drake',39,'Canadá','40',90000000,'Inició como actor en Degrassi antes de convertirse en uno de los artistas más influyentes del rap y R&B moderno.','Rap'),(21,'Kendrick Lamar',39,'Estados Unidos','Sounwave',55000000,'Considerado uno de los mejores raperos de la historia, sus álbumes abordan temas sociales, raciales y personales.','Rap'),(22,'Eminem',53,'Estados Unidos','Dr. Dre',50000000,'Se convirtió en una figura clave del hip-hop por su técnica lírica y su narrativa autobiográfica extrema.','Rap'),(23,'Travis Scott',34,'Estados Unidos','Mike Dean',70000000,'Popularizó un sonido de trap psicodélico centrado en la atmósfera y la experiencia en vivo.','Rap'),(24,'Nicki Minaj',43,'Estados Unidos','Wheezy',45000000,'Destacó por su versatilidad vocal, personajes alter ego y dominio del rap femenino global.','Rap'),(25,'C. Tangana',35,'España','El Guincho',15000000,'Evolucionó del rap underground al pop experimental con fuerte influencia del flamenco contemporáneo.','Rap/Urban'),(26,'Quevedo',24,'España','Linton',25000000,'Se hizo viral en plataformas digitales antes de consolidarse en la música urbana española.','Trap/Rap'),(27,'Fernando Costa',29,'España','Blasfem',2000000,'Representa el rap español clásico con letras centradas en vida urbana y experiencias personales.','Rap'),(28,'Hard GZ',33,'España','Hard GZ',3000000,'Conocido por su rap consciente, aborda temas sociales y políticos en su música.','Rap'),(29,'Mayo214',25,'España','Kroniko',800000,'Artista emergente del trap español con influencia del sonido underground digital.','Trap'),(30,'Pimp Flaco',30,'España','Kinder Malo',1000000,'Ha desarrollado un estilo alternativo dentro del rap español con mezcla de humor, crítica y experimentación sonora.','Rap/Trap');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones` (
  `id` int NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `duracion` varchar(6) DEFAULT NULL,
  `reproducciones` bigint DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_album` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_album` (`id_album`),
  CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `albumes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` VALUES (1,'7 rings','02:58',2100000000,'2019-01-18',2),(2,'thank u next','03:27',2400000000,'2018-11-03',2),(3,'positions','02:52',1200000000,'2020-10-30',2),(4,'no tears left','03:25',1800000000,'2018-04-20',2),(5,'into you','04:04',1500000000,NULL,NULL),(6,'dangerous woman','03:56',1400000000,NULL,NULL),(7,'Umbrella','04:36',2500000000,'2007-03-29',4),(8,'Diamonds','03:45',1800000000,'2012-09-27',3),(9,'We Found Love','03:35',2000000000,'2011-09-22',3),(10,'Work','03:39',1900000000,'2016-01-27',3),(11,'Only Girl','03:55',1700000000,'2010-09-10',4),(12,'Rude Boy','03:43',1400000000,'2009-02-20',4),(13,'DESPECHA','02:36',900000000,'2022-07-28',5),(14,'SAOKO','02:17',500000000,'2022-03-18',5),(15,'Con Altura','02:38',1500000000,'2019-03-28',6),(16,'Malamente','02:49',1200000000,'2018-05-30',6),(17,'LA FAMA','03:08',800000000,'2021-11-11',5),(18,'Bizcochito','01:49',700000000,NULL,NULL),(19,'Telefono','03:05',600000000,'2018-07-06',8),(20,'Vas a Quedarte','03:15',500000000,'2018-11-09',8),(21,'Formentera','03:00',400000000,'2022-06-03',7),(22,'Lo Malo','03:02',450000000,NULL,8),(23,'En el coche','02:45',300000000,NULL,NULL),(24,'Las Babys','02:40',250000000,NULL,NULL),(25,'Levitating','03:23',2200000000,'2020-03-27',9),(26,'Dont Start Now','03:03',2100000000,'2019-11-01',9),(27,'New Rules','03:29',1900000000,'2017-07-07',9),(28,'Physical','03:13',900000000,'2020-01-31',9),(29,'Houdini','03:05',500000000,'2023-11-09',10),(30,'IDGAF','03:37',800000000,NULL,NULL),(31,'bad guy','03:14',2600000000,'2019-03-29',12),(32,'bury a friend','03:13',1400000000,'2019-01-30',12),(33,'Happier Than Ever','04:58',1200000000,'2021-07-30',11),(34,'Ocean Eyes','03:20',1100000000,NULL,NULL),(35,'when party over','03:16',1000000000,NULL,NULL),(36,'Therefore I Am','02:54',900000000,NULL,NULL),(37,'Lush Life','03:20',900000000,'2015-06-05',13),(38,'Never Forget You','03:33',850000000,'2015-09-22',13),(39,'Ruin My Life','03:10',600000000,'2018-10-18',13),(40,'Aint My Fault','03:44',700000000,'2016-09-02',13),(41,'Cant Tame Her','03:05',400000000,NULL,NULL),(42,'Wow','03:00',300000000,NULL,NULL),(43,'Boom Clap','02:49',900000000,'2014-06-15',14),(44,'Vroom Vroom','03:18',400000000,'2016-02-26',14),(45,'1999','03:09',800000000,'2018-10-05',14),(46,'Beg For You','02:52',500000000,'2022-01-27',14),(47,'Speed Drive','02:58',600000000,'2023-06-29',14),(48,'I Love It','02:37',1200000000,NULL,NULL),(49,'Lose You','03:26',1200000000,'2019-10-23',15),(50,'Good For You','03:41',1100000000,'2015-06-22',15),(51,'Hands To Myself','03:20',900000000,'2015-12-21',15),(52,'Rare','03:40',700000000,'2020-01-10',15),(53,'Calm Down','03:59',1500000000,NULL,NULL),(54,'Love Song','03:08',1000000000,NULL,NULL),(55,'Blinding Lights','03:20',3000000000,'2019-11-29',16),(56,'Starboy','03:50',2200000000,'2016-09-22',16),(57,'Save Your Tears','03:35',2100000000,'2020-03-20',16),(58,'The Hills','04:02',1800000000,'2015-05-27',16),(59,'Die For You','04:20',1700000000,'2016-11-25',16),(60,'I Feel It Coming','04:29',1300000000,NULL,NULL);
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `rol` varchar(20) DEFAULT 'usuario',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'administrador@gmail.com','123456','administrador');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-17 13:10:06
