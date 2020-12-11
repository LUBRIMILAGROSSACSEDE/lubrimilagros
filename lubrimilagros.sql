-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: 127.0.0.1	Database: lubrimilagros
-- ------------------------------------------------------
-- Server version 	5.7.24
-- Date: Sun, 06 Dec 2020 13:17:50 -0500

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `card_brands`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_brands`
--

LOCK TABLES `card_brands` WRITE;
/*!40000 ALTER TABLE `card_brands` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `card_brands` VALUES (1,'Visa'),(2,'Mastercard');
/*!40000 ALTER TABLE `card_brands` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `card_brands` with 2 row(s)
--

--
-- Table structure for table `client_payments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `date_of_payment` date NOT NULL,
  `payment_method_type_id` int(10) unsigned NOT NULL,
  `has_card` tinyint(1) NOT NULL DEFAULT '0',
  `card_brand_id` int(10) unsigned DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` decimal(12,2) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_payments_client_id_foreign` (`client_id`),
  KEY `client_payments_card_brand_id_foreign` (`card_brand_id`),
  KEY `client_payments_payment_method_type_id_foreign` (`payment_method_type_id`),
  CONSTRAINT `client_payments_card_brand_id_foreign` FOREIGN KEY (`card_brand_id`) REFERENCES `card_brands` (`id`),
  CONSTRAINT `client_payments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `client_payments_payment_method_type_id_foreign` FOREIGN KEY (`payment_method_type_id`) REFERENCES `payment_method_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_payments`
--

LOCK TABLES `client_payments` WRITE;
/*!40000 ALTER TABLE `client_payments` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `client_payments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `client_payments` with 0 row(s)
--

--
-- Table structure for table `clients`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hostname_id` bigint(20) unsigned DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `locked_users` tinyint(1) NOT NULL DEFAULT '0',
  `locked_tenant` tinyint(1) NOT NULL DEFAULT '0',
  `locked_emission` tinyint(1) NOT NULL DEFAULT '0',
  `plan_id` int(10) unsigned NOT NULL,
  `start_billing_cycle` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_hostname_id_foreign` (`hostname_id`),
  KEY `clients_plan_id_foreign` (`plan_id`),
  CONSTRAINT `clients_hostname_id_foreign` FOREIGN KEY (`hostname_id`) REFERENCES `hostnames` (`id`) ON DELETE CASCADE,
  CONSTRAINT `clients_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `clients` VALUES (1,1,'20605110267','MULTISERVICIOS LUBRICENTRO MILAGROS S.A.C. - LUBRIMILAGROS S.A.C.','miguelhjj1991@gmail.com','ZeUVSXrBf4ZBBXkxvupNV94LDxgiQsNMTTFRINwqMT2qWHydhr',0,0,0,0,1,'2020-09-12','2020-08-23 23:34:23','2020-09-30 21:47:31');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `clients` with 1 row(s)
--

--
-- Table structure for table `configurations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locked_admin` tinyint(1) NOT NULL DEFAULT '0',
  `certificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soap_send_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '01',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `soap_type_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '01',
  `soap_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soap_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soap_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_public_culqui` text COLLATE utf8mb4_unicode_ci,
  `token_private_culqui` text COLLATE utf8mb4_unicode_ci,
  `url_apiruc` text COLLATE utf8mb4_unicode_ci,
  `token_apiruc` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `configurations` VALUES (1,0,'certificate_admin_master.pem','01','2020-08-23 23:18:31','2020-09-30 23:59:02','01','20605110267M19H91JE','MbATEmCD91',NULL,NULL,NULL,'https://apiperu.dev','825673c9e6d460698ac8f703f4939a12410279feabe0b5bdc0b1a85cccfe75f7');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `configurations` with 1 row(s)
--

--
-- Table structure for table `hostnames`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostnames` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fqdn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `force_https` tinyint(1) NOT NULL DEFAULT '0',
  `under_maintenance_since` timestamp NULL DEFAULT NULL,
  `website_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostnames_fqdn_unique` (`fqdn`),
  KEY `hostnames_website_id_foreign` (`website_id`),
  CONSTRAINT `hostnames_website_id_foreign` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostnames`
--

LOCK TABLES `hostnames` WRITE;
/*!40000 ALTER TABLE `hostnames` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `hostnames` VALUES (1,'lubrimilagros.jeremias.pe',NULL,0,NULL,1,'2020-08-23 23:34:23','2020-08-23 23:34:23',NULL);
/*!40000 ALTER TABLE `hostnames` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `hostnames` with 1 row(s)
--

--
-- Table structure for table `migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_01_01_000003_tenancy_websites',1),(4,'2017_01_01_000005_tenancy_hostnames',1),(5,'2018_04_06_000001_tenancy_websites_needs_db_host',1),(6,'2019_01_28_092812_create_plans_table',1),(7,'2019_01_29_094116_create_plan_documents_table',1),(8,'2019_01_29_170027_create_clients_table',1),(9,'2019_02_27_165906_change_data_to_plans',1),(10,'2019_07_03_094112_create_card_brands_table',1),(11,'2019_07_03_094441_create_payment_method_types_table',1),(12,'2019_07_03_100132_create_client_payments_table',1),(13,'2019_07_19_163317_add_locked_emission_to_clients',1),(14,'2019_10_09_100840_add_locked_tenant_to_clients',1),(15,'2019_10_09_141307_create_configurations_table',1),(16,'2019_10_11_153451_add_locked_users_to_clients',1),(17,'2019_11_07_155742_create_modules_table',1),(18,'2019_11_14_211509_add_start_billing_cycle_to_clients',1),(19,'2020_02_01_131218_add_certificate_to_configurations',1),(20,'2020_02_01_182806_add_soap_to_configurations',1),(21,'2020_03_10_165827_add_data_module_for_finance',1),(22,'2020_03_31_151819_add_phone_users',1),(23,'2020_07_03_232125_add_culqi_to_configurations',1),(24,'2020_07_27_184250_add_apiruc_to_configurations',1),(25,'2020_09_07_110230_add_data_module_for_establishments_users',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `migrations` with 25 row(s)
--

