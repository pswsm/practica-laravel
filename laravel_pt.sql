-- MariaDB dump 10.19  Distrib 10.11.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: laravel_pt
-- ------------------------------------------------------
-- Server version	10.11.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(43,'2014_10_12_000000_create_users_table',1),
(44,'2014_10_12_100000_create_password_reset_tokens_table',1),
(45,'2019_08_19_000000_create_failed_jobs_table',1),
(46,'2019_12_14_000001_create_personal_access_tokens_table',1),
(47,'2023_02_21_170111_create_teams_table',1),
(48,'2023_02_21_170200_create_players_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `yearOfBirth` int(11) NOT NULL,
  `salary` double NOT NULL,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `players_team_id_index` (`team_id`),
  CONSTRAINT `players_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES
(1,'Kaitlyn','Hudson',1995,186985,4),
(2,'Dante','Moore',1988,486214,1),
(3,'Blake','Kuvalis',2001,415042,1),
(4,'Daphnee','Nikolaus',1989,564374,1),
(5,'Santina','Streich',1999,599959,1),
(6,'Levi','Hoeger',1988,948024,1),
(7,'Ozella','Mosciski',1994,394046,1),
(8,'Cloyd','Schultz',1987,747648,1),
(9,'Simeon','Runolfsdottir',1997,463832,1),
(10,'Bryce','Daugherty',2001,321443,1),
(11,'Lenny','Nicolas',1998,693014,1),
(12,'Frank','Smith',1985,643600,1),
(13,'Tatyana','Bruen',1997,675489,1),
(14,'Bernadine','Schultz',1993,219791,1),
(15,'Salma','McDermott',1986,295706,1),
(16,'Noah','Kiehn',1987,774109,2),
(17,'Elyse','Jaskolski',1986,926627,2),
(18,'Brennon','Bradtke',1993,104244,2),
(19,'Brycen','Halvorson',1994,908501,2),
(20,'Sandra','Jacobs',1998,995913,2),
(21,'Lavern','Lowe',1991,194430,2),
(22,'Anibal','Botsford',2004,447852,2),
(23,'Terrell','Labadie',1995,827812,2),
(24,'Dasia','Brakus',1995,278987,2),
(25,'Chase','Parisian',2002,304108,2),
(26,'Shanelle','Lindgren',1984,139650,2),
(27,'Price','Thompson',1999,721093,2),
(28,'Kaden','Bogan',1994,630172,2),
(29,'Dan','Batz',1994,163459,2),
(30,'Abelardo','Ziemann',1994,400136,2),
(31,'Eldon','Rempel',2003,947575,3),
(32,'Nedra','Gorczany',1987,539176,3),
(33,'Merritt','O\'Kon',1989,831382,3),
(34,'Christiana','Stamm',2001,279328,3),
(35,'Sophia','Flatley',1990,982747,3),
(36,'Claud','Williamson',2005,662769,3),
(37,'Kailee','Beer',1990,240210,3),
(38,'Ciara','Reinger',1991,511024,3),
(39,'Gillian','Steuber',1999,148696,3),
(40,'Shania','Barrows',1990,759071,3),
(41,'Robb','Price',2007,471994,3),
(42,'Horacio','Weimann',1990,519736,3),
(43,'Ines','Hammes',2002,319951,3),
(44,'Bailey','Bechtelar',1999,743364,3),
(45,'Reanna','Dickens',2003,926736,3),
(46,'Ettie','Pagac',2005,222340,4),
(47,'Boris','Reinger',1995,171142,4),
(48,'Duncan','Weimann',1994,218223,4),
(49,'Adrienne','Streich',1989,484949,4),
(50,'Bonita','McLaughlin',1989,791098,4),
(51,'Brandy','Hane',1983,409385,4),
(52,'Selena','Blick',1991,902622,4),
(53,'Clarabelle','Kuhic',1989,551636,4),
(54,'Ruth','Green',1993,167440,4),
(55,'Henderson','Simonis',2002,655306,4),
(56,'Vergie','Hilpert',1991,326500,4),
(57,'Oran','Dare',1987,112050,4),
(58,'Emery','Will',1993,825060,4),
(59,'Rubie','Kilback',1995,272059,4),
(60,'Earnest','Huel',1992,367024,4),
(61,'Myron','Reichert',1995,173910,5),
(62,'Casey','Jakubowski',2003,288057,5),
(63,'Filomena','VonRueden',2002,365759,5),
(64,'Colten','Hill',1988,366304,5),
(65,'Rudolph','Herman',1996,139157,5),
(66,'Stan','Kovacek',2007,453702,5),
(67,'Kobe','Conroy',1986,956602,5),
(68,'Destiney','Satterfield',1998,386680,5),
(69,'Olaf','Gerlach',1988,827823,5),
(70,'Ardith','Hickle',1993,146090,5),
(71,'Ellsworth','Beatty',1986,898937,5),
(72,'Mariam','Hackett',1995,614845,5),
(73,'Delpha','Okuneva',1985,739884,5),
(74,'Orlando','Haley',1990,155842,5),
(75,'Zackary','Hudson',2005,970266,5),
(76,'Libbie','Corwin',1984,805748,6),
(77,'Loren','Schneider',1991,553534,6),
(78,'Cecil','Walsh',2003,380743,6),
(79,'Edmund','D\'Amore',2006,364074,6),
(80,'Lucile','Douglas',1993,668358,6),
(81,'Loren','Kub',1992,254800,6),
(82,'Queenie','Walsh',2002,914371,6),
(83,'Destin','Lakin',1987,535540,6),
(84,'Carmine','Schneider',1998,203536,6),
(85,'Stephany','Runte',1987,328407,6),
(86,'Floy','Gaylord',1999,952334,6),
(87,'Rupert','Zieme',1985,280831,6),
(88,'Brooks','Casper',2006,677672,6),
(89,'Cody','Torp',2007,257600,6),
(90,'Estevan','Medhurst',1997,643981,6),
(91,'Janiya','Vandervort',1985,171596,7),
(92,'Annamarie','Welch',2000,607006,7),
(93,'Amos','Becker',2002,722412,7),
(94,'Kelvin','Schumm',1988,466327,7),
(95,'Wilma','Leannon',1983,346280,7),
(96,'Leilani','Rath',1996,514674,7),
(97,'Bertha','Nicolas',1993,226818,7),
(98,'Eusebio','Smith',1997,461364,7),
(99,'Hannah','Harvey',1992,965943,7),
(100,'Loraine','Stoltenberg',1999,797201,7),
(101,'Hank','Raynor',2003,175235,7),
(102,'Bertrand','Cruickshank',2000,964678,7),
(103,'Lamont','Schaden',1987,329608,7),
(104,'Emelia','Gislason',2001,683167,7),
(105,'Orlo','Shields',1990,180268,7),
(106,'Lyda','Gislason',1984,352390,8),
(107,'Filomena','Cremin',1996,566190,8),
(108,'August','Boehm',1999,147992,8),
(109,'Kirk','Pouros',1997,234380,8),
(110,'Torrey','Fisher',2002,590803,8),
(111,'Quinton','Kautzer',1985,154176,8),
(112,'Amelie','Metz',1998,270773,8),
(113,'Andrew','Effertz',1989,161386,8),
(114,'Ellie','Smith',1985,293893,8),
(115,'Ted','Ankunding',2000,454781,8),
(116,'Daryl','Parker',1988,994798,8),
(117,'Aidan','Sawayn',2000,847656,8),
(118,'Carrie','Rempel',1993,936535,8),
(119,'Noel','Hagenes',2001,620818,8),
(120,'Madison','Witting',2003,195027,8),
(121,'Norene','Harvey',2000,349160,9),
(122,'Cortney','Gutmann',1983,193472,9),
(123,'Orie','Nienow',1992,159340,9),
(124,'Berneice','Legros',2002,263416,9),
(125,'Maxwell','Davis',2006,140815,9),
(126,'Citlalli','Cronin',2004,508551,9),
(127,'Clair','Ziemann',1985,352109,9),
(128,'Opal','Nader',2006,415134,9),
(129,'Darrion','Mante',1989,465731,9),
(130,'Taylor','Bergnaum',1999,118685,9),
(131,'Susanna','Tremblay',1994,410487,9),
(132,'Loyce','Roberts',1999,586232,9),
(133,'Kiel','Veum',2004,269756,9),
(134,'Vergie','Hagenes',2007,987600,9),
(135,'Duane','Greenholt',1990,896411,9),
(136,'Lenora','Gusikowski',1985,814633,10),
(137,'Giovanni','Schmeler',2003,626045,10),
(138,'Virgil','Collier',2001,365252,10),
(139,'Wilbert','Ebert',2007,153554,10),
(140,'Reta','Leuschke',1988,421091,10),
(141,'Tavares','Hintz',1989,177123,10),
(142,'Abe','Mante',1998,469968,10),
(143,'Kiley','Jenkins',1997,722547,10),
(144,'Dominic','Jaskolski',1983,497906,10),
(145,'Nelda','Mueller',1985,571232,10),
(146,'Delilah','Johnston',2001,847764,10),
(147,'Weldon','Orn',2006,920468,10),
(148,'Ansley','Lebsack',1985,753885,10),
(149,'Gisselle','Gibson',1991,644442,10),
(150,'Patricia','Maggio',1999,170342,10),
(151,'Darron','Kunze',1991,877031,11),
(152,'Camille','Langworth',1995,902628,11),
(153,'Arlo','Hartmann',2006,541957,11),
(154,'Phoebe','Roob',2000,520468,11),
(155,'Avis','Block',1985,731218,11),
(156,'Jacey','Von',2005,289316,11),
(157,'Johanna','O\'Hara',2000,410339,11),
(158,'Casimir','Daniel',2002,129313,11),
(159,'Scot','Ernser',2003,871940,11),
(160,'Percival','Erdman',1987,686886,11),
(161,'Isabella','Price',1994,393807,11),
(162,'Velda','Windler',2001,414708,11),
(163,'Terence','Carter',1986,893355,11),
(164,'Ellie','Oberbrunner',1983,734469,11),
(165,'Donna','Waters',2006,443858,11),
(166,'Meta','Lindgren',1992,721785,12),
(167,'Sophia','Hintz',1988,709372,12),
(168,'Margarita','Emard',1993,883675,12),
(169,'Nash','Reinger',1992,750544,12),
(170,'Wilburn','Ruecker',1993,452397,12),
(171,'Audrey','Boehm',1991,807544,12),
(172,'Brendon','Wuckert',1983,522322,12),
(173,'Janelle','Bednar',1999,169753,12),
(174,'Tatyana','Reinger',2003,930095,12),
(175,'Lelia','Champlin',1994,179889,12),
(176,'Darlene','Little',2000,836127,12),
(177,'Heber','Dibbert',1995,695431,12),
(178,'Grayson','Lindgren',1983,416173,12),
(179,'Elinore','Pfeffer',1984,859383,12),
(180,'Audra','Hahn',1990,306876,12),
(181,'Garret','Lind',1984,718795,13),
(182,'Halle','Streich',1987,813682,13),
(183,'Candice','Jacobson',1985,306911,13),
(184,'Bertrand','Tremblay',1987,746006,13),
(185,'Tracy','Leuschke',1997,566454,13),
(186,'Destiney','Schneider',2002,567740,13),
(187,'Cesar','Nienow',2005,442484,13),
(188,'Jewel','Schulist',2005,363507,13),
(189,'Eladio','Stiedemann',2006,777059,13),
(190,'Angie','Larkin',1996,554325,13),
(191,'Marietta','Murray',1988,843065,13),
(192,'Leonardo','Fahey',1999,233536,13),
(193,'Carolanne','Veum',1991,285205,13),
(194,'Dan','Becker',1999,528158,13),
(195,'Karina','Wilkinson',2002,976219,13),
(196,'Bessie','Runolfsson',1985,929056,14),
(197,'Vincenzo','Veum',2001,246055,14),
(198,'Eddie','Schmidt',2002,244892,14),
(199,'Weldon','O\'Reilly',1985,373304,14),
(200,'Ayla','Kihn',1989,514373,14),
(201,'Armand','Rempel',1996,250175,14),
(202,'Mossie','Rempel',1988,578529,14),
(203,'Toney','Maggio',2006,550825,14),
(204,'Alfredo','Nolan',1988,680200,14),
(205,'Jaylen','Balistreri',1987,274253,14),
(206,'Adan','Reinger',2001,425580,14),
(207,'Shayna','McGlynn',1996,778174,14),
(208,'Stevie','Romaguera',1989,573370,14),
(209,'Una','Stroman',2001,825293,14),
(210,'Prudence','Miller',1985,629077,14),
(211,'Ivah','Schuppe',2005,554379,15),
(212,'Brennan','Walter',2004,571913,15),
(213,'Elva','Cole',2000,843870,15),
(214,'Dagmar','Armstrong',1993,199263,15),
(215,'Martina','Boyer',2003,126408,15),
(216,'Adele','Hyatt',1983,295854,15),
(217,'Drew','Schuppe',1987,188780,15),
(218,'Amely','Schmitt',1997,286867,15),
(219,'Deion','Yost',1997,517961,15),
(220,'Lyla','Thompson',1990,529456,15),
(221,'Shaylee','Marvin',1985,452150,15),
(222,'Aron','Brown',1997,247556,15),
(223,'Jaquelin','Macejkovic',1996,816524,15),
(224,'Clinton','Fritsch',2001,806182,15),
(225,'Stanley','Greenholt',2003,620010,15),
(226,'Richmond','Beatty',1991,391045,16),
(227,'Jewell','Roob',1986,937366,16),
(228,'Carli','Weissnat',1998,536366,16),
(229,'Jayson','Brekke',1993,166229,16),
(230,'Jean','Powlowski',2002,556529,16),
(231,'Grace','Herman',2004,132551,16),
(232,'Ford','Corwin',1987,194910,16),
(233,'Maud','Stokes',1983,648992,16),
(234,'Tristin','Funk',2005,974415,16),
(235,'Ethan','Leannon',1999,326844,16),
(236,'Dylan','McLaughlin',1992,334328,16),
(237,'Cortney','Wehner',2000,959933,16),
(238,'Mathias','King',1987,107870,16),
(239,'Jessie','Boyer',2005,100608,16),
(240,'Madisyn','Thompson',2002,796568,16),
(241,'Mallie','Sanford',1984,546052,17),
(242,'Cara','McLaughlin',1992,223169,17),
(243,'Amos','Zemlak',1987,499763,17),
(244,'Peyton','Ratke',1997,484128,17),
(245,'Alexandra','Lind',2005,580333,17),
(246,'Westley','Rodriguez',2002,635240,17),
(247,'Corrine','Ullrich',1986,137243,17),
(248,'Murray','Schmidt',2000,352039,17),
(249,'Freddie','Walker',1993,719940,17),
(250,'Brady','Nolan',2006,173322,17),
(251,'Quincy','Franecki',2003,801790,17),
(252,'Kaela','West',1988,917649,17),
(253,'Maryse','Goldner',1990,286453,17),
(254,'Casandra','Huel',2004,662198,17),
(255,'Elian','Mitchell',1985,932283,17),
(256,'Hailey','Wehner',2003,893643,18),
(257,'Jany','Friesen',1998,636033,18),
(258,'Deontae','Funk',1992,857384,18),
(259,'Rolando','Welch',1991,842352,18),
(260,'Angelo','Sawayn',1990,310910,18),
(261,'Albert','Lind',1985,474749,18),
(262,'Trycia','Feil',1987,667477,18),
(263,'Dangelo','Johns',2006,580182,18),
(264,'Domingo','Volkman',1983,139429,18),
(265,'Alden','Blick',2001,143525,18),
(266,'Carey','Harris',1989,444977,18),
(267,'Kaleb','Feest',1997,896851,18),
(268,'Carmelo','Balistreri',2002,128434,18),
(269,'Kelli','O\'Kon',1988,359164,18),
(270,'Ali','Nitzsche',2006,505877,18),
(271,'Alejandrin','Bruen',1990,417770,19),
(272,'Graham','Gusikowski',1983,797721,19),
(273,'Arlo','Tillman',1998,936789,19),
(274,'Dustin','Cummerata',1995,600244,19),
(275,'Obie','Volkman',1989,995400,19),
(276,'Haylie','Kemmer',1983,527772,19),
(277,'Miller','Deckow',2005,899973,19),
(278,'Alphonso','Kautzer',2003,410074,19),
(279,'Wallace','Schmidt',2003,471329,19),
(280,'Camila','Aufderhar',1987,365537,19),
(281,'Dee','Willms',1999,542477,19),
(282,'Esperanza','Lind',2001,292479,19),
(283,'Waino','Ledner',2003,167129,19),
(284,'Elton','Schmitt',1995,264117,19),
(285,'Narciso','Klocko',1989,642149,19),
(286,'Rosalyn','Hintz',1996,579599,20),
(287,'Coby','Okuneva',1988,477130,20),
(288,'Shyanne','Lehner',2003,493989,20),
(289,'Ahmad','Daugherty',1993,879075,20),
(290,'George','Turcotte',1984,861790,20),
(291,'Davion','Gaylord',1998,591124,20),
(292,'Luz','Kilback',2006,722577,20),
(293,'Kyleigh','White',1991,156157,20),
(294,'Elena','Schmidt',1991,614030,20),
(295,'Reilly','Simonis',1984,457774,20),
(296,'Hadley','Johnson',1997,690993,20),
(297,'Monserrate','Romaguera',1988,729008,20),
(298,'Santa','Franecki',1993,849635,20),
(299,'Cathryn','Jakubowski',1991,542101,20),
(300,'Rylan','Huel',1983,322315,20),
(301,'Aron','Monahan',1985,161285,21),
(302,'Lennie','Moen',1987,187215,21),
(303,'Frida','Dicki',2006,630553,21),
(304,'Frida','Rau',1989,935919,21),
(305,'Milo','Keeling',1994,513106,21),
(306,'Zane','Mertz',1991,720911,21),
(307,'Sydney','Koepp',1991,897833,21),
(308,'Kianna','Hauck',2004,521118,21),
(309,'Dale','Feest',1998,956207,21),
(310,'Mya','Trantow',1985,704065,21),
(311,'Courtney','Dibbert',1991,744130,21),
(312,'Shana','Langosh',1993,116347,21),
(313,'Eino','Rempel',1983,452006,21),
(314,'Yasmeen','Lebsack',1994,410125,21),
(315,'Orion','Runte',1988,525403,21),
(316,'Rosalia','Brown',1995,477929,22),
(317,'Gunner','Windler',2001,259837,22),
(318,'Hazel','Ebert',1996,914717,22),
(319,'Rachelle','Simonis',2004,604375,22),
(320,'Eddie','Goodwin',2003,994277,22),
(321,'Vincenza','Little',2005,625585,22),
(322,'Percy','Dare',1990,252753,22),
(323,'Danielle','Prohaska',1985,443761,22),
(324,'Chad','Franecki',1984,520031,22),
(325,'Leo','Ziemann',1995,286801,22),
(326,'Lulu','Altenwerth',2006,765205,22),
(327,'Kaya','Purdy',1986,178743,22),
(328,'Melvin','Botsford',1986,518105,22),
(329,'Jerrold','Steuber',2001,867849,22),
(330,'Damion','Brown',1998,574528,22),
(331,'General','Langworth',2007,116837,NULL),
(337,'Rosanna','Stiedemann',1992,227255,NULL),
(338,'Lea','Hills',1988,543367,NULL),
(339,'Ora','Sawayn',2001,591105,NULL),
(340,'Kelli','Schoen',1987,329339,NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `coach` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `budget` double(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teams_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES
(1,'West Demario United','Mose Pacocha','International',7302762.00),
(2,'Nolanborough CF','Kenyon Strosin','International',9639480.00),
(3,'New Timmy Assoc','Landen Romaguera','National',8102772.00),
(4,'North Corene AS','Randy Stiedemann','Local',8830398.00),
(5,'East Danielleport CF','Marvin O\'Kon','National',7410220.00),
(6,'West Arno CF','Giles Langworth','Local',9925858.00),
(7,'South Raheem AS','Colten Bashirian','International',6966189.00),
(8,'Conroyport United','Madisyn Bailey','National',4502547.00),
(9,'Lake Demarcus AS','Oleta Pfannerstill','National',7818084.00),
(10,'Colliermouth Assoc','Ellen Heller','Local',4536395.00),
(11,'Walshberg AE','Lilian Veum','Local',2873638.00),
(12,'Everardoburgh UE','Tavares O\'Reilly','Local',8983161.00),
(13,'Johnsland AS','Yolanda Mertz','International',6734297.00),
(14,'Macejkovicview UE','Kadin Grady','Local',1948168.00),
(15,'East Darien Assoc','Lance Ritchie','Local',5810224.00),
(16,'West Kristian AS','Brandyn Thiel','National',3077891.00),
(17,'Stokesfurt United','Shayne Huel','International',2857686.00),
(18,'Jonesview CF','Savanna Wiza','International',1659447.00),
(19,'Port Hughview United','Lance Deckow','National',4566584.00),
(20,'Padbergland AS','Ladarius Kuphal','National',2369531.00),
(21,'Garnetfort UE','Warren Murphy','Local',2733327.00),
(22,'North Bria AE','Keith Will','Local',3228596.00);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2023-03-02 19:25:06