--
-- Table structure for table `modules`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `modules` VALUES (1,'documents','Ventas',NULL,NULL),(2,'purchases','Compras',NULL,NULL),(3,'advanced','Documentos Avanzados',NULL,NULL),(4,'reports','Reportes',NULL,NULL),(5,'configuration','Configuración',NULL,NULL),(6,'pos','Punto de venta (POS)',NULL,NULL),(7,'dashboard','Dashboard',NULL,NULL),(8,'inventory','Inventario',NULL,NULL),(9,'accounting','Contabilidad',NULL,NULL),(10,'ecommerce','Ecommerce',NULL,NULL),(11,'cuenta','Cuenta',NULL,NULL),(12,'finance','Finanzas',NULL,NULL),(14,'establishments','Usuarios/Locales & Series',NULL,NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `modules` with 13 row(s)
--

--
-- Table structure for table `password_resets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `password_resets` with 0 row(s)
--

--
-- Table structure for table `payment_method_types`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_card` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method_types`
--

LOCK TABLES `payment_method_types` WRITE;
/*!40000 ALTER TABLE `payment_method_types` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `payment_method_types` VALUES (1,'Efectivo',0),(2,'Tarjeta de crédito',1),(3,'Tarjeta de débito',1),(4,'Transferencia',0);
/*!40000 ALTER TABLE `payment_method_types` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `payment_method_types` with 4 row(s)
--

--
-- Table structure for table `plan_documents`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_documents`
--

LOCK TABLES `plan_documents` WRITE;
/*!40000 ALTER TABLE `plan_documents` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `plan_documents` VALUES (1,'Facturas, boletas, notas de débito y crédito, resúmenes y anulaciones'),(2,'Guias de remisión'),(3,'Retenciones'),(4,'Percepciones');
/*!40000 ALTER TABLE `plan_documents` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `plan_documents` with 4 row(s)
--

--
-- Table structure for table `plans`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pricing` double NOT NULL,
  `limit_users` bigint(20) NOT NULL,
  `limit_documents` bigint(20) NOT NULL,
  `plan_documents` json NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `plans` VALUES (1,'Ilimitado',99,0,0,'[1, 2, 3, 4]',1,'2020-08-23 23:18:36','2020-08-23 23:18:36');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `plans` with 1 row(s)
--

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `users` VALUES (1,'Admin Instrador','admin@gmail.com',NULL,'$2y$10$gKDY38SnOAjWWw0TA8uzRe26T3zhm811eMjrNz48c9ISb9QbWP/cW',NULL,'53PgTENXaxmFtVa2eN1I29ngz1NrPgUs8dyhF743wVRGezBwHl3IArDd7mjI','2020-08-23 23:18:36','2020-08-23 23:18:36',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `users` with 1 row(s)
--

--
-- Table structure for table `websites`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `managed_by_database_connection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'References the database connection key in your database.php',
  PRIMARY KEY (`id`),
  UNIQUE KEY `websites_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websites`
--

LOCK TABLES `websites` WRITE;
/*!40000 ALTER TABLE `websites` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `websites` VALUES (1,'tenancy_lubrimilagros','2020-08-23 23:25:33','2020-08-23 23:25:33',NULL,NULL);
/*!40000 ALTER TABLE `websites` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `websites` with 1 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Sun, 06 Dec 2020 13:17:51 -0500
