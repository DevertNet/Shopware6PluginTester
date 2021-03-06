-- MySQL dump 10.16  Distrib 10.2.30-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.2.30-MariaDB-1:10.2.30+maria~bionic-log

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
-- Table structure for table `acl_resource`
--

DROP TABLE IF EXISTS `acl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_resource` (
  `resource` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acl_role_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`resource`,`privilege`,`acl_role_id`),
  KEY `fk.acl_resource.acl_role_id` (`acl_role_id`),
  CONSTRAINT `fk.acl_resource.acl_role_id` FOREIGN KEY (`acl_role_id`) REFERENCES `acl_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_resource`
--

LOCK TABLES `acl_resource` WRITE;
/*!40000 ALTER TABLE `acl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_role`
--

DROP TABLE IF EXISTS `acl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_role` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_role`
--

LOCK TABLES `acl_role` WRITE;
/*!40000 ALTER TABLE `acl_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_user_role`
--

DROP TABLE IF EXISTS `acl_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_user_role` (
  `user_id` binary(16) NOT NULL,
  `acl_role_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`acl_role_id`),
  KEY `fk.acl_user_role.acl_role_id` (`acl_role_id`),
  CONSTRAINT `fk.acl_user_role.acl_role_id` FOREIGN KEY (`acl_role_id`) REFERENCES `acl_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk.acl_user_role.user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_user_role`
--

LOCK TABLES `acl_user_role` WRITE;
/*!40000 ALTER TABLE `acl_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_config`
--

DROP TABLE IF EXISTS `app_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_config` (
  `key` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `value` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_config`
--

LOCK TABLES `app_config` WRITE;
/*!40000 ALTER TABLE `app_config` DISABLE KEYS */;
INSERT INTO `app_config` VALUES ('cache-id','319ea3ae54fb4455940c5d4d6459da3d');
/*!40000 ALTER TABLE `app_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `line_item_count` varchar(42) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` binary(16) NOT NULL,
  `shipping_method_id` binary(16) NOT NULL,
  `payment_method_id` binary(16) NOT NULL,
  `country_id` binary(16) NOT NULL,
  `customer_id` binary(16) DEFAULT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `fk.cart.country_id` (`country_id`),
  KEY `fk.cart.currency_id` (`currency_id`),
  KEY `fk.cart.customer_id` (`customer_id`),
  KEY `fk.cart.payment_method_id` (`payment_method_id`),
  KEY `fk.cart.shipping_method_id` (`shipping_method_id`),
  KEY `fk.cart.sales_channel_id` (`sales_channel_id`),
  CONSTRAINT `fk.cart.country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.cart.currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.cart.customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.cart.payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.cart.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.cart.shipping_method_id` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `auto_increment` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` binary(16) DEFAULT NULL,
  `parent_version_id` binary(16) DEFAULT NULL,
  `media_id` binary(16) DEFAULT NULL,
  `cms_page_id` binary(16) DEFAULT NULL,
  `path` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_category_id` binary(16) DEFAULT NULL,
  `after_category_version_id` binary(16) DEFAULT NULL,
  `level` int(11) unsigned NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `child_count` int(11) unsigned NOT NULL DEFAULT 0,
  `display_nested_products` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `visible` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  UNIQUE KEY `auto_increment` (`auto_increment`),
  KEY `idx.level` (`level`),
  KEY `fk.category.media_id` (`media_id`),
  KEY `fk.category.parent_id` (`parent_id`,`parent_version_id`),
  KEY `fk.category.after_category_id` (`after_category_id`,`after_category_version_id`),
  KEY `fk.category.cms_page_id` (`cms_page_id`),
  CONSTRAINT `fk.category.after_category_id` FOREIGN KEY (`after_category_id`, `after_category_version_id`) REFERENCES `category` (`id`, `version_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk.category.cms_page_id` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_page` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.category.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk.category.parent_id` FOREIGN KEY (`parent_id`, `parent_version_id`) REFERENCES `category` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('����A�2�N�(','���jK¾K��u,4%',1,NULL,NULL,NULL,'iTw�.�C��>���:',NULL,NULL,NULL,1,1,3,1,1,'page','2020-04-04 21:03:14.391','2020-04-04 21:05:17.619'),('�@W��O��ř�1xh','���jK¾K��u,4%',3,'w�Y�f�L�����9��','���jK¾K��u,4%',NULL,'Ru�Ύ�EB�)n��C��','|0c8312bca2c0411d82320304db4e9f28|77b959cf66de4c1590c7f9b7da3982f3|',NULL,'���jK¾K��u,4%',3,1,0,1,1,'page','2020-04-04 21:05:17.625',NULL),('!�,��F.�D��*C�3','���jK¾K��u,4%',8,'��&#Fo�7G\'�d','���jK¾K��u,4%',NULL,'Ru�Ύ�EB�)n��C��','|0c8312bca2c0411d82320304db4e9f28|a515ae260223466f8e37471d279e6406|','�鴄�OD�Gt��~H\\','���jK¾K��u,4%',3,1,0,1,1,'page','2020-04-04 21:05:17.637',NULL),('%H��Bޅd?_�ؐQ','���jK¾K��u,4%',9,'����A�2�N�(','���jK¾K��u,4%',NULL,'Ru�Ύ�EB�)n��C��','|0c8312bca2c0411d82320304db4e9f28|','��&#Fo�7G\'�d','���jK¾K��u,4%',2,1,0,1,1,'page','2020-04-04 21:05:17.641',NULL),('H�C/�A8�&0A9�','���jK¾K��u,4%',4,'w�Y�f�L�����9��','���jK¾K��u,4%',NULL,'Ru�Ύ�EB�)n��C��','|0c8312bca2c0411d82320304db4e9f28|77b959cf66de4c1590c7f9b7da3982f3|','�@W��O��ř�1xh','���jK¾K��u,4%',3,1,0,1,1,'page','2020-04-04 21:05:17.628',NULL),('w�Y�f�L�����9��','���jK¾K��u,4%',2,'����A�2�N�(','���jK¾K��u,4%',NULL,'Ru�Ύ�EB�)n��C��','|0c8312bca2c0411d82320304db4e9f28|',NULL,'���jK¾K��u,4%',2,0,3,1,1,'page','2020-04-04 21:05:17.622',NULL),('�鴄�OD�Gt��~H\\','���jK¾K��u,4%',7,'��&#Fo�7G\'�d','���jK¾K��u,4%',NULL,'Ru�Ύ�EB�)n��C��','|0c8312bca2c0411d82320304db4e9f28|a515ae260223466f8e37471d279e6406|',NULL,'���jK¾K��u,4%',3,1,0,1,1,'page','2020-04-04 21:05:17.634',NULL),('��&#Fo�7G\'�d','���jK¾K��u,4%',6,'����A�2�N�(','���jK¾K��u,4%',NULL,'Ru�Ύ�EB�)n��C��','|0c8312bca2c0411d82320304db4e9f28|','w�Y�f�L�����9��','���jK¾K��u,4%',2,1,2,1,1,'page','2020-04-04 21:05:17.632',NULL),('�\"�[��@���[u�','���jK¾K��u,4%',5,'w�Y�f�L�����9��','���jK¾K��u,4%',NULL,'Ru�Ύ�EB�)n��C��','|0c8312bca2c0411d82320304db4e9f28|77b959cf66de4c1590c7f9b7da3982f3|','H�C/�A8�&0A9�','���jK¾K��u,4%',3,1,0,1,1,'page','2020-04-04 21:05:17.630',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_tag`
--

DROP TABLE IF EXISTS `category_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_tag` (
  `category_id` binary(16) NOT NULL,
  `category_version_id` binary(16) NOT NULL,
  `tag_id` binary(16) NOT NULL,
  PRIMARY KEY (`category_id`,`category_version_id`,`tag_id`),
  KEY `fk.category_tag.tag_id` (`tag_id`),
  CONSTRAINT `fk.category_tag.category_tag__category_version_id` FOREIGN KEY (`category_id`, `category_version_id`) REFERENCES `category` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.category_tag.tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_tag`
--

LOCK TABLES `category_tag` WRITE;
/*!40000 ALTER TABLE `category_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translation`
--

DROP TABLE IF EXISTS `category_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translation` (
  `category_id` binary(16) NOT NULL,
  `category_version_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breadcrumb` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `external_link` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `slot_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`category_id`,`category_version_id`,`language_id`),
  KEY `fk.category_translation.language_id` (`language_id`),
  CONSTRAINT `fk.category_translation.category_id` FOREIGN KEY (`category_id`, `category_version_id`) REFERENCES `category` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.category_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.category_translation.custom_fields` CHECK (json_valid(`custom_fields`)),
  CONSTRAINT `json.category_translation.slot_config` CHECK (json_valid(`slot_config`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translation`
--

LOCK TABLES `category_translation` WRITE;
/*!40000 ALTER TABLE `category_translation` DISABLE KEYS */;
INSERT INTO `category_translation` VALUES ('����A�2�N�(','���jK¾K��u,4%','/�_��Mp�XT�|��','Catalogue #1','{\"0c8312bca2c0411d82320304db4e9f28\":\"Catalogue #1\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:14.392','2020-04-04 21:05:17.619',NULL),('����A�2�N�(','���jK¾K��u,4%','�/p�L���M�4�8','Katalog #1','{\"0c8312bca2c0411d82320304db4e9f28\":\"Katalog #1\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:14.393','2020-04-04 21:05:17.618',NULL),('�@W��O��ř�1xh','���jK¾K��u,4%','/�_��Mp�XT�|��','Bakery products','{\"0c8312bca2c0411d82320304db4e9f28\":\"Catalogue #1\",\"77b959cf66de4c1590c7f9b7da3982f3\":\"Food\",\"19ca405790ff4f07aac8c599d4317868\":\"Bakery products\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.625',NULL,NULL),('�@W��O��ř�1xh','���jK¾K��u,4%','�/p�L���M�4�8','Backwaren','{\"0c8312bca2c0411d82320304db4e9f28\":\"Katalog #1\",\"77b959cf66de4c1590c7f9b7da3982f3\":\"Lebensmittel\",\"19ca405790ff4f07aac8c599d4317868\":\"Backwaren\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.624',NULL,NULL),('!�,��F.�D��*C�3','���jK¾K��u,4%','/�_��Mp�XT�|��','Men','{\"0c8312bca2c0411d82320304db4e9f28\":\"Catalogue #1\",\"a515ae260223466f8e37471d279e6406\":\"Clothing\",\"2185182cbbd4462ea844abeb2a438b33\":\"Men\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.637',NULL,NULL),('!�,��F.�D��*C�3','���jK¾K��u,4%','�/p�L���M�4�8','Herren','{\"0c8312bca2c0411d82320304db4e9f28\":\"Katalog #1\",\"a515ae260223466f8e37471d279e6406\":\"Bekleidung\",\"2185182cbbd4462ea844abeb2a438b33\":\"Herren\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.636',NULL,NULL),('%H��Bޅd?_�ؐQ','���jK¾K��u,4%','/�_��Mp�XT�|��','Free time & electronics','{\"0c8312bca2c0411d82320304db4e9f28\":\"Catalogue #1\",\"251448b91bc742de85643f5fccd89051\":\"Free time & electronics\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.641',NULL,NULL),('%H��Bޅd?_�ؐQ','���jK¾K��u,4%','�/p�L���M�4�8','Freizeit & Elektro','{\"0c8312bca2c0411d82320304db4e9f28\":\"Katalog #1\",\"251448b91bc742de85643f5fccd89051\":\"Freizeit & Elektro\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.640',NULL,NULL),('H�C/�A8�&0A9�','���jK¾K��u,4%','/�_��Mp�XT�|��','Fish','{\"0c8312bca2c0411d82320304db4e9f28\":\"Catalogue #1\",\"77b959cf66de4c1590c7f9b7da3982f3\":\"Food\",\"48f97f432fd041388b2630184139cf0e\":\"Fish\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.627',NULL,NULL),('H�C/�A8�&0A9�','���jK¾K��u,4%','�/p�L���M�4�8','Fisch','{\"0c8312bca2c0411d82320304db4e9f28\":\"Katalog #1\",\"77b959cf66de4c1590c7f9b7da3982f3\":\"Lebensmittel\",\"48f97f432fd041388b2630184139cf0e\":\"Fisch\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.627',NULL,NULL),('w�Y�f�L�����9��','���jK¾K��u,4%','/�_��Mp�XT�|��','Food','{\"0c8312bca2c0411d82320304db4e9f28\":\"Catalogue #1\",\"77b959cf66de4c1590c7f9b7da3982f3\":\"Food\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.622',NULL,NULL),('w�Y�f�L�����9��','���jK¾K��u,4%','�/p�L���M�4�8','Lebensmittel','{\"0c8312bca2c0411d82320304db4e9f28\":\"Katalog #1\",\"77b959cf66de4c1590c7f9b7da3982f3\":\"Lebensmittel\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.621',NULL,NULL),('�鴄�OD�Gt��~H\\','���jK¾K��u,4%','/�_��Mp�XT�|��','Women','{\"0c8312bca2c0411d82320304db4e9f28\":\"Catalogue #1\",\"a515ae260223466f8e37471d279e6406\":\"Clothing\",\"8de9b484c54f441c894774e5f57e485c\":\"Women\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.634',NULL,NULL),('�鴄�OD�Gt��~H\\','���jK¾K��u,4%','�/p�L���M�4�8','Damen','{\"0c8312bca2c0411d82320304db4e9f28\":\"Katalog #1\",\"a515ae260223466f8e37471d279e6406\":\"Bekleidung\",\"8de9b484c54f441c894774e5f57e485c\":\"Damen\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.633',NULL,NULL),('��&#Fo�7G\'�d','���jK¾K��u,4%','/�_��Mp�XT�|��','Clothing','{\"0c8312bca2c0411d82320304db4e9f28\":\"Catalogue #1\",\"a515ae260223466f8e37471d279e6406\":\"Clothing\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.631',NULL,NULL),('��&#Fo�7G\'�d','���jK¾K��u,4%','�/p�L���M�4�8','Bekleidung','{\"0c8312bca2c0411d82320304db4e9f28\":\"Katalog #1\",\"a515ae260223466f8e37471d279e6406\":\"Bekleidung\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.631',NULL,NULL),('�\"�[��@���[u�','���jK¾K��u,4%','/�_��Mp�XT�|��','Sweets','{\"0c8312bca2c0411d82320304db4e9f28\":\"Catalogue #1\",\"77b959cf66de4c1590c7f9b7da3982f3\":\"Food\",\"bb22b05bff9140f3808b1cff975b75eb\":\"Sweets\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.629',NULL,NULL),('�\"�[��@���[u�','���jK¾K��u,4%','�/p�L���M�4�8','Süßes','{\"0c8312bca2c0411d82320304db4e9f28\":\"Katalog #1\",\"77b959cf66de4c1590c7f9b7da3982f3\":\"Lebensmittel\",\"bb22b05bff9140f3808b1cff975b75eb\":\"S\\u00fc\\u00dfes\"}',NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.629',NULL,NULL);
/*!40000 ALTER TABLE `category_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_block` (
  `id` binary(16) NOT NULL,
  `cms_section_id` binary(16) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `section_position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'main',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `margin_top` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `margin_bottom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `margin_left` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `margin_right` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_media_id` binary(16) DEFAULT NULL,
  `background_media_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.cms_block.background_media_id` (`background_media_id`),
  KEY `fk.cms_block.cms_section_id` (`cms_section_id`),
  CONSTRAINT `fk.cms_block.background_media_id` FOREIGN KEY (`background_media_id`) REFERENCES `media` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.cms_block.cms_section_id` FOREIGN KEY (`cms_section_id`) REFERENCES `cms_section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.cms_block.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_block`
--

LOCK TABLES `cms_block` WRITE;
/*!40000 ALTER TABLE `cms_block` DISABLE KEYS */;
INSERT INTO `cms_block` VALUES ('\0�R΂L\r�Q�0��:','b`��O�Jˬ�oR4��=',0,'main','text',NULL,0,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:23.089',NULL),('t���CW�`\r��8�','ӝB�aEn��M>�U/�',0,'main','image-text','Category info',1,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:18.723',NULL),('>P�\nC��J�����','\0F�C\"���R�Y',0,'main','text',NULL,0,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:23.079',NULL),('\"��Nx1L�@��2Ȣ�','	v`Z��AP�z��@hN',2,'main','product-listing','Category listing',1,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:18.723',NULL),('=�=��zK��k^&��@\"','&�y&.�OM���d^5Q)',0,'main','text',NULL,0,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:23.050',NULL),('A�v|�O ��܎O}�S','	v`Z��AP�z��@hN',1,'sidebar','category-navigation','Sidebar navigation',1,NULL,'30px',NULL,NULL,NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:18.723',NULL),('C��ң�L�s��H#�E','	v`Z��AP�z��@hN',2,'sidebar','sidebar-filter','Sidebar filter',1,NULL,NULL,NULL,NULL,NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:18.723',NULL),('T�id nGժ�����K','�PX�(1B�+g�>��',0,'main','text',NULL,0,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:23.070',NULL),('|�/<��D���Ɲ!�O�','0�/�Cފs�F�zZ1',0,'main','text',NULL,0,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:23.060',NULL),('��>���H��۱\r\n�\r%','�Tw�.�C��>���:',0,'main','image-cover',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:05:17.593',NULL),('�إ���@6����[���','X�n+KnE>����x8�{',1,'main','form','Contact form',1,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:21.755',NULL),('�J>�}H�����','�/��u�Bڵi������',0,'main','image-text','Category info',1,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:14.486',NULL),('��0D@��4d�N�_','�/��u�Bڵi������',2,'main','product-listing','Category listing',1,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:14.486',NULL),('���F�O��0�x@Y�','�/��u�Bڵi������',1,'main','sidebar-filter','Filter',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:18.713',NULL),('��.�ѶL������u�','�?��xmK��\r�:�m=P',1,'main','form','Newsletter form',1,'20px','20px','20px','20px',NULL,NULL,'cover',NULL,NULL,'2020-04-04 21:03:21.763',NULL);
/*!40000 ALTER TABLE `cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page` (
  `id` binary(16) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_media_id` binary(16) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.cms_page.preview_media_id` (`preview_media_id`),
  CONSTRAINT `fk.cms_page.preview_media_id` FOREIGN KEY (`preview_media_id`) REFERENCES `media` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.cms_page.config` CHECK (json_valid(`config`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page`
--

LOCK TABLES `cms_page` WRITE;
/*!40000 ALTER TABLE `cms_page` DISABLE KEYS */;
INSERT INTO `cms_page` VALUES (':* Q�N�������','page',NULL,NULL,0,NULL,'2020-04-04 21:03:23.047',NULL),('$a���CO�P��Ng|','page',NULL,NULL,0,NULL,'2020-04-04 21:03:23.057',NULL),('Ru�Ύ�EB�)n��C��','product_list',NULL,NULL,1,NULL,'2020-04-04 21:03:14.485',NULL),('iTw�.�C��>���:','landingpage',NULL,NULL,0,NULL,'2020-04-04 21:05:17.593',NULL),('}�V��ZOm�^��~�*','page',NULL,NULL,0,NULL,'2020-04-04 21:03:23.086',NULL),('��Q\r�Bk��oOFi�','product_list',NULL,NULL,1,NULL,'2020-04-04 21:03:18.716',NULL),('��q�~�Ft�?o,p=','page',NULL,NULL,0,NULL,'2020-04-04 21:03:23.076',NULL),('����@{��)I�S%�','page',NULL,NULL,1,NULL,'2020-04-04 21:03:21.760',NULL),('�&nBdl@��g�i%','page',NULL,NULL,0,NULL,'2020-04-04 21:03:23.067',NULL),('��P�	�I���^.��2','page',NULL,NULL,1,NULL,'2020-04-04 21:03:21.752',NULL);
/*!40000 ALTER TABLE `cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translation`
--

DROP TABLE IF EXISTS `cms_page_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_translation` (
  `cms_page_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`cms_page_id`,`language_id`),
  KEY `fk.cms_page_translation.language_id` (`language_id`),
  CONSTRAINT `fk.cms_page_translation.cms_page_id` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.cms_page_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.cms_page_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translation`
--

LOCK TABLES `cms_page_translation` WRITE;
/*!40000 ALTER TABLE `cms_page_translation` DISABLE KEYS */;
INSERT INTO `cms_page_translation` VALUES (':* Q�N�������','/�_��Mp�XT�|��','Payment / Shipping',NULL,'2020-04-04 21:03:23.048',NULL),(':* Q�N�������','�/p�L���M�4�8','Versand und Zahlung',NULL,'2020-04-04 21:03:23.049',NULL),('$a���CO�P��Ng|','/�_��Mp�XT�|��','Terms of service',NULL,'2020-04-04 21:03:23.058',NULL),('$a���CO�P��Ng|','�/p�L���M�4�8','AGB',NULL,'2020-04-04 21:03:23.059',NULL),('Ru�Ύ�EB�)n��C��','/�_��Mp�XT�|��','Default category layout',NULL,'2020-04-04 21:03:14.485',NULL),('Ru�Ύ�EB�)n��C��','�/p�L���M�4�8','Standard Kategorie-Layout',NULL,'2020-04-04 21:03:14.485',NULL),('iTw�.�C��>���:','/�_��Mp�XT�|��','Homepage',NULL,'2020-04-04 21:05:17.587',NULL),('iTw�.�C��>���:','�/p�L���M�4�8','Startseite',NULL,'2020-04-04 21:05:17.586',NULL),('}�V��ZOm�^��~�*','/�_��Mp�XT�|��','Imprint',NULL,'2020-04-04 21:03:23.086',NULL),('}�V��ZOm�^��~�*','�/p�L���M�4�8','Impressum',NULL,'2020-04-04 21:03:23.087',NULL),('��Q\r�Bk��oOFi�','/�_��Mp�XT�|��','Default category layout with sidebar',NULL,'2020-04-04 21:03:18.716',NULL),('��Q\r�Bk��oOFi�','�/p�L���M�4�8','Standard Kategorie-Layout mit Sidebar',NULL,'2020-04-04 21:03:18.716',NULL),('��q�~�Ft�?o,p=','/�_��Mp�XT�|��','Privacy',NULL,'2020-04-04 21:03:23.077',NULL),('��q�~�Ft�?o,p=','�/p�L���M�4�8','Datenschutz',NULL,'2020-04-04 21:03:23.078',NULL),('����@{��)I�S%�','/�_��Mp�XT�|��','Default shop page layout with newsletter form',NULL,'2020-04-04 21:03:21.760',NULL),('����@{��)I�S%�','�/p�L���M�4�8','Standard Shopseiten-Layout mit Newsletterformular',NULL,'2020-04-04 21:03:21.760',NULL),('�&nBdl@��g�i%','/�_��Mp�XT�|��','Right of rescission',NULL,'2020-04-04 21:03:23.068',NULL),('�&nBdl@��g�i%','�/p�L���M�4�8','Widerrufsbelehrungen',NULL,'2020-04-04 21:03:23.068',NULL),('��P�	�I���^.��2','/�_��Mp�XT�|��','Default shop page layout with contact form',NULL,'2020-04-04 21:03:21.752',NULL),('��P�	�I���^.��2','�/p�L���M�4�8','Standard Shopseiten-Layout mit Kontaktformular',NULL,'2020-04-04 21:03:21.752',NULL);
/*!40000 ALTER TABLE `cms_page_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_section`
--

DROP TABLE IF EXISTS `cms_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_section` (
  `id` binary(16) NOT NULL,
  `cms_page_id` binary(16) NOT NULL,
  `position` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `sizing_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'boxed',
  `mobile_behavior` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'wrap',
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_media_id` binary(16) DEFAULT NULL,
  `background_media_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.cms_section.cms_page_id` (`cms_page_id`),
  KEY `fk.cms_section.background_media_id` (`background_media_id`),
  CONSTRAINT `fk.cms_section.background_media_id` FOREIGN KEY (`background_media_id`) REFERENCES `media` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.cms_section.cms_page_id` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.cms_section.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_section`
--

LOCK TABLES `cms_section` WRITE;
/*!40000 ALTER TABLE `cms_section` DISABLE KEYS */;
INSERT INTO `cms_section` VALUES ('\0F�C\"���R�Y','��q�~�Ft�?o,p=',0,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:23.079',NULL),('	v`Z��AP�z��@hN','��Q\r�Bk��oOFi�',1,'sidebar',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:18.719',NULL),('0�/�Cފs�F�zZ1','$a���CO�P��Ng|',0,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:23.060',NULL),('&�y&.�OM���d^5Q)',':* Q�N�������',0,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:23.049',NULL),('X�n+KnE>����x8�{','��P�	�I���^.��2',0,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:21.754',NULL),('b`��O�Jˬ�oR4��=','}�V��ZOm�^��~�*',0,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:23.088',NULL),('�Tw�.�C��>���:','iTw�.�C��>���:',1,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:17.593',NULL),('�PX�(1B�+g�>��','�&nBdl@��g�i%',0,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:23.069',NULL),('ӝB�aEn��M>�U/�','��Q\r�Bk��oOFi�',0,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:18.719',NULL),('�?��xmK��\r�:�m=P','����@{��)I�S%�',0,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:21.762',NULL),('�/��u�Bڵi������','Ru�Ύ�EB�)n��C��',0,'default',NULL,0,'boxed','wrap',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:03:18.002',NULL);
/*!40000 ALTER TABLE `cms_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_slot`
--

DROP TABLE IF EXISTS `cms_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_slot` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `cms_block_id` binary(16) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `fk.cms_slot.cms_block_id` (`cms_block_id`),
  CONSTRAINT `fk.cms_slot.cms_block_id` FOREIGN KEY (`cms_block_id`) REFERENCES `cms_block` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_slot`
--

LOCK TABLES `cms_slot` WRITE;
/*!40000 ALTER TABLE `cms_slot` DISABLE KEYS */;
INSERT INTO `cms_slot` VALUES ('�����Og���?-�\n�','���jK¾K��u,4%','=�=��zK��k^&��@\"','text','content',0,'2020-04-04 21:03:23.051',NULL),('%�����A���ܦ@H','���jK¾K��u,4%','�إ���@6����[���','form','content',1,'2020-04-04 21:03:21.756',NULL),('8t�Z��B�:~u]��','���jK¾K��u,4%','>P�\nC��J�����','text','content',0,'2020-04-04 21:03:23.080',NULL),('D)9��G=���la�b','���jK¾K��u,4%','�J>�}H�����','image','left',1,'2020-04-04 21:03:14.486',NULL),('G\0���LC�7[�PNW','���jK¾K��u,4%','��0D@��4d�N�_','product-listing','content',1,'2020-04-04 21:03:14.486',NULL),('Jg��F����b�p','���jK¾K��u,4%','\0�R΂L\r�Q�0��:','text','content',0,'2020-04-04 21:03:23.089',NULL),('Z�PxĩA��84t4>�','���jK¾K��u,4%','\"��Nx1L�@��2Ȣ�','product-listing','content',1,'2020-04-04 21:03:18.727',NULL),('j�d�-�JF�Y�IKL:\r','���jK¾K��u,4%','C��ң�L�s��H#�E','sidebar-filter','content',1,'2020-04-04 21:03:18.727',NULL),('k���\ZTK巋��Gfk�','���jK¾K��u,4%','C��ң�L�s��H#�E','sidebar-filter','content',1,'2020-04-04 21:03:18.727',NULL),('yՒ�A\'\\y���','���jK¾K��u,4%','���F�O��0�x@Y�','sidebar-filter','content',1,'2020-04-04 21:03:18.714',NULL),('y/�{�G+�N�s�W�j','���jK¾K��u,4%','t���CW�`\r��8�','image','left',1,'2020-04-04 21:03:18.727',NULL),('���y5�Ft��ы�n�z','���jK¾K��u,4%','A�v|�O ��܎O}�S','category-navigation','content',1,'2020-04-04 21:03:18.727',NULL),('�.K��&Hp�Jp#�\'','���jK¾K��u,4%','t���CW�`\r��8�','text','right',1,'2020-04-04 21:03:18.727',NULL),('�N���ZN��f��c/�','���jK¾K��u,4%','��>���H��۱\r\n�\r%','image','image',0,'2020-04-04 21:05:17.593',NULL),('ҊaAm�L���\n9s$Q','���jK¾K��u,4%','�J>�}H�����','text','right',1,'2020-04-04 21:03:14.486',NULL),('�z��~IL�CqEA���','���jK¾K��u,4%','|�/<��D���Ɲ!�O�','text','content',0,'2020-04-04 21:03:23.061',NULL),('�s�;�@�1�/�\\��','���jK¾K��u,4%','��.�ѶL������u�','form','content',1,'2020-04-04 21:03:21.764',NULL),('�D����G��a��o|','���jK¾K��u,4%','T�id nGժ�����K','text','content',0,'2020-04-04 21:03:23.071',NULL);
/*!40000 ALTER TABLE `cms_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_slot_translation`
--

DROP TABLE IF EXISTS `cms_slot_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_slot_translation` (
  `cms_slot_id` binary(16) NOT NULL,
  `cms_slot_version_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`cms_slot_id`,`cms_slot_version_id`,`language_id`),
  KEY `fk.cms_slot_translation.language_id` (`language_id`),
  CONSTRAINT `fk.cms_slot_translation.cms_slot_id` FOREIGN KEY (`cms_slot_id`, `cms_slot_version_id`) REFERENCES `cms_slot` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.cms_slot_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.cms_slot_translation.config` CHECK (json_valid(`config`)),
  CONSTRAINT `json.cms_slot_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_slot_translation`
--

LOCK TABLES `cms_slot_translation` WRITE;
/*!40000 ALTER TABLE `cms_slot_translation` DISABLE KEYS */;
INSERT INTO `cms_slot_translation` VALUES ('�����Og���?-�\n�','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"content\":{\"value\":\"<h2>Payment \\/ Shipping<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.052',NULL),('�����Og���?-�\n�','���jK¾K��u,4%','�/p�L���M�4�8','{\"content\":{\"value\":\"<h2>Versand und Zahlung<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.053',NULL),('%�����A���ܦ@H','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"type\":{\"source\":\"static\",\"value\":\"contact\"},\"mailReceiver\":{\"source\":\"static\",\"value\":[]},\"confirmationText\":{\"source\":\"static\",\"value\":\"\"}}',NULL,'2020-04-04 21:03:21.756',NULL),('%�����A���ܦ@H','���jK¾K��u,4%','�/p�L���M�4�8','{\"type\":{\"source\":\"static\",\"value\":\"contact\"},\"mailReceiver\":{\"source\":\"static\",\"value\":[]},\"confirmationText\":{\"source\":\"static\",\"value\":\"\"}}',NULL,'2020-04-04 21:03:21.756',NULL),('8t�Z��B�:~u]��','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"content\":{\"value\":\"<h2>Privacy<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.081',NULL),('8t�Z��B�:~u]��','���jK¾K��u,4%','�/p�L���M�4�8','{\"content\":{\"value\":\"<h2>Datenschutz<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.082',NULL),('D)9��G=���la�b','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"media\":{\"source\":\"mapped\",\"value\":\"category.media\"},\"displayMode\":{\"source\":\"static\",\"value\":\"cover\"},\"url\":{\"source\":\"static\",\"value\":null},\"newTab\":{\"source\":\"static\",\"value\":false},\"minHeight\":{\"source\":\"static\",\"value\":\"320px\"}}',NULL,'2020-04-04 21:03:14.486',NULL),('D)9��G=���la�b','���jK¾K��u,4%','�/p�L���M�4�8','{\"media\":{\"source\":\"mapped\",\"value\":\"category.media\"},\"displayMode\":{\"source\":\"static\",\"value\":\"cover\"},\"url\":{\"source\":\"static\",\"value\":null},\"newTab\":{\"source\":\"static\",\"value\":false},\"minHeight\":{\"source\":\"static\",\"value\":\"320px\"}}',NULL,'2020-04-04 21:03:14.486',NULL),('G\0���LC�7[�PNW','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"boxLayout\":{\"source\":\"static\",\"value\":\"standard\"}}',NULL,'2020-04-04 21:03:14.486',NULL),('G\0���LC�7[�PNW','���jK¾K��u,4%','�/p�L���M�4�8','{\"boxLayout\":{\"source\":\"static\",\"value\":\"standard\"}}',NULL,'2020-04-04 21:03:14.486',NULL),('Jg��F����b�p','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"content\":{\"value\":\"<h2>Imprint<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.090',NULL),('Jg��F����b�p','���jK¾K��u,4%','�/p�L���M�4�8','{\"content\":{\"value\":\"<h2>Impressum<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.091',NULL),('j�d�-�JF�Y�IKL:\r','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"boxLayout\":{\"source\":\"static\",\"value\":\"standard\"}}',NULL,'2020-04-04 21:03:18.727',NULL),('j�d�-�JF�Y�IKL:\r','���jK¾K��u,4%','�/p�L���M�4�8','{\"boxLayout\":{\"source\":\"static\",\"value\":\"standard\"}}',NULL,'2020-04-04 21:03:18.727',NULL),('yՒ�A\'\\y���','���jK¾K��u,4%','/�_��Mp�XT�|��',NULL,NULL,'2020-04-04 21:03:18.714',NULL),('y/�{�G+�N�s�W�j','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"media\":{\"source\":\"mapped\",\"value\":\"category.media\"},\"displayMode\":{\"source\":\"static\",\"value\":\"cover\"},\"url\":{\"source\":\"static\",\"value\":null},\"newTab\":{\"source\":\"static\",\"value\":false},\"minHeight\":{\"source\":\"static\",\"value\":\"320px\"}}',NULL,'2020-04-04 21:03:18.727',NULL),('y/�{�G+�N�s�W�j','���jK¾K��u,4%','�/p�L���M�4�8','{\"media\":{\"source\":\"mapped\",\"value\":\"category.media\"},\"displayMode\":{\"source\":\"static\",\"value\":\"cover\"},\"url\":{\"source\":\"static\",\"value\":null},\"newTab\":{\"source\":\"static\",\"value\":false},\"minHeight\":{\"source\":\"static\",\"value\":\"320px\"}}',NULL,'2020-04-04 21:03:18.727',NULL),('���y5�Ft��ы�n�z','���jK¾K��u,4%','/�_��Mp�XT�|��',NULL,NULL,'2020-04-04 21:03:18.727',NULL),('���y5�Ft��ы�n�z','���jK¾K��u,4%','�/p�L���M�4�8',NULL,NULL,'2020-04-04 21:03:18.727',NULL),('�.K��&Hp�Jp#�\'','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"content\":{\"source\":\"mapped\",\"value\":\"category.description\"}}',NULL,'2020-04-04 21:03:18.727',NULL),('�.K��&Hp�Jp#�\'','���jK¾K��u,4%','�/p�L���M�4�8','{\"content\":{\"source\":\"mapped\",\"value\":\"category.description\"}}',NULL,'2020-04-04 21:03:18.727',NULL),('�N���ZN��f��c/�','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"url\":{\"value\":null,\"source\":\"static\"},\"media\":{\"value\":\"de4b7dbe9d95435092cb85ce146ced28\",\"source\":\"static\"},\"newTab\":{\"value\":false,\"source\":\"static\"},\"minHeight\":{\"value\":\"340px\",\"source\":\"static\"},\"displayMode\":{\"value\":\"standard\",\"source\":\"static\"}}',NULL,'2020-04-04 21:05:17.593',NULL),('�N���ZN��f��c/�','���jK¾K��u,4%','�/p�L���M�4�8','{\"url\":{\"value\":null,\"source\":\"static\"},\"media\":{\"value\":\"de4b7dbe9d95435092cb85ce146ced28\",\"source\":\"static\"},\"newTab\":{\"value\":false,\"source\":\"static\"},\"minHeight\":{\"value\":\"340px\",\"source\":\"static\"},\"displayMode\":{\"value\":\"standard\",\"source\":\"static\"}}',NULL,'2020-04-04 21:05:17.592',NULL),('ҊaAm�L���\n9s$Q','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"content\":{\"source\":\"mapped\",\"value\":\"category.description\"}}',NULL,'2020-04-04 21:03:14.486',NULL),('ҊaAm�L���\n9s$Q','���jK¾K��u,4%','�/p�L���M�4�8','{\"content\":{\"source\":\"mapped\",\"value\":\"category.description\"}}',NULL,'2020-04-04 21:03:14.486',NULL),('�z��~IL�CqEA���','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"content\":{\"value\":\"<h2>Terms of service<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.062',NULL),('�z��~IL�CqEA���','���jK¾K��u,4%','�/p�L���M�4�8','{\"content\":{\"value\":\"<h2>AGB<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.063',NULL),('�s�;�@�1�/�\\��','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"type\":{\"source\":\"static\",\"value\":\"newsletter\"},\"mailReceiver\":{\"source\":\"static\",\"value\":[]},\"confirmationText\":{\"source\":\"static\",\"value\":\"\"}}',NULL,'2020-04-04 21:03:21.764',NULL),('�s�;�@�1�/�\\��','���jK¾K��u,4%','�/p�L���M�4�8','{\"type\":{\"source\":\"static\",\"value\":\"newsletter\"},\"mailReceiver\":{\"source\":\"static\",\"value\":[]},\"confirmationText\":{\"source\":\"static\",\"value\":\"\"}}',NULL,'2020-04-04 21:03:21.764',NULL),('�D����G��a��o|','���jK¾K��u,4%','/�_��Mp�XT�|��','{\"content\":{\"value\":\"<h2>Right of rescission<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.072',NULL),('�D����G��a��o|','���jK¾K��u,4%','�/p�L���M�4�8','{\"content\":{\"value\":\"<h2>Widerrufsbelehrungen<\\/h2><hr><p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.<\\/p>\",\"source\":\"static\"},\"verticalAlign\":{\"value\":null,\"source\":\"static\"}}',NULL,'2020-04-04 21:03:23.072',NULL);
/*!40000 ALTER TABLE `cms_slot_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` binary(16) NOT NULL,
  `iso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `tax_free` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `iso3` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_state_in_registration` tinyint(1) NOT NULL DEFAULT 0,
  `force_state_in_registration` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `shipping_available` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('\0j�>�NY�cI�H%٢','HU',10,0,1,'HUN',0,0,'2020-04-04 21:03:14.376',NULL,1),('\r��Z�#N�5B���w','IE',10,0,1,'IRL',0,0,'2020-04-04 21:03:14.360',NULL,1),('V�\Zd@ȢMǴq��','AT',10,0,1,'AUT',0,0,'2020-04-04 21:03:14.363',NULL,1),('\Z!�~�K���?��}��','GB',5,0,1,'GBR',0,0,'2020-04-04 21:03:14.291',NULL,1),('\Zrp��H5�3\\=�\"��','SE',10,0,1,'SWE',0,0,'2020-04-04 21:03:14.363',NULL,1),('\"f�J��BF�D�3a�cH','RO',10,0,1,'ROU',0,0,'2020-04-04 21:03:14.377',NULL,1),('&>3	BA��ۃ�+�','ES',10,0,1,'ESP',0,0,'2020-04-04 21:03:14.364',NULL,1),('.R��)fMT����.�(�','LU',10,0,1,'LUX',0,0,'2020-04-04 21:03:14.361',NULL,1),('3Pp�i�G�4��=G:�','FR',10,0,1,'FRA',0,0,'2020-04-04 21:03:14.380',NULL,1),(';[��$J��\Z\n,���9','CA',10,0,1,'CAN',0,0,'2020-04-04 21:03:14.361',NULL,1),('Hv���G���;̸t��','LI',10,0,1,'LIE',0,0,'2020-04-04 21:03:14.375',NULL,1),('LM\Z�Hr��$lsZ��','AU',10,0,1,'AUS',0,0,'2020-04-04 21:03:14.378',NULL,1),('P̯�[�@աA!\rԬ','FI',10,0,1,'FIN',0,0,'2020-04-04 21:03:14.379',NULL,1),('bE�ۢ�Bf���\\���','JP',10,0,1,'JPN',0,0,'2020-04-04 21:03:14.361',NULL,1),('o�9?s�F������]','PT',10,0,1,'PRT',0,0,'2020-04-04 21:03:14.363',NULL,1),('��>,J���#��a','DE',1,0,1,'DEU',0,0,'2020-04-04 21:03:14.263',NULL,1),('��G��A*����MX;','AE',10,0,1,'ARE',0,0,'2020-04-04 21:03:14.375',NULL,1),('�\n��N�Pd�(��','IL',10,0,1,'ISR',0,0,'2020-04-04 21:03:14.378',NULL,1),('��o��O捖9|-��f','IS',10,0,1,'ISL',0,0,'2020-04-04 21:03:14.360',NULL,1),('�a��p�G3�,��Z���','NL',10,0,1,'NLD',0,0,'2020-04-04 21:03:14.362',NULL,1),('�v�QWF��3�\rK�6�','US',10,0,1,'USA',0,0,'2020-04-04 21:03:14.364',NULL,1),('�p���B��Y��`�6','IT',10,0,1,'ITA',0,0,'2020-04-04 21:03:14.360',NULL,1),('Ʒ���H?�D��\n@�o','GR',10,0,1,'GRC',0,0,'2020-04-04 21:03:14.289',NULL,1),('��Ɲr\'Fn�e�|Ps��','PL',10,0,1,'POL',0,0,'2020-04-04 21:03:14.376',NULL,1),('����@��bt�L$�','BR',10,0,1,'BRA',0,0,'2020-04-04 21:03:14.378',NULL,1),('�k���C��:����L�','NO',10,0,1,'NOR',0,0,'2020-04-04 21:03:14.362',NULL,1),('�9R�dmG����,�','DK',10,0,1,'DNK',0,0,'2020-04-04 21:03:14.379',NULL,1),('�mN҆�@e��R*�bP\r','BE',10,0,1,'BEL',0,0,'2020-04-04 21:03:14.379',NULL,1),('��Fm�Ce����R��','CH',10,1,1,'CHE',0,0,'2020-04-04 21:03:14.364',NULL,1),('�¼���LG��f�X','TR',10,0,1,'TUR',0,0,'2020-04-04 21:03:14.376',NULL,1),('�)�8�Di��:�t���','NA',10,0,1,'NAM',0,0,'2020-04-04 21:03:14.362',NULL,1),('�U��O!�t\ZK���','SK',10,0,1,'SVK',0,0,'2020-04-04 21:03:14.377',NULL,1),('��^klC�Q���7�','CZ',10,0,1,'CZE',0,0,'2020-04-04 21:03:14.377',NULL,1);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state`
--

DROP TABLE IF EXISTS `country_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_state` (
  `id` binary(16) NOT NULL,
  `country_id` binary(16) NOT NULL,
  `short_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.country_state.country_id` (`country_id`),
  CONSTRAINT `fk.country_state.country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state`
--

LOCK TABLES `country_state` WRITE;
/*!40000 ALTER TABLE `country_state` DISABLE KEYS */;
INSERT INTO `country_state` VALUES ('\0�Z�4G��?�p�*','\Z!�~�K���?��}��','GB-DGY',1,1,'2020-04-04 21:03:14.350',NULL),('g8��O;�B!�H�','��>,J���#��a','DE-BE',1,1,'2020-04-04 21:03:14.270',NULL),('��!�G��)?�`�','�v�QWF��3�\rK�6�','US-NH',1,1,'2020-04-04 21:03:14.370',NULL),('�>�mA0�X�mBǾ\Z','�v�QWF��3�\rK�6�','US-MA',1,1,'2020-04-04 21:03:14.369',NULL),('�M*IdH��NO�\Z�','\Z!�~�K���?��}��','GB-ABD',1,1,'2020-04-04 21:03:14.349',NULL),('l�ļQA:�z�����','\Z!�~�K���?��}��','GB-BRD',1,1,'2020-04-04 21:03:14.328',NULL),(')C+�Mv���2��$','\Z!�~�K���?��}��','GB-SCT',1,1,'2020-04-04 21:03:14.295',NULL),('���8�H/��\"I0��','\Z!�~�K���?��}��','GB-KIR',1,1,'2020-04-04 21:03:14.330',NULL),('%U��F�R��`��','\Z!�~�K���?��}��','GB-SKP',1,1,'2020-04-04 21:03:14.333',NULL),('=�_�I*�r�5��\n\\','\Z!�~�K���?��}��','GB-WSX',1,1,'2020-04-04 21:03:14.318',NULL),('%�	��A����5�z�','�v�QWF��3�\rK�6�','US-MN',1,1,'2020-04-04 21:03:14.369',NULL),('��|mA1�M�4,��','\Z!�~�K���?��}��','GB-IOW',1,1,'2020-04-04 21:03:14.339',NULL),('	3�_��M���#�w��~','\Z!�~�K���?��}��','GB-BIR',1,1,'2020-04-04 21:03:14.328',NULL),('	U�&�AݕVi�V+�','\Z!�~�K���?��}��','GB-YOR',1,1,'2020-04-04 21:03:14.346',NULL),('=\n(VD�\'�Z�>�','�v�QWF��3�\rK�6�','US-MS',1,1,'2020-04-04 21:03:14.369',NULL),('��ɂ�O��V�3Y�','��>,J���#��a','DE-BW',1,1,'2020-04-04 21:03:14.266',NULL),('�~MK�E$�^a�E�G','�v�QWF��3�\rK�6�','US-WY',1,1,'2020-04-04 21:03:14.375',NULL),('�)9I�@��','�v�QWF��3�\rK�6�','US-AL',1,1,'2020-04-04 21:03:14.365',NULL),(')�vaO,�3��r�1i','�v�QWF��3�\rK�6�','US-ME',1,1,'2020-04-04 21:03:14.368',NULL),('\rG\0���F\0�8P��gg4','\Z!�~�K���?��}��','GB-NET',1,1,'2020-04-04 21:03:14.331',NULL),('\r����IP������m*','��>,J���#��a','DE-TH',1,1,'2020-04-04 21:03:14.288',NULL),('6���UFt��y����','\Z!�~�K���?��}��','GB-SGC',1,1,'2020-04-04 21:03:14.343',NULL),('�ǁ=A���X 3�','\Z!�~�K���?��}��','GB-HMF',1,1,'2020-04-04 21:03:14.322',NULL),('�?�0Gb�a~�B�','\Z!�~�K���?��}��','GB-CHW',1,1,'2020-04-04 21:03:14.337',NULL),('��1��@T�.q��T','\Z!�~�K���?��}��','GB-MLN',1,1,'2020-04-04 21:03:14.352',NULL),('�o�+Ld����m�','\Z!�~�K���?��}��','GB-DNC',1,1,'2020-04-04 21:03:14.329',NULL),('�8�|F~�#��9�[�','��>,J���#��a','DE-SN',1,1,'2020-04-04 21:03:14.284',NULL),('KS$cO��8W��k��','\Z!�~�K���?��}��','GB-SHR',1,1,'2020-04-04 21:03:14.343',NULL),('�si`O��ċ(/','�v�QWF��3�\rK�6�','US-HI',1,1,'2020-04-04 21:03:14.367',NULL),('FN�\Z9@�����I�','\Z!�~�K���?��}��','GB-ESS',1,1,'2020-04-04 21:03:14.307',NULL),('prz�LR���5֑�f','\Z!�~�K���?��}��','GB-NFK',1,1,'2020-04-04 21:03:14.312',NULL),('\Z3}�G�@�=����','\Z!�~�K���?��}��','GB-WSM',1,1,'2020-04-04 21:03:14.327',NULL),('>�}(*O����=O���','\Z!�~�K���?��}��','GB-BGE',1,1,'2020-04-04 21:03:14.355',NULL),('U�r��Ao����^�.N','\Z!�~�K���?��}��','GB-CRY',1,1,'2020-04-04 21:03:14.321',NULL),('����A�&��x�','\Z!�~�K���?��}��','GB-NIR',1,1,'2020-04-04 21:03:14.294',NULL),(':��LJ��K�B\"5','�v�QWF��3�\rK�6�','US-OR',1,1,'2020-04-04 21:03:14.372',NULL),('t�eK�N��Jt����','\Z!�~�K���?��}��','GB-SOL',1,1,'2020-04-04 21:03:14.333',NULL),('},�aM������&.^','��>,J���#��a','DE-MV',1,1,'2020-04-04 21:03:14.278',NULL),('�Cf\0CH;�b,��\n','\Z!�~�K���?��}��','GB-NWP',1,1,'2020-04-04 21:03:14.358',NULL),(' E�%dKw����|k','\Z!�~�K���?��}��','GB-LND',1,1,'2020-04-04 21:03:14.318',NULL),(' R���Cȭ:�A��K�','�v�QWF��3�\rK�6�','US-KS',1,1,'2020-04-04 21:03:14.368',NULL),(' ���Os�����T��','\Z!�~�K���?��}��','GB-LIV',1,1,'2020-04-04 21:03:14.330',NULL),('$Q�.N@F����UI��','\Z!�~�K���?��}��','GB-SFK',1,1,'2020-04-04 21:03:14.316',NULL),('$�79]CR�j�uS�A','\Z!�~�K���?��}��','GB-AGY',1,1,'2020-04-04 21:03:14.357',NULL),('%��P]�B�hn���Ԡ','\Z!�~�K���?��}��','GB-WBK',1,1,'2020-04-04 21:03:14.345',NULL),('&}�t�K����*��','\Z!�~�K���?��}��','GB-ERY',1,1,'2020-04-04 21:03:14.338',NULL),('\'g-K0�C���f	y\\r�','\Z!�~�K���?��}��','GB-UKM',1,1,'2020-04-04 21:03:14.299',NULL),('\'{��|O���//�E��','\Z!�~�K���?��}��','GB-HIL',1,1,'2020-04-04 21:03:14.323',NULL),(')���y~A`��	C+�S�','\Z!�~�K���?��}��','GB-BDG',1,1,'2020-04-04 21:03:14.319',NULL),('+�7���I:�XSl�w�','\Z!�~�K���?��}��','GB-STE',1,1,'2020-04-04 21:03:14.344',NULL),('-nK*��Jҋ��I��','\Z!�~�K���?��}��','GB-IVC',1,1,'2020-04-04 21:03:14.352',NULL),('.&�mb�E˭Ű�?\\^','\Z!�~�K���?��}��','GB-RDB',1,1,'2020-04-04 21:03:14.326',NULL),('.<�G_Dɩ��׺S�','\Z!�~�K���?��}��','GB-PEM',1,1,'2020-04-04 21:03:14.358',NULL),('.�i�)H/���P_�','�v�QWF��3�\rK�6�','US-ID',1,1,'2020-04-04 21:03:14.367',NULL),('.��4OT����މ[~','\Z!�~�K���?��}��','GB-BAS',1,1,'2020-04-04 21:03:14.335',NULL),('/Xh��FC\0��jN�ۥG','\Z!�~�K���?��}��','GB-WRL',1,1,'2020-04-04 21:03:14.335',NULL),('014k)I͸��A&�Hs','\Z!�~�K���?��}��','GB-ENG',1,1,'2020-04-04 21:03:14.293',NULL),('0��s��@��ҙV��e�','\Z!�~�K���?��}��','GB-ESX',1,1,'2020-04-04 21:03:14.306',NULL),('1��aKGW��%>��1','�v�QWF��3�\rK�6�','US-OH',1,1,'2020-04-04 21:03:14.372',NULL),('11	3�H���t.,ɤ','\Z!�~�K���?��}��','GB-PLY',1,1,'2020-04-04 21:03:14.342',NULL),('1���k0J��4���U','�v�QWF��3�\rK�6�','US-MI',1,1,'2020-04-04 21:03:14.369',NULL),('2��}�B����,�F','\Z!�~�K���?��}��','GB-KEN',1,1,'2020-04-04 21:03:14.310',NULL),('3IK�$�C�g�\\���','\Z!�~�K���?��}��','GB-CWY',1,1,'2020-04-04 21:03:14.356',NULL),('3�:�KWB����\'��','\Z!�~�K���?��}��','GB-MEA',1,1,'2020-04-04 21:03:14.348',NULL),('4a�K�N����%�','\Z!�~�K���?��}��','GB-SFT',1,1,'2020-04-04 21:03:14.332',NULL),('5�>l�Cp��*�$��M','\Z!�~�K���?��}��','GB-STS',1,1,'2020-04-04 21:03:14.315',NULL),('6���{nI槢��i�a�','\Z!�~�K���?��}��','GB-RDG',1,1,'2020-04-04 21:03:14.342',NULL),('7rU\r�fH�S���','\Z!�~�K���?��}��','GB-TFW',1,1,'2020-04-04 21:03:14.345',NULL),('7�fA2K�S�\r�\0�','\Z!�~�K���?��}��','GB-CBF',1,1,'2020-04-04 21:03:14.337',NULL),('8�F�M��Q��C\Z','\Z!�~�K���?��}��','GB-BEN',1,1,'2020-04-04 21:03:14.320',NULL),('9ҩ�6 H>��$x�Ar�','��>,J���#��a','DE-SL',1,1,'2020-04-04 21:03:14.283',NULL),(':�,$,M��ȑ[�u�','\Z!�~�K���?��}��','GB-BBD',1,1,'2020-04-04 21:03:14.335',NULL),(';�2�mB7����zw�','\Z!�~�K���?��}��','GB-STT',1,1,'2020-04-04 21:03:14.344',NULL),('<���6VG��۔O$�i','\Z!�~�K���?��}��','GB-BMH',1,1,'2020-04-04 21:03:14.336',NULL),('=� s�5A���3�W��','\Z!�~�K���?��}��','GB-AGB',1,1,'2020-04-04 21:03:14.349',NULL),('>��z=�N\r��J.]�','\Z!�~�K���?��}��','GB-NGM',1,1,'2020-04-04 21:03:14.341',NULL),('?��q�AA������NV','\Z!�~�K���?��}��','GB-BRY',1,1,'2020-04-04 21:03:14.320',NULL),('@��ۗ�O����+�BY�','\Z!�~�K���?��}��','GB-SWK',1,1,'2020-04-04 21:03:14.326',NULL),('A�\n�D&D[��ʽ]��','\Z!�~�K���?��}��','GB-CGN',1,1,'2020-04-04 21:03:14.356',NULL),('B��h�K٘��(0�;','\Z!�~�K���?��}��','GB-SAW',1,1,'2020-04-04 21:03:14.332',NULL),('C5��\\@���ǐ�V6','��>,J���#��a','DE-HH',1,1,'2020-04-04 21:03:14.274',NULL),('D���R�M��F𛞑`L','\Z!�~�K���?��}��','GB-DUD',1,1,'2020-04-04 21:03:14.329',NULL),('F�u\"H����eeY$�','�v�QWF��3�\rK�6�','US-UT',1,1,'2020-04-04 21:03:14.373',NULL),('H/h�H��\r`���','\Z!�~�K���?��}��','GB-VGL',1,1,'2020-04-04 21:03:14.359',NULL),('HR���CΥ�:�H%pO','\Z!�~�K���?��}��','GB-MDB',1,1,'2020-04-04 21:03:14.340',NULL),('H���OK�N���\0L','\Z!�~�K���?��}��','GB-WAR',1,1,'2020-04-04 21:03:14.317',NULL),('I#�\\�J���B!���}','\Z!�~�K���?��}��','GB-WGN',1,1,'2020-04-04 21:03:14.334',NULL),('J�d�joK�/%���','�v�QWF��3�\rK�6�','US-TN',1,1,'2020-04-04 21:03:14.373',NULL),('J�g��L)��:?Yk\"�','�v�QWF��3�\rK�6�','US-VA',1,1,'2020-04-04 21:03:14.374',NULL),('M/�\\��N���A��א�','�v�QWF��3�\rK�6�','US-NE',1,1,'2020-04-04 21:03:14.370',NULL),('N��.hND�}��3wA','\Z!�~�K���?��}��','GB-GRE',1,1,'2020-04-04 21:03:14.322',NULL),('N�F*�@Kş-��H��','�v�QWF��3�\rK�6�','US-CO',1,1,'2020-04-04 21:03:14.366',NULL),('OhVx*CJ�׹�-�','\Z!�~�K���?��}��','GB-SHF',1,1,'2020-04-04 21:03:14.333',NULL),('Pe���ZCI�_\'�qY�P','\Z!�~�K���?��}��','GB-HRT',1,1,'2020-04-04 21:03:14.309',NULL),('P��Jf�\Z��Wqa)','\Z!�~�K���?��}��','GB-DBY',1,1,'2020-04-04 21:03:14.302',NULL),('Q����}Nw�������','\Z!�~�K���?��}��','GB-BNH',1,1,'2020-04-04 21:03:14.336',NULL),('R�C\0}O���.6\'��,','�v�QWF��3�\rK�6�','US-IL',1,1,'2020-04-04 21:03:14.367',NULL),('S�n�i@��]RT�p(z','\Z!�~�K���?��}��','GB-MIK',1,1,'2020-04-04 21:03:14.340',NULL),('Sh�6�AЧ�v�\\m�','\Z!�~�K���?��}��','GB-ELS',1,1,'2020-04-04 21:03:14.351',NULL),('S�J��E߿�����Ap','\Z!�~�K���?��}��','GB-CAM',1,1,'2020-04-04 21:03:14.301',NULL),('Sŗ�zN2�Q�uȊ^','\Z!�~�K���?��}��','GB-GAT',1,1,'2020-04-04 21:03:14.329',NULL),('Uf���-IK�PkJ��IS','\Z!�~�K���?��}��','GB-FAL',1,1,'2020-04-04 21:03:14.351',NULL),('V�\rCUOx�4G:��B','�v�QWF��3�\rK�6�','US-IA',1,1,'2020-04-04 21:03:14.368',NULL),('X3f�9iK��=*Kd��','\Z!�~�K���?��}��','GB-AND',1,1,'2020-04-04 21:03:14.347',NULL),('X���!�JX����T�\"�','�v�QWF��3�\rK�6�','US-MT',1,1,'2020-04-04 21:03:14.370',NULL),('Y~��&]D��:\"\r�|��','�v�QWF��3�\rK�6�','US-TX',1,1,'2020-04-04 21:03:14.373',NULL),('Y�A��M���w/��P�','\Z!�~�K���?��}��','GB-SLG',1,1,'2020-04-04 21:03:14.343',NULL),('Z���h,B��໘\r�H�','\Z!�~�K���?��}��','GB-DOR',1,1,'2020-04-04 21:03:14.305',NULL),('\\�0�ƴE���\"��w','\Z!�~�K���?��}��','GB-SHN',1,1,'2020-04-04 21:03:14.332',NULL),(']�R�HC&���F\\g(','\Z!�~�K���?��}��','GB-MRT',1,1,'2020-04-04 21:03:14.325',NULL),('_�%Ҡ�E_��&��,{','\Z!�~�K���?��}��','GB-SOM',1,1,'2020-04-04 21:03:14.315',NULL),('cc��jL��V�{�0+','\Z!�~�K���?��}��','GB-ENF',1,1,'2020-04-04 21:03:14.321',NULL),('cj�2��BҢ\0t�6o��','\Z!�~�K���?��}��','GB-STN',1,1,'2020-04-04 21:03:14.326',NULL),('c~P<$UA����1�N�','\Z!�~�K���?��}��','GB-TOB',1,1,'2020-04-04 21:03:14.345',NULL),('eX�Q��Ao��\r�pێ','\Z!�~�K���?��}��','GB-TWH',1,1,'2020-04-04 21:03:14.327',NULL),('f,�&O�A�����.e','\Z!�~�K���?��}��','GB-BUR',1,1,'2020-04-04 21:03:14.328',NULL),('g��_µI%��$l�1�;','\Z!�~�K���?��}��','GB-NYK',1,1,'2020-04-04 21:03:14.313',NULL),('g����\\O��H��(<4F','\Z!�~�K���?��}��','GB-BNE',1,1,'2020-04-04 21:03:14.319',NULL),('i��t�\ZEm��7�D\06G','\Z!�~�K���?��}��','GB-BDF',1,1,'2020-04-04 21:03:14.335',NULL),('jcm=�&F�5�\Z!ܡ','\Z!�~�K���?��}��','GB-POW',1,1,'2020-04-04 21:03:14.359',NULL),('kj�7\"GN�ϵ�I�N','�v�QWF��3�\rK�6�','US-NY',1,1,'2020-04-04 21:03:14.371',NULL),('k�МnK����_$\'�','�v�QWF��3�\rK�6�','US-NV',1,1,'2020-04-04 21:03:14.370',NULL),('l���}O��B���>','\Z!�~�K���?��}��','GB-STY',1,1,'2020-04-04 21:03:14.333',NULL),('lT$�Y�IՁ+��Q�O�','\Z!�~�K���?��}��','GB-SWD',1,1,'2020-04-04 21:03:14.344',NULL),('n��n?�J������^','\Z!�~�K���?��}��','GB-ISL',1,1,'2020-04-04 21:03:14.324',NULL),('n�Ҽ=RJ)�����H��','�v�QWF��3�\rK�6�','US-PA',1,1,'2020-04-04 21:03:14.372',NULL),('p;�q�K��~��mu?','\Z!�~�K���?��}��','GB-GLG',1,1,'2020-04-04 21:03:14.352',NULL),('pQ��t�B�}u�x�q','�v�QWF��3�\rK�6�','US-AK',1,1,'2020-04-04 21:03:14.365',NULL),('p�	c�D*��s\\՞l`','��>,J���#��a','DE-BY',1,1,'2020-04-04 21:03:14.268',NULL),('qGo~̖A��`{b}j','\Z!�~�K���?��}��','GB-LUT',1,1,'2020-04-04 21:03:14.340',NULL),('rɣ��N{�O/I��D�','\Z!�~�K���?��}��','GB-SWA',1,1,'2020-04-04 21:03:14.359',NULL),('rM�S�A��㭝GS��','\Z!�~�K���?��}��','GB-WIL',1,1,'2020-04-04 21:03:14.346',NULL),('t\nЭ�O)����{�.','�v�QWF��3�\rK�6�','US-GA',1,1,'2020-04-04 21:03:14.366',NULL),('t@�p�Mw���z2��@','\Z!�~�K���?��}��','GB-BKM',1,1,'2020-04-04 21:03:14.300',NULL),('tmj�N6��W��\'�','��>,J���#��a','DE-HB',1,1,'2020-04-04 21:03:14.273',NULL),('t�4�@�J�m§�','\Z!�~�K���?��}��','GB-WKF',1,1,'2020-04-04 21:03:14.334',NULL),('t�F/ՃG��� �}�\'','\Z!�~�K���?��}��','GB-MRY',1,1,'2020-04-04 21:03:14.352',NULL),('vLԲ#�Aܬ������','\Z!�~�K���?��}��','GB-NTL',1,1,'2020-04-04 21:03:14.358',NULL),('v�A��4B3����g,\'8','\Z!�~�K���?��}��','GB-ABE',1,1,'2020-04-04 21:03:14.349',NULL),('x�W�ƼD���}\Z�\\��','\Z!�~�K���?��}��','GB-SCB',1,1,'2020-04-04 21:03:14.354',NULL),('y�3��SBA�����8','\Z!�~�K���?��}��','GB-SLF',1,1,'2020-04-04 21:03:14.332',NULL),('z�d��bAY����\"�','\Z!�~�K���?��}��','GB-SRY',1,1,'2020-04-04 21:03:14.317',NULL),('{S�zvGC�h?�1;','\Z!�~�K���?��}��','GB-PKN',1,1,'2020-04-04 21:03:14.353',NULL),('{ൔ�?NV�E{��ֈ','\Z!�~�K���?��}��','GB-WOR',1,1,'2020-04-04 21:03:14.318',NULL),('}�M��F�v��b�h','\Z!�~�K���?��}��','GB-ORK',1,1,'2020-04-04 21:03:14.353',NULL),('}u��/[B��	�L�~','\Z!�~�K���?��}��','GB-DAL',1,1,'2020-04-04 21:03:14.338',NULL),('f$�ݝA���wn�hbv','\Z!�~�K���?��}��','GB-STG',1,1,'2020-04-04 21:03:14.355',NULL),('jܩF�AY�T�vϪS','�v�QWF��3�\rK�6�','US-IN',1,1,'2020-04-04 21:03:14.367',NULL),('�����A8�<R8�Ɂ','�v�QWF��3�\rK�6�','US-SC',1,1,'2020-04-04 21:03:14.373',NULL),('��HTKEͮ�sy$�`b','\Z!�~�K���?��}��','GB-LCE',1,1,'2020-04-04 21:03:14.340',NULL),('�T�ލ.B�\"ەrJ�','\Z!�~�K���?��}��','GB-WDU',1,1,'2020-04-04 21:03:14.355',NULL),('�t�uqJ�����d�','\Z!�~�K���?��}��','GB-HRY',1,1,'2020-04-04 21:03:14.323',NULL),('����C��}\'�a��','\Z!�~�K���?��}��','GB-DEV',1,1,'2020-04-04 21:03:14.304',NULL),('��{��B`�j�\0���','\Z!�~�K���?��}��','GB-RCH',1,1,'2020-04-04 21:03:14.331',NULL),('�\"�HBY��5ٞ�','\Z!�~�K���?��}��','GB-LAN',1,1,'2020-04-04 21:03:14.311',NULL),('�Y��6MՖ�`�\"q��','�v�QWF��3�\rK�6�','US-VT',1,1,'2020-04-04 21:03:14.374',NULL),('��A��HԵ��\0���','\Z!�~�K���?��}��','GB-EDH',1,1,'2020-04-04 21:03:14.351',NULL),('�pH��C�)>%��&�','\Z!�~�K���?��}��','GB-CLK',1,1,'2020-04-04 21:03:14.349',NULL),('���\r}NM��M�74��X','\Z!�~�K���?��}��','GB-HEF',1,1,'2020-04-04 21:03:14.339',NULL),('��I��tI��kA�yAL�','\Z!�~�K���?��}��','GB-ROT',1,1,'2020-04-04 21:03:14.332',NULL),('�TW�O�Ge���l���S','�v�QWF��3�\rK�6�','US-RI',1,1,'2020-04-04 21:03:14.372',NULL),('�~���Fe���e�<','\Z!�~�K���?��}��','GB-CON',1,1,'2020-04-04 21:03:14.337',NULL),('�>OԓJ���\Z��\r\Z','\Z!�~�K���?��}��','GB-CHE',1,1,'2020-04-04 21:03:14.337',NULL),('�򣗒�N�:1{�a','\Z!�~�K���?��}��','GB-MTY',1,1,'2020-04-04 21:03:14.357',NULL),('�4^ AU� ւ�4\\�','\Z!�~�K���?��}��','GB-DUR',1,1,'2020-04-04 21:03:14.338',NULL),('�ydqhFD�ّ�i�','\Z!�~�K���?��}��','GB-CMN',1,1,'2020-04-04 21:03:14.356',NULL),('��,��yIу���4���','\Z!�~�K���?��}��','GB-CAY',1,1,'2020-04-04 21:03:14.356',NULL),('�\'qxC��.���-�','\Z!�~�K���?��}��','GB-SLK',1,1,'2020-04-04 21:03:14.354',NULL),('�e9�RKL��0���*x','\Z!�~�K���?��}��','GB-RFW',1,1,'2020-04-04 21:03:14.353',NULL),('�����\\@,�L���$:','\Z!�~�K���?��}��','GB-MUL',1,1,'2020-04-04 21:03:14.348',NULL),('�@rk Nf�����(','\Z!�~�K���?��}��','GB-CMA',1,1,'2020-04-04 21:03:14.302',NULL),('����5:Il�$��:*<\'','\Z!�~�K���?��}��','GB-FMO',1,1,'2020-04-04 21:03:14.348',NULL),('���\Z\r�B#�u�9&o/','\Z!�~�K���?��}��','GB-MAN',1,1,'2020-04-04 21:03:14.331',NULL),('�w�\ncIū��M�e�','��>,J���#��a','DE-ST',1,1,'2020-04-04 21:03:14.285',NULL),('�^��^B6��&U�<��','\Z!�~�K���?��}��','GB-RIC',1,1,'2020-04-04 21:03:14.326',NULL),('�:�`��D�� uN��','\Z!�~�K���?��}��','GB-NTH',1,1,'2020-04-04 21:03:14.313',NULL),('�2��gZG���@�qj\0','\Z!�~�K���?��}��','GB-CMD',1,1,'2020-04-04 21:03:14.321',NULL),('�J��x�M�YoK,J�','\Z!�~�K���?��}��','GB-POL',1,1,'2020-04-04 21:03:14.342',NULL),('����vFH��޿��I�','\Z!�~�K���?��}��','GB-ELN',1,1,'2020-04-04 21:03:14.350',NULL),('�m8�܅Ow��#�&_jz','\Z!�~�K���?��}��','GB-NLN',1,1,'2020-04-04 21:03:14.341',NULL),('�֍�)L����:�;A','\Z!�~�K���?��}��','GB-FIF',1,1,'2020-04-04 21:03:14.351',NULL),('�����I=��I�_� �','\Z!�~�K���?��}��','GB-IOS',1,1,'2020-04-04 21:03:14.339',NULL),('����CA�<����','�v�QWF��3�\rK�6�','US-OK',1,1,'2020-04-04 21:03:14.372',NULL),('���a�I���	B�K�P','\Z!�~�K���?��}��','GB-SAY',1,1,'2020-04-04 21:03:14.354',NULL),('�r��5�CS��=��^NM','\Z!�~�K���?��}��','GB-RCT',1,1,'2020-04-04 21:03:14.359',NULL),('���.әHL�l�9','\Z!�~�K���?��}��','GB-WRX',1,1,'2020-04-04 21:03:14.360',NULL),('��}SӋGM���L�X�','�v�QWF��3�\rK�6�','US-WI',1,1,'2020-04-04 21:03:14.374',NULL),('�6�e>Ht���?y��','\Z!�~�K���?��}��','GB-WNM',1,1,'2020-04-04 21:03:14.346',NULL),('�S@�@iKڧ4���z�','\Z!�~�K���?��}��','GB-BPL',1,1,'2020-04-04 21:03:14.336',NULL),('��7tDN���k�L','�v�QWF��3�\rK�6�','US-NC',1,1,'2020-04-04 21:03:14.371',NULL),('�ua��DC�V�t��`','\Z!�~�K���?��}��','GB-WOK',1,1,'2020-04-04 21:03:14.346',NULL),('�t��E\\��2)��','�v�QWF��3�\rK�6�','US-DE',1,1,'2020-04-04 21:03:14.366',NULL),('�	���gES��U��z','\Z!�~�K���?��}��','GB-KWL',1,1,'2020-04-04 21:03:14.330',NULL),('�&F3>Gb�i��\Zo�','\Z!�~�K���?��}��','GB-DEN',1,1,'2020-04-04 21:03:14.357',NULL),('����L:�$�ƾ�','\Z!�~�K���?��}��','GB-THR',1,1,'2020-04-04 21:03:14.345',NULL),('�Q���.I����EP','\Z!�~�K���?��}��','GB-WFT',1,1,'2020-04-04 21:03:14.327',NULL),('��Ä�A��l�M�\"�','\Z!�~�K���?��}��','GB-WLL',1,1,'2020-04-04 21:03:14.334',NULL),('��T�}O˙xFg�<�','\Z!�~�K���?��}��','GB-GBN',1,1,'2020-04-04 21:03:14.297',NULL),('�>��J�Ow������','�v�QWF��3�\rK�6�','US-MO',1,1,'2020-04-04 21:03:14.370',NULL),('��LݗI=���ԯp�w','\Z!�~�K���?��}��','GB-BGW',1,1,'2020-04-04 21:03:14.355',NULL),('�����0B[��ٱ<s','\Z!�~�K���?��}��','GB-SND',1,1,'2020-04-04 21:03:14.333',NULL),('�|2�M�[���$�','\Z!�~�K���?��}��','GB-DER',1,1,'2020-04-04 21:03:14.338',NULL),('��r���A׷T������','\Z!�~�K���?��}��','GB-ABC',1,1,'2020-04-04 21:03:14.347',NULL),('��^��A\"���CH��','\Z!�~�K���?��}��','GB-DRS',1,1,'2020-04-04 21:03:14.347',NULL),('��S�7�HR���߹9�','\Z!�~�K���?��}��','GB-WLS',1,1,'2020-04-04 21:03:14.296',NULL),('�@���A�W�E�<�','\Z!�~�K���?��}��','GB-LDS',1,1,'2020-04-04 21:03:14.330',NULL),('���oH��D�uf:�','\Z!�~�K���?��}��','GB-OLD',1,1,'2020-04-04 21:03:14.331',NULL),('��n��+C1�)A�C�!�','\Z!�~�K���?��}��','GB-ANS',1,1,'2020-04-04 21:03:14.349',NULL),('�K}��JA�5)�0N','\Z!�~�K���?��}��','GB-MON',1,1,'2020-04-04 21:03:14.358',NULL),('�\Z�\n7|F ��QU?\05','\Z!�~�K���?��}��','GB-CCG',1,1,'2020-04-04 21:03:14.347',NULL),('�,��Z�K��A�*,','\Z!�~�K���?��}��','GB-MDW',1,1,'2020-04-04 21:03:14.340',NULL),('������@���;X�eP','\Z!�~�K���?��}��','GB-GWN',1,1,'2020-04-04 21:03:14.357',NULL),('����E�I���+�~�d','\Z!�~�K���?��}��','GB-NSM',1,1,'2020-04-04 21:03:14.341',NULL),('��0]@�C@�$��s�','��>,J���#��a','DE-BB',1,1,'2020-04-04 21:03:14.271',NULL),('�}]bM�����A0�','�v�QWF��3�\rK�6�','US-KY',1,1,'2020-04-04 21:03:14.368',NULL),('���t?�@l���$��','��>,J���#��a','DE-NW',1,1,'2020-04-04 21:03:14.280',NULL),('�\0̭�B-�+O�r\"�','\Z!�~�K���?��}��','GB-WLV',1,1,'2020-04-04 21:03:14.335',NULL),('��;t�K/���>b4\Z','��>,J���#��a','DE-HE',1,1,'2020-04-04 21:03:14.275',NULL),('�#7H�G�Ks�','�v�QWF��3�\rK�6�','US-MD',1,1,'2020-04-04 21:03:14.369',NULL),('�U�\r6>GJ���M�C��','�v�QWF��3�\rK�6�','US-FL',1,1,'2020-04-04 21:03:14.366',NULL),('�q�p�A��H�}��','\Z!�~�K���?��}��','GB-WND',1,1,'2020-04-04 21:03:14.327',NULL),('�+20��E\'�=��C8','\Z!�~�K���?��}��','GB-BOL',1,1,'2020-04-04 21:03:14.328',NULL),('�Q�:�*G��@f��(','\Z!�~�K���?��}��','GB-WLN',1,1,'2020-04-04 21:03:14.355',NULL),('đƺ3L��|�$�6','\Z!�~�K���?��}��','GB-NEL',1,1,'2020-04-04 21:03:14.341',NULL),('Ŀ(%��G��A��!p��','\Z!�~�K���?��}��','GB-DND',1,1,'2020-04-04 21:03:14.350',NULL),('ŏ�&�,I�����L��','\Z!�~�K���?��}��','GB-HNS',1,1,'2020-04-04 21:03:14.324',NULL),('�J�?N��Z��BT','\Z!�~�K���?��}��','GB-GLS',1,1,'2020-04-04 21:03:14.308',NULL),('ƒz>=G��<.�*X�','\Z!�~�K���?��}��','GB-TAM',1,1,'2020-04-04 21:03:14.334',NULL),('ƺ���C|�;\Z}��:','\Z!�~�K���?��}��','GB-NMD',1,1,'2020-04-04 21:03:14.348',NULL),('ȥk��AΟ+��G��','�v�QWF��3�\rK�6�','US-NM',1,1,'2020-04-04 21:03:14.371',NULL),('��Į�Nݭ`��:�{','�v�QWF��3�\rK�6�','US-ND',1,1,'2020-04-04 21:03:14.371',NULL),('˯P�ŰG8�������','\Z!�~�K���?��}��','GB-KHL',1,1,'2020-04-04 21:03:14.339',NULL),('̐F+�BZ�r�/T���','\Z!�~�K���?��}��','GB-FLN',1,1,'2020-04-04 21:03:14.357',NULL),('�}�oOO��I�q��','\Z!�~�K���?��}��','GB-ANN',1,1,'2020-04-04 21:03:14.346',NULL),('��&�`�LN���ګ��','\Z!�~�K���?��}��','GB-NTT',1,1,'2020-04-04 21:03:14.314',NULL),('�gT�%fJˏY9)�~�','\Z!�~�K���?��}��','GB-CRF',1,1,'2020-04-04 21:03:14.356',NULL),('Ͼ�\'��H	�A*G��','\Z!�~�K���?��}��','GB-EDU',1,1,'2020-04-04 21:03:14.350',NULL),('�����O��ܣv�\Z\n','\Z!�~�K���?��}��','GB-CLD',1,1,'2020-04-04 21:03:14.329',NULL),('т׳q�@\n���@i�P�','\Z!�~�K���?��}��','GB-LEC',1,1,'2020-04-04 21:03:14.311',NULL),('���+S@��]�E�l�Y','�v�QWF��3�\rK�6�','US-CT',1,1,'2020-04-04 21:03:14.366',NULL),('�+ ��C��v�$}v','�v�QWF��3�\rK�6�','US-WV',1,1,'2020-04-04 21:03:14.374',NULL),('�G���?@6�Zؘ��','\Z!�~�K���?��}��','GB-HCK',1,1,'2020-04-04 21:03:14.322',NULL),('ս��hE鷉�)ݞ�!','�v�QWF��3�\rK�6�','US-SD',1,1,'2020-04-04 21:03:14.373',NULL),('�50�קLl�{v��ᓭ','\Z!�~�K���?��}��','GB-STH',1,1,'2020-04-04 21:03:14.344',NULL),('��8��O��������s','\Z!�~�K���?��}��','GB-BEX',1,1,'2020-04-04 21:03:14.320',NULL),('�mv2�\ZIش�����^','\Z!�~�K���?��}��','GB-HAM',1,1,'2020-04-04 21:03:14.308',NULL),('��\r��A:�O�*=�LJ','\Z!�~�K���?��}��','GB-HAV',1,1,'2020-04-04 21:03:14.323',NULL),('ێͺ�@r�Vz�M]�','\Z!�~�K���?��}��','GB-KTT',1,1,'2020-04-04 21:03:14.324',NULL),('ۭh<~UM���_�ݒ��','�v�QWF��3�\rK�6�','US-LA',1,1,'2020-04-04 21:03:14.368',NULL),('�5;K��F_��u%��','�v�QWF��3�\rK�6�','US-CA',1,1,'2020-04-04 21:03:14.365',NULL),('ݶ���Iϝ���Z3','\Z!�~�K���?��}��','GB-ERW',1,1,'2020-04-04 21:03:14.351',NULL),('��(R�C���\"a��I','\Z!�~�K���?��}��','GB-HLD',1,1,'2020-04-04 21:03:14.352',NULL),('�.e5�J��u�@����','\Z!�~�K���?��}��','GB-SOS',1,1,'2020-04-04 21:03:14.344',NULL),('߼M\\jkO�@��/�G�','\Z!�~�K���?��}��','GB-WRT',1,1,'2020-04-04 21:03:14.345',NULL),('�L\'���G���z���0','\Z!�~�K���?��}��','GB-TRF',1,1,'2020-04-04 21:03:14.334',NULL),('�\"�\"D�#\r�\"T\\s','��>,J���#��a','DE-RP',1,1,'2020-04-04 21:03:14.281',NULL),('�3��V�N��p<�','�v�QWF��3�\rK�6�','US-NJ',1,1,'2020-04-04 21:03:14.371',NULL),('�s�&�K��ǯX���n','\Z!�~�K���?��}��','GB-TOF',1,1,'2020-04-04 21:03:14.359',NULL),('��Fu�F����ru`�\"','\Z!�~�K���?��}��','GB-KEC',1,1,'2020-04-04 21:03:14.324',NULL),('��@��N��mUX�W','\Z!�~�K���?��}��','GB-NAY',1,1,'2020-04-04 21:03:14.353',NULL),('�{�B�OǄMm\"T�4�','\Z!�~�K���?��}��','GB-PTE',1,1,'2020-04-04 21:03:14.342',NULL),('���r�Cّ�ՉŪ','\Z!�~�K���?��}��','GB-EAL',1,1,'2020-04-04 21:03:14.321',NULL),('�<x��;A>�!eKr�\"','�v�QWF��3�\rK�6�','US-WA',1,1,'2020-04-04 21:03:14.374',NULL),('�\0^�O]�1b��EV','\Z!�~�K���?��}��','GB-RCC',1,1,'2020-04-04 21:03:14.343',NULL),('����EKF���M��3','\Z!�~�K���?��}��','GB-LIN',1,1,'2020-04-04 21:03:14.312',NULL),('�u}I��4�YW5:','\Z!�~�K���?��}��','GB-HRW',1,1,'2020-04-04 21:03:14.323',NULL),('�6�=J�����k�~�','\Z!�~�K���?��}��','GB-HPL',1,1,'2020-04-04 21:03:14.339',NULL),('��̒N�I���~\0쥾','�v�QWF��3�\rK�6�','US-AZ',1,1,'2020-04-04 21:03:14.365',NULL),('�q-�\nkA.��lF��','��>,J���#��a','DE-NI',1,1,'2020-04-04 21:03:14.277',NULL),('�{+�3�A��JKc5��','\Z!�~�K���?��}��','GB-OXF',1,1,'2020-04-04 21:03:14.314',NULL),('�E��qCB�y~]��','\Z!�~�K���?��}��','GB-BNS',1,1,'2020-04-04 21:03:14.327',NULL),('����nRM$��:�\Z^�','�v�QWF��3�\rK�6�','US-AR',1,1,'2020-04-04 21:03:14.365',NULL),('��m[�K�����I5��','\Z!�~�K���?��}��','GB-RUT',1,1,'2020-04-04 21:03:14.343',NULL),('�4D�h%A/��g��E��','\Z!�~�K���?��}��','GB-HAL',1,1,'2020-04-04 21:03:14.338',NULL),('��h�E0����\'9�','\Z!�~�K���?��}��','GB-BST',1,1,'2020-04-04 21:03:14.337',NULL),('�Z\\\r�J��\'�S��','\Z!�~�K���?��}��','GB-BFS',1,1,'2020-04-04 21:03:14.347',NULL),('��#r��K���-��E�','\Z!�~�K���?��}��','GB-NWM',1,1,'2020-04-04 21:03:14.325',NULL),('�;T��G�|�J��Ҝ','\Z!�~�K���?��}��','GB-LBH',1,1,'2020-04-04 21:03:14.325',NULL),('�@@/`�L�����v\"�','\Z!�~�K���?��}��','GB-NTY',1,1,'2020-04-04 21:03:14.331',NULL),('�wG��iG\r��%vŠE�','\Z!�~�K���?��}��','GB-LEW',1,1,'2020-04-04 21:03:14.325',NULL),('��LA{@7�z`�y>�','\Z!�~�K���?��}��','GB-LBC',1,1,'2020-04-04 21:03:14.348',NULL),('��0[j�A��q���','\Z!�~�K���?��}��','GB-COV',1,1,'2020-04-04 21:03:14.329',NULL),('��]nzAFo��R?d��','\Z!�~�K���?��}��','GB-BRC',1,1,'2020-04-04 21:03:14.336',NULL),('�A�\ZJ�MڿK��Z��l','��>,J���#��a','DE-SH',1,1,'2020-04-04 21:03:14.287',NULL),('�D���fBv��Ƶ��','\Z!�~�K���?��}��','GB-EAY',1,1,'2020-04-04 21:03:14.350',NULL),('�b=���C_��W�]A','\Z!�~�K���?��}��','GB-NBL',1,1,'2020-04-04 21:03:14.341',NULL),('��%��F$���2���&','\Z!�~�K���?��}��','GB-POR',1,1,'2020-04-04 21:03:14.342',NULL),('�o}�WXG��߻=�u�','\Z!�~�K���?��}��','GB-NLK',1,1,'2020-04-04 21:03:14.353',NULL),('��Yg�D�F�����-','\Z!�~�K���?��}��','GB-EAW',1,1,'2020-04-04 21:03:14.297',NULL),('�[է��@��Oo��Q-�','�v�QWF��3�\rK�6�','US-DC',1,1,'2020-04-04 21:03:14.375',NULL),('���JI��a)�E','\Z!�~�K���?��}��','GB-ZET',1,1,'2020-04-04 21:03:14.354',NULL);
/*!40000 ALTER TABLE `country_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translation`
--

DROP TABLE IF EXISTS `country_state_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_state_translation` (
  `country_state_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`country_state_id`,`language_id`),
  KEY `fk.country_state_translation.language_id` (`language_id`),
  CONSTRAINT `fk.country_state_translation.country_state_id` FOREIGN KEY (`country_state_id`) REFERENCES `country_state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.country_state_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.country_state_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translation`
--

LOCK TABLES `country_state_translation` WRITE;
/*!40000 ALTER TABLE `country_state_translation` DISABLE KEYS */;
INSERT INTO `country_state_translation` VALUES ('\0�Z�4G��?�p�*','/�_��Mp�XT�|��','Dumfries and Galloway',NULL,'2020-04-04 21:03:14.350',NULL),('g8��O;�B!�H�','/�_��Mp�XT�|��','Berlin',NULL,'2020-04-04 21:03:14.270',NULL),('g8��O;�B!�H�','�/p�L���M�4�8','Berlin',NULL,'2020-04-04 21:03:14.270',NULL),('��!�G��)?�`�','/�_��Mp�XT�|��','New Hampshire',NULL,'2020-04-04 21:03:14.370',NULL),('�>�mA0�X�mBǾ\Z','/�_��Mp�XT�|��','Massachusetts',NULL,'2020-04-04 21:03:14.369',NULL),('�M*IdH��NO�\Z�','/�_��Mp�XT�|��','Aberdeenshire',NULL,'2020-04-04 21:03:14.349',NULL),('l�ļQA:�z�����','/�_��Mp�XT�|��','Bradford',NULL,'2020-04-04 21:03:14.328',NULL),(')C+�Mv���2��$','/�_��Mp�XT�|��','Scotland',NULL,'2020-04-04 21:03:14.295',NULL),('���8�H/��\"I0��','/�_��Mp�XT�|��','Kirklees',NULL,'2020-04-04 21:03:14.330',NULL),('%U��F�R��`��','/�_��Mp�XT�|��','Stockport',NULL,'2020-04-04 21:03:14.333',NULL),('=�_�I*�r�5��\n\\','/�_��Mp�XT�|��','West Sussex',NULL,'2020-04-04 21:03:14.318',NULL),('%�	��A����5�z�','/�_��Mp�XT�|��','Minnesota',NULL,'2020-04-04 21:03:14.369',NULL),('��|mA1�M�4,��','/�_��Mp�XT�|��','Isle of Wight',NULL,'2020-04-04 21:03:14.339',NULL),('	3�_��M���#�w��~','/�_��Mp�XT�|��','Birmingham',NULL,'2020-04-04 21:03:14.328',NULL),('	U�&�AݕVi�V+�','/�_��Mp�XT�|��','York',NULL,'2020-04-04 21:03:14.346',NULL),('=\n(VD�\'�Z�>�','/�_��Mp�XT�|��','Mississippi',NULL,'2020-04-04 21:03:14.369',NULL),('��ɂ�O��V�3Y�','/�_��Mp�XT�|��','Baden-Württemberg',NULL,'2020-04-04 21:03:14.266',NULL),('��ɂ�O��V�3Y�','�/p�L���M�4�8','Baden-Württemberg',NULL,'2020-04-04 21:03:14.266',NULL),('�~MK�E$�^a�E�G','/�_��Mp�XT�|��','Wyoming',NULL,'2020-04-04 21:03:14.375',NULL),('�)9I�@��','/�_��Mp�XT�|��','Alabama',NULL,'2020-04-04 21:03:14.365',NULL),(')�vaO,�3��r�1i','/�_��Mp�XT�|��','Maine',NULL,'2020-04-04 21:03:14.368',NULL),('\rG\0���F\0�8P��gg4','/�_��Mp�XT�|��','Newcastle upon Tyne',NULL,'2020-04-04 21:03:14.331',NULL),('\r����IP������m*','/�_��Mp�XT�|��','Thuringia',NULL,'2020-04-04 21:03:14.288',NULL),('\r����IP������m*','�/p�L���M�4�8','Thüringen',NULL,'2020-04-04 21:03:14.288',NULL),('6���UFt��y����','/�_��Mp�XT�|��','South Gloucestershire',NULL,'2020-04-04 21:03:14.343',NULL),('�ǁ=A���X 3�','/�_��Mp�XT�|��','Hammersmith and Fulham',NULL,'2020-04-04 21:03:14.322',NULL),('�?�0Gb�a~�B�','/�_��Mp�XT�|��','Cheshire West and Chester',NULL,'2020-04-04 21:03:14.337',NULL),('��1��@T�.q��T','/�_��Mp�XT�|��','Midlothian',NULL,'2020-04-04 21:03:14.352',NULL),('�o�+Ld����m�','/�_��Mp�XT�|��','Doncaster',NULL,'2020-04-04 21:03:14.329',NULL),('�8�|F~�#��9�[�','/�_��Mp�XT�|��','Saxony',NULL,'2020-04-04 21:03:14.284',NULL),('�8�|F~�#��9�[�','�/p�L���M�4�8','Sachsen',NULL,'2020-04-04 21:03:14.284',NULL),('KS$cO��8W��k��','/�_��Mp�XT�|��','Shropshire',NULL,'2020-04-04 21:03:14.343',NULL),('�si`O��ċ(/','/�_��Mp�XT�|��','Hawaii',NULL,'2020-04-04 21:03:14.367',NULL),('FN�\Z9@�����I�','/�_��Mp�XT�|��','Essex',NULL,'2020-04-04 21:03:14.307',NULL),('prz�LR���5֑�f','/�_��Mp�XT�|��','Norfolk',NULL,'2020-04-04 21:03:14.312',NULL),('\Z3}�G�@�=����','/�_��Mp�XT�|��','Westminster',NULL,'2020-04-04 21:03:14.327',NULL),('>�}(*O����=O���','/�_��Mp�XT�|��','Bridgend',NULL,'2020-04-04 21:03:14.355',NULL),('U�r��Ao����^�.N','/�_��Mp�XT�|��','Croydon',NULL,'2020-04-04 21:03:14.321',NULL),('����A�&��x�','/�_��Mp�XT�|��','Northern Ireland',NULL,'2020-04-04 21:03:14.294',NULL),(':��LJ��K�B\"5','/�_��Mp�XT�|��','Oregon',NULL,'2020-04-04 21:03:14.372',NULL),('t�eK�N��Jt����','/�_��Mp�XT�|��','Solihull',NULL,'2020-04-04 21:03:14.333',NULL),('},�aM������&.^','/�_��Mp�XT�|��','Mecklenburg-Western Pomerania',NULL,'2020-04-04 21:03:14.278',NULL),('},�aM������&.^','�/p�L���M�4�8','Mecklenburg-Vorpommern',NULL,'2020-04-04 21:03:14.278',NULL),('�Cf\0CH;�b,��\n','/�_��Mp�XT�|��','Newport',NULL,'2020-04-04 21:03:14.358',NULL),(' E�%dKw����|k','/�_��Mp�XT�|��','London, City of',NULL,'2020-04-04 21:03:14.318',NULL),(' R���Cȭ:�A��K�','/�_��Mp�XT�|��','Kansas',NULL,'2020-04-04 21:03:14.368',NULL),(' ���Os�����T��','/�_��Mp�XT�|��','Liverpool',NULL,'2020-04-04 21:03:14.330',NULL),('$Q�.N@F����UI��','/�_��Mp�XT�|��','Suffolk',NULL,'2020-04-04 21:03:14.316',NULL),('$�79]CR�j�uS�A','/�_��Mp�XT�|��','Isle of Anglesey',NULL,'2020-04-04 21:03:14.357',NULL),('%��P]�B�hn���Ԡ','/�_��Mp�XT�|��','West Berkshire',NULL,'2020-04-04 21:03:14.345',NULL),('&}�t�K����*��','/�_��Mp�XT�|��','East Riding of Yorkshire',NULL,'2020-04-04 21:03:14.338',NULL),('\'g-K0�C���f	y\\r�','/�_��Mp�XT�|��','United Kingdom',NULL,'2020-04-04 21:03:14.299',NULL),('\'{��|O���//�E��','/�_��Mp�XT�|��','Hillingdon',NULL,'2020-04-04 21:03:14.323',NULL),(')���y~A`��	C+�S�','/�_��Mp�XT�|��','Barking and Dagenham',NULL,'2020-04-04 21:03:14.319',NULL),('+�7���I:�XSl�w�','/�_��Mp�XT�|��','Stoke-on-Trent',NULL,'2020-04-04 21:03:14.344',NULL),('-nK*��Jҋ��I��','/�_��Mp�XT�|��','Inverclyde',NULL,'2020-04-04 21:03:14.352',NULL),('.&�mb�E˭Ű�?\\^','/�_��Mp�XT�|��','Redbridge',NULL,'2020-04-04 21:03:14.326',NULL),('.<�G_Dɩ��׺S�','/�_��Mp�XT�|��','Pembrokeshire',NULL,'2020-04-04 21:03:14.358',NULL),('.�i�)H/���P_�','/�_��Mp�XT�|��','Idaho',NULL,'2020-04-04 21:03:14.367',NULL),('.��4OT����މ[~','/�_��Mp�XT�|��','Bath and North East Somerset',NULL,'2020-04-04 21:03:14.335',NULL),('/Xh��FC\0��jN�ۥG','/�_��Mp�XT�|��','Wirral',NULL,'2020-04-04 21:03:14.335',NULL),('014k)I͸��A&�Hs','/�_��Mp�XT�|��','England',NULL,'2020-04-04 21:03:14.293',NULL),('0��s��@��ҙV��e�','/�_��Mp�XT�|��','East Sussex',NULL,'2020-04-04 21:03:14.306',NULL),('1��aKGW��%>��1','/�_��Mp�XT�|��','Ohio',NULL,'2020-04-04 21:03:14.372',NULL),('11	3�H���t.,ɤ','/�_��Mp�XT�|��','Plymouth',NULL,'2020-04-04 21:03:14.342',NULL),('1���k0J��4���U','/�_��Mp�XT�|��','Michigan',NULL,'2020-04-04 21:03:14.369',NULL),('2��}�B����,�F','/�_��Mp�XT�|��','Kent',NULL,'2020-04-04 21:03:14.310',NULL),('3IK�$�C�g�\\���','/�_��Mp�XT�|��','Conwy',NULL,'2020-04-04 21:03:14.356',NULL),('3�:�KWB����\'��','/�_��Mp�XT�|��','Mid and East Antrim',NULL,'2020-04-04 21:03:14.348',NULL),('4a�K�N����%�','/�_��Mp�XT�|��','Sefton',NULL,'2020-04-04 21:03:14.332',NULL),('5�>l�Cp��*�$��M','/�_��Mp�XT�|��','Staffordshire',NULL,'2020-04-04 21:03:14.315',NULL),('6���{nI槢��i�a�','/�_��Mp�XT�|��','Reading',NULL,'2020-04-04 21:03:14.342',NULL),('7rU\r�fH�S���','/�_��Mp�XT�|��','Telford and Wrekin',NULL,'2020-04-04 21:03:14.345',NULL),('7�fA2K�S�\r�\0�','/�_��Mp�XT�|��','Central Bedfordshire',NULL,'2020-04-04 21:03:14.337',NULL),('8�F�M��Q��C\Z','/�_��Mp�XT�|��','Brent',NULL,'2020-04-04 21:03:14.320',NULL),('9ҩ�6 H>��$x�Ar�','/�_��Mp�XT�|��','Saarland',NULL,'2020-04-04 21:03:14.283',NULL),('9ҩ�6 H>��$x�Ar�','�/p�L���M�4�8','Saarland',NULL,'2020-04-04 21:03:14.283',NULL),(':�,$,M��ȑ[�u�','/�_��Mp�XT�|��','Blackburn with Darwen',NULL,'2020-04-04 21:03:14.335',NULL),(';�2�mB7����zw�','/�_��Mp�XT�|��','Stockton-on-Tees',NULL,'2020-04-04 21:03:14.344',NULL),('<���6VG��۔O$�i','/�_��Mp�XT�|��','Bournemouth',NULL,'2020-04-04 21:03:14.336',NULL),('=� s�5A���3�W��','/�_��Mp�XT�|��','Argyll and Bute',NULL,'2020-04-04 21:03:14.349',NULL),('>��z=�N\r��J.]�','/�_��Mp�XT�|��','Nottingham',NULL,'2020-04-04 21:03:14.341',NULL),('?��q�AA������NV','/�_��Mp�XT�|��','Bromley',NULL,'2020-04-04 21:03:14.320',NULL),('@��ۗ�O����+�BY�','/�_��Mp�XT�|��','Southwark',NULL,'2020-04-04 21:03:14.326',NULL),('A�\n�D&D[��ʽ]��','/�_��Mp�XT�|��','Ceredigion',NULL,'2020-04-04 21:03:14.356',NULL),('B��h�K٘��(0�;','/�_��Mp�XT�|��','Sandwell',NULL,'2020-04-04 21:03:14.332',NULL),('C5��\\@���ǐ�V6','/�_��Mp�XT�|��','Hamburg',NULL,'2020-04-04 21:03:14.274',NULL),('C5��\\@���ǐ�V6','�/p�L���M�4�8','Hamburg',NULL,'2020-04-04 21:03:14.274',NULL),('D���R�M��F𛞑`L','/�_��Mp�XT�|��','Dudley',NULL,'2020-04-04 21:03:14.329',NULL),('F�u\"H����eeY$�','/�_��Mp�XT�|��','Utah',NULL,'2020-04-04 21:03:14.373',NULL),('H/h�H��\r`���','/�_��Mp�XT�|��','Vale of Glamorgan, The',NULL,'2020-04-04 21:03:14.359',NULL),('HR���CΥ�:�H%pO','/�_��Mp�XT�|��','Middlesbrough',NULL,'2020-04-04 21:03:14.340',NULL),('H���OK�N���\0L','/�_��Mp�XT�|��','Warwickshire',NULL,'2020-04-04 21:03:14.317',NULL),('I#�\\�J���B!���}','/�_��Mp�XT�|��','Wigan',NULL,'2020-04-04 21:03:14.334',NULL),('J�d�joK�/%���','/�_��Mp�XT�|��','Tennessee',NULL,'2020-04-04 21:03:14.373',NULL),('J�g��L)��:?Yk\"�','/�_��Mp�XT�|��','Virginia',NULL,'2020-04-04 21:03:14.374',NULL),('M/�\\��N���A��א�','/�_��Mp�XT�|��','Nebraska',NULL,'2020-04-04 21:03:14.370',NULL),('N��.hND�}��3wA','/�_��Mp�XT�|��','Greenwich',NULL,'2020-04-04 21:03:14.322',NULL),('N�F*�@Kş-��H��','/�_��Mp�XT�|��','Colorado',NULL,'2020-04-04 21:03:14.366',NULL),('OhVx*CJ�׹�-�','/�_��Mp�XT�|��','Sheffield',NULL,'2020-04-04 21:03:14.333',NULL),('Pe���ZCI�_\'�qY�P','/�_��Mp�XT�|��','Hertfordshire',NULL,'2020-04-04 21:03:14.309',NULL),('P��Jf�\Z��Wqa)','/�_��Mp�XT�|��','Derbyshire',NULL,'2020-04-04 21:03:14.302',NULL),('Q����}Nw�������','/�_��Mp�XT�|��','Brighton and Hove',NULL,'2020-04-04 21:03:14.336',NULL),('R�C\0}O���.6\'��,','/�_��Mp�XT�|��','Illinois',NULL,'2020-04-04 21:03:14.367',NULL),('S�n�i@��]RT�p(z','/�_��Mp�XT�|��','Milton Keynes',NULL,'2020-04-04 21:03:14.340',NULL),('Sh�6�AЧ�v�\\m�','/�_��Mp�XT�|��','Eilean Siar',NULL,'2020-04-04 21:03:14.351',NULL),('S�J��E߿�����Ap','/�_��Mp�XT�|��','Cambridgeshire',NULL,'2020-04-04 21:03:14.301',NULL),('Sŗ�zN2�Q�uȊ^','/�_��Mp�XT�|��','Gateshead',NULL,'2020-04-04 21:03:14.329',NULL),('Uf���-IK�PkJ��IS','/�_��Mp�XT�|��','Falkirk',NULL,'2020-04-04 21:03:14.351',NULL),('V�\rCUOx�4G:��B','/�_��Mp�XT�|��','Iowa',NULL,'2020-04-04 21:03:14.368',NULL),('X3f�9iK��=*Kd��','/�_��Mp�XT�|��','Ards and North Down',NULL,'2020-04-04 21:03:14.347',NULL),('X���!�JX����T�\"�','/�_��Mp�XT�|��','Montana',NULL,'2020-04-04 21:03:14.370',NULL),('Y~��&]D��:\"\r�|��','/�_��Mp�XT�|��','Texas',NULL,'2020-04-04 21:03:14.373',NULL),('Y�A��M���w/��P�','/�_��Mp�XT�|��','Slough',NULL,'2020-04-04 21:03:14.343',NULL),('Z���h,B��໘\r�H�','/�_��Mp�XT�|��','Dorset',NULL,'2020-04-04 21:03:14.305',NULL),('\\�0�ƴE���\"��w','/�_��Mp�XT�|��','St. Helens',NULL,'2020-04-04 21:03:14.332',NULL),(']�R�HC&���F\\g(','/�_��Mp�XT�|��','Merton',NULL,'2020-04-04 21:03:14.325',NULL),('_�%Ҡ�E_��&��,{','/�_��Mp�XT�|��','Somerset',NULL,'2020-04-04 21:03:14.315',NULL),('cc��jL��V�{�0+','/�_��Mp�XT�|��','Enfield',NULL,'2020-04-04 21:03:14.321',NULL),('cj�2��BҢ\0t�6o��','/�_��Mp�XT�|��','Sutton',NULL,'2020-04-04 21:03:14.326',NULL),('c~P<$UA����1�N�','/�_��Mp�XT�|��','Torbay',NULL,'2020-04-04 21:03:14.345',NULL),('eX�Q��Ao��\r�pێ','/�_��Mp�XT�|��','Tower Hamlets',NULL,'2020-04-04 21:03:14.327',NULL),('f,�&O�A�����.e','/�_��Mp�XT�|��','Bury',NULL,'2020-04-04 21:03:14.328',NULL),('g��_µI%��$l�1�;','/�_��Mp�XT�|��','North Yorkshire',NULL,'2020-04-04 21:03:14.313',NULL),('g����\\O��H��(<4F','/�_��Mp�XT�|��','Barnet',NULL,'2020-04-04 21:03:14.319',NULL),('i��t�\ZEm��7�D\06G','/�_��Mp�XT�|��','Bedford',NULL,'2020-04-04 21:03:14.335',NULL),('jcm=�&F�5�\Z!ܡ','/�_��Mp�XT�|��','Powys',NULL,'2020-04-04 21:03:14.359',NULL),('kj�7\"GN�ϵ�I�N','/�_��Mp�XT�|��','New York',NULL,'2020-04-04 21:03:14.371',NULL),('k�МnK����_$\'�','/�_��Mp�XT�|��','Nevada',NULL,'2020-04-04 21:03:14.370',NULL),('l���}O��B���>','/�_��Mp�XT�|��','South Tyneside',NULL,'2020-04-04 21:03:14.333',NULL),('lT$�Y�IՁ+��Q�O�','/�_��Mp�XT�|��','Swindon',NULL,'2020-04-04 21:03:14.344',NULL),('n��n?�J������^','/�_��Mp�XT�|��','Islington',NULL,'2020-04-04 21:03:14.324',NULL),('n�Ҽ=RJ)�����H��','/�_��Mp�XT�|��','Pennsylvania',NULL,'2020-04-04 21:03:14.372',NULL),('p;�q�K��~��mu?','/�_��Mp�XT�|��','Glasgow City',NULL,'2020-04-04 21:03:14.352',NULL),('pQ��t�B�}u�x�q','/�_��Mp�XT�|��','Alaska',NULL,'2020-04-04 21:03:14.365',NULL),('p�	c�D*��s\\՞l`','/�_��Mp�XT�|��','Bavaria',NULL,'2020-04-04 21:03:14.268',NULL),('p�	c�D*��s\\՞l`','�/p�L���M�4�8','Bayern',NULL,'2020-04-04 21:03:14.268',NULL),('qGo~̖A��`{b}j','/�_��Mp�XT�|��','Luton',NULL,'2020-04-04 21:03:14.340',NULL),('rɣ��N{�O/I��D�','/�_��Mp�XT�|��','Swansea',NULL,'2020-04-04 21:03:14.359',NULL),('rM�S�A��㭝GS��','/�_��Mp�XT�|��','Wiltshire',NULL,'2020-04-04 21:03:14.346',NULL),('t\nЭ�O)����{�.','/�_��Mp�XT�|��','Georgia',NULL,'2020-04-04 21:03:14.366',NULL),('t@�p�Mw���z2��@','/�_��Mp�XT�|��','Buckinghamshire',NULL,'2020-04-04 21:03:14.300',NULL),('tmj�N6��W��\'�','/�_��Mp�XT�|��','Bremen',NULL,'2020-04-04 21:03:14.273',NULL),('tmj�N6��W��\'�','�/p�L���M�4�8','Bremen',NULL,'2020-04-04 21:03:14.273',NULL),('t�4�@�J�m§�','/�_��Mp�XT�|��','Wakefield',NULL,'2020-04-04 21:03:14.334',NULL),('t�F/ՃG��� �}�\'','/�_��Mp�XT�|��','Moray',NULL,'2020-04-04 21:03:14.352',NULL),('vLԲ#�Aܬ������','/�_��Mp�XT�|��','Neath Port Talbot',NULL,'2020-04-04 21:03:14.358',NULL),('v�A��4B3����g,\'8','/�_��Mp�XT�|��','Aberdeen City',NULL,'2020-04-04 21:03:14.349',NULL),('x�W�ƼD���}\Z�\\��','/�_��Mp�XT�|��','Scottish Borders, The',NULL,'2020-04-04 21:03:14.354',NULL),('y�3��SBA�����8','/�_��Mp�XT�|��','Salford',NULL,'2020-04-04 21:03:14.332',NULL),('z�d��bAY����\"�','/�_��Mp�XT�|��','Surrey',NULL,'2020-04-04 21:03:14.317',NULL),('{S�zvGC�h?�1;','/�_��Mp�XT�|��','Perth and Kinross',NULL,'2020-04-04 21:03:14.353',NULL),('{ൔ�?NV�E{��ֈ','/�_��Mp�XT�|��','Worcestershire',NULL,'2020-04-04 21:03:14.318',NULL),('}�M��F�v��b�h','/�_��Mp�XT�|��','Orkney Islands',NULL,'2020-04-04 21:03:14.353',NULL),('}u��/[B��	�L�~','/�_��Mp�XT�|��','Darlington',NULL,'2020-04-04 21:03:14.338',NULL),('f$�ݝA���wn�hbv','/�_��Mp�XT�|��','Stirling',NULL,'2020-04-04 21:03:14.355',NULL),('jܩF�AY�T�vϪS','/�_��Mp�XT�|��','Indiana',NULL,'2020-04-04 21:03:14.367',NULL),('�����A8�<R8�Ɂ','/�_��Mp�XT�|��','South Carolina',NULL,'2020-04-04 21:03:14.373',NULL),('��HTKEͮ�sy$�`b','/�_��Mp�XT�|��','Leicester',NULL,'2020-04-04 21:03:14.340',NULL),('�T�ލ.B�\"ەrJ�','/�_��Mp�XT�|��','West Dunbartonshire',NULL,'2020-04-04 21:03:14.355',NULL),('�t�uqJ�����d�','/�_��Mp�XT�|��','Haringey',NULL,'2020-04-04 21:03:14.323',NULL),('����C��}\'�a��','/�_��Mp�XT�|��','Devon',NULL,'2020-04-04 21:03:14.304',NULL),('��{��B`�j�\0���','/�_��Mp�XT�|��','Rochdale',NULL,'2020-04-04 21:03:14.331',NULL),('�\"�HBY��5ٞ�','/�_��Mp�XT�|��','Lancashire',NULL,'2020-04-04 21:03:14.311',NULL),('�Y��6MՖ�`�\"q��','/�_��Mp�XT�|��','Vermont',NULL,'2020-04-04 21:03:14.374',NULL),('��A��HԵ��\0���','/�_��Mp�XT�|��','Edinburgh, City of',NULL,'2020-04-04 21:03:14.351',NULL),('�pH��C�)>%��&�','/�_��Mp�XT�|��','Clackmannanshire',NULL,'2020-04-04 21:03:14.349',NULL),('���\r}NM��M�74��X','/�_��Mp�XT�|��','Herefordshire',NULL,'2020-04-04 21:03:14.339',NULL),('��I��tI��kA�yAL�','/�_��Mp�XT�|��','Rotherham',NULL,'2020-04-04 21:03:14.332',NULL),('�TW�O�Ge���l���S','/�_��Mp�XT�|��','Rhode Island',NULL,'2020-04-04 21:03:14.372',NULL),('�~���Fe���e�<','/�_��Mp�XT�|��','Cornwall',NULL,'2020-04-04 21:03:14.337',NULL),('�>OԓJ���\Z��\r\Z','/�_��Mp�XT�|��','Cheshire East',NULL,'2020-04-04 21:03:14.337',NULL),('�򣗒�N�:1{�a','/�_��Mp�XT�|��','Merthyr Tydfil',NULL,'2020-04-04 21:03:14.357',NULL),('�4^ AU� ւ�4\\�','/�_��Mp�XT�|��','Durham County',NULL,'2020-04-04 21:03:14.338',NULL),('�ydqhFD�ّ�i�','/�_��Mp�XT�|��','Carmarthenshire',NULL,'2020-04-04 21:03:14.356',NULL),('��,��yIу���4���','/�_��Mp�XT�|��','Caerphilly',NULL,'2020-04-04 21:03:14.356',NULL),('�\'qxC��.���-�','/�_��Mp�XT�|��','South Lanarkshire',NULL,'2020-04-04 21:03:14.354',NULL),('�e9�RKL��0���*x','/�_��Mp�XT�|��','Renfrewshire',NULL,'2020-04-04 21:03:14.353',NULL),('�����\\@,�L���$:','/�_��Mp�XT�|��','Mid Ulster',NULL,'2020-04-04 21:03:14.348',NULL),('�@rk Nf�����(','/�_��Mp�XT�|��','Cumbria',NULL,'2020-04-04 21:03:14.302',NULL),('����5:Il�$��:*<\'','/�_��Mp�XT�|��','Fermanagh and Omagh',NULL,'2020-04-04 21:03:14.348',NULL),('���\Z\r�B#�u�9&o/','/�_��Mp�XT�|��','Manchester',NULL,'2020-04-04 21:03:14.331',NULL),('�w�\ncIū��M�e�','/�_��Mp�XT�|��','Saxony-Anhalt',NULL,'2020-04-04 21:03:14.285',NULL),('�w�\ncIū��M�e�','�/p�L���M�4�8','Sachsen-Anhalt',NULL,'2020-04-04 21:03:14.285',NULL),('�^��^B6��&U�<��','/�_��Mp�XT�|��','Richmond upon Thames',NULL,'2020-04-04 21:03:14.326',NULL),('�:�`��D�� uN��','/�_��Mp�XT�|��','Northamptonshire',NULL,'2020-04-04 21:03:14.313',NULL),('�2��gZG���@�qj\0','/�_��Mp�XT�|��','Camden',NULL,'2020-04-04 21:03:14.321',NULL),('�J��x�M�YoK,J�','/�_��Mp�XT�|��','Poole',NULL,'2020-04-04 21:03:14.342',NULL),('����vFH��޿��I�','/�_��Mp�XT�|��','East Lothian',NULL,'2020-04-04 21:03:14.350',NULL),('�m8�܅Ow��#�&_jz','/�_��Mp�XT�|��','North Lincolnshire',NULL,'2020-04-04 21:03:14.341',NULL),('�֍�)L����:�;A','/�_��Mp�XT�|��','Fife',NULL,'2020-04-04 21:03:14.351',NULL),('�����I=��I�_� �','/�_��Mp�XT�|��','Isles of Scilly',NULL,'2020-04-04 21:03:14.339',NULL),('����CA�<����','/�_��Mp�XT�|��','Oklahoma',NULL,'2020-04-04 21:03:14.372',NULL),('���a�I���	B�K�P','/�_��Mp�XT�|��','South Ayrshire',NULL,'2020-04-04 21:03:14.354',NULL),('�r��5�CS��=��^NM','/�_��Mp�XT�|��','Rhondda, Cynon, Taff',NULL,'2020-04-04 21:03:14.359',NULL),('���.әHL�l�9','/�_��Mp�XT�|��','Wrexham',NULL,'2020-04-04 21:03:14.360',NULL),('��}SӋGM���L�X�','/�_��Mp�XT�|��','Wisconsin',NULL,'2020-04-04 21:03:14.374',NULL),('�6�e>Ht���?y��','/�_��Mp�XT�|��','Windsor and Maidenhead',NULL,'2020-04-04 21:03:14.346',NULL),('�S@�@iKڧ4���z�','/�_��Mp�XT�|��','Blackpool',NULL,'2020-04-04 21:03:14.336',NULL),('��7tDN���k�L','/�_��Mp�XT�|��','North Carolina',NULL,'2020-04-04 21:03:14.371',NULL),('�ua��DC�V�t��`','/�_��Mp�XT�|��','Wokingham',NULL,'2020-04-04 21:03:14.346',NULL),('�t��E\\��2)��','/�_��Mp�XT�|��','Delaware',NULL,'2020-04-04 21:03:14.366',NULL),('�	���gES��U��z','/�_��Mp�XT�|��','Knowsley',NULL,'2020-04-04 21:03:14.330',NULL),('�&F3>Gb�i��\Zo�','/�_��Mp�XT�|��','Denbighshire',NULL,'2020-04-04 21:03:14.357',NULL),('����L:�$�ƾ�','/�_��Mp�XT�|��','Thurrock',NULL,'2020-04-04 21:03:14.345',NULL),('�Q���.I����EP','/�_��Mp�XT�|��','Waltham Forest',NULL,'2020-04-04 21:03:14.327',NULL),('��Ä�A��l�M�\"�','/�_��Mp�XT�|��','Walsall',NULL,'2020-04-04 21:03:14.334',NULL),('��T�}O˙xFg�<�','/�_��Mp�XT�|��','Great Britain',NULL,'2020-04-04 21:03:14.297',NULL),('�>��J�Ow������','/�_��Mp�XT�|��','Missouri',NULL,'2020-04-04 21:03:14.370',NULL),('��LݗI=���ԯp�w','/�_��Mp�XT�|��','Blaenau Gwent',NULL,'2020-04-04 21:03:14.355',NULL),('�����0B[��ٱ<s','/�_��Mp�XT�|��','Sunderland',NULL,'2020-04-04 21:03:14.333',NULL),('�|2�M�[���$�','/�_��Mp�XT�|��','Derby',NULL,'2020-04-04 21:03:14.338',NULL),('��r���A׷T������','/�_��Mp�XT�|��','Armagh, Banbridge and Craigavon',NULL,'2020-04-04 21:03:14.347',NULL),('��^��A\"���CH��','/�_��Mp�XT�|��','Derry and Strabane',NULL,'2020-04-04 21:03:14.347',NULL),('��S�7�HR���߹9�','/�_��Mp�XT�|��','Wales',NULL,'2020-04-04 21:03:14.296',NULL),('�@���A�W�E�<�','/�_��Mp�XT�|��','Leeds',NULL,'2020-04-04 21:03:14.330',NULL),('���oH��D�uf:�','/�_��Mp�XT�|��','Oldham',NULL,'2020-04-04 21:03:14.331',NULL),('��n��+C1�)A�C�!�','/�_��Mp�XT�|��','Angus',NULL,'2020-04-04 21:03:14.349',NULL),('�K}��JA�5)�0N','/�_��Mp�XT�|��','Monmouthshire',NULL,'2020-04-04 21:03:14.358',NULL),('�\Z�\n7|F ��QU?\05','/�_��Mp�XT�|��','Causeway Coast and Glens',NULL,'2020-04-04 21:03:14.347',NULL),('�,��Z�K��A�*,','/�_��Mp�XT�|��','Medway',NULL,'2020-04-04 21:03:14.340',NULL),('������@���;X�eP','/�_��Mp�XT�|��','Gwynedd',NULL,'2020-04-04 21:03:14.357',NULL),('����E�I���+�~�d','/�_��Mp�XT�|��','North Somerset',NULL,'2020-04-04 21:03:14.341',NULL),('��0]@�C@�$��s�','/�_��Mp�XT�|��','Brandenburg',NULL,'2020-04-04 21:03:14.271',NULL),('��0]@�C@�$��s�','�/p�L���M�4�8','Brandenburg',NULL,'2020-04-04 21:03:14.271',NULL),('�}]bM�����A0�','/�_��Mp�XT�|��','Kentucky',NULL,'2020-04-04 21:03:14.368',NULL),('���t?�@l���$��','/�_��Mp�XT�|��','North Rhine-Westphalia',NULL,'2020-04-04 21:03:14.280',NULL),('���t?�@l���$��','�/p�L���M�4�8','Nordrhein-Westfalen',NULL,'2020-04-04 21:03:14.280',NULL),('�\0̭�B-�+O�r\"�','/�_��Mp�XT�|��','Wolverhampton',NULL,'2020-04-04 21:03:14.335',NULL),('��;t�K/���>b4\Z','/�_��Mp�XT�|��','Hesse',NULL,'2020-04-04 21:03:14.275',NULL),('��;t�K/���>b4\Z','�/p�L���M�4�8','Hessen',NULL,'2020-04-04 21:03:14.275',NULL),('�#7H�G�Ks�','/�_��Mp�XT�|��','Maryland',NULL,'2020-04-04 21:03:14.369',NULL),('�U�\r6>GJ���M�C��','/�_��Mp�XT�|��','Florida',NULL,'2020-04-04 21:03:14.366',NULL),('�q�p�A��H�}��','/�_��Mp�XT�|��','Wandsworth',NULL,'2020-04-04 21:03:14.327',NULL),('�+20��E\'�=��C8','/�_��Mp�XT�|��','Bolton',NULL,'2020-04-04 21:03:14.328',NULL),('�Q�:�*G��@f��(','/�_��Mp�XT�|��','West Lothian',NULL,'2020-04-04 21:03:14.355',NULL),('đƺ3L��|�$�6','/�_��Mp�XT�|��','North East Lincolnshire',NULL,'2020-04-04 21:03:14.341',NULL),('Ŀ(%��G��A��!p��','/�_��Mp�XT�|��','Dundee City',NULL,'2020-04-04 21:03:14.350',NULL),('ŏ�&�,I�����L��','/�_��Mp�XT�|��','Hounslow',NULL,'2020-04-04 21:03:14.324',NULL),('�J�?N��Z��BT','/�_��Mp�XT�|��','Gloucestershire',NULL,'2020-04-04 21:03:14.308',NULL),('ƒz>=G��<.�*X�','/�_��Mp�XT�|��','Tameside',NULL,'2020-04-04 21:03:14.334',NULL),('ƺ���C|�;\Z}��:','/�_��Mp�XT�|��','Newry, Mourne and Down',NULL,'2020-04-04 21:03:14.348',NULL),('ȥk��AΟ+��G��','/�_��Mp�XT�|��','New Mexico',NULL,'2020-04-04 21:03:14.371',NULL),('��Į�Nݭ`��:�{','/�_��Mp�XT�|��','North Dakota',NULL,'2020-04-04 21:03:14.371',NULL),('˯P�ŰG8�������','/�_��Mp�XT�|��','Kingston upon Hull',NULL,'2020-04-04 21:03:14.339',NULL),('̐F+�BZ�r�/T���','/�_��Mp�XT�|��','Flintshire',NULL,'2020-04-04 21:03:14.357',NULL),('�}�oOO��I�q��','/�_��Mp�XT�|��','Antrim and Newtownabbey',NULL,'2020-04-04 21:03:14.346',NULL),('��&�`�LN���ګ��','/�_��Mp�XT�|��','Nottinghamshire',NULL,'2020-04-04 21:03:14.314',NULL),('�gT�%fJˏY9)�~�','/�_��Mp�XT�|��','Cardiff',NULL,'2020-04-04 21:03:14.356',NULL),('Ͼ�\'��H	�A*G��','/�_��Mp�XT�|��','East Dunbartonshire',NULL,'2020-04-04 21:03:14.350',NULL),('�����O��ܣv�\Z\n','/�_��Mp�XT�|��','Calderdale',NULL,'2020-04-04 21:03:14.329',NULL),('т׳q�@\n���@i�P�','/�_��Mp�XT�|��','Leicestershire',NULL,'2020-04-04 21:03:14.311',NULL),('���+S@��]�E�l�Y','/�_��Mp�XT�|��','Connecticut',NULL,'2020-04-04 21:03:14.366',NULL),('�+ ��C��v�$}v','/�_��Mp�XT�|��','West Virginia',NULL,'2020-04-04 21:03:14.374',NULL),('�G���?@6�Zؘ��','/�_��Mp�XT�|��','Hackney',NULL,'2020-04-04 21:03:14.322',NULL),('ս��hE鷉�)ݞ�!','/�_��Mp�XT�|��','South Dakota',NULL,'2020-04-04 21:03:14.373',NULL),('�50�קLl�{v��ᓭ','/�_��Mp�XT�|��','Southampton',NULL,'2020-04-04 21:03:14.344',NULL),('��8��O��������s','/�_��Mp�XT�|��','Bexley',NULL,'2020-04-04 21:03:14.320',NULL),('�mv2�\ZIش�����^','/�_��Mp�XT�|��','Hampshire',NULL,'2020-04-04 21:03:14.308',NULL),('��\r��A:�O�*=�LJ','/�_��Mp�XT�|��','Havering',NULL,'2020-04-04 21:03:14.323',NULL),('ێͺ�@r�Vz�M]�','/�_��Mp�XT�|��','Kingston upon Thames',NULL,'2020-04-04 21:03:14.324',NULL),('ۭh<~UM���_�ݒ��','/�_��Mp�XT�|��','Louisiana',NULL,'2020-04-04 21:03:14.368',NULL),('�5;K��F_��u%��','/�_��Mp�XT�|��','California',NULL,'2020-04-04 21:03:14.365',NULL),('ݶ���Iϝ���Z3','/�_��Mp�XT�|��','East Renfrewshire',NULL,'2020-04-04 21:03:14.351',NULL),('��(R�C���\"a��I','/�_��Mp�XT�|��','Highland',NULL,'2020-04-04 21:03:14.352',NULL),('�.e5�J��u�@����','/�_��Mp�XT�|��','Southend-on-Sea',NULL,'2020-04-04 21:03:14.344',NULL),('߼M\\jkO�@��/�G�','/�_��Mp�XT�|��','Warrington',NULL,'2020-04-04 21:03:14.345',NULL),('�L\'���G���z���0','/�_��Mp�XT�|��','Trafford',NULL,'2020-04-04 21:03:14.334',NULL),('�\"�\"D�#\r�\"T\\s','/�_��Mp�XT�|��','Rhineland-Palatinate',NULL,'2020-04-04 21:03:14.281',NULL),('�\"�\"D�#\r�\"T\\s','�/p�L���M�4�8','Rheinland-Pfalz',NULL,'2020-04-04 21:03:14.281',NULL),('�3��V�N��p<�','/�_��Mp�XT�|��','New Jersey',NULL,'2020-04-04 21:03:14.371',NULL),('�s�&�K��ǯX���n','/�_��Mp�XT�|��','Torfaen',NULL,'2020-04-04 21:03:14.359',NULL),('��Fu�F����ru`�\"','/�_��Mp�XT�|��','Kensington and Chelsea',NULL,'2020-04-04 21:03:14.324',NULL),('��@��N��mUX�W','/�_��Mp�XT�|��','North Ayrshire',NULL,'2020-04-04 21:03:14.353',NULL),('�{�B�OǄMm\"T�4�','/�_��Mp�XT�|��','Peterborough',NULL,'2020-04-04 21:03:14.342',NULL),('���r�Cّ�ՉŪ','/�_��Mp�XT�|��','Ealing',NULL,'2020-04-04 21:03:14.321',NULL),('�<x��;A>�!eKr�\"','/�_��Mp�XT�|��','Washington',NULL,'2020-04-04 21:03:14.374',NULL),('�\0^�O]�1b��EV','/�_��Mp�XT�|��','Redcar and Cleveland',NULL,'2020-04-04 21:03:14.343',NULL),('����EKF���M��3','/�_��Mp�XT�|��','Lincolnshire',NULL,'2020-04-04 21:03:14.312',NULL),('�u}I��4�YW5:','/�_��Mp�XT�|��','Harrow',NULL,'2020-04-04 21:03:14.323',NULL),('�6�=J�����k�~�','/�_��Mp�XT�|��','Hartlepool',NULL,'2020-04-04 21:03:14.339',NULL),('��̒N�I���~\0쥾','/�_��Mp�XT�|��','Arizona',NULL,'2020-04-04 21:03:14.365',NULL),('�q-�\nkA.��lF��','/�_��Mp�XT�|��','Lower Saxony',NULL,'2020-04-04 21:03:14.277',NULL),('�q-�\nkA.��lF��','�/p�L���M�4�8','Niedersachsen',NULL,'2020-04-04 21:03:14.277',NULL),('�{+�3�A��JKc5��','/�_��Mp�XT�|��','Oxfordshire',NULL,'2020-04-04 21:03:14.314',NULL),('�E��qCB�y~]��','/�_��Mp�XT�|��','Barnsley',NULL,'2020-04-04 21:03:14.327',NULL),('����nRM$��:�\Z^�','/�_��Mp�XT�|��','Arkansas',NULL,'2020-04-04 21:03:14.365',NULL),('��m[�K�����I5��','/�_��Mp�XT�|��','Rutland',NULL,'2020-04-04 21:03:14.343',NULL),('�4D�h%A/��g��E��','/�_��Mp�XT�|��','Halton',NULL,'2020-04-04 21:03:14.338',NULL),('��h�E0����\'9�','/�_��Mp�XT�|��','Bristol, City of',NULL,'2020-04-04 21:03:14.337',NULL),('�Z\\\r�J��\'�S��','/�_��Mp�XT�|��','Belfast',NULL,'2020-04-04 21:03:14.347',NULL),('��#r��K���-��E�','/�_��Mp�XT�|��','Newham',NULL,'2020-04-04 21:03:14.325',NULL),('�;T��G�|�J��Ҝ','/�_��Mp�XT�|��','Lambeth',NULL,'2020-04-04 21:03:14.325',NULL),('�@@/`�L�����v\"�','/�_��Mp�XT�|��','North Tyneside',NULL,'2020-04-04 21:03:14.331',NULL),('�wG��iG\r��%vŠE�','/�_��Mp�XT�|��','Lewisham',NULL,'2020-04-04 21:03:14.325',NULL),('��LA{@7�z`�y>�','/�_��Mp�XT�|��','Lisburn and Castlereagh',NULL,'2020-04-04 21:03:14.348',NULL),('��0[j�A��q���','/�_��Mp�XT�|��','Coventry',NULL,'2020-04-04 21:03:14.329',NULL),('��]nzAFo��R?d��','/�_��Mp�XT�|��','Bracknell Forest',NULL,'2020-04-04 21:03:14.336',NULL),('�A�\ZJ�MڿK��Z��l','/�_��Mp�XT�|��','Schleswig-Holstein',NULL,'2020-04-04 21:03:14.287',NULL),('�A�\ZJ�MڿK��Z��l','�/p�L���M�4�8','Schleswig-Holstein',NULL,'2020-04-04 21:03:14.287',NULL),('�D���fBv��Ƶ��','/�_��Mp�XT�|��','East Ayrshire',NULL,'2020-04-04 21:03:14.350',NULL),('�b=���C_��W�]A','/�_��Mp�XT�|��','Northumberland',NULL,'2020-04-04 21:03:14.341',NULL),('��%��F$���2���&','/�_��Mp�XT�|��','Portsmouth',NULL,'2020-04-04 21:03:14.342',NULL),('�o}�WXG��߻=�u�','/�_��Mp�XT�|��','North Lanarkshire',NULL,'2020-04-04 21:03:14.353',NULL),('��Yg�D�F�����-','/�_��Mp�XT�|��','England and Wales',NULL,'2020-04-04 21:03:14.297',NULL),('�[է��@��Oo��Q-�','/�_��Mp�XT�|��','District of Columbia',NULL,'2020-04-04 21:03:14.375',NULL),('���JI��a)�E','/�_��Mp�XT�|��','Shetland Islands',NULL,'2020-04-04 21:03:14.354',NULL);
/*!40000 ALTER TABLE `country_state_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translation`
--

DROP TABLE IF EXISTS `country_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_translation` (
  `country_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`country_id`,`language_id`),
  KEY `fk.country_translation.language_id` (`language_id`),
  CONSTRAINT `fk.country_translation.country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.country_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.country_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translation`
--

LOCK TABLES `country_translation` WRITE;
/*!40000 ALTER TABLE `country_translation` DISABLE KEYS */;
INSERT INTO `country_translation` VALUES ('\0j�>�NY�cI�H%٢','/�_��Mp�XT�|��','Hungary',NULL,'2020-04-04 21:03:14.376',NULL),('\0j�>�NY�cI�H%٢','�/p�L���M�4�8','Ungarn',NULL,'2020-04-04 21:03:14.376',NULL),('\r��Z�#N�5B���w','/�_��Mp�XT�|��','Ireland',NULL,'2020-04-04 21:03:14.360',NULL),('\r��Z�#N�5B���w','�/p�L���M�4�8','Irland',NULL,'2020-04-04 21:03:14.360',NULL),('V�\Zd@ȢMǴq��','/�_��Mp�XT�|��','Austria',NULL,'2020-04-04 21:03:14.363',NULL),('V�\Zd@ȢMǴq��','�/p�L���M�4�8','Österreich',NULL,'2020-04-04 21:03:14.363',NULL),('\Z!�~�K���?��}��','/�_��Mp�XT�|��','United Kingdom',NULL,'2020-04-04 21:03:14.292',NULL),('\Z!�~�K���?��}��','�/p�L���M�4�8','Vereinigtes Königreich',NULL,'2020-04-04 21:03:14.292',NULL),('\Zrp��H5�3\\=�\"��','/�_��Mp�XT�|��','Sweden',NULL,'2020-04-04 21:03:14.364',NULL),('\Zrp��H5�3\\=�\"��','�/p�L���M�4�8','Schweden',NULL,'2020-04-04 21:03:14.364',NULL),('\"f�J��BF�D�3a�cH','/�_��Mp�XT�|��','Romania',NULL,'2020-04-04 21:03:14.377',NULL),('\"f�J��BF�D�3a�cH','�/p�L���M�4�8','Rumänien',NULL,'2020-04-04 21:03:14.378',NULL),('&>3	BA��ۃ�+�','/�_��Mp�XT�|��','Spain',NULL,'2020-04-04 21:03:14.364',NULL),('&>3	BA��ۃ�+�','�/p�L���M�4�8','Spanien',NULL,'2020-04-04 21:03:14.364',NULL),('.R��)fMT����.�(�','/�_��Mp�XT�|��','Luxembourg',NULL,'2020-04-04 21:03:14.362',NULL),('.R��)fMT����.�(�','�/p�L���M�4�8','Luxemburg',NULL,'2020-04-04 21:03:14.362',NULL),('3Pp�i�G�4��=G:�','/�_��Mp�XT�|��','France',NULL,'2020-04-04 21:03:14.380',NULL),('3Pp�i�G�4��=G:�','�/p�L���M�4�8','Frankreich',NULL,'2020-04-04 21:03:14.380',NULL),(';[��$J��\Z\n,���9','/�_��Mp�XT�|��','Canada',NULL,'2020-04-04 21:03:14.361',NULL),(';[��$J��\Z\n,���9','�/p�L���M�4�8','Kanada',NULL,'2020-04-04 21:03:14.361',NULL),('Hv���G���;̸t��','/�_��Mp�XT�|��','Liechtenstein',NULL,'2020-04-04 21:03:14.375',NULL),('Hv���G���;̸t��','�/p�L���M�4�8','Liechtenstein',NULL,'2020-04-04 21:03:14.375',NULL),('LM\Z�Hr��$lsZ��','/�_��Mp�XT�|��','Australia',NULL,'2020-04-04 21:03:14.378',NULL),('LM\Z�Hr��$lsZ��','�/p�L���M�4�8','Australien',NULL,'2020-04-04 21:03:14.379',NULL),('P̯�[�@աA!\rԬ','/�_��Mp�XT�|��','Finland',NULL,'2020-04-04 21:03:14.379',NULL),('P̯�[�@աA!\rԬ','�/p�L���M�4�8','Finnland',NULL,'2020-04-04 21:03:14.379',NULL),('bE�ۢ�Bf���\\���','/�_��Mp�XT�|��','Japan',NULL,'2020-04-04 21:03:14.361',NULL),('bE�ۢ�Bf���\\���','�/p�L���M�4�8','Japan',NULL,'2020-04-04 21:03:14.361',NULL),('o�9?s�F������]','/�_��Mp�XT�|��','Portugal',NULL,'2020-04-04 21:03:14.363',NULL),('o�9?s�F������]','�/p�L���M�4�8','Portugal',NULL,'2020-04-04 21:03:14.363',NULL),('��>,J���#��a','/�_��Mp�XT�|��','Germany',NULL,'2020-04-04 21:03:14.265',NULL),('��>,J���#��a','�/p�L���M�4�8','Deutschland',NULL,'2020-04-04 21:03:14.265',NULL),('��G��A*����MX;','/�_��Mp�XT�|��','Arab Emirates',NULL,'2020-04-04 21:03:14.376',NULL),('��G��A*����MX;','�/p�L���M�4�8','Arabische Emirate',NULL,'2020-04-04 21:03:14.376',NULL),('�\n��N�Pd�(��','/�_��Mp�XT�|��','Israel',NULL,'2020-04-04 21:03:14.378',NULL),('�\n��N�Pd�(��','�/p�L���M�4�8','Israel',NULL,'2020-04-04 21:03:14.378',NULL),('��o��O捖9|-��f','/�_��Mp�XT�|��','Iceland',NULL,'2020-04-04 21:03:14.360',NULL),('��o��O捖9|-��f','�/p�L���M�4�8','Island',NULL,'2020-04-04 21:03:14.360',NULL),('�a��p�G3�,��Z���','/�_��Mp�XT�|��','Netherlands',NULL,'2020-04-04 21:03:14.362',NULL),('�a��p�G3�,��Z���','�/p�L���M�4�8','Niederlande',NULL,'2020-04-04 21:03:14.362',NULL),('�v�QWF��3�\rK�6�','/�_��Mp�XT�|��','USA',NULL,'2020-04-04 21:03:14.364',NULL),('�v�QWF��3�\rK�6�','�/p�L���M�4�8','USA',NULL,'2020-04-04 21:03:14.365',NULL),('�p���B��Y��`�6','/�_��Mp�XT�|��','Italy',NULL,'2020-04-04 21:03:14.361',NULL),('�p���B��Y��`�6','�/p�L���M�4�8','Italien',NULL,'2020-04-04 21:03:14.361',NULL),('Ʒ���H?�D��\n@�o','/�_��Mp�XT�|��','Greece',NULL,'2020-04-04 21:03:14.290',NULL),('Ʒ���H?�D��\n@�o','�/p�L���M�4�8','Griechenland',NULL,'2020-04-04 21:03:14.291',NULL),('��Ɲr\'Fn�e�|Ps��','/�_��Mp�XT�|��','Poland',NULL,'2020-04-04 21:03:14.376',NULL),('��Ɲr\'Fn�e�|Ps��','�/p�L���M�4�8','Polen',NULL,'2020-04-04 21:03:14.376',NULL),('����@��bt�L$�','/�_��Mp�XT�|��','Brazil',NULL,'2020-04-04 21:03:14.378',NULL),('����@��bt�L$�','�/p�L���M�4�8','Brasilien',NULL,'2020-04-04 21:03:14.378',NULL),('�k���C��:����L�','/�_��Mp�XT�|��','Norway',NULL,'2020-04-04 21:03:14.363',NULL),('�k���C��:����L�','�/p�L���M�4�8','Norwegen',NULL,'2020-04-04 21:03:14.363',NULL),('�9R�dmG����,�','/�_��Mp�XT�|��','Denmark',NULL,'2020-04-04 21:03:14.379',NULL),('�9R�dmG����,�','�/p�L���M�4�8','Dänemark',NULL,'2020-04-04 21:03:14.379',NULL),('�mN҆�@e��R*�bP\r','/�_��Mp�XT�|��','Belgium',NULL,'2020-04-04 21:03:14.379',NULL),('�mN҆�@e��R*�bP\r','�/p�L���M�4�8','Belgien',NULL,'2020-04-04 21:03:14.379',NULL),('��Fm�Ce����R��','/�_��Mp�XT�|��','Switzerland',NULL,'2020-04-04 21:03:14.364',NULL),('��Fm�Ce����R��','�/p�L���M�4�8','Schweiz',NULL,'2020-04-04 21:03:14.364',NULL),('�¼���LG��f�X','/�_��Mp�XT�|��','Turkey',NULL,'2020-04-04 21:03:14.376',NULL),('�¼���LG��f�X','�/p�L���M�4�8','Türkei',NULL,'2020-04-04 21:03:14.377',NULL),('�)�8�Di��:�t���','/�_��Mp�XT�|��','Namibia',NULL,'2020-04-04 21:03:14.362',NULL),('�)�8�Di��:�t���','�/p�L���M�4�8','Namibia',NULL,'2020-04-04 21:03:14.362',NULL),('�U��O!�t\ZK���','/�_��Mp�XT�|��','Slovenia',NULL,'2020-04-04 21:03:14.377',NULL),('�U��O!�t\ZK���','�/p�L���M�4�8','Slowenien',NULL,'2020-04-04 21:03:14.377',NULL),('��^klC�Q���7�','/�_��Mp�XT�|��','Czech Republic',NULL,'2020-04-04 21:03:14.377',NULL),('��^klC�Q���7�','�/p�L���M�4�8','Tschechische Republik',NULL,'2020-04-04 21:03:14.377',NULL);
/*!40000 ALTER TABLE `country_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` binary(16) NOT NULL,
  `iso_code` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `factor` double NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `decimal_precision` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.currency.iso_code` (`iso_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES ('&���iOS��(]W��','PLN',4.33,'zł',1,2,'2020-04-04 21:03:21.802',NULL),('��&�,O��L��-\0�','DKK',7.47,'kr',1,2,'2020-04-04 21:03:21.812',NULL),('�w��K�O��R��/�','NOK',0.099,'nkr',1,2,'2020-04-04 21:03:21.815',NULL),('��Kg7>Dg���^g�F','USD',1.17085,'$',1,2,'2020-04-04 21:03:14.381',NULL),('��,nAD�\n�i�^�','SEK',10.51,'kr',1,2,'2020-04-04 21:03:21.809',NULL),('��UK�G͂�����','EUR',1,'€',1,2,'2020-04-04 21:03:14.380',NULL),('�D�N��H����~��','CHF',1.1,'Fr',1,2,'2020-04-04 21:03:21.806',NULL),('���I·!��B�','GBP',0.89157,'£',1,2,'2020-04-04 21:03:14.382',NULL);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_translation`
--

DROP TABLE IF EXISTS `currency_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_translation` (
  `currency_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`currency_id`,`language_id`),
  KEY `fk.currency_translation.language_id` (`language_id`),
  CONSTRAINT `fk.currency_translation.currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.currency_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.currency_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_translation`
--

LOCK TABLES `currency_translation` WRITE;
/*!40000 ALTER TABLE `currency_translation` DISABLE KEYS */;
INSERT INTO `currency_translation` VALUES ('&���iOS��(]W��','/�_��Mp�XT�|��','PLN','Złoty',NULL,'2020-04-04 21:03:21.804',NULL),('&���iOS��(]W��','�/p�L���M�4�8','PLN','Złoty',NULL,'2020-04-04 21:03:21.805',NULL),('��&�,O��L��-\0�','/�_��Mp�XT�|��','DKK','Danish krone',NULL,'2020-04-04 21:03:21.813',NULL),('��&�,O��L��-\0�','�/p�L���M�4�8','DKK','Dänische Kronen',NULL,'2020-04-04 21:03:21.814',NULL),('�w��K�O��R��/�','/�_��Mp�XT�|��','NOK','Norwegian krone',NULL,'2020-04-04 21:03:21.816',NULL),('�w��K�O��R��/�','�/p�L���M�4�8','NOK','Norwegische Kronen',NULL,'2020-04-04 21:03:21.817',NULL),('��Kg7>Dg���^g�F','/�_��Mp�XT�|��','USD','US-Dollar',NULL,'2020-04-04 21:03:14.381',NULL),('��Kg7>Dg���^g�F','�/p�L���M�4�8','USD','US-Dollar',NULL,'2020-04-04 21:03:14.382',NULL),('��,nAD�\n�i�^�','/�_��Mp�XT�|��','SEK','Swedish krone',NULL,'2020-04-04 21:03:21.810',NULL),('��,nAD�\n�i�^�','�/p�L���M�4�8','SEK','Schwedische Kronen',NULL,'2020-04-04 21:03:21.811',NULL),('��UK�G͂�����','/�_��Mp�XT�|��','EUR','Euro',NULL,'2020-04-04 21:03:14.381',NULL),('��UK�G͂�����','�/p�L���M�4�8','EUR','Euro',NULL,'2020-04-04 21:03:14.381',NULL),('�D�N��H����~��','/�_��Mp�XT�|��','CHF','Swiss francs',NULL,'2020-04-04 21:03:21.807',NULL),('�D�N��H����~��','�/p�L���M�4�8','CHF','Schweizer Franken',NULL,'2020-04-04 21:03:21.808',NULL),('���I·!��B�','/�_��Mp�XT�|��','GBP','Pound',NULL,'2020-04-04 21:03:14.382',NULL),('���I·!��B�','�/p�L���M�4�8','GBP','Pfund',NULL,'2020-04-04 21:03:14.382',NULL);
/*!40000 ALTER TABLE `currency_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field`
--

DROP TABLE IF EXISTS `custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `set_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.custom_field.name` (`name`),
  KEY `fk.custom_field.set_id` (`set_id`),
  CONSTRAINT `fk.custom_field.set_id` FOREIGN KEY (`set_id`) REFERENCES `custom_field_set` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.custom_field.config` CHECK (json_valid(`config`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field`
--

LOCK TABLES `custom_field` WRITE;
/*!40000 ALTER TABLE `custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_set`
--

DROP TABLE IF EXISTS `custom_field_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_set` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `json.custom_field_set.config` CHECK (json_valid(`config`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_set`
--

LOCK TABLES `custom_field_set` WRITE;
/*!40000 ALTER TABLE `custom_field_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_set_relation`
--

DROP TABLE IF EXISTS `custom_field_set_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_set_relation` (
  `id` binary(16) NOT NULL,
  `set_id` binary(16) NOT NULL,
  `entity_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.custom_field_set_relation.entity_name` (`set_id`,`entity_name`),
  CONSTRAINT `fk.custom_field_set_relation.set_id` FOREIGN KEY (`set_id`) REFERENCES `custom_field_set` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_set_relation`
--

LOCK TABLES `custom_field_set_relation` WRITE;
/*!40000 ALTER TABLE `custom_field_set_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_set_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` binary(16) NOT NULL,
  `auto_increment` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` binary(16) NOT NULL,
  `default_payment_method_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `last_payment_method_id` binary(16) DEFAULT NULL,
  `default_billing_address_id` binary(16) NOT NULL,
  `default_shipping_address_id` binary(16) NOT NULL,
  `customer_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salutation_id` binary(16) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `legacy_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `legacy_encoder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `doubleOptInRegistration` tinyint(1) NOT NULL DEFAULT 0,
  `doubleOptInEmailSentDate` datetime(3) DEFAULT NULL,
  `doubleOptInConfirmDate` datetime(3) DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest` tinyint(1) NOT NULL DEFAULT 0,
  `first_login` datetime(3) DEFAULT NULL,
  `last_login` datetime(3) DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `last_order_date` datetime(3) DEFAULT NULL,
  `order_count` int(5) NOT NULL DEFAULT 0,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `affiliate_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `remote_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.auto_increment` (`auto_increment`),
  UNIQUE KEY `hash` (`hash`),
  KEY `idx.firstlogin` (`first_login`),
  KEY `idx.lastlogin` (`last_login`),
  KEY `idx.customer.default_billing_address_id` (`default_billing_address_id`),
  KEY `idx.customer.default_shipping_address_id` (`default_shipping_address_id`),
  KEY `fk.customer.customer_group_id` (`customer_group_id`),
  KEY `fk.customer.default_payment_method_id` (`default_payment_method_id`),
  KEY `fk.customer.last_payment_method_id` (`last_payment_method_id`),
  KEY `fk.customer.sales_channel_id` (`sales_channel_id`),
  KEY `fk.customer.salutation_id` (`salutation_id`),
  CONSTRAINT `fk.customer.customer_group_id` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.customer.default_payment_method_id` FOREIGN KEY (`default_payment_method_id`) REFERENCES `payment_method` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.customer.last_payment_method_id` FOREIGN KEY (`last_payment_method_id`) REFERENCES `payment_method` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.customer.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.customer.salutation_id` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.customer.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('l�SL,G�Q�<��',1,'ϽPӍAح��OȽ�','����IS��C��E��','�C-�9�F$�2�k��M','/�_��Mp�XT�|��',NULL,'�����9G����/e	�,','�����9G����/e	�,','SWDEMO10000','Ƒn��A۝c����3�','Max','Mustermann',NULL,'$2y$10$qYoCQe2r3h/tiGIqwsq7YuuKBGCEmgtM/U4v182xtKDrFv5vSNFJO',NULL,NULL,'test@example.com',NULL,1,0,NULL,NULL,NULL,0,NULL,'2019-06-12 07:13:39.641',0,'1996-06-06',NULL,0,NULL,NULL,NULL,'2020-04-04 21:05:18.400',NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address` (
  `id` binary(16) NOT NULL,
  `customer_id` binary(16) NOT NULL,
  `country_id` binary(16) NOT NULL,
  `country_state_id` binary(16) DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salutation_id` binary(16) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_address_line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.customer_address.country_id` (`country_id`),
  KEY `fk.customer_address.country_state_id` (`country_state_id`),
  KEY `fk.customer_address.customer_id` (`customer_id`),
  KEY `fk.customer_address.salutation_id` (`salutation_id`),
  CONSTRAINT `fk.customer_address.country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.customer_address.country_state_id` FOREIGN KEY (`country_state_id`) REFERENCES `country_state` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk.customer_address.customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.customer_address.salutation_id` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.customer_address.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES ('�����9G����/e	�,','l�SL,G�Q�<��','\0j�>�NY�cI�H%٢',NULL,NULL,NULL,'Ƒn��A۝c����3�',NULL,'Max','Mustermann','Musterstraße 1','12345','Musterstadt',NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:18.399',NULL);
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_group` (
  `id` binary(16) NOT NULL,
  `display_gross` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group`
--

LOCK TABLES `customer_group` WRITE;
/*!40000 ALTER TABLE `customer_group` DISABLE KEYS */;
INSERT INTO `customer_group` VALUES ('ϽPӍAح��OȽ�',1,'2020-04-04 21:03:14.382',NULL);
/*!40000 ALTER TABLE `customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_group_translation`
--

DROP TABLE IF EXISTS `customer_group_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_group_translation` (
  `customer_group_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`),
  KEY `fk.customer_group_translation.language_id` (`language_id`),
  CONSTRAINT `fk.customer_group_translation.customer_group_id` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.customer_group_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.customer_group_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_group_translation`
--

LOCK TABLES `customer_group_translation` WRITE;
/*!40000 ALTER TABLE `customer_group_translation` DISABLE KEYS */;
INSERT INTO `customer_group_translation` VALUES ('ϽPӍAح��OȽ�','/�_��Mp�XT�|��','Standard customer group',NULL,'2020-04-04 21:03:14.383',NULL),('ϽPӍAح��OȽ�','�/p�L���M�4�8','Standard-Kundengruppe',NULL,'2020-04-04 21:03:14.383',NULL);
/*!40000 ALTER TABLE `customer_group_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_recovery`
--

DROP TABLE IF EXISTS `customer_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_recovery` (
  `id` binary(16) NOT NULL,
  `customer_id` binary(16) NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  UNIQUE KEY `uniq.customer_recovery.customer_id` (`customer_id`),
  CONSTRAINT `fk.customer_recovery.customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_recovery`
--

LOCK TABLES `customer_recovery` WRITE;
/*!40000 ALTER TABLE `customer_recovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_tag`
--

DROP TABLE IF EXISTS `customer_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_tag` (
  `customer_id` binary(16) NOT NULL,
  `tag_id` binary(16) NOT NULL,
  PRIMARY KEY (`customer_id`,`tag_id`),
  KEY `fk.customer_tag.tag_id` (`tag_id`),
  CONSTRAINT `fk.customer_tag.customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk.customer_tag.tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_tag`
--

LOCK TABLES `customer_tag` WRITE;
/*!40000 ALTER TABLE `customer_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dead_message`
--

DROP TABLE IF EXISTS `dead_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dead_message` (
  `id` binary(16) NOT NULL,
  `original_message_class` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `serialized_original_message` longblob NOT NULL,
  `handler_class` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `encrypted` tinyint(1) NOT NULL DEFAULT 0,
  `error_count` int(11) NOT NULL,
  `next_execution_time` datetime(3) NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception_file` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception_line` int(11) NOT NULL,
  `scheduled_task_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.dead_message.scheduled_task_id` (`scheduled_task_id`),
  CONSTRAINT `fk.dead_message.scheduled_task_id` FOREIGN KEY (`scheduled_task_id`) REFERENCES `scheduled_task` (`id`) ON DELETE SET NULL,
  CONSTRAINT `check.dead_message.error_count` CHECK (`error_count` >= 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dead_message`
--

LOCK TABLES `dead_message` WRITE;
/*!40000 ALTER TABLE `dead_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `dead_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_time`
--

DROP TABLE IF EXISTS `delivery_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_time` (
  `id` binary(16) NOT NULL,
  `min` int(3) NOT NULL,
  `max` int(3) NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_time`
--

LOCK TABLES `delivery_time` WRITE;
/*!40000 ALTER TABLE `delivery_time` DISABLE KEYS */;
INSERT INTO `delivery_time` VALUES ('�\\N&�i\"�w>/',2,5,'day','2020-04-04 21:03:14.000',NULL),('qza��UIW��|1�.',1,2,'week','2020-04-04 21:03:14.000',NULL),('�-��j|B:�6bl(Î',1,3,'day','2020-04-04 21:03:14.000',NULL),('�p��-,KݧM�fÄ�',3,4,'week','2020-04-04 21:03:14.000',NULL);
/*!40000 ALTER TABLE `delivery_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_time_translation`
--

DROP TABLE IF EXISTS `delivery_time_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_time_translation` (
  `delivery_time_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`delivery_time_id`,`language_id`),
  KEY `fk.delivery_time_translation.language_id` (`language_id`),
  CONSTRAINT `fk.delivery_time_translation.delivery_time_id` FOREIGN KEY (`delivery_time_id`) REFERENCES `delivery_time` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.delivery_time_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_time_translation`
--

LOCK TABLES `delivery_time_translation` WRITE;
/*!40000 ALTER TABLE `delivery_time_translation` DISABLE KEYS */;
INSERT INTO `delivery_time_translation` VALUES ('�\\N&�i\"�w>/','/�_��Mp�XT�|��','2-5 days',NULL,'2020-04-04 21:03:14.000',NULL),('�\\N&�i\"�w>/','�/p�L���M�4�8','2-5 Tage',NULL,'2020-04-04 21:03:14.000',NULL),('qza��UIW��|1�.','/�_��Mp�XT�|��','1-2 weeks',NULL,'2020-04-04 21:03:14.000',NULL),('qza��UIW��|1�.','�/p�L���M�4�8','1-2 Wochen',NULL,'2020-04-04 21:03:14.000',NULL),('�-��j|B:�6bl(Î','/�_��Mp�XT�|��','1-3 days',NULL,'2020-04-04 21:03:14.000',NULL),('�-��j|B:�6bl(Î','�/p�L���M�4�8','1-3 Tage',NULL,'2020-04-04 21:03:14.000',NULL),('�p��-,KݧM�fÄ�','/�_��Mp�XT�|��','3-4 weeks',NULL,'2020-04-04 21:03:14.000',NULL),('�p��-,KݧM�fÄ�','�/p�L���M�4�8','3-4 Wochen',NULL,'2020-04-04 21:03:14.000',NULL);
/*!40000 ALTER TABLE `delivery_time_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` binary(16) NOT NULL,
  `document_type_id` binary(16) NOT NULL,
  `referenced_document_id` binary(16) DEFAULT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` binary(16) NOT NULL,
  `order_version_id` binary(16) NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `static` tinyint(1) NOT NULL DEFAULT 0,
  `deep_link_code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_media_file_id` binary(16) DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.deep_link_code` (`deep_link_code`),
  KEY `fk.document.document_type_id` (`document_type_id`),
  KEY `fk.document.referenced_document_id` (`referenced_document_id`),
  KEY `fk.document.order_id` (`order_id`,`order_version_id`),
  KEY `fk.document.document_media_file_id` (`document_media_file_id`),
  CONSTRAINT `fk.document.document_media_file_id` FOREIGN KEY (`document_media_file_id`) REFERENCES `media` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.document.document_type_id` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.document.order_id` FOREIGN KEY (`order_id`, `order_version_id`) REFERENCES `order` (`id`, `version_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.document.referenced_document_id` FOREIGN KEY (`referenced_document_id`) REFERENCES `document` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.document.custom_fields` CHECK (json_valid(`custom_fields`)),
  CONSTRAINT `json.document.config` CHECK (json_valid(`config`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_base_config`
--

DROP TABLE IF EXISTS `document_base_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_base_config` (
  `id` binary(16) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename_prefix` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `filename_suffix` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `document_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `global` tinyint(1) DEFAULT 0,
  `document_type_id` binary(16) NOT NULL,
  `logo_id` binary(16) DEFAULT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx.document_base_config.type_id` (`document_type_id`),
  KEY `fk.document_base_config.logo_id` (`logo_id`),
  CONSTRAINT `fk.document_base_config.logo_id` FOREIGN KEY (`logo_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.document_base_config.type_id` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.config` CHECK (json_valid(`config`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_base_config`
--

LOCK TABLES `document_base_config` WRITE;
/*!40000 ALTER TABLE `document_base_config` DISABLE KEYS */;
INSERT INTO `document_base_config` VALUES ('$��*�D��3��|�','storno','storno_','','',1,'���@��F�����q�E',NULL,'{\"displayPrices\":true,\"displayFooter\":true,\"displayHeader\":true,\"displayLineItems\":true,\"diplayLineItemPosition\":true,\"displayPageCount\":true,\"displayCompanyAddress\":true,\"pageOrientation\":\"portrait\",\"pageSize\":\"a4\",\"itemsPerPage\":10,\"companyName\":\"Muster AG\",\"taxNumber\":\"000111000\",\"vatId\":\"XX 111 222 333\",\"taxOffice\":\"Coesfeld\",\"bankName\":\"Kreissparkasse M\\u00fcnster\",\"bankIban\":\"DE11111222223333344444\",\"bankBic\":\"SWSKKEFF\",\"placeOfJurisdiction\":\"Coesfeld\",\"placeOfFulfillment\":\"Coesfeld\",\"executiveDirector\":\"Max Mustermann\",\"companyAddress\":\"Muster AG - Ebbinghoff 10 - 48624 Sch\\u00f6ppingen\",\"referencedDocumentType\":\"invoice\"}','2020-04-04 21:03:14.416',NULL),('9��i\'D|�wрE=','credit_note','credit_note_','','',1,'�1����Bg���\\?�y',NULL,'{\"displayPrices\":true,\"displayFooter\":true,\"displayHeader\":true,\"displayLineItems\":true,\"diplayLineItemPosition\":true,\"displayPageCount\":true,\"displayCompanyAddress\":true,\"pageOrientation\":\"portrait\",\"pageSize\":\"a4\",\"itemsPerPage\":10,\"companyName\":\"Muster AG\",\"taxNumber\":\"000111000\",\"vatId\":\"XX 111 222 333\",\"taxOffice\":\"Coesfeld\",\"bankName\":\"Kreissparkasse M\\u00fcnster\",\"bankIban\":\"DE11111222223333344444\",\"bankBic\":\"SWSKKEFF\",\"placeOfJurisdiction\":\"Coesfeld\",\"placeOfFulfillment\":\"Coesfeld\",\"executiveDirector\":\"Max Mustermann\",\"companyAddress\":\"Muster AG - Ebbinghoff 10 - 48624 Sch\\u00f6ppingen\"}','2020-04-04 21:03:14.417',NULL),('f\'��.�O��#\"���','delivery_note','delivery_note_','','',1,'�_�frI��b�G��`',NULL,'{\"displayPrices\":false,\"displayFooter\":true,\"displayHeader\":true,\"displayLineItems\":true,\"diplayLineItemPosition\":true,\"displayPageCount\":true,\"displayCompanyAddress\":true,\"pageOrientation\":\"portrait\",\"pageSize\":\"a4\",\"itemsPerPage\":10,\"companyName\":\"Muster AG\",\"taxNumber\":\"000111000\",\"vatId\":\"XX 111 222 333\",\"taxOffice\":\"Coesfeld\",\"bankName\":\"Kreissparkasse M\\u00fcnster\",\"bankIban\":\"DE11111222223333344444\",\"bankBic\":\"SWSKKEFF\",\"placeOfJurisdiction\":\"Coesfeld\",\"placeOfFulfillment\":\"Coesfeld\",\"executiveDirector\":\"Max Mustermann\",\"companyAddress\":\"Muster AG - Ebbinghoff 10 - 48624 Sch\\u00f6ppingen\"}','2020-04-04 21:03:14.417',NULL),('��j���J���Q�K��&','invoice','invoice_','','',1,'}��q�Ec���	W��',NULL,'{\"displayPrices\":true,\"displayFooter\":true,\"displayHeader\":true,\"displayLineItems\":true,\"diplayLineItemPosition\":true,\"displayPageCount\":true,\"displayCompanyAddress\":true,\"pageOrientation\":\"portrait\",\"pageSize\":\"a4\",\"itemsPerPage\":10,\"companyName\":\"Muster AG\",\"taxNumber\":\"000111000\",\"vatId\":\"XX 111 222 333\",\"taxOffice\":\"Coesfeld\",\"bankName\":\"Kreissparkasse M\\u00fcnster\",\"bankIban\":\"DE11111222223333344444\",\"bankBic\":\"SWSKKEFF\",\"placeOfJurisdiction\":\"Coesfeld\",\"placeOfFulfillment\":\"Coesfeld\",\"executiveDirector\":\"Max Mustermann\",\"companyAddress\":\"Muster AG - Ebbinghoff 10 - 48624 Sch\\u00f6ppingen\"}','2020-04-04 21:03:14.417',NULL);
/*!40000 ALTER TABLE `document_base_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_base_config_sales_channel`
--

DROP TABLE IF EXISTS `document_base_config_sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_base_config_sales_channel` (
  `id` binary(16) NOT NULL,
  `document_base_config_id` binary(16) NOT NULL,
  `document_type_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  UNIQUE KEY `uniq.document_base_configuration_id__sales_channel_id` (`document_type_id`,`sales_channel_id`),
  KEY `fk.document_base_config_sales_channel.document_base_config_id` (`document_base_config_id`),
  KEY `fk.document_base_config_sales_channel.sales_channel_id` (`sales_channel_id`),
  CONSTRAINT `fk.document_base_config_sales_channel.document_base_config_id` FOREIGN KEY (`document_base_config_id`) REFERENCES `document_base_config` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.document_base_config_sales_channel.document_type_id` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.document_base_config_sales_channel.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_base_config_sales_channel`
--

LOCK TABLES `document_base_config_sales_channel` WRITE;
/*!40000 ALTER TABLE `document_base_config_sales_channel` DISABLE KEYS */;
INSERT INTO `document_base_config_sales_channel` VALUES ('�zq��k@	��(�]��h','$��*�D��3��|�','���@��F�����q�E',NULL,'2020-04-04 21:03:14.417',NULL),('�/n���Kܭ����HL','��j���J���Q�K��&','}��q�Ec���	W��',NULL,'2020-04-04 21:03:14.417',NULL),('��B=�dl�x��','f\'��.�O��#\"���','�_�frI��b�G��`',NULL,'2020-04-04 21:03:14.417',NULL),('��]�pJ=���Q����','9��i\'D|�wрE=','�1����Bg���\\?�y',NULL,'2020-04-04 21:03:14.418',NULL);
/*!40000 ALTER TABLE `document_base_config_sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_type` (
  `id` binary(16) NOT NULL,
  `technical_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.document_type.technical_name` (`technical_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type`
--

LOCK TABLES `document_type` WRITE;
/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
INSERT INTO `document_type` VALUES ('}��q�Ec���	W��','invoice','2020-04-04 21:03:14.250',NULL),('�1����Bg���\\?�y','credit_note','2020-04-04 21:03:14.252',NULL),('�_�frI��b�G��`','delivery_note','2020-04-04 21:03:14.252',NULL),('���@��F�����q�E','storno','2020-04-04 21:03:14.416',NULL);
/*!40000 ALTER TABLE `document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type_translation`
--

DROP TABLE IF EXISTS `document_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_type_translation` (
  `document_type_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`document_type_id`,`language_id`),
  KEY `fk.document_type_translation.language_id` (`language_id`),
  CONSTRAINT `fk.document_type_translation.document_type_id` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.document_type_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.document_type_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type_translation`
--

LOCK TABLES `document_type_translation` WRITE;
/*!40000 ALTER TABLE `document_type_translation` DISABLE KEYS */;
INSERT INTO `document_type_translation` VALUES ('}��q�Ec���	W��','/�_��Mp�XT�|��','Invoice',NULL,'2020-04-04 21:03:14.254',NULL),('}��q�Ec���	W��','�/p�L���M�4�8','Rechnung',NULL,'2020-04-04 21:03:14.254',NULL),('�1����Bg���\\?�y','/�_��Mp�XT�|��','Credit note',NULL,'2020-04-04 21:03:14.256',NULL),('�1����Bg���\\?�y','�/p�L���M�4�8','Gutschrift',NULL,'2020-04-04 21:03:14.256',NULL),('�_�frI��b�G��`','/�_��Mp�XT�|��','Delivery note',NULL,'2020-04-04 21:03:14.255',NULL),('�_�frI��b�G��`','�/p�L���M�4�8','Lieferschein',NULL,'2020-04-04 21:03:14.255',NULL),('���@��F�����q�E','/�_��Mp�XT�|��','Storno bill',NULL,'2020-04-04 21:03:14.416',NULL),('���@��F�����q�E','�/p�L���M�4�8','Stornorechnung',NULL,'2020-04-04 21:03:14.416',NULL);
/*!40000 ALTER TABLE `document_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elasticsearch_index_task`
--

DROP TABLE IF EXISTS `elasticsearch_index_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elasticsearch_index_task` (
  `id` binary(16) NOT NULL,
  `index` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doc_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elasticsearch_index_task`
--

LOCK TABLES `elasticsearch_index_task` WRITE;
/*!40000 ALTER TABLE `elasticsearch_index_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `elasticsearch_index_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enqueue`
--

DROP TABLE IF EXISTS `enqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enqueue` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `published_at` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `headers` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `redelivered` tinyint(1) DEFAULT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `delayed_until` bigint(20) DEFAULT NULL,
  `time_to_live` bigint(20) DEFAULT NULL,
  `delivery_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `redeliver_after` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CFC35A6862A6DC27E0D4FDE17FFD7F63121369211A065DF8BF396750` (`priority`,`published_at`,`queue`,`delivery_id`,`delayed_until`,`id`),
  KEY `IDX_CFC35A68AA0BDFF712136921` (`redeliver_after`,`delivery_id`),
  KEY `IDX_CFC35A68E0669C0612136921` (`time_to_live`,`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enqueue`
--

LOCK TABLES `enqueue` WRITE;
/*!40000 ALTER TABLE `enqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `enqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_action`
--

DROP TABLE IF EXISTS `event_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_action` (
  `id` binary(16) NOT NULL,
  `event_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx.event_action.event_name` (`event_name`),
  KEY `idx.event_action.action_name` (`action_name`),
  CONSTRAINT `json.event_action.config` CHECK (json_valid(`config`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_action`
--

LOCK TABLES `event_action` WRITE;
/*!40000 ALTER TABLE `event_action` DISABLE KEYS */;
INSERT INTO `event_action` VALUES ('3�c�J1���z��','checkout.order.placed','action.mail.send','{\"mail_template_type_id\":\"8e9f421e796648b7b2680439da89fcf9\"}','2020-04-04 21:03:14.422',NULL),('-6.s@�6�M2y~9','user.recovery.request','action.mail.send','{\"mail_template_type_id\":\"a989b781fa894d5e9a8d3dd842af414c\"}','2020-04-04 21:03:16.031',NULL),('4��`��N��\0�\Z�S��','customer.recovery.request','action.mail.send','{\"mail_template_type_id\":\"b496e12809684081b83712c5d256fe82\"}','2020-04-04 21:03:18.797',NULL),('I�u��tC����w�;�','contact_form.send','action.mail.send','{\"mail_template_type_id\":\"d53f7708c34b4e37aa6bd6b85602729d\"}','2020-04-04 21:03:16.763',NULL),('gv���@��N=���H�','checkout.customer.double_opt_in_guest_order','action.mail.send','{\"mail_template_type_id\":\"cb7b9ed0965340babfc566912416af83\"}','2020-04-04 21:03:20.186',NULL),('���0�Jջ�R㡰�','checkout.customer.double_opt_in_registration','action.mail.send','{\"mail_template_type_id\":\"2f9e748ff5b949f9aa37913dc26a855c\"}','2020-04-04 21:03:19.964',NULL),('�-h�/�N����\0hFG�','checkout.customer.register','action.mail.send','{\"mail_template_type_id\":\"572455124da5438d86090664217db598\"}','2020-04-04 21:03:14.440',NULL),('ر��D4�jOZ�\\�\"','newsletter.confirm','action.mail.send','{\"mail_template_type_id\":\"e1e80400fc074eb2b3d222177ef366f9\"}','2020-04-04 21:03:14.442',NULL),('���3@�@%�[4���&h','newsletter.register','action.mail.send','{\"mail_template_type_id\":\"eb75b9c468794311a903aec00cb11ce8\"}','2020-04-04 21:03:14.441',NULL);
/*!40000 ALTER TABLE `event_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_shopping_account`
--

DROP TABLE IF EXISTS `google_shopping_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_shopping_account` (
  `id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.google_shopping_account.sales_channel_id` (`sales_channel_id`),
  CONSTRAINT `fk.google_shopping_account.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_shopping_account`
--

LOCK TABLES `google_shopping_account` WRITE;
/*!40000 ALTER TABLE `google_shopping_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `google_shopping_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_shopping_merchant_account`
--

DROP TABLE IF EXISTS `google_shopping_merchant_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_shopping_merchant_account` (
  `id` binary(16) NOT NULL,
  `google_shopping_account_id` binary(16) NOT NULL,
  `merchant_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.google_shopping_merchant_account.google_shopping_account_id` (`google_shopping_account_id`),
  CONSTRAINT `fk.google_shopping_merchant_account.google_shopping_account_id` FOREIGN KEY (`google_shopping_account_id`) REFERENCES `google_shopping_account` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_shopping_merchant_account`
--

LOCK TABLES `google_shopping_merchant_account` WRITE;
/*!40000 ALTER TABLE `google_shopping_merchant_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `google_shopping_merchant_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_export_file`
--

DROP TABLE IF EXISTS `import_export_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_export_file` (
  `id` binary(16) NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(3) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_export_file`
--

LOCK TABLES `import_export_file` WRITE;
/*!40000 ALTER TABLE `import_export_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_export_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_export_log`
--

DROP TABLE IF EXISTS `import_export_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_export_log` (
  `id` binary(16) NOT NULL,
  `activity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `records` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL,
  `profile_id` binary(16) DEFAULT NULL,
  `file_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `invalid_records_log_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.import_export_log.user_id` (`user_id`),
  KEY `fk.import_export_log.profile_id` (`profile_id`),
  KEY `fk.import_export_log.file_id` (`file_id`),
  KEY `fk.import_export_log.invalid_records_log_id` (`invalid_records_log_id`),
  CONSTRAINT `fk.import_export_log.file_id` FOREIGN KEY (`file_id`) REFERENCES `import_export_file` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk.import_export_log.invalid_records_log_id` FOREIGN KEY (`invalid_records_log_id`) REFERENCES `import_export_log` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk.import_export_log.profile_id` FOREIGN KEY (`profile_id`) REFERENCES `import_export_profile` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk.import_export_log.user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `json.import_export_log.config` CHECK (json_valid(`config`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_export_log`
--

LOCK TABLES `import_export_log` WRITE;
/*!40000 ALTER TABLE `import_export_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_export_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_export_profile`
--

DROP TABLE IF EXISTS `import_export_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_export_profile` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_default` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `source_entity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delimiter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enclosure` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mapping` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `json.import_export_profile.config` CHECK (json_valid(`config`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_export_profile`
--

LOCK TABLES `import_export_profile` WRITE;
/*!40000 ALTER TABLE `import_export_profile` DISABLE KEYS */;
INSERT INTO `import_export_profile` VALUES ('�Ú8Ab��=��','Default product',1,'product','text/csv',';','\"','[{\"key\":\"id\",\"mappedKey\":\"id\"},{\"key\":\"parentId\",\"mappedKey\":\"parent_id\"},{\"key\":\"productNumber\",\"mappedKey\":\"product_number\"},{\"key\":\"active\",\"mappedKey\":\"active\"},{\"key\":\"stock\",\"mappedKey\":\"stock\"},{\"key\":\"translations.DEFAULT.name\",\"mappedKey\":\"name\"},{\"key\":\"translations.DEFAULT.description\",\"mappedKey\":\"description\"},{\"key\":\"price.DEFAULT.net\",\"mappedKey\":\"price_net\"},{\"key\":\"price.DEFAULT.gross\",\"mappedKey\":\"price_gross\"},{\"key\":\"tax.id\",\"mappedKey\":\"tax_id\"},{\"key\":\"tax.taxRate\",\"mappedKey\":\"tax_rate\"},{\"key\":\"tax.name\",\"mappedKey\":\"tax_name\"},{\"key\":\"cover.media.id\",\"mappedKey\":\"cover_media_id\"},{\"key\":\"cover.media.url\",\"mappedKey\":\"cover_media_url\"},{\"key\":\"cover.media.translations.DEFAULT.title\",\"mappedKey\":\"cover_media_title\"},{\"key\":\"cover.media.translations.DEFAULT.alt\",\"mappedKey\":\"cover_media_alt\"},{\"key\":\"manufacturer.id\",\"mappedKey\":\"manufacturer_id\"},{\"key\":\"manufacturer.translations.DEFAULT.name\",\"mappedKey\":\"manufacturer_name\"},{\"key\":\"categories\",\"mappedKey\":\"categories\"},{\"key\":\"visibilities.all\",\"mappedKey\":\"sales_channel\"}]','2020-04-28 16:30:57.779',NULL,NULL),('.fkK	`N���{�lA�','Default media',1,'media','text/csv',';','\"','[{\"key\":\"id\",\"mappedKey\":\"id\"},{\"key\":\"mediaFolderId\",\"mappedKey\":\"folder_id\"},{\"key\":\"url\",\"mappedKey\":\"url\"},{\"key\":\"private\",\"mappedKey\":\"private\"},{\"key\":\"mediaType\",\"mappedKey\":\"type\"},{\"key\":\"translations.DEFAULT.title\",\"mappedKey\":\"title\"},{\"key\":\"translations.DEFAULT.alt\",\"mappedKey\":\"alt\"}]','2020-04-28 16:30:57.778',NULL,NULL),('�w�H�RJ`��#���X','Default category',1,'category','text/csv',';','\"','[{\"key\":\"id\",\"mappedKey\":\"id\"},{\"key\":\"parentId\",\"mappedKey\":\"parent_id\"},{\"key\":\"active\",\"mappedKey\":\"active\"},{\"key\":\"type\",\"mappedKey\":\"type\"},{\"key\":\"visible\",\"mappedKey\":\"visible\"},{\"key\":\"translations.DEFAULT.name\",\"mappedKey\":\"name\"},{\"key\":\"translations.DEFAULT.externalLink\",\"mappedKey\":\"external_link\"},{\"key\":\"translations.DEFAULT.description\",\"mappedKey\":\"description\"},{\"key\":\"translations.DEFAULT.metaTitle\",\"mappedKey\":\"meta_title\"},{\"key\":\"translations.DEFAULT.metaDescription\",\"mappedKey\":\"meta_description\"},{\"key\":\"media.id\",\"mappedKey\":\"media_id\"},{\"key\":\"media.url\",\"mappedKey\":\"media_url\"},{\"key\":\"media.mediaFolderId\",\"mappedKey\":\"media_folder_id\"},{\"key\":\"media.mediaType\",\"mappedKey\":\"media_type\"},{\"key\":\"media.translations.DEFAULT.title\",\"mappedKey\":\"media_title\"},{\"key\":\"media.translations.DEFAULT.alt\",\"mappedKey\":\"media_alt\"},{\"key\":\"cmsPageId\",\"mappedKey\":\"cms_page_id\"}]','2020-04-28 16:30:57.776',NULL,NULL),('���nf7I3���+7J�','Default properties',1,'property_group_option','text/csv',';','\"','[{\"key\":\"id\",\"mappedKey\":\"id\"},{\"key\":\"colorHexCode\",\"mappedKey\":\"color_hex_code\"},{\"key\":\"translations.DEFAULT.name\",\"mappedKey\":\"name\"},{\"key\":\"translations.DEFAULT.position\",\"mappedKey\":\"position\"},{\"key\":\"group.id\",\"mappedKey\":\"group_id\"},{\"key\":\"group.displayType\",\"mappedKey\":\"group_display_type\"},{\"key\":\"group.sortingType\",\"mappedKey\":\"group_sorting_type\"},{\"key\":\"group.translations.DEFAULT.name\",\"mappedKey\":\"group_name\"},{\"key\":\"group.translations.DEFAULT.description\",\"mappedKey\":\"group_description\"},{\"key\":\"group.translations.DEFAULT.position\",\"mappedKey\":\"group_position\"},{\"key\":\"media.id\",\"mappedKey\":\"media_id\"},{\"key\":\"media.url\",\"mappedKey\":\"media_url\"},{\"key\":\"media.mediaFolderId\",\"mappedKey\":\"media_folder_id\"},{\"key\":\"media.mediaType\",\"mappedKey\":\"media_type\"},{\"key\":\"media.translations.DEFAULT.title\",\"mappedKey\":\"media_title\"},{\"key\":\"media.translations.DEFAULT.alt\",\"mappedKey\":\"media_alt\"}]','2020-04-28 16:30:58.262',NULL,NULL),('�`��@b�!C�Aj�','Default variant configuration settings',1,'product_configurator_setting','text/csv',';','\"','[{\"key\":\"id\",\"mappedKey\":\"id\"},{\"key\":\"productId\",\"mappedKey\":\"product_id\"},{\"key\":\"optionId\",\"mappedKey\":\"option_id\"},{\"key\":\"position\",\"mappedKey\":\"position\"},{\"key\":\"media.id\",\"mappedKey\":\"media_id\"},{\"key\":\"media.url\",\"mappedKey\":\"media_url\"},{\"key\":\"media.mediaFolderId\",\"mappedKey\":\"media_folder_id\"},{\"key\":\"media.mediaType\",\"mappedKey\":\"media_type\"},{\"key\":\"media.translations.DEFAULT.title\",\"mappedKey\":\"media_title\"},{\"key\":\"media.translations.DEFAULT.alt\",\"mappedKey\":\"media_alt\"},{\"key\":\"price.DEFAULT.net\",\"mappedKey\":\"price_net\"},{\"key\":\"price.DEFAULT.gross\",\"mappedKey\":\"price_gross\"}]','2020-04-28 16:30:58.262',NULL,NULL),('� �7��KO��č����','Default newsletter recipient',1,'newsletter_recipient','text/csv',';','\"','[{\"key\":\"id\",\"mappedKey\":\"id\"},{\"key\":\"email\",\"mappedKey\":\"email\"},{\"key\":\"title\",\"mappedKey\":\"title\"},{\"key\":\"salutation.salutationKey\",\"mappedKey\":\"salutation\"},{\"key\":\"firstName\",\"mappedKey\":\"first_name\"},{\"key\":\"lastName\",\"mappedKey\":\"last_name\"},{\"key\":\"zipCode\",\"mappedKey\":\"zip_code\"},{\"key\":\"city\",\"mappedKey\":\"city\"},{\"key\":\"street\",\"mappedKey\":\"street\"},{\"key\":\"status\",\"mappedKey\":\"status\"},{\"key\":\"hash\",\"mappedKey\":\"hash\"},{\"key\":\"salesChannel.id\",\"mappedKey\":\"sales_channel_id\"}]','2020-04-28 16:30:58.261',NULL,NULL);
/*!40000 ALTER TABLE `import_export_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_export_profile_translation`
--

DROP TABLE IF EXISTS `import_export_profile_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_export_profile_translation` (
  `import_export_profile_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`import_export_profile_id`,`language_id`),
  KEY `fk.import_export_profile_translation.language_id` (`language_id`),
  CONSTRAINT `fk.import_export_profile_translation.import_export_profile_id` FOREIGN KEY (`import_export_profile_id`) REFERENCES `import_export_profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.import_export_profile_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_export_profile_translation`
--

LOCK TABLES `import_export_profile_translation` WRITE;
/*!40000 ALTER TABLE `import_export_profile_translation` DISABLE KEYS */;
INSERT INTO `import_export_profile_translation` VALUES ('�Ú8Ab��=��','/�_��Mp�XT�|��','Default product','2020-04-28 16:30:58.000',NULL),('�Ú8Ab��=��','�/p�L���M�4�8','Standardprofil Produkt','2020-04-28 16:30:58.000',NULL),('.fkK	`N���{�lA�','/�_��Mp�XT�|��','Default media','2020-04-28 16:30:58.000',NULL),('.fkK	`N���{�lA�','�/p�L���M�4�8','Standardprofil Medien','2020-04-28 16:30:58.000',NULL),('�w�H�RJ`��#���X','/�_��Mp�XT�|��','Default category','2020-04-28 16:30:58.000',NULL),('�w�H�RJ`��#���X','�/p�L���M�4�8','Standardprofil Kategorie','2020-04-28 16:30:58.000',NULL),('���nf7I3���+7J�','/�_��Mp�XT�|��','Default properties','2020-04-28 16:30:58.000',NULL),('���nf7I3���+7J�','�/p�L���M�4�8','Standardprofil Eigenschaften','2020-04-28 16:30:58.000',NULL),('�`��@b�!C�Aj�','/�_��Mp�XT�|��','Default variant configuration settings','2020-04-28 16:30:58.000',NULL),('�`��@b�!C�Aj�','�/p�L���M�4�8','Standardprofil Variantenkonfiguration','2020-04-28 16:30:58.000',NULL),('� �7��KO��č����','/�_��Mp�XT�|��','Default newsletter recipient','2020-04-28 16:30:58.000',NULL),('� �7��KO��č����','�/p�L���M�4�8','Standardprofil Newsletter-Empfänger','2020-04-28 16:30:58.000',NULL);
/*!40000 ALTER TABLE `import_export_profile_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration`
--

DROP TABLE IF EXISTS `integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integration` (
  `id` binary(16) NOT NULL,
  `write_access` tinyint(1) NOT NULL DEFAULT 0,
  `access_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_access_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `last_usage_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx.access_key` (`access_key`),
  CONSTRAINT `json.integration.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration`
--

LOCK TABLES `integration` WRITE;
/*!40000 ALTER TABLE `integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` binary(16) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` binary(16) DEFAULT NULL,
  `locale_id` binary(16) NOT NULL,
  `translation_code_id` binary(16) DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.translation_code_id` (`translation_code_id`),
  KEY `idx.language.translation_code_id` (`translation_code_id`),
  KEY `idx.language.language_id_parent_language_id` (`id`,`parent_id`),
  KEY `fk.language.parent_id` (`parent_id`),
  KEY `fk.language.locale_id` (`locale_id`),
  CONSTRAINT `fk.language.locale_id` FOREIGN KEY (`locale_id`) REFERENCES `locale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.language.parent_id` FOREIGN KEY (`parent_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.language.translation_code_id` FOREIGN KEY (`translation_code_id`) REFERENCES `locale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.language.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES ('/�_��Mp�XT�|��','English',NULL,'1��UAM�wJ��@�#','1��UAM�wJ��@�#',NULL,'2020-04-04 21:03:14.159',NULL),('�/p�L���M�4�8','Deutsch',NULL,'As�F��׸�����','As�F��׸�����',NULL,'2020-04-04 21:03:14.178',NULL);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locale`
--

DROP TABLE IF EXISTS `locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locale` (
  `id` binary(16) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locale`
--

LOCK TABLES `locale` WRITE;
/*!40000 ALTER TABLE `locale` DISABLE KEYS */;
INSERT INTO `locale` VALUES ('\0%?�I\"�/U(4�','sr-ME','2020-04-04 21:03:14.202',NULL),('\0�1R{KD�����)m','es-ES','2020-04-04 21:03:14.193',NULL),('\0����vJZ�n3i?f�','ur-IN','2020-04-04 21:03:14.204',NULL),('hI�%KQ���+���','ku-TR','2020-04-04 21:03:14.198',NULL),('7ߞ/�J+��D�\n���','bs-BA','2020-04-04 21:03:14.189',NULL),('j��V~H��D��z��','ar-JO','2020-04-04 21:03:14.188',NULL),('�,�l�A��3�rf��','en-IN','2020-04-04 21:03:14.191',NULL),('\r(0�+L����y�','kfo-CI','2020-04-04 21:03:14.197',NULL),('rxn�<L���m�RO\r2','aa-ET','2020-04-04 21:03:14.187',NULL),('o�&nGݡ(�SQ�ב','it-CH','2020-04-04 21:03:14.196',NULL),('o�IulL��\r\\���','ar-MA','2020-04-04 21:03:14.188',NULL),('�E�H��*�50n�','fil-PH','2020-04-04 21:03:14.194',NULL),('����DF�)��ו','fur-IT','2020-04-04 21:03:14.195',NULL),('	��M��Dױ!���#�B','so-DJ','2020-04-04 21:03:14.201',NULL),('	�_��7M��4!oz�>{','ln-CD','2020-04-04 21:03:14.198',NULL),('\nl<�~TJX�rExg��]','es-MX','2020-04-04 21:03:14.193',NULL),('\r�䢀O�����ϭ�','ln-CG','2020-04-04 21:03:14.198',NULL),('v(��Dղ|Ғ�','ky-KG','2020-04-04 21:03:14.198',NULL),('#r��JH�K����b','pa-IN','2020-04-04 21:03:14.200',NULL),('���BOs���0S���','fr-SN','2020-04-04 21:03:14.195',NULL),('�_e�I����=I<��','hr-HR','2020-04-04 21:03:14.196',NULL),('\r+p��J���	�l�I','ar-LY','2020-04-04 21:03:14.188',NULL),('\r�c%\rN��r���Mc','lo-LA','2020-04-04 21:03:14.198',NULL),('\r���MJB�B�2p߭','byn-ER','2020-04-04 21:03:14.189',NULL),('���>_C���C��j�','bo-CN','2020-04-04 21:03:14.189',NULL),('��ʏN��u�۽\'','is-IS','2020-04-04 21:03:14.196',NULL),('���@����I3I','kpe-GN','2020-04-04 21:03:14.197',NULL),('g�$RK��Ǒm��','gsw-CH','2020-04-04 21:03:14.195',NULL),('����,K	��|�Bɂ','fo-FO','2020-04-04 21:03:14.194',NULL),('�(�!Dq�?ه@��-','de-BE','2020-04-04 21:03:14.190',NULL),('[m�WF͒����','kl-GL','2020-04-04 21:03:14.197',NULL),('d�$;�I��Mľ��[','nds-DE','2020-04-04 21:03:14.199',NULL),('�k�}~G\n�1�]��Q','nn-NO','2020-04-04 21:03:14.199',NULL),('e�9tHi�yf���p/','zh-HK','2020-04-04 21:03:14.204',NULL),('�����A��ԛ�uQ*�','en-JM','2020-04-04 21:03:14.191',NULL),('�	�ɐG���x���p','st-ZA','2020-04-04 21:03:14.202',NULL),('y��SK͐\\Q���','sr-RS','2020-04-04 21:03:14.202',NULL),('�ǈ�)O����g3[','pt-PT','2020-04-04 21:03:14.200',NULL),('\Z�<�@<��;�j~','ca-ES','2020-04-04 21:03:14.189',NULL),('\Z�Eq�|F���D3�)��','pa-PK','2020-04-04 21:03:14.200',NULL),('G/�h{F�P�[��dB','ar-SA','2020-04-04 21:03:14.188',NULL),('As�F��׸�����','de-DE','2020-04-04 21:03:14.158',NULL),(' ڻ�wI3�A��	���','pl-PL','2020-04-04 21:03:14.200',NULL),('!�����Dk�I�1����','to-TO','2020-04-04 21:03:14.203',NULL),('\"^�_GF>�ϋՠwq','ee-TG','2020-04-04 21:03:14.190',NULL),('\"���LJ�0c��','om-KE','2020-04-04 21:03:14.200',NULL),('\"�=E}�A�6���~��','cch-NG','2020-04-04 21:03:14.189',NULL),('#C�\nC�M8�a��]�j�','de-LU','2020-04-04 21:03:14.190',NULL),('#g[�O���5#a#�','ak-GH','2020-04-04 21:03:14.187',NULL),('#�b�&jK�����\r�:','en-AS','2020-04-04 21:03:14.190',NULL),('$+�mDL�����\0z[F','ss-ZA','2020-04-04 21:03:14.202',NULL),('\'\0	�VA_��A�_','as-IN','2020-04-04 21:03:14.189',NULL),(')�b&�NҬ(Ndop�2','ar-KW','2020-04-04 21:03:14.188',NULL),(')�?F<SG���6��]�','ne-IN','2020-04-04 21:03:14.199',NULL),('*���oTO�M}8\nO�r','en-ZW','2020-04-04 21:03:14.192',NULL),(',X؏?#B襧��J��','sr-CS','2020-04-04 21:03:14.202',NULL),(',��/x2G�y{����','ve-ZA','2020-04-04 21:03:14.204',NULL),('-�\"�o�@Б�L�S���','sk-SK','2020-04-04 21:03:14.201',NULL),('-��A[WO���v����','tig-ER','2020-04-04 21:03:14.203',NULL),('.<QK�hDo�<��RR��','es-BO','2020-04-04 21:03:14.192',NULL),('.����DՆ�S^=�8','en-BW','2020-04-04 21:03:14.191',NULL),('/���}(B�������','ar-BH','2020-04-04 21:03:14.188',NULL),('1�-8�rE���*�X�\r�','uk-UA','2020-04-04 21:03:14.203',NULL),('1��UAM�wJ��@�#','en-GB','2020-04-04 21:03:14.156',NULL),('2�`b�BE�K�jT�J','fr-BE','2020-04-04 21:03:14.194',NULL),('4��qi�A���Z�s�','tt-RU','2020-04-04 21:03:14.203',NULL),('6�\'HK�BV���\0�=�\Z','ar-YE','2020-04-04 21:03:14.189',NULL),('6�$�N_�aU\Zs�\\','en-SG','2020-04-04 21:03:14.192',NULL),('7��؜\'B��JJ$�','zu-ZA','2020-04-04 21:03:14.205',NULL),('8*)Ux�M���I�.�%','aa-DJ','2020-04-04 21:03:14.187',NULL),('9,�`��@��|���L��','pt-BR','2020-04-04 21:03:14.200',NULL),(';5,���Dɀ�n� �\0','ne-NP','2020-04-04 21:03:14.199',NULL),('>i�/�0HG�qY^�P','fa-AF','2020-04-04 21:03:14.194',NULL),('>����IS��>�u�*','ar-SY','2020-04-04 21:03:14.188',NULL),('>�Y~\ZD%��$���','ko-KR','2020-04-04 21:03:14.197',NULL),('@�j��IٗH9�{��N','es-CL','2020-04-04 21:03:14.192',NULL),('BO{���N���CX�*�V','sr-BA','2020-04-04 21:03:14.202',NULL),('D�Z�F�MK��p\0\'�8�','gl-ES','2020-04-04 21:03:14.195',NULL),('E�P� EF�P�-� �#','sh-BA','2020-04-04 21:03:14.201',NULL),('F�Y{=K2���?���','zh-MO','2020-04-04 21:03:14.204',NULL),('Gzb�K_�x@\r����','bg-BG','2020-04-04 21:03:14.189',NULL),('G��\rJ㝞�x�a1','sl-SI','2020-04-04 21:03:14.201',NULL),('IߔC��N���6U�Q��','es-NI','2020-04-04 21:03:14.193',NULL),('I��(�M1���� �J','ku-IR','2020-04-04 21:03:14.198',NULL),('K*���D����ջ','or-IN','2020-04-04 21:03:14.200',NULL),('L�2���B;��a�wo�#','nso-ZA','2020-04-04 21:03:14.199',NULL),('L�B���I���d#���','fr-CA','2020-04-04 21:03:14.194',NULL),('R���Ik��mf���','el-GR','2020-04-04 21:03:14.190',NULL),('R�_C�FFѪ�O@��,0','en-VI','2020-04-04 21:03:14.192',NULL),('UmK\0�IT�~�R��r','ar-SD','2020-04-04 21:03:14.188',NULL),('U�(��\\@�us.�','nl-BE','2020-04-04 21:03:14.199',NULL),('V��^W#Ki�v�W���+','af-ZA','2020-04-04 21:03:14.187',NULL),('V�\r��Bl�\"�9��it','th-TH','2020-04-04 21:03:14.203',NULL),('Xh,��`@��O��K8�','ee-GH','2020-04-04 21:03:14.190',NULL),('YO�u�F������9��','om-ET','2020-04-04 21:03:14.200',NULL),('Z��V�GH�*N8؅��','he-IL','2020-04-04 21:03:14.196',NULL),('[�O�|@��_i��\n�Y','ro-RO','2020-04-04 21:03:14.200',NULL),('[�#yH׉?2$�.�e','sh-CS','2020-04-04 21:03:14.201',NULL),('\\,w�zF������V','mt-MT','2020-04-04 21:03:14.199',NULL),('\\7���Oa���g��','es-PY','2020-04-04 21:03:14.193',NULL),('].c��O��Q�f��Q','es-PR','2020-04-04 21:03:14.193',NULL),('^��9݊F\"����/k�o','ar-LB','2020-04-04 21:03:14.188',NULL),('_n�|�Fn��4eP�7w','ar-AE','2020-04-04 21:03:14.187',NULL),('c���;H6��\'�y�ˀ','so-SO','2020-04-04 21:03:14.202',NULL),('c��^RN�+ZF!�','ha-NG','2020-04-04 21:03:14.195',NULL),('c��eMN��Z���I3','gv-GB','2020-04-04 21:03:14.195',NULL),('dv!�G0��6��n','en-BE','2020-04-04 21:03:14.191',NULL),('e|[�,QAm�2P+�k��','es-AR','2020-04-04 21:03:14.192',NULL),('f����Og��n[䶎','gaa-GH','2020-04-04 21:03:14.195',NULL),('h���nNC���Bw�w�','en-UM','2020-04-04 21:03:14.192',NULL),('jz%��E哀3r���','ku-IQ','2020-04-04 21:03:14.197',NULL),('j�JW�7G���9�S�','en-AU','2020-04-04 21:03:14.191',NULL),('k�i�XIā|��Ȇ��','haw-US','2020-04-04 21:03:14.196',NULL),('m�e�N�Iܵ����','tg-TJ','2020-04-04 21:03:14.203',NULL),('n�<�sB�����i�','de-AT','2020-04-04 21:03:14.190',NULL),('o���Lև/j-�\0Pa','ru-UA','2020-04-04 21:03:14.201',NULL),('p�%Y�J��r�}N[|�','de-LI','2020-04-04 21:03:14.190',NULL),('qB��bJu��N,k��q','es-VE','2020-04-04 21:03:14.194',NULL),('q+0�\\qE���:�c�I','uz-AF','2020-04-04 21:03:14.204',NULL),('rӟ�fA\"���@ɜ��','ml-IN','2020-04-04 21:03:14.198',NULL),('sh���Bz��k��cP7','sa-IN','2020-04-04 21:03:14.201',NULL),('tc{+��Hڗ��@��','ha-SD','2020-04-04 21:03:14.196',NULL),('to�(l>F�[��z�','oc-FR','2020-04-04 21:03:14.200',NULL),('v:�^�J��]K�PAE|','ti-ER','2020-04-04 21:03:14.203',NULL),('w���nO/���-�;�','es-CO','2020-04-04 21:03:14.192',NULL),('yN	�Aډ��E�v�','en-MH','2020-04-04 21:03:14.191',NULL),('ySZ�8�I�Sּ&�!','my-MM','2020-04-04 21:03:14.199',NULL),('yֹ���H\\���R仉�','cy-GB','2020-04-04 21:03:14.190',NULL),('z��ٰAڌ(����','kk-KZ','2020-04-04 21:03:14.197',NULL),('|G�Г�LӑC?����','es-PA','2020-04-04 21:03:14.193',NULL),('}�i4nJ�\'B���','es-PE','2020-04-04 21:03:14.193',NULL),('~��Sr�K߭��҂�\'','so-ET','2020-04-04 21:03:14.201',NULL),('�����@Q�Gu\Z�xx�','gez-ET','2020-04-04 21:03:14.195',NULL),('��j71�@Р�/u+','kam-KE','2020-04-04 21:03:14.197',NULL),('�\0���1G*�a� n2I','st-LS','2020-04-04 21:03:14.202',NULL),('��P���I���;�@','am-ET','2020-04-04 21:03:14.187',NULL),('���M�FF=����ˈ','wo-SN','2020-04-04 21:03:14.204',NULL),('�C+��K扟�zN[�N','de-CH','2020-04-04 21:03:14.190',NULL),('�c��?�N�������&','ga-IE','2020-04-04 21:03:14.195',NULL),('��CB�O��K��X��','sv-SE','2020-04-04 21:03:14.202',NULL),('�1�BCH�����b','ms-MY','2020-04-04 21:03:14.199',NULL),('�Y�Jޏ}ly^ϊ�','en-HK','2020-04-04 21:03:14.191',NULL),('��\"*�GA�����4�','kw-GB','2020-04-04 21:03:14.198',NULL),('��dm!$J���t��-','en-NZ','2020-04-04 21:03:14.192',NULL),('�O�4JD̈́�yy���','en-US','2020-04-04 21:03:14.192',NULL),('�\'���I�@&e=�','ha-GH','2020-04-04 21:03:14.195',NULL),('��+��\ZE!��`�My* ','mn-CN','2020-04-04 21:03:14.198',NULL),('��6�}Dv�U��\r1C	','lt-LT','2020-04-04 21:03:14.198',NULL),('�b���J:��<�Ƈy','si-LK','2020-04-04 21:03:14.201',NULL),('����]3E���+�J��','ti-ET','2020-04-04 21:03:14.203',NULL),('�af�ALс�X��D�','fa-IR','2020-04-04 21:03:14.194',NULL),('�|�GCB��(�A�3','ar-IQ','2020-04-04 21:03:14.188',NULL),('��\Z�7�Eo�q.1�;','en-MT','2020-04-04 21:03:14.191',NULL),('�2��\\A����RG�6','ur-PK','2020-04-04 21:03:14.204',NULL),('���=�J���T��S�','ar-QA','2020-04-04 21:03:14.188',NULL),('�[<��MH����;b�G�','lv-LV','2020-04-04 21:03:14.198',NULL),('�xF��H����H�a�','wal-ET','2020-04-04 21:03:14.204',NULL),('���B�IJ\"�:m�\'�0#','es-GT','2020-04-04 21:03:14.193',NULL),('�#���?I�0%��\\','nr-ZA','2020-04-04 21:03:14.199',NULL),('�eϯ��K9�!|Ƣ','ar-DZ','2020-04-04 21:03:14.188',NULL),('�	�j��OЎdRch�E?','en-NA','2020-04-04 21:03:14.191',NULL),('����B�H:��22�`�','fi-FI','2020-04-04 21:03:14.194',NULL),('���J�ODe��������','id-ID','2020-04-04 21:03:14.196',NULL),('��a �S@��F�Ф��','en-MP','2020-04-04 21:03:14.191',NULL),('��R���I+�Lv�<��','es-CR','2020-04-04 21:03:14.193',NULL),('�ksZ��N���Q@o�','ms-BN','2020-04-04 21:03:14.199',NULL),('�G?��D�E\0we��=','syr-SY','2020-04-04 21:03:14.203',NULL),('�Ì\'�F�K����2)','sq-AL','2020-04-04 21:03:14.202',NULL),('��LC��+����f','en-BZ','2020-04-04 21:03:14.191',NULL),('�I@�h�C}���3MjS','en-TT','2020-04-04 21:03:14.192',NULL),('���EL���&�H�)','sw-TZ','2020-04-04 21:03:14.202',NULL),('�*ey�G ����x�S@','en-IE','2020-04-04 21:03:14.191',NULL),('�ۘP�3J����k���','aa-ER','2020-04-04 21:03:14.187',NULL),('��y�K���}��','es-UY','2020-04-04 21:03:14.194',NULL),('�k}�DF�s����J','kpe-LR','2020-04-04 21:03:14.197',NULL),('��Y��\"M��#�v�e{�','es-HN','2020-04-04 21:03:14.193',NULL),('�3�wO��~׮���','en-ZA','2020-04-04 21:03:14.192',NULL),('��I��Lt�[x�BO�\'','ar-TN','2020-04-04 21:03:14.189',NULL),('��ˈ�O�������?K','af-NA','2020-04-04 21:03:14.187',NULL),('����vFn��g�^չ','ny-MW','2020-04-04 21:03:14.200',NULL),('�X��h�It��ϻ9���','kn-IN','2020-04-04 21:03:14.197',NULL),('�aI<-!NB�,(��\n�','nl-NL','2020-04-04 21:03:14.199',NULL),('��#�C����2��&','hu-HU','2020-04-04 21:03:14.196',NULL),('�j$ڟ�Fؒ�\0�I�','be-BY','2020-04-04 21:03:14.189',NULL),('��&[��G�I���.','kcg-NG','2020-04-04 21:03:14.197',NULL),('ƌu��K�����y','tn-ZA','2020-04-04 21:03:14.203',NULL),('�\n��SKC�Oѫ��>','dz-BT','2020-04-04 21:03:14.190',NULL),('����D��!�d��C','ro-MD','2020-04-04 21:03:14.200',NULL),('�\0YN�K��T{���H�','ru-RU','2020-04-04 21:03:14.200',NULL),('��*�(A��s�9։^','zh-SG','2020-04-04 21:03:14.204',NULL),('��R�qEޏf�,l��','se-FI','2020-04-04 21:03:14.201',NULL),('����|oDu�eYN�P�2','en-PK','2020-04-04 21:03:14.192',NULL),('�#�G]&Ml�e�3��W','ar-EG','2020-04-04 21:03:14.188',NULL),('Ѣ>z$JC���p�?w�','fr-LU','2020-04-04 21:03:14.194',NULL),('Ҍ�dP5B��g��1�','gez-ER','2020-04-04 21:03:14.195',NULL),('�Bl�\Z C*�&4�ȩ�$','kok-IN','2020-04-04 21:03:14.197',NULL),('ԯ�ogJ��v�ia�D�','es-EC','2020-04-04 21:03:14.193',NULL),('��x>�@����!!.]','es-US','2020-04-04 21:03:14.193',NULL),('֠�\0:EO��T�����','ig-NG','2020-04-04 21:03:14.196',NULL),('ְ`�\rH���uf��','yo-NG','2020-04-04 21:03:14.204',NULL),('�.c<AyAʚ@�Z\n��u','so-KE','2020-04-04 21:03:14.201',NULL),('�E��4@\Z���v+7U�','el-CY','2020-04-04 21:03:14.190',NULL),('����O\0��d؋�','dv-MV','2020-04-04 21:03:14.190',NULL),('�[�}L\rAd�N1L��','gu-IN','2020-04-04 21:03:14.195',NULL),('�e�~M��8\r���e�','es-SV','2020-04-04 21:03:14.193',NULL),('��k<�]EE�G����+�','en-CA','2020-04-04 21:03:14.191',NULL),('�&��JJ��EE.S�\nt','en-PH','2020-04-04 21:03:14.192',NULL),('�f��-�JT��ǿ�歉','eu-ES','2020-04-04 21:03:14.194',NULL),('�m뽓ZBk�_f�7�|','bn-IN','2020-04-04 21:03:14.189',NULL),('����)zFA�Zt3e�','ku-SY','2020-04-04 21:03:14.198',NULL),('�W���pD���+m���','bo-IN','2020-04-04 21:03:14.189',NULL),('�]v�\0�@�����\0ܚ=','ss-SZ','2020-04-04 21:03:14.202',NULL),('����¸B4����e}�\'','ha-NE','2020-04-04 21:03:14.195',NULL),('�)�i��M������c�6','da-DK','2020-04-04 21:03:14.190',NULL),('�_���BV�^�r�UU�','ii-CN','2020-04-04 21:03:14.196',NULL),('�(�|p�M9�Uw�K��','es-DO','2020-04-04 21:03:14.193',NULL),('��Oy}B9��)^��I�','tr-TR','2020-04-04 21:03:14.203',NULL),('��bMK���|$�}�\0','km-KH','2020-04-04 21:03:14.197',NULL),('����OF��t�uYH','xh-ZA','2020-04-04 21:03:14.204',NULL),('�nL]dD�K���.r�','te-IN','2020-04-04 21:03:14.203',NULL),('�r�r|E��-9�tg:','mk-MK','2020-04-04 21:03:14.198',NULL),('��B0�AG骓�\'6��','fr-FR','2020-04-04 21:03:14.194',NULL),('�(��WjDʓ;[�(et','mr-IN','2020-04-04 21:03:14.199',NULL),('�C�XcHB	�(��k5r','sw-KE','2020-04-04 21:03:14.202',NULL),('�KN�E��j���\\��','et-EE','2020-04-04 21:03:14.194',NULL),('��\\�Aڇ�9B5:L','ta-IN','2020-04-04 21:03:14.203',NULL),('�Ue�V�J��=M&vA��','kaj-NG','2020-04-04 21:03:14.197',NULL),('�y����O��ג�˙(�','fr-MC','2020-04-04 21:03:14.195',NULL),('�8Vl;A�h:��U�','ka-GE','2020-04-04 21:03:14.197',NULL),('���V��B���\03p��','ts-ZA','2020-04-04 21:03:14.203',NULL),('�#%,��H��t��H�_','fr-CH','2020-04-04 21:03:14.194',NULL),('�޽�x;N��س-n\rk�','ps-AF','2020-04-04 21:03:14.200',NULL),('�G�+iHr�� )l	','sv-FI','2020-04-04 21:03:14.202',NULL),('�q��B��Fe����','cs-CZ','2020-04-04 21:03:14.190',NULL),('�o��`Ft��K{�g�','bn-BD','2020-04-04 21:03:14.189',NULL),('����H\n����\"�W','en-GU','2020-04-04 21:03:14.191',NULL),('��#��pJN��	;���','rw-RW','2020-04-04 21:03:14.201',NULL),('��J���F���?��Wg','hy-AM','2020-04-04 21:03:14.196',NULL),('�l0�o�F/�B�v��','sid-ET','2020-04-04 21:03:14.201',NULL),('�ͩ^��H��`��V�ް','zh-CN','2020-04-04 21:03:14.204',NULL),('��b�/C��)�%�','mn-MN','2020-04-04 21:03:14.198',NULL),('��\\<�@I񏠨;��W�','az-AZ','2020-04-04 21:03:14.189',NULL),('����SN)����ʯ�r','ar-OM','2020-04-04 21:03:14.188',NULL),('���呚G��U�Al���','nb-NO','2020-04-04 21:03:14.199',NULL),('�ߥ�C\"�R����','se-NO','2020-04-04 21:03:14.201',NULL),('����W�M�ۜ�jk','ug-CN','2020-04-04 21:03:14.203',NULL),('�S��rL�}�b+�^�','it-IT','2020-04-04 21:03:14.196',NULL),('��\r��C{�$��~3)�','hi-IN','2020-04-04 21:03:14.196',NULL),('��ANS��Lq�B','ja-JP','2020-04-04 21:03:14.196',NULL),('��q��PM���Ru���','vi-VN','2020-04-04 21:03:14.204',NULL),('�>!�Bj��gO�}','uz-UZ','2020-04-04 21:03:14.204',NULL),('�x�ũsN!�\"��kk','zh-TW','2020-04-04 21:03:14.205',NULL);
/*!40000 ALTER TABLE `locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locale_translation`
--

DROP TABLE IF EXISTS `locale_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locale_translation` (
  `locale_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `territory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`locale_id`,`language_id`),
  KEY `fk.locale_translation.language_id` (`language_id`),
  CONSTRAINT `fk.locale_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.locale_translation.locale_id` FOREIGN KEY (`locale_id`) REFERENCES `locale` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.locale_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locale_translation`
--

LOCK TABLES `locale_translation` WRITE;
/*!40000 ALTER TABLE `locale_translation` DISABLE KEYS */;
INSERT INTO `locale_translation` VALUES ('\0%?�I\"�/U(4�','/�_��Mp�XT�|��','Serbian','Montenegro',NULL,'2020-04-04 21:03:14.202',NULL),('\0%?�I\"�/U(4�','�/p�L���M�4�8','Serbisch','Montenegro',NULL,'2020-04-04 21:03:14.202',NULL),('\0�1R{KD�����)m','/�_��Mp�XT�|��','Spanish','Spain',NULL,'2020-04-04 21:03:14.193',NULL),('\0�1R{KD�����)m','�/p�L���M�4�8','Spanisch','Spanien',NULL,'2020-04-04 21:03:14.193',NULL),('\0����vJZ�n3i?f�','/�_��Mp�XT�|��','Urdu','India',NULL,'2020-04-04 21:03:14.204',NULL),('\0����vJZ�n3i?f�','�/p�L���M�4�8','Urdu','Indien',NULL,'2020-04-04 21:03:14.204',NULL),('hI�%KQ���+���','/�_��Mp�XT�|��','Kurdish','Turkey',NULL,'2020-04-04 21:03:14.198',NULL),('hI�%KQ���+���','�/p�L���M�4�8','Kurdisch','Türkei',NULL,'2020-04-04 21:03:14.198',NULL),('7ߞ/�J+��D�\n���','/�_��Mp�XT�|��','Bosnian','Bosnia and Herzegovina',NULL,'2020-04-04 21:03:14.189',NULL),('7ߞ/�J+��D�\n���','�/p�L���M�4�8','Bosnisch','Bosnien und Herzegowina',NULL,'2020-04-04 21:03:14.189',NULL),('j��V~H��D��z��','/�_��Mp�XT�|��','Arabic','Jordan',NULL,'2020-04-04 21:03:14.188',NULL),('j��V~H��D��z��','�/p�L���M�4�8','Arabisch','Jordanien',NULL,'2020-04-04 21:03:14.188',NULL),('�,�l�A��3�rf��','/�_��Mp�XT�|��','English','India',NULL,'2020-04-04 21:03:14.191',NULL),('�,�l�A��3�rf��','�/p�L���M�4�8','Englisch','Indien',NULL,'2020-04-04 21:03:14.191',NULL),('\r(0�+L����y�','/�_��Mp�XT�|��','Koro','Ivory Coast',NULL,'2020-04-04 21:03:14.197',NULL),('\r(0�+L����y�','�/p�L���M�4�8','Koro','Côte d?Ivoire',NULL,'2020-04-04 21:03:14.197',NULL),('rxn�<L���m�RO\r2','/�_��Mp�XT�|��','Afar','Ethiopia',NULL,'2020-04-04 21:03:14.187',NULL),('rxn�<L���m�RO\r2','�/p�L���M�4�8','Afar','Äthiopien',NULL,'2020-04-04 21:03:14.187',NULL),('o�&nGݡ(�SQ�ב','/�_��Mp�XT�|��','Italian','Switzerland',NULL,'2020-04-04 21:03:14.196',NULL),('o�&nGݡ(�SQ�ב','�/p�L���M�4�8','Italienisch','Schweiz',NULL,'2020-04-04 21:03:14.196',NULL),('o�IulL��\r\\���','/�_��Mp�XT�|��','Arabic','Morocco',NULL,'2020-04-04 21:03:14.188',NULL),('o�IulL��\r\\���','�/p�L���M�4�8','Arabisch','Marokko',NULL,'2020-04-04 21:03:14.188',NULL),('�E�H��*�50n�','/�_��Mp�XT�|��','Filipino','Philippines',NULL,'2020-04-04 21:03:14.194',NULL),('�E�H��*�50n�','�/p�L���M�4�8','Filipino','Philippinen',NULL,'2020-04-04 21:03:14.194',NULL),('����DF�)��ו','/�_��Mp�XT�|��','Friulian','Italy',NULL,'2020-04-04 21:03:14.195',NULL),('����DF�)��ו','�/p�L���M�4�8','Friulisch','Italien',NULL,'2020-04-04 21:03:14.195',NULL),('	��M��Dױ!���#�B','/�_��Mp�XT�|��','Somali','Djibouti',NULL,'2020-04-04 21:03:14.201',NULL),('	��M��Dױ!���#�B','�/p�L���M�4�8','Somali','Dschibuti',NULL,'2020-04-04 21:03:14.201',NULL),('	�_��7M��4!oz�>{','/�_��Mp�XT�|��','Lingala','Democratic Republic of the Congo',NULL,'2020-04-04 21:03:14.198',NULL),('	�_��7M��4!oz�>{','�/p�L���M�4�8','Lingala','Demokratische Republik Kongo',NULL,'2020-04-04 21:03:14.198',NULL),('\nl<�~TJX�rExg��]','/�_��Mp�XT�|��','Spanish','Mexico',NULL,'2020-04-04 21:03:14.193',NULL),('\nl<�~TJX�rExg��]','�/p�L���M�4�8','Spanisch','Mexiko',NULL,'2020-04-04 21:03:14.193',NULL),('\r�䢀O�����ϭ�','/�_��Mp�XT�|��','Lingala','Congo',NULL,'2020-04-04 21:03:14.198',NULL),('\r�䢀O�����ϭ�','�/p�L���M�4�8','Lingala','Kongo',NULL,'2020-04-04 21:03:14.198',NULL),('v(��Dղ|Ғ�','/�_��Mp�XT�|��','Kirghiz','Kyrgyzstan',NULL,'2020-04-04 21:03:14.198',NULL),('v(��Dղ|Ғ�','�/p�L���M�4�8','Kirgisisch','Kirgisistan',NULL,'2020-04-04 21:03:14.198',NULL),('#r��JH�K����b','/�_��Mp�XT�|��','Punjabi','India',NULL,'2020-04-04 21:03:14.200',NULL),('#r��JH�K����b','�/p�L���M�4�8','Pandschabisch','Indien',NULL,'2020-04-04 21:03:14.200',NULL),('���BOs���0S���','/�_��Mp�XT�|��','French','Senegal',NULL,'2020-04-04 21:03:14.195',NULL),('���BOs���0S���','�/p�L���M�4�8','Französisch','Senegal',NULL,'2020-04-04 21:03:14.195',NULL),('�_e�I����=I<��','/�_��Mp�XT�|��','Croatian','Croatia',NULL,'2020-04-04 21:03:14.196',NULL),('�_e�I����=I<��','�/p�L���M�4�8','Kroatisch','Kroatien',NULL,'2020-04-04 21:03:14.196',NULL),('\r+p��J���	�l�I','/�_��Mp�XT�|��','Arabic','Libya',NULL,'2020-04-04 21:03:14.188',NULL),('\r+p��J���	�l�I','�/p�L���M�4�8','Arabisch','Libyen',NULL,'2020-04-04 21:03:14.188',NULL),('\r�c%\rN��r���Mc','/�_��Mp�XT�|��','Lao','Laos',NULL,'2020-04-04 21:03:14.198',NULL),('\r�c%\rN��r���Mc','�/p�L���M�4�8','Laotisch','Laos',NULL,'2020-04-04 21:03:14.198',NULL),('\r���MJB�B�2p߭','/�_��Mp�XT�|��','Blin','Eritrea',NULL,'2020-04-04 21:03:14.189',NULL),('\r���MJB�B�2p߭','�/p�L���M�4�8','Blin','Eritrea',NULL,'2020-04-04 21:03:14.189',NULL),('���>_C���C��j�','/�_��Mp�XT�|��','Tibetan','China',NULL,'2020-04-04 21:03:14.189',NULL),('���>_C���C��j�','�/p�L���M�4�8','Tibetisch','China',NULL,'2020-04-04 21:03:14.189',NULL),('��ʏN��u�۽\'','/�_��Mp�XT�|��','Icelandic','Iceland',NULL,'2020-04-04 21:03:14.196',NULL),('��ʏN��u�۽\'','�/p�L���M�4�8','Isländisch','Island',NULL,'2020-04-04 21:03:14.196',NULL),('���@����I3I','/�_��Mp�XT�|��','Kpelle','Guinea',NULL,'2020-04-04 21:03:14.197',NULL),('���@����I3I','�/p�L���M�4�8','Kpelle-Sprache','Guinea',NULL,'2020-04-04 21:03:14.197',NULL),('g�$RK��Ǒm��','/�_��Mp�XT�|��','Swiss German','Switzerland',NULL,'2020-04-04 21:03:14.195',NULL),('g�$RK��Ǒm��','�/p�L���M�4�8','Schweizerdeutsch','Schweiz',NULL,'2020-04-04 21:03:14.195',NULL),('����,K	��|�Bɂ','/�_��Mp�XT�|��','Faeroese','Faeroe Islands',NULL,'2020-04-04 21:03:14.194',NULL),('����,K	��|�Bɂ','�/p�L���M�4�8','Färöisch','Färöer',NULL,'2020-04-04 21:03:14.194',NULL),('�(�!Dq�?ه@��-','/�_��Mp�XT�|��','German','Belgium',NULL,'2020-04-04 21:03:14.190',NULL),('�(�!Dq�?ه@��-','�/p�L���M�4�8','Deutsch','Belgien',NULL,'2020-04-04 21:03:14.190',NULL),('[m�WF͒����','/�_��Mp�XT�|��','Greenlandic','Greenland',NULL,'2020-04-04 21:03:14.197',NULL),('[m�WF͒����','�/p�L���M�4�8','Grönländisch','Grönland',NULL,'2020-04-04 21:03:14.197',NULL),('d�$;�I��Mľ��[','/�_��Mp�XT�|��','Low German','Germany',NULL,'2020-04-04 21:03:14.199',NULL),('d�$;�I��Mľ��[','�/p�L���M�4�8','Niederdeutsch','Deutschland',NULL,'2020-04-04 21:03:14.199',NULL),('�k�}~G\n�1�]��Q','/�_��Mp�XT�|��','Norwegian Nynorsk','Norway',NULL,'2020-04-04 21:03:14.199',NULL),('�k�}~G\n�1�]��Q','�/p�L���M�4�8','Norwegisch Nynorsk','Norwegen',NULL,'2020-04-04 21:03:14.199',NULL),('e�9tHi�yf���p/','/�_��Mp�XT�|��','Chinese','Hong Kong',NULL,'2020-04-04 21:03:14.204',NULL),('e�9tHi�yf���p/','�/p�L���M�4�8','Chinesisch','Sonderverwaltungszone Hongkong',NULL,'2020-04-04 21:03:14.204',NULL),('�����A��ԛ�uQ*�','/�_��Mp�XT�|��','English','Jamaica',NULL,'2020-04-04 21:03:14.191',NULL),('�����A��ԛ�uQ*�','�/p�L���M�4�8','Englisch','Jamaika',NULL,'2020-04-04 21:03:14.191',NULL),('�	�ɐG���x���p','/�_��Mp�XT�|��','Southern Sotho Language','South Africa',NULL,'2020-04-04 21:03:14.202',NULL),('�	�ɐG���x���p','�/p�L���M�4�8','Süd-Sotho-Sprache','Südafrika',NULL,'2020-04-04 21:03:14.202',NULL),('y��SK͐\\Q���','/�_��Mp�XT�|��','Serbian','Serbia',NULL,'2020-04-04 21:03:14.202',NULL),('y��SK͐\\Q���','�/p�L���M�4�8','Serbisch','Serbien',NULL,'2020-04-04 21:03:14.202',NULL),('�ǈ�)O����g3[','/�_��Mp�XT�|��','Portuguese','Portugal',NULL,'2020-04-04 21:03:14.200',NULL),('�ǈ�)O����g3[','�/p�L���M�4�8','Portugiesisch','Portugal',NULL,'2020-04-04 21:03:14.200',NULL),('\Z�<�@<��;�j~','/�_��Mp�XT�|��','Catalan','Spain',NULL,'2020-04-04 21:03:14.189',NULL),('\Z�<�@<��;�j~','�/p�L���M�4�8','Katalanisch','Spanien',NULL,'2020-04-04 21:03:14.189',NULL),('\Z�Eq�|F���D3�)��','/�_��Mp�XT�|��','Punjabi','Pakistan',NULL,'2020-04-04 21:03:14.200',NULL),('\Z�Eq�|F���D3�)��','�/p�L���M�4�8','Pandschabisch','Pakistan',NULL,'2020-04-04 21:03:14.200',NULL),('G/�h{F�P�[��dB','/�_��Mp�XT�|��','Arabic','Saudi Arabia',NULL,'2020-04-04 21:03:14.188',NULL),('G/�h{F�P�[��dB','�/p�L���M�4�8','Arabisch','Saudi-Arabien',NULL,'2020-04-04 21:03:14.188',NULL),('As�F��׸�����','/�_��Mp�XT�|��','German','Germany',NULL,'2020-04-04 21:03:14.181',NULL),('As�F��׸�����','�/p�L���M�4�8','Deutsch','Deutschland',NULL,'2020-04-04 21:03:14.182',NULL),(' ڻ�wI3�A��	���','/�_��Mp�XT�|��','Polish','Poland',NULL,'2020-04-04 21:03:14.200',NULL),(' ڻ�wI3�A��	���','�/p�L���M�4�8','Polnisch','Polen',NULL,'2020-04-04 21:03:14.200',NULL),('!�����Dk�I�1����','/�_��Mp�XT�|��','Tongan','Tonga',NULL,'2020-04-04 21:03:14.203',NULL),('!�����Dk�I�1����','�/p�L���M�4�8','Tongaisch','Tonga',NULL,'2020-04-04 21:03:14.203',NULL),('\"^�_GF>�ϋՠwq','/�_��Mp�XT�|��','Ewe','Togo',NULL,'2020-04-04 21:03:14.190',NULL),('\"^�_GF>�ϋՠwq','�/p�L���M�4�8','Ewe-Sprache','Togo',NULL,'2020-04-04 21:03:14.190',NULL),('\"���LJ�0c��','/�_��Mp�XT�|��','Oromo','Kenya',NULL,'2020-04-04 21:03:14.200',NULL),('\"���LJ�0c��','�/p�L���M�4�8','Oromo','Kenia',NULL,'2020-04-04 21:03:14.200',NULL),('\"�=E}�A�6���~��','/�_��Mp�XT�|��','Atsam','Nigeria',NULL,'2020-04-04 21:03:14.189',NULL),('\"�=E}�A�6���~��','�/p�L���M�4�8','Atsam','Nigeria',NULL,'2020-04-04 21:03:14.189',NULL),('#C�\nC�M8�a��]�j�','/�_��Mp�XT�|��','German','Luxemburg',NULL,'2020-04-04 21:03:14.190',NULL),('#C�\nC�M8�a��]�j�','�/p�L���M�4�8','Deutsch','Luxemburg',NULL,'2020-04-04 21:03:14.190',NULL),('#g[�O���5#a#�','/�_��Mp�XT�|��','Akan','Ghana',NULL,'2020-04-04 21:03:14.187',NULL),('#g[�O���5#a#�','�/p�L���M�4�8','Akan','Ghana',NULL,'2020-04-04 21:03:14.187',NULL),('#�b�&jK�����\r�:','/�_��Mp�XT�|��','English','American Samoa',NULL,'2020-04-04 21:03:14.191',NULL),('#�b�&jK�����\r�:','�/p�L���M�4�8','Englisch','Amerikanisch-Samoa',NULL,'2020-04-04 21:03:14.191',NULL),('$+�mDL�����\0z[F','/�_��Mp�XT�|��','Swazi','South Africa',NULL,'2020-04-04 21:03:14.202',NULL),('$+�mDL�����\0z[F','�/p�L���M�4�8','Swazi','Südafrika',NULL,'2020-04-04 21:03:14.202',NULL),('\'\0	�VA_��A�_','/�_��Mp�XT�|��','Assamese','India',NULL,'2020-04-04 21:03:14.189',NULL),('\'\0	�VA_��A�_','�/p�L���M�4�8','Assamesisch','Indien',NULL,'2020-04-04 21:03:14.189',NULL),(')�b&�NҬ(Ndop�2','/�_��Mp�XT�|��','Arabic','Kuwait',NULL,'2020-04-04 21:03:14.188',NULL),(')�b&�NҬ(Ndop�2','�/p�L���M�4�8','Arabisch','Kuwait',NULL,'2020-04-04 21:03:14.188',NULL),(')�?F<SG���6��]�','/�_��Mp�XT�|��','Nepalese','India',NULL,'2020-04-04 21:03:14.199',NULL),(')�?F<SG���6��]�','�/p�L���M�4�8','Nepalesisch','Indien',NULL,'2020-04-04 21:03:14.199',NULL),('*���oTO�M}8\nO�r','/�_��Mp�XT�|��','English','Zimbabwe',NULL,'2020-04-04 21:03:14.192',NULL),('*���oTO�M}8\nO�r','�/p�L���M�4�8','Englisch','Simbabwe',NULL,'2020-04-04 21:03:14.192',NULL),(',X؏?#B襧��J��','/�_��Mp�XT�|��','Serbian','Serbia and Montenegro',NULL,'2020-04-04 21:03:14.202',NULL),(',X؏?#B襧��J��','�/p�L���M�4�8','Serbisch','Serbien und Montenegro',NULL,'2020-04-04 21:03:14.202',NULL),(',��/x2G�y{����','/�_��Mp�XT�|��','Venda Language','South Africa',NULL,'2020-04-04 21:03:14.204',NULL),(',��/x2G�y{����','�/p�L���M�4�8','Venda-Sprache','Südafrika',NULL,'2020-04-04 21:03:14.204',NULL),('-�\"�o�@Б�L�S���','/�_��Mp�XT�|��','Slovakian','Slovakia',NULL,'2020-04-04 21:03:14.201',NULL),('-�\"�o�@Б�L�S���','�/p�L���M�4�8','Slowakisch','Slowakei',NULL,'2020-04-04 21:03:14.201',NULL),('-��A[WO���v����','/�_��Mp�XT�|��','Tigre','Eritrea',NULL,'2020-04-04 21:03:14.203',NULL),('-��A[WO���v����','�/p�L���M�4�8','Tigre','Eritrea',NULL,'2020-04-04 21:03:14.203',NULL),('.<QK�hDo�<��RR��','/�_��Mp�XT�|��','Spanish','Bolivia',NULL,'2020-04-04 21:03:14.192',NULL),('.<QK�hDo�<��RR��','�/p�L���M�4�8','Spanisch','Bolivien',NULL,'2020-04-04 21:03:14.192',NULL),('.����DՆ�S^=�8','/�_��Mp�XT�|��','English','Botswana',NULL,'2020-04-04 21:03:14.191',NULL),('.����DՆ�S^=�8','�/p�L���M�4�8','Englisch','Botsuana',NULL,'2020-04-04 21:03:14.191',NULL),('/���}(B�������','/�_��Mp�XT�|��','Arabic','Bahrain',NULL,'2020-04-04 21:03:14.188',NULL),('/���}(B�������','�/p�L���M�4�8','Arabisch','Bahrain',NULL,'2020-04-04 21:03:14.188',NULL),('1�-8�rE���*�X�\r�','/�_��Mp�XT�|��','Ukrainian','Ukraine',NULL,'2020-04-04 21:03:14.204',NULL),('1�-8�rE���*�X�\r�','�/p�L���M�4�8','Ukrainisch','Ukraine',NULL,'2020-04-04 21:03:14.204',NULL),('1��UAM�wJ��@�#','/�_��Mp�XT�|��','English','United Kingdom',NULL,'2020-04-04 21:03:14.179',NULL),('1��UAM�wJ��@�#','�/p�L���M�4�8','Englisch','Vereinigtes Königreich',NULL,'2020-04-04 21:03:14.181',NULL),('2�`b�BE�K�jT�J','/�_��Mp�XT�|��','French','Belgium',NULL,'2020-04-04 21:03:14.194',NULL),('2�`b�BE�K�jT�J','�/p�L���M�4�8','Französisch','Belgien',NULL,'2020-04-04 21:03:14.194',NULL),('4��qi�A���Z�s�','/�_��Mp�XT�|��','Tartar','Russian Federation',NULL,'2020-04-04 21:03:14.203',NULL),('4��qi�A���Z�s�','�/p�L���M�4�8','Tatarisch','Russische Föderation',NULL,'2020-04-04 21:03:14.203',NULL),('6�\'HK�BV���\0�=�\Z','/�_��Mp�XT�|��','Arabic','Yemen',NULL,'2020-04-04 21:03:14.189',NULL),('6�\'HK�BV���\0�=�\Z','�/p�L���M�4�8','Arabisch','Jemen',NULL,'2020-04-04 21:03:14.189',NULL),('6�$�N_�aU\Zs�\\','/�_��Mp�XT�|��','English','Singapore',NULL,'2020-04-04 21:03:14.192',NULL),('6�$�N_�aU\Zs�\\','�/p�L���M�4�8','Englisch','Singapur',NULL,'2020-04-04 21:03:14.192',NULL),('7��؜\'B��JJ$�','/�_��Mp�XT�|��','Zulu','South Africa',NULL,'2020-04-04 21:03:14.205',NULL),('7��؜\'B��JJ$�','�/p�L���M�4�8','Zulu','Südafrika',NULL,'2020-04-04 21:03:14.205',NULL),('8*)Ux�M���I�.�%','/�_��Mp�XT�|��','Afar','Djibouti',NULL,'2020-04-04 21:03:14.187',NULL),('8*)Ux�M���I�.�%','�/p�L���M�4�8','Afar','Dschibuti',NULL,'2020-04-04 21:03:14.187',NULL),('9,�`��@��|���L��','/�_��Mp�XT�|��','Portuguese','Brazil',NULL,'2020-04-04 21:03:14.200',NULL),('9,�`��@��|���L��','�/p�L���M�4�8','Portugiesisch','Brasilien',NULL,'2020-04-04 21:03:14.200',NULL),(';5,���Dɀ�n� �\0','/�_��Mp�XT�|��','Nepalese','Nepal',NULL,'2020-04-04 21:03:14.199',NULL),(';5,���Dɀ�n� �\0','�/p�L���M�4�8','Nepalesisch','Nepal',NULL,'2020-04-04 21:03:14.199',NULL),('>i�/�0HG�qY^�P','/�_��Mp�XT�|��','Persian','Afghanistan',NULL,'2020-04-04 21:03:14.194',NULL),('>i�/�0HG�qY^�P','�/p�L���M�4�8','Persisch','Afghanistan',NULL,'2020-04-04 21:03:14.194',NULL),('>����IS��>�u�*','/�_��Mp�XT�|��','Arabic','Syria',NULL,'2020-04-04 21:03:14.188',NULL),('>����IS��>�u�*','�/p�L���M�4�8','Arabisch','Syrien',NULL,'2020-04-04 21:03:14.188',NULL),('>�Y~\ZD%��$���','/�_��Mp�XT�|��','Korean','Republic of Korea',NULL,'2020-04-04 21:03:14.197',NULL),('>�Y~\ZD%��$���','�/p�L���M�4�8','Koreanisch','Republik Korea',NULL,'2020-04-04 21:03:14.197',NULL),('@�j��IٗH9�{��N','/�_��Mp�XT�|��','Spanish','Chile',NULL,'2020-04-04 21:03:14.192',NULL),('@�j��IٗH9�{��N','�/p�L���M�4�8','Spanisch','Chile',NULL,'2020-04-04 21:03:14.192',NULL),('BO{���N���CX�*�V','/�_��Mp�XT�|��','Serbian','Bosnia and Herzegovina',NULL,'2020-04-04 21:03:14.202',NULL),('BO{���N���CX�*�V','�/p�L���M�4�8','Serbisch','Bosnien und Herzegowina',NULL,'2020-04-04 21:03:14.202',NULL),('D�Z�F�MK��p\0\'�8�','/�_��Mp�XT�|��','Galician','Spain',NULL,'2020-04-04 21:03:14.195',NULL),('D�Z�F�MK��p\0\'�8�','�/p�L���M�4�8','Galizisch','Spanien',NULL,'2020-04-04 21:03:14.195',NULL),('E�P� EF�P�-� �#','/�_��Mp�XT�|��','Serbo-Croat','Bosnia and Herzegovina',NULL,'2020-04-04 21:03:14.201',NULL),('E�P� EF�P�-� �#','�/p�L���M�4�8','Serbo-Kroatisch','Bosnien und Herzegowina',NULL,'2020-04-04 21:03:14.201',NULL),('F�Y{=K2���?���','/�_��Mp�XT�|��','Chinese','Macao',NULL,'2020-04-04 21:03:14.204',NULL),('F�Y{=K2���?���','�/p�L���M�4�8','Chinesisch','Sonderverwaltungszone Macao',NULL,'2020-04-04 21:03:14.204',NULL),('Gzb�K_�x@\r����','/�_��Mp�XT�|��','Bulgarian','Bulgaria',NULL,'2020-04-04 21:03:14.189',NULL),('Gzb�K_�x@\r����','�/p�L���M�4�8','Bulgarisch','Bulgarien',NULL,'2020-04-04 21:03:14.189',NULL),('G��\rJ㝞�x�a1','/�_��Mp�XT�|��','Slovene','Slovenia',NULL,'2020-04-04 21:03:14.201',NULL),('G��\rJ㝞�x�a1','�/p�L���M�4�8','Slowenisch','Slowenien',NULL,'2020-04-04 21:03:14.201',NULL),('IߔC��N���6U�Q��','/�_��Mp�XT�|��','Spanish','Nicaragua',NULL,'2020-04-04 21:03:14.193',NULL),('IߔC��N���6U�Q��','�/p�L���M�4�8','Spanisch','Nicaragua',NULL,'2020-04-04 21:03:14.193',NULL),('I��(�M1���� �J','/�_��Mp�XT�|��','Kurdish','Iran',NULL,'2020-04-04 21:03:14.198',NULL),('I��(�M1���� �J','�/p�L���M�4�8','Kurdisch','Iran',NULL,'2020-04-04 21:03:14.198',NULL),('K*���D����ջ','/�_��Mp�XT�|��','Orija','India',NULL,'2020-04-04 21:03:14.200',NULL),('K*���D����ջ','�/p�L���M�4�8','Orija','Indien',NULL,'2020-04-04 21:03:14.200',NULL),('L�2���B;��a�wo�#','/�_��Mp�XT�|��','Northern Sotho language','South Africa',NULL,'2020-04-04 21:03:14.199',NULL),('L�2���B;��a�wo�#','�/p�L���M�4�8','Nord-Sotho-Sprache','Südafrika',NULL,'2020-04-04 21:03:14.199',NULL),('L�B���I���d#���','/�_��Mp�XT�|��','French','Canada',NULL,'2020-04-04 21:03:14.194',NULL),('L�B���I���d#���','�/p�L���M�4�8','Französisch','Kanada',NULL,'2020-04-04 21:03:14.194',NULL),('R���Ik��mf���','/�_��Mp�XT�|��','Greek','Greece',NULL,'2020-04-04 21:03:14.190',NULL),('R���Ik��mf���','�/p�L���M�4�8','Griechisch','Griechenland',NULL,'2020-04-04 21:03:14.190',NULL),('R�_C�FFѪ�O@��,0','/�_��Mp�XT�|��','English','American Virgin Islands',NULL,'2020-04-04 21:03:14.192',NULL),('R�_C�FFѪ�O@��,0','�/p�L���M�4�8','Englisch','Amerikanische Jungferninseln',NULL,'2020-04-04 21:03:14.192',NULL),('UmK\0�IT�~�R��r','/�_��Mp�XT�|��','Arabic','Sudan',NULL,'2020-04-04 21:03:14.188',NULL),('UmK\0�IT�~�R��r','�/p�L���M�4�8','Arabisch','Sudan',NULL,'2020-04-04 21:03:14.188',NULL),('U�(��\\@�us.�','/�_��Mp�XT�|��','Dutch','Belgium',NULL,'2020-04-04 21:03:14.199',NULL),('U�(��\\@�us.�','�/p�L���M�4�8','Niederländisch','Belgien',NULL,'2020-04-04 21:03:14.199',NULL),('V��^W#Ki�v�W���+','/�_��Mp�XT�|��','Afrikaans','South Africa',NULL,'2020-04-04 21:03:14.187',NULL),('V��^W#Ki�v�W���+','�/p�L���M�4�8','Afrikaans','Südafrika',NULL,'2020-04-04 21:03:14.187',NULL),('V�\r��Bl�\"�9��it','/�_��Mp�XT�|��','Thai','Thailand',NULL,'2020-04-04 21:03:14.203',NULL),('V�\r��Bl�\"�9��it','�/p�L���M�4�8','Thailändisch','Thailand',NULL,'2020-04-04 21:03:14.203',NULL),('Xh,��`@��O��K8�','/�_��Mp�XT�|��','Ewe','Ghana',NULL,'2020-04-04 21:03:14.190',NULL),('Xh,��`@��O��K8�','�/p�L���M�4�8','Ewe-Sprache','Ghana',NULL,'2020-04-04 21:03:14.190',NULL),('YO�u�F������9��','/�_��Mp�XT�|��','Oromo','Ethiopia',NULL,'2020-04-04 21:03:14.200',NULL),('YO�u�F������9��','�/p�L���M�4�8','Oromo','Äthiopien',NULL,'2020-04-04 21:03:14.200',NULL),('Z��V�GH�*N8؅��','/�_��Mp�XT�|��','Hebrew','Israel',NULL,'2020-04-04 21:03:14.196',NULL),('Z��V�GH�*N8؅��','�/p�L���M�4�8','Hebräisch','Israel',NULL,'2020-04-04 21:03:14.196',NULL),('[�O�|@��_i��\n�Y','/�_��Mp�XT�|��','Romanian','Romania',NULL,'2020-04-04 21:03:14.200',NULL),('[�O�|@��_i��\n�Y','�/p�L���M�4�8','Rumänisch','Rumänien',NULL,'2020-04-04 21:03:14.200',NULL),('[�#yH׉?2$�.�e','/�_��Mp�XT�|��','Serbo-Croat','Serbia and Montenegro',NULL,'2020-04-04 21:03:14.201',NULL),('[�#yH׉?2$�.�e','�/p�L���M�4�8','Serbo-Kroatisch','Serbien und Montenegro',NULL,'2020-04-04 21:03:14.201',NULL),('\\,w�zF������V','/�_��Mp�XT�|��','Maltese','Malta',NULL,'2020-04-04 21:03:14.199',NULL),('\\,w�zF������V','�/p�L���M�4�8','Maltesisch','Malta',NULL,'2020-04-04 21:03:14.199',NULL),('\\7���Oa���g��','/�_��Mp�XT�|��','Spanish','Paraguay',NULL,'2020-04-04 21:03:14.193',NULL),('\\7���Oa���g��','�/p�L���M�4�8','Spanisch','Paraguay',NULL,'2020-04-04 21:03:14.193',NULL),('].c��O��Q�f��Q','/�_��Mp�XT�|��','Spanish','Puerto Rico',NULL,'2020-04-04 21:03:14.193',NULL),('].c��O��Q�f��Q','�/p�L���M�4�8','Spanisch','Puerto Rico',NULL,'2020-04-04 21:03:14.193',NULL),('^��9݊F\"����/k�o','/�_��Mp�XT�|��','Arabic','Lebanon',NULL,'2020-04-04 21:03:14.188',NULL),('^��9݊F\"����/k�o','�/p�L���M�4�8','Arabisch','Libanon',NULL,'2020-04-04 21:03:14.188',NULL),('_n�|�Fn��4eP�7w','/�_��Mp�XT�|��','Arabic','United Arab Emirates',NULL,'2020-04-04 21:03:14.187',NULL),('_n�|�Fn��4eP�7w','�/p�L���M�4�8','Arabisch','Vereinigte Arabische Emirate',NULL,'2020-04-04 21:03:14.187',NULL),('c���;H6��\'�y�ˀ','/�_��Mp�XT�|��','Somali','Somalia',NULL,'2020-04-04 21:03:14.202',NULL),('c���;H6��\'�y�ˀ','�/p�L���M�4�8','Somali','Somalia',NULL,'2020-04-04 21:03:14.202',NULL),('c��^RN�+ZF!�','/�_��Mp�XT�|��','Hausa','Nigeria',NULL,'2020-04-04 21:03:14.195',NULL),('c��^RN�+ZF!�','�/p�L���M�4�8','Hausa','Nigeria',NULL,'2020-04-04 21:03:14.196',NULL),('c��eMN��Z���I3','/�_��Mp�XT�|��','Manx','United Kingdom',NULL,'2020-04-04 21:03:14.195',NULL),('c��eMN��Z���I3','�/p�L���M�4�8','Manx','Vereinigtes Königreich',NULL,'2020-04-04 21:03:14.195',NULL),('dv!�G0��6��n','/�_��Mp�XT�|��','English','Belgium',NULL,'2020-04-04 21:03:14.191',NULL),('dv!�G0��6��n','�/p�L���M�4�8','Englisch','Belgien',NULL,'2020-04-04 21:03:14.191',NULL),('e|[�,QAm�2P+�k��','/�_��Mp�XT�|��','Spanish','Argentina',NULL,'2020-04-04 21:03:14.192',NULL),('e|[�,QAm�2P+�k��','�/p�L���M�4�8','Spanisch','Argentinien',NULL,'2020-04-04 21:03:14.192',NULL),('f����Og��n[䶎','/�_��Mp�XT�|��','Ga','Ghana',NULL,'2020-04-04 21:03:14.195',NULL),('f����Og��n[䶎','�/p�L���M�4�8','Ga-Sprache','Ghana',NULL,'2020-04-04 21:03:14.195',NULL),('h���nNC���Bw�w�','/�_��Mp�XT�|��','English','U.S. Minor Outlying Islands',NULL,'2020-04-04 21:03:14.192',NULL),('h���nNC���Bw�w�','�/p�L���M�4�8','Englisch','Amerikanisch-Ozeanien',NULL,'2020-04-04 21:03:14.192',NULL),('jz%��E哀3r���','/�_��Mp�XT�|��','Kurdish','Iraq',NULL,'2020-04-04 21:03:14.197',NULL),('jz%��E哀3r���','�/p�L���M�4�8','Kurdisch','Irak',NULL,'2020-04-04 21:03:14.197',NULL),('j�JW�7G���9�S�','/�_��Mp�XT�|��','English','Australia',NULL,'2020-04-04 21:03:14.191',NULL),('j�JW�7G���9�S�','�/p�L���M�4�8','Englisch','Australien',NULL,'2020-04-04 21:03:14.191',NULL),('k�i�XIā|��Ȇ��','/�_��Mp�XT�|��','Hawaiian','United States',NULL,'2020-04-04 21:03:14.196',NULL),('k�i�XIā|��Ȇ��','�/p�L���M�4�8','Hawaiisch','Vereinigte Staaten',NULL,'2020-04-04 21:03:14.196',NULL),('m�e�N�Iܵ����','/�_��Mp�XT�|��','Tadjik','Tajikistan',NULL,'2020-04-04 21:03:14.203',NULL),('m�e�N�Iܵ����','�/p�L���M�4�8','Tadschikisch','Tadschikistan',NULL,'2020-04-04 21:03:14.203',NULL),('n�<�sB�����i�','/�_��Mp�XT�|��','German','Austria',NULL,'2020-04-04 21:03:14.190',NULL),('n�<�sB�����i�','�/p�L���M�4�8','Deutsch','Österreich',NULL,'2020-04-04 21:03:14.190',NULL),('o���Lև/j-�\0Pa','/�_��Mp�XT�|��','Russian','Ukraine',NULL,'2020-04-04 21:03:14.201',NULL),('o���Lև/j-�\0Pa','�/p�L���M�4�8','Russisch','Ukraine',NULL,'2020-04-04 21:03:14.201',NULL),('p�%Y�J��r�}N[|�','/�_��Mp�XT�|��','German','Liechtenstein',NULL,'2020-04-04 21:03:14.190',NULL),('p�%Y�J��r�}N[|�','�/p�L���M�4�8','Deutsch','Liechtenstein',NULL,'2020-04-04 21:03:14.190',NULL),('qB��bJu��N,k��q','/�_��Mp�XT�|��','Spanish','Venezuela',NULL,'2020-04-04 21:03:14.194',NULL),('qB��bJu��N,k��q','�/p�L���M�4�8','Spanisch','Venezuela',NULL,'2020-04-04 21:03:14.194',NULL),('q+0�\\qE���:�c�I','/�_��Mp�XT�|��','Uzbek','Afghanistan',NULL,'2020-04-04 21:03:14.204',NULL),('q+0�\\qE���:�c�I','�/p�L���M�4�8','Usbekisch','Afghanistan',NULL,'2020-04-04 21:03:14.204',NULL),('rӟ�fA\"���@ɜ��','/�_��Mp�XT�|��','Malayalam','India',NULL,'2020-04-04 21:03:14.198',NULL),('rӟ�fA\"���@ɜ��','�/p�L���M�4�8','Malayalam','Indien',NULL,'2020-04-04 21:03:14.198',NULL),('sh���Bz��k��cP7','/�_��Mp�XT�|��','Sanskrit','India',NULL,'2020-04-04 21:03:14.201',NULL),('sh���Bz��k��cP7','�/p�L���M�4�8','Sanskrit','Indien',NULL,'2020-04-04 21:03:14.201',NULL),('tc{+��Hڗ��@��','/�_��Mp�XT�|��','Hausa','Sudan',NULL,'2020-04-04 21:03:14.196',NULL),('tc{+��Hڗ��@��','�/p�L���M�4�8','Hausa','Sudan',NULL,'2020-04-04 21:03:14.196',NULL),('to�(l>F�[��z�','/�_��Mp�XT�|��','Occitan','France',NULL,'2020-04-04 21:03:14.200',NULL),('to�(l>F�[��z�','�/p�L���M�4�8','Okzitanisch','Frankreich',NULL,'2020-04-04 21:03:14.200',NULL),('v:�^�J��]K�PAE|','/�_��Mp�XT�|��','Tigrinya','Eritrea',NULL,'2020-04-04 21:03:14.203',NULL),('v:�^�J��]K�PAE|','�/p�L���M�4�8','Tigrinja','Eritrea',NULL,'2020-04-04 21:03:14.203',NULL),('w���nO/���-�;�','/�_��Mp�XT�|��','Spanish','Colombia',NULL,'2020-04-04 21:03:14.192',NULL),('w���nO/���-�;�','�/p�L���M�4�8','Spanisch','Kolumbien',NULL,'2020-04-04 21:03:14.193',NULL),('yN	�Aډ��E�v�','/�_��Mp�XT�|��','English','Marshall Islands',NULL,'2020-04-04 21:03:14.191',NULL),('yN	�Aډ��E�v�','�/p�L���M�4�8','Englisch','Marshallinseln',NULL,'2020-04-04 21:03:14.191',NULL),('ySZ�8�I�Sּ&�!','/�_��Mp�XT�|��','Burmese','Myanmar',NULL,'2020-04-04 21:03:14.199',NULL),('ySZ�8�I�Sּ&�!','�/p�L���M�4�8','Birmanisch','Myanmar',NULL,'2020-04-04 21:03:14.199',NULL),('yֹ���H\\���R仉�','/�_��Mp�XT�|��','Welsh','United Kingdom',NULL,'2020-04-04 21:03:14.190',NULL),('yֹ���H\\���R仉�','�/p�L���M�4�8','Walisisch','Vereinigtes Königreich',NULL,'2020-04-04 21:03:14.190',NULL),('z��ٰAڌ(����','/�_��Mp�XT�|��','Kazakh','Kazakhstan',NULL,'2020-04-04 21:03:14.197',NULL),('z��ٰAڌ(����','�/p�L���M�4�8','Kasachisch','Kasachstan',NULL,'2020-04-04 21:03:14.197',NULL),('|G�Г�LӑC?����','/�_��Mp�XT�|��','Spanish','Panama',NULL,'2020-04-04 21:03:14.193',NULL),('|G�Г�LӑC?����','�/p�L���M�4�8','Spanisch','Panama',NULL,'2020-04-04 21:03:14.193',NULL),('}�i4nJ�\'B���','/�_��Mp�XT�|��','Spanish','Peru',NULL,'2020-04-04 21:03:14.193',NULL),('}�i4nJ�\'B���','�/p�L���M�4�8','Spanisch','Peru',NULL,'2020-04-04 21:03:14.193',NULL),('~��Sr�K߭��҂�\'','/�_��Mp�XT�|��','Somali','Ethiopia',NULL,'2020-04-04 21:03:14.201',NULL),('~��Sr�K߭��҂�\'','�/p�L���M�4�8','Somali','Äthiopien',NULL,'2020-04-04 21:03:14.201',NULL),('�����@Q�Gu\Z�xx�','/�_��Mp�XT�|��','Geez','Ethiopia',NULL,'2020-04-04 21:03:14.195',NULL),('�����@Q�Gu\Z�xx�','�/p�L���M�4�8','Geez','Äthiopien',NULL,'2020-04-04 21:03:14.195',NULL),('��j71�@Р�/u+','/�_��Mp�XT�|��','Kamba','Kenya',NULL,'2020-04-04 21:03:14.197',NULL),('��j71�@Р�/u+','�/p�L���M�4�8','Kamba','Kenia',NULL,'2020-04-04 21:03:14.197',NULL),('�\0���1G*�a� n2I','/�_��Mp�XT�|��','Southern Sotho Language','Lesotho',NULL,'2020-04-04 21:03:14.202',NULL),('�\0���1G*�a� n2I','�/p�L���M�4�8','Süd-Sotho-Sprache','Lesotho',NULL,'2020-04-04 21:03:14.202',NULL),('��P���I���;�@','/�_��Mp�XT�|��','Amharic','Ethiopia',NULL,'2020-04-04 21:03:14.187',NULL),('��P���I���;�@','�/p�L���M�4�8','Amharisch','Äthiopien',NULL,'2020-04-04 21:03:14.187',NULL),('���M�FF=����ˈ','/�_��Mp�XT�|��','Wolof','Senegal',NULL,'2020-04-04 21:03:14.204',NULL),('���M�FF=����ˈ','�/p�L���M�4�8','Wolof','Senegal',NULL,'2020-04-04 21:03:14.204',NULL),('�C+��K扟�zN[�N','/�_��Mp�XT�|��','German','Switzerland',NULL,'2020-04-04 21:03:14.190',NULL),('�C+��K扟�zN[�N','�/p�L���M�4�8','Deutsch','Schweiz',NULL,'2020-04-04 21:03:14.190',NULL),('�c��?�N�������&','/�_��Mp�XT�|��','Irish','Ireland',NULL,'2020-04-04 21:03:14.195',NULL),('�c��?�N�������&','�/p�L���M�4�8','Irisch','Irland',NULL,'2020-04-04 21:03:14.195',NULL),('��CB�O��K��X��','/�_��Mp�XT�|��','Swedish','Sweden',NULL,'2020-04-04 21:03:14.202',NULL),('��CB�O��K��X��','�/p�L���M�4�8','Schwedisch','Schweden',NULL,'2020-04-04 21:03:14.202',NULL),('�1�BCH�����b','/�_��Mp�XT�|��','Malay','Malaysia',NULL,'2020-04-04 21:03:14.199',NULL),('�1�BCH�����b','�/p�L���M�4�8','Malaiisch','Malaysia',NULL,'2020-04-04 21:03:14.199',NULL),('�Y�Jޏ}ly^ϊ�','/�_��Mp�XT�|��','English','Hong Kong',NULL,'2020-04-04 21:03:14.191',NULL),('�Y�Jޏ}ly^ϊ�','�/p�L���M�4�8','Englisch','Sonderverwaltungszone Hongkong',NULL,'2020-04-04 21:03:14.191',NULL),('��\"*�GA�����4�','/�_��Mp�XT�|��','Cornish','United Kingdom',NULL,'2020-04-04 21:03:14.198',NULL),('��\"*�GA�����4�','�/p�L���M�4�8','Kornisch','Vereinigtes Königreich',NULL,'2020-04-04 21:03:14.198',NULL),('��dm!$J���t��-','/�_��Mp�XT�|��','English','New Zealand',NULL,'2020-04-04 21:03:14.192',NULL),('��dm!$J���t��-','�/p�L���M�4�8','Englisch','Neuseeland',NULL,'2020-04-04 21:03:14.192',NULL),('�O�4JD̈́�yy���','/�_��Mp�XT�|��','English','United States',NULL,'2020-04-04 21:03:14.192',NULL),('�O�4JD̈́�yy���','�/p�L���M�4�8','Englisch','Vereinigte Staaten',NULL,'2020-04-04 21:03:14.192',NULL),('�\'���I�@&e=�','/�_��Mp�XT�|��','Hausa','Ghana',NULL,'2020-04-04 21:03:14.195',NULL),('�\'���I�@&e=�','�/p�L���M�4�8','Hausa','Ghana',NULL,'2020-04-04 21:03:14.195',NULL),('��+��\ZE!��`�My* ','/�_��Mp�XT�|��','Mongol','China',NULL,'2020-04-04 21:03:14.198',NULL),('��+��\ZE!��`�My* ','�/p�L���M�4�8','Mongolisch','China',NULL,'2020-04-04 21:03:14.198',NULL),('��6�}Dv�U��\r1C	','/�_��Mp�XT�|��','Lithuanian','Lithuania',NULL,'2020-04-04 21:03:14.198',NULL),('��6�}Dv�U��\r1C	','�/p�L���M�4�8','Litauisch','Litauen',NULL,'2020-04-04 21:03:14.198',NULL),('�b���J:��<�Ƈy','/�_��Mp�XT�|��','Singhalese','Sri Lanka',NULL,'2020-04-04 21:03:14.201',NULL),('�b���J:��<�Ƈy','�/p�L���M�4�8','Singhalesisch','Sri Lanka',NULL,'2020-04-04 21:03:14.201',NULL),('����]3E���+�J��','/�_��Mp�XT�|��','Tigrinya','Ethiopia',NULL,'2020-04-04 21:03:14.203',NULL),('����]3E���+�J��','�/p�L���M�4�8','Tigrinja','Äthiopien',NULL,'2020-04-04 21:03:14.203',NULL),('�af�ALс�X��D�','/�_��Mp�XT�|��','Persian','Iran',NULL,'2020-04-04 21:03:14.194',NULL),('�af�ALс�X��D�','�/p�L���M�4�8','Persisch','Iran',NULL,'2020-04-04 21:03:14.194',NULL),('�|�GCB��(�A�3','/�_��Mp�XT�|��','Arabic','Iraq',NULL,'2020-04-04 21:03:14.188',NULL),('�|�GCB��(�A�3','�/p�L���M�4�8','Arabisch','Irak',NULL,'2020-04-04 21:03:14.188',NULL),('��\Z�7�Eo�q.1�;','/�_��Mp�XT�|��','English','Malta',NULL,'2020-04-04 21:03:14.191',NULL),('��\Z�7�Eo�q.1�;','�/p�L���M�4�8','Englisch','Malta',NULL,'2020-04-04 21:03:14.191',NULL),('�2��\\A����RG�6','/�_��Mp�XT�|��','Urdu','Pakistan',NULL,'2020-04-04 21:03:14.204',NULL),('�2��\\A����RG�6','�/p�L���M�4�8','Urdu','Pakistan',NULL,'2020-04-04 21:03:14.204',NULL),('���=�J���T��S�','/�_��Mp�XT�|��','Arabic','Qatar',NULL,'2020-04-04 21:03:14.188',NULL),('���=�J���T��S�','�/p�L���M�4�8','Arabisch','Katar',NULL,'2020-04-04 21:03:14.188',NULL),('�[<��MH����;b�G�','/�_��Mp�XT�|��','Latvian','Lettland',NULL,'2020-04-04 21:03:14.198',NULL),('�[<��MH����;b�G�','�/p�L���M�4�8','Lettisch','Lettland',NULL,'2020-04-04 21:03:14.198',NULL),('�xF��H����H�a�','/�_��Mp�XT�|��','Walamo Language','Ethiopia',NULL,'2020-04-04 21:03:14.204',NULL),('�xF��H����H�a�','�/p�L���M�4�8','Walamo-Sprache','Äthiopien',NULL,'2020-04-04 21:03:14.204',NULL),('���B�IJ\"�:m�\'�0#','/�_��Mp�XT�|��','Spanish','Guatemala',NULL,'2020-04-04 21:03:14.193',NULL),('���B�IJ\"�:m�\'�0#','�/p�L���M�4�8','Spanisch','Guatemala',NULL,'2020-04-04 21:03:14.193',NULL),('�#���?I�0%��\\','/�_��Mp�XT�|��','Southern Ndebele','South Africa',NULL,'2020-04-04 21:03:14.199',NULL),('�#���?I�0%��\\','�/p�L���M�4�8','Süd-Ndebele-Sprache','Südafrika',NULL,'2020-04-04 21:03:14.199',NULL),('�eϯ��K9�!|Ƣ','/�_��Mp�XT�|��','Arabic','Algeria',NULL,'2020-04-04 21:03:14.188',NULL),('�eϯ��K9�!|Ƣ','�/p�L���M�4�8','Arabisch','Algerien',NULL,'2020-04-04 21:03:14.188',NULL),('�	�j��OЎdRch�E?','/�_��Mp�XT�|��','English','Namibia',NULL,'2020-04-04 21:03:14.191',NULL),('�	�j��OЎdRch�E?','�/p�L���M�4�8','Englisch','Namibia',NULL,'2020-04-04 21:03:14.192',NULL),('����B�H:��22�`�','/�_��Mp�XT�|��','Finnish','Finland',NULL,'2020-04-04 21:03:14.194',NULL),('����B�H:��22�`�','�/p�L���M�4�8','Finnisch','Finnland',NULL,'2020-04-04 21:03:14.194',NULL),('���J�ODe��������','/�_��Mp�XT�|��','Indonesian','Indonesia',NULL,'2020-04-04 21:03:14.196',NULL),('���J�ODe��������','�/p�L���M�4�8','Indonesisch','Indonesien',NULL,'2020-04-04 21:03:14.196',NULL),('��a �S@��F�Ф��','/�_��Mp�XT�|��','English','Northern Mariana Islands',NULL,'2020-04-04 21:03:14.191',NULL),('��a �S@��F�Ф��','�/p�L���M�4�8','Englisch','Nördliche Marianen',NULL,'2020-04-04 21:03:14.191',NULL),('��R���I+�Lv�<��','/�_��Mp�XT�|��','Spanish','Costa Rica',NULL,'2020-04-04 21:03:14.193',NULL),('��R���I+�Lv�<��','�/p�L���M�4�8','Spanisch','Costa Rica',NULL,'2020-04-04 21:03:14.193',NULL),('�ksZ��N���Q@o�','/�_��Mp�XT�|��','Malay','Brunei Darussalam',NULL,'2020-04-04 21:03:14.199',NULL),('�ksZ��N���Q@o�','�/p�L���M�4�8','Malaiisch','Brunei Darussalam',NULL,'2020-04-04 21:03:14.199',NULL),('�G?��D�E\0we��=','/�_��Mp�XT�|��','Syriac','Syria',NULL,'2020-04-04 21:03:14.203',NULL),('�G?��D�E\0we��=','�/p�L���M�4�8','Syrisch','Syrien',NULL,'2020-04-04 21:03:14.203',NULL),('�Ì\'�F�K����2)','/�_��Mp�XT�|��','Albanian','Albania',NULL,'2020-04-04 21:03:14.202',NULL),('�Ì\'�F�K����2)','�/p�L���M�4�8','Albanisch','Albanien',NULL,'2020-04-04 21:03:14.202',NULL),('��LC��+����f','/�_��Mp�XT�|��','English','Belize',NULL,'2020-04-04 21:03:14.191',NULL),('��LC��+����f','�/p�L���M�4�8','Englisch','Belize',NULL,'2020-04-04 21:03:14.191',NULL),('�I@�h�C}���3MjS','/�_��Mp�XT�|��','English','Trinidad and Tobago',NULL,'2020-04-04 21:03:14.192',NULL),('�I@�h�C}���3MjS','�/p�L���M�4�8','Englisch','Trinidad und Tobago',NULL,'2020-04-04 21:03:14.192',NULL),('���EL���&�H�)','/�_��Mp�XT�|��','Swahili','Tanzania',NULL,'2020-04-04 21:03:14.202',NULL),('���EL���&�H�)','�/p�L���M�4�8','Suaheli','Tansania',NULL,'2020-04-04 21:03:14.202',NULL),('�*ey�G ����x�S@','/�_��Mp�XT�|��','English','Ireland',NULL,'2020-04-04 21:03:14.191',NULL),('�*ey�G ����x�S@','�/p�L���M�4�8','Englisch','Irland',NULL,'2020-04-04 21:03:14.191',NULL),('�ۘP�3J����k���','/�_��Mp�XT�|��','Afar','Eritrea',NULL,'2020-04-04 21:03:14.187',NULL),('�ۘP�3J����k���','�/p�L���M�4�8','Afar','Eritrea',NULL,'2020-04-04 21:03:14.187',NULL),('��y�K���}��','/�_��Mp�XT�|��','Spanish','Uruguay',NULL,'2020-04-04 21:03:14.194',NULL),('��y�K���}��','�/p�L���M�4�8','Spanisch','Uruguay',NULL,'2020-04-04 21:03:14.194',NULL),('�k}�DF�s����J','/�_��Mp�XT�|��','Kpelle','Liberia',NULL,'2020-04-04 21:03:14.197',NULL),('�k}�DF�s����J','�/p�L���M�4�8','Kpelle-Sprache','Liberia',NULL,'2020-04-04 21:03:14.197',NULL),('��Y��\"M��#�v�e{�','/�_��Mp�XT�|��','Spanish','Honduras',NULL,'2020-04-04 21:03:14.193',NULL),('��Y��\"M��#�v�e{�','�/p�L���M�4�8','Spanisch','Honduras',NULL,'2020-04-04 21:03:14.193',NULL),('�3�wO��~׮���','/�_��Mp�XT�|��','English','South Africa',NULL,'2020-04-04 21:03:14.192',NULL),('�3�wO��~׮���','�/p�L���M�4�8','Englisch','Südafrika',NULL,'2020-04-04 21:03:14.192',NULL),('��I��Lt�[x�BO�\'','/�_��Mp�XT�|��','Arabic','Tunisia',NULL,'2020-04-04 21:03:14.189',NULL),('��I��Lt�[x�BO�\'','�/p�L���M�4�8','Arabisch','Tunesien',NULL,'2020-04-04 21:03:14.189',NULL),('��ˈ�O�������?K','/�_��Mp�XT�|��','Afrikaans','Namibia',NULL,'2020-04-04 21:03:14.187',NULL),('��ˈ�O�������?K','�/p�L���M�4�8','Afrikaans','Namibia',NULL,'2020-04-04 21:03:14.187',NULL),('����vFn��g�^չ','/�_��Mp�XT�|��','Nyanja','Malawi',NULL,'2020-04-04 21:03:14.200',NULL),('����vFn��g�^չ','�/p�L���M�4�8','Nyanja-Sprache','Malawi',NULL,'2020-04-04 21:03:14.200',NULL),('�X��h�It��ϻ9���','/�_��Mp�XT�|��','Kannada','India',NULL,'2020-04-04 21:03:14.197',NULL),('�X��h�It��ϻ9���','�/p�L���M�4�8','Kannada','Indien',NULL,'2020-04-04 21:03:14.197',NULL),('�aI<-!NB�,(��\n�','/�_��Mp�XT�|��','Dutch','Netherlands',NULL,'2020-04-04 21:03:14.199',NULL),('�aI<-!NB�,(��\n�','�/p�L���M�4�8','Niederländisch','Niederlande',NULL,'2020-04-04 21:03:14.199',NULL),('��#�C����2��&','/�_��Mp�XT�|��','Hungarian','Hungary',NULL,'2020-04-04 21:03:14.196',NULL),('��#�C����2��&','�/p�L���M�4�8','Ungarisch','Ungarn',NULL,'2020-04-04 21:03:14.196',NULL),('�j$ڟ�Fؒ�\0�I�','/�_��Mp�XT�|��','Belarusian','Belarus',NULL,'2020-04-04 21:03:14.189',NULL),('�j$ڟ�Fؒ�\0�I�','�/p�L���M�4�8','Weißrussisch','Belarus',NULL,'2020-04-04 21:03:14.189',NULL),('��&[��G�I���.','/�_��Mp�XT�|��','Tyap','Nigeria',NULL,'2020-04-04 21:03:14.197',NULL),('��&[��G�I���.','�/p�L���M�4�8','Tyap','Nigeria',NULL,'2020-04-04 21:03:14.197',NULL),('ƌu��K�����y','/�_��Mp�XT�|��','Tswana Language','South Africa',NULL,'2020-04-04 21:03:14.203',NULL),('ƌu��K�����y','�/p�L���M�4�8','Tswana-Sprache','Südafrika',NULL,'2020-04-04 21:03:14.203',NULL),('�\n��SKC�Oѫ��>','/�_��Mp�XT�|��','Bhutanese','Bhutan',NULL,'2020-04-04 21:03:14.190',NULL),('�\n��SKC�Oѫ��>','�/p�L���M�4�8','Bhutanisch','Bhutan',NULL,'2020-04-04 21:03:14.190',NULL),('����D��!�d��C','/�_��Mp�XT�|��','Romanian','Republic of Moldova',NULL,'2020-04-04 21:03:14.200',NULL),('����D��!�d��C','�/p�L���M�4�8','Rumänisch','Republik Moldau',NULL,'2020-04-04 21:03:14.200',NULL),('�\0YN�K��T{���H�','/�_��Mp�XT�|��','Russian','Russian Federation',NULL,'2020-04-04 21:03:14.200',NULL),('�\0YN�K��T{���H�','�/p�L���M�4�8','Russisch','Russische Föderation',NULL,'2020-04-04 21:03:14.200',NULL),('��*�(A��s�9։^','/�_��Mp�XT�|��','Chinese','Singapur',NULL,'2020-04-04 21:03:14.205',NULL),('��*�(A��s�9։^','�/p�L���M�4�8','Chinesisch','Singapur',NULL,'2020-04-04 21:03:14.205',NULL),('��R�qEޏf�,l��','/�_��Mp�XT�|��','Northen Samian','Finland',NULL,'2020-04-04 21:03:14.201',NULL),('��R�qEޏf�,l��','�/p�L���M�4�8','Nord-Samisch','Finnland',NULL,'2020-04-04 21:03:14.201',NULL),('����|oDu�eYN�P�2','/�_��Mp�XT�|��','English','Pakistan',NULL,'2020-04-04 21:03:14.192',NULL),('����|oDu�eYN�P�2','�/p�L���M�4�8','Englisch','Pakistan',NULL,'2020-04-04 21:03:14.192',NULL),('�#�G]&Ml�e�3��W','/�_��Mp�XT�|��','Arabic','Egypt',NULL,'2020-04-04 21:03:14.188',NULL),('�#�G]&Ml�e�3��W','�/p�L���M�4�8','Arabisch','Ägypten',NULL,'2020-04-04 21:03:14.188',NULL),('Ѣ>z$JC���p�?w�','/�_��Mp�XT�|��','French','Luxembourg',NULL,'2020-04-04 21:03:14.194',NULL),('Ѣ>z$JC���p�?w�','�/p�L���M�4�8','Französisch','Luxemburg',NULL,'2020-04-04 21:03:14.195',NULL),('Ҍ�dP5B��g��1�','/�_��Mp�XT�|��','Geez','Eritrea',NULL,'2020-04-04 21:03:14.195',NULL),('Ҍ�dP5B��g��1�','�/p�L���M�4�8','Geez','Eritrea',NULL,'2020-04-04 21:03:14.195',NULL),('�Bl�\Z C*�&4�ȩ�$','/�_��Mp�XT�|��','Konkani','India',NULL,'2020-04-04 21:03:14.197',NULL),('�Bl�\Z C*�&4�ȩ�$','�/p�L���M�4�8','Konkani','Indien',NULL,'2020-04-04 21:03:14.197',NULL),('ԯ�ogJ��v�ia�D�','/�_��Mp�XT�|��','Spanish','Ecuador',NULL,'2020-04-04 21:03:14.193',NULL),('ԯ�ogJ��v�ia�D�','�/p�L���M�4�8','Spanisch','Ecuador',NULL,'2020-04-04 21:03:14.193',NULL),('��x>�@����!!.]','/�_��Mp�XT�|��','Spanish','United States',NULL,'2020-04-04 21:03:14.194',NULL),('��x>�@����!!.]','�/p�L���M�4�8','Spanisch','Vereinigte Staaten',NULL,'2020-04-04 21:03:14.194',NULL),('֠�\0:EO��T�����','/�_��Mp�XT�|��','Igbo','Nigeria',NULL,'2020-04-04 21:03:14.196',NULL),('֠�\0:EO��T�����','�/p�L���M�4�8','Igbo-Sprache','Nigeria',NULL,'2020-04-04 21:03:14.196',NULL),('ְ`�\rH���uf��','/�_��Mp�XT�|��','Yoruba','Nigeria',NULL,'2020-04-04 21:03:14.204',NULL),('ְ`�\rH���uf��','�/p�L���M�4�8','Yoruba','Nigeria',NULL,'2020-04-04 21:03:14.204',NULL),('�.c<AyAʚ@�Z\n��u','/�_��Mp�XT�|��','Somali','Kenya',NULL,'2020-04-04 21:03:14.201',NULL),('�.c<AyAʚ@�Z\n��u','�/p�L���M�4�8','Somali','Kenia',NULL,'2020-04-04 21:03:14.201',NULL),('�E��4@\Z���v+7U�','/�_��Mp�XT�|��','Greek','Cyprus',NULL,'2020-04-04 21:03:14.190',NULL),('�E��4@\Z���v+7U�','�/p�L���M�4�8','Griechisch','Zypern',NULL,'2020-04-04 21:03:14.190',NULL),('����O\0��d؋�','/�_��Mp�XT�|��','Maldivian','Maldive Islands',NULL,'2020-04-04 21:03:14.190',NULL),('����O\0��d؋�','�/p�L���M�4�8','Maledivisch','Malediven',NULL,'2020-04-04 21:03:14.190',NULL),('�[�}L\rAd�N1L��','/�_��Mp�XT�|��','Gujarati','India',NULL,'2020-04-04 21:03:14.195',NULL),('�[�}L\rAd�N1L��','�/p�L���M�4�8','Gujarati','Indien',NULL,'2020-04-04 21:03:14.195',NULL),('�e�~M��8\r���e�','/�_��Mp�XT�|��','Spanish','El Salvador',NULL,'2020-04-04 21:03:14.193',NULL),('�e�~M��8\r���e�','�/p�L���M�4�8','Spanisch','El Salvador',NULL,'2020-04-04 21:03:14.193',NULL),('��k<�]EE�G����+�','/�_��Mp�XT�|��','English','Canada',NULL,'2020-04-04 21:03:14.191',NULL),('��k<�]EE�G����+�','�/p�L���M�4�8','Englisch','Kanada',NULL,'2020-04-04 21:03:14.191',NULL),('�&��JJ��EE.S�\nt','/�_��Mp�XT�|��','English','Philippines',NULL,'2020-04-04 21:03:14.192',NULL),('�&��JJ��EE.S�\nt','�/p�L���M�4�8','Englisch','Philippinen',NULL,'2020-04-04 21:03:14.192',NULL),('�f��-�JT��ǿ�歉','/�_��Mp�XT�|��','Basque','Spain',NULL,'2020-04-04 21:03:14.194',NULL),('�f��-�JT��ǿ�歉','�/p�L���M�4�8','Baskisch','Spanien',NULL,'2020-04-04 21:03:14.194',NULL),('�m뽓ZBk�_f�7�|','/�_��Mp�XT�|��','Bengali','India',NULL,'2020-04-04 21:03:14.189',NULL),('�m뽓ZBk�_f�7�|','�/p�L���M�4�8','Bengalisch','Indien',NULL,'2020-04-04 21:03:14.189',NULL),('����)zFA�Zt3e�','/�_��Mp�XT�|��','Kurdish','Syria',NULL,'2020-04-04 21:03:14.198',NULL),('����)zFA�Zt3e�','�/p�L���M�4�8','Kurdisch','Syrien',NULL,'2020-04-04 21:03:14.198',NULL),('�W���pD���+m���','/�_��Mp�XT�|��','Tibetan','India',NULL,'2020-04-04 21:03:14.189',NULL),('�W���pD���+m���','�/p�L���M�4�8','Tibetisch','Indien',NULL,'2020-04-04 21:03:14.189',NULL),('�]v�\0�@�����\0ܚ=','/�_��Mp�XT�|��','Swazi','Swaziland',NULL,'2020-04-04 21:03:14.202',NULL),('�]v�\0�@�����\0ܚ=','�/p�L���M�4�8','Swazi','Swasiland',NULL,'2020-04-04 21:03:14.202',NULL),('����¸B4����e}�\'','/�_��Mp�XT�|��','Hausa','Niger',NULL,'2020-04-04 21:03:14.195',NULL),('����¸B4����e}�\'','�/p�L���M�4�8','Hausa','Niger',NULL,'2020-04-04 21:03:14.195',NULL),('�)�i��M������c�6','/�_��Mp�XT�|��','Danish','Denmark',NULL,'2020-04-04 21:03:14.190',NULL),('�)�i��M������c�6','�/p�L���M�4�8','Dänisch','Dänemark',NULL,'2020-04-04 21:03:14.190',NULL),('�_���BV�^�r�UU�','/�_��Mp�XT�|��','Sichuan Yi','China',NULL,'2020-04-04 21:03:14.196',NULL),('�_���BV�^�r�UU�','�/p�L���M�4�8','Sichuan Yi','China',NULL,'2020-04-04 21:03:14.196',NULL),('�(�|p�M9�Uw�K��','/�_��Mp�XT�|��','Spanish','Dominican Republic',NULL,'2020-04-04 21:03:14.193',NULL),('�(�|p�M9�Uw�K��','�/p�L���M�4�8','Spanisch','Dominikanische Republik',NULL,'2020-04-04 21:03:14.193',NULL),('��Oy}B9��)^��I�','/�_��Mp�XT�|��','Turkish','Turkey',NULL,'2020-04-04 21:03:14.203',NULL),('��Oy}B9��)^��I�','�/p�L���M�4�8','Türkisch','Türkei',NULL,'2020-04-04 21:03:14.203',NULL),('��bMK���|$�}�\0','/�_��Mp�XT�|��','Cambodian','Cambodia',NULL,'2020-04-04 21:03:14.197',NULL),('��bMK���|$�}�\0','�/p�L���M�4�8','Kambodschanisch','Kambodscha',NULL,'2020-04-04 21:03:14.197',NULL),('����OF��t�uYH','/�_��Mp�XT�|��','Xhosa','South Africa',NULL,'2020-04-04 21:03:14.204',NULL),('����OF��t�uYH','�/p�L���M�4�8','Xhosa','Südafrika',NULL,'2020-04-04 21:03:14.204',NULL),('�nL]dD�K���.r�','/�_��Mp�XT�|��','Telugu','India',NULL,'2020-04-04 21:03:14.203',NULL),('�nL]dD�K���.r�','�/p�L���M�4�8','Telugu','Indien',NULL,'2020-04-04 21:03:14.203',NULL),('�r�r|E��-9�tg:','/�_��Mp�XT�|��','Macedonian','Macedonia',NULL,'2020-04-04 21:03:14.198',NULL),('�r�r|E��-9�tg:','�/p�L���M�4�8','Mazedonisch','Mazedonien',NULL,'2020-04-04 21:03:14.198',NULL),('��B0�AG骓�\'6��','/�_��Mp�XT�|��','French','France',NULL,'2020-04-04 21:03:14.194',NULL),('��B0�AG骓�\'6��','�/p�L���M�4�8','Französisch','Frankreich',NULL,'2020-04-04 21:03:14.194',NULL),('�(��WjDʓ;[�(et','/�_��Mp�XT�|��','Marathi','India',NULL,'2020-04-04 21:03:14.199',NULL),('�(��WjDʓ;[�(et','�/p�L���M�4�8','Marathi','Indien',NULL,'2020-04-04 21:03:14.199',NULL),('�C�XcHB	�(��k5r','/�_��Mp�XT�|��','Swahili','Kenya',NULL,'2020-04-04 21:03:14.202',NULL),('�C�XcHB	�(��k5r','�/p�L���M�4�8','Suaheli','Kenia',NULL,'2020-04-04 21:03:14.202',NULL),('�KN�E��j���\\��','/�_��Mp�XT�|��','Estonian','Estonia',NULL,'2020-04-04 21:03:14.194',NULL),('�KN�E��j���\\��','�/p�L���M�4�8','Estnisch','Estland',NULL,'2020-04-04 21:03:14.194',NULL),('��\\�Aڇ�9B5:L','/�_��Mp�XT�|��','Tamil','India',NULL,'2020-04-04 21:03:14.203',NULL),('��\\�Aڇ�9B5:L','�/p�L���M�4�8','Tamilisch','Indien',NULL,'2020-04-04 21:03:14.203',NULL),('�Ue�V�J��=M&vA��','/�_��Mp�XT�|��','Jju','Nigeria',NULL,'2020-04-04 21:03:14.197',NULL),('�Ue�V�J��=M&vA��','�/p�L���M�4�8','Jju','Nigeria',NULL,'2020-04-04 21:03:14.197',NULL),('�y����O��ג�˙(�','/�_��Mp�XT�|��','French','Monaco',NULL,'2020-04-04 21:03:14.195',NULL),('�y����O��ג�˙(�','�/p�L���M�4�8','Französisch','Monaco',NULL,'2020-04-04 21:03:14.195',NULL),('�8Vl;A�h:��U�','/�_��Mp�XT�|��','Georgian','Georgia',NULL,'2020-04-04 21:03:14.197',NULL),('�8Vl;A�h:��U�','�/p�L���M�4�8','Georgisch','Georgien',NULL,'2020-04-04 21:03:14.197',NULL),('���V��B���\03p��','/�_��Mp�XT�|��','Tsonga','South Africa',NULL,'2020-04-04 21:03:14.203',NULL),('���V��B���\03p��','�/p�L���M�4�8','Tsonga','Südafrika',NULL,'2020-04-04 21:03:14.203',NULL),('�#%,��H��t��H�_','/�_��Mp�XT�|��','French','Switzerland',NULL,'2020-04-04 21:03:14.194',NULL),('�#%,��H��t��H�_','�/p�L���M�4�8','Französisch','Schweiz',NULL,'2020-04-04 21:03:14.194',NULL),('�޽�x;N��س-n\rk�','/�_��Mp�XT�|��','Pashto','Afghanistan',NULL,'2020-04-04 21:03:14.200',NULL),('�޽�x;N��س-n\rk�','�/p�L���M�4�8','Paschtu','Afghanistan',NULL,'2020-04-04 21:03:14.200',NULL),('�G�+iHr�� )l	','/�_��Mp�XT�|��','Swedish','Finland',NULL,'2020-04-04 21:03:14.202',NULL),('�G�+iHr�� )l	','�/p�L���M�4�8','Schwedisch','Finnland',NULL,'2020-04-04 21:03:14.202',NULL),('�q��B��Fe����','/�_��Mp�XT�|��','Czech','Czech Republic',NULL,'2020-04-04 21:03:14.190',NULL),('�q��B��Fe����','�/p�L���M�4�8','Tschechisch','Tschechische Republik',NULL,'2020-04-04 21:03:14.190',NULL),('�o��`Ft��K{�g�','/�_��Mp�XT�|��','Bengali','Bangladesh',NULL,'2020-04-04 21:03:14.189',NULL),('�o��`Ft��K{�g�','�/p�L���M�4�8','Bengalisch','Bangladesch',NULL,'2020-04-04 21:03:14.189',NULL),('����H\n����\"�W','/�_��Mp�XT�|��','English','Guam',NULL,'2020-04-04 21:03:14.191',NULL),('����H\n����\"�W','�/p�L���M�4�8','Englisch','Guam',NULL,'2020-04-04 21:03:14.191',NULL),('��#��pJN��	;���','/�_��Mp�XT�|��','Rwandan','Rwanda',NULL,'2020-04-04 21:03:14.201',NULL),('��#��pJN��	;���','�/p�L���M�4�8','Ruandisch','Ruanda',NULL,'2020-04-04 21:03:14.201',NULL),('��J���F���?��Wg','/�_��Mp�XT�|��','Armenian','Armenia',NULL,'2020-04-04 21:03:14.196',NULL),('��J���F���?��Wg','�/p�L���M�4�8','Armenisch','Armenien',NULL,'2020-04-04 21:03:14.196',NULL),('�l0�o�F/�B�v��','/�_��Mp�XT�|��','Sidamo','Ethiopia',NULL,'2020-04-04 21:03:14.201',NULL),('�l0�o�F/�B�v��','�/p�L���M�4�8','Sidamo','Äthiopien',NULL,'2020-04-04 21:03:14.201',NULL),('�ͩ^��H��`��V�ް','/�_��Mp�XT�|��','Chinese','China',NULL,'2020-04-04 21:03:14.204',NULL),('�ͩ^��H��`��V�ް','�/p�L���M�4�8','Chinesisch','China',NULL,'2020-04-04 21:03:14.204',NULL),('��b�/C��)�%�','/�_��Mp�XT�|��','Mongol','Mongolia',NULL,'2020-04-04 21:03:14.198',NULL),('��b�/C��)�%�','�/p�L���M�4�8','Mongolisch','Mongolei',NULL,'2020-04-04 21:03:14.198',NULL),('��\\<�@I񏠨;��W�','/�_��Mp�XT�|��','Azerbaijani','Azerbaijan',NULL,'2020-04-04 21:03:14.189',NULL),('��\\<�@I񏠨;��W�','�/p�L���M�4�8','Aserbaidschanisch','Aserbaidschan',NULL,'2020-04-04 21:03:14.189',NULL),('����SN)����ʯ�r','/�_��Mp�XT�|��','Arabic','Oman',NULL,'2020-04-04 21:03:14.188',NULL),('����SN)����ʯ�r','�/p�L���M�4�8','Arabisch','Oman',NULL,'2020-04-04 21:03:14.188',NULL),('���呚G��U�Al���','/�_��Mp�XT�|��','Norwegian Bokmål','Norway',NULL,'2020-04-04 21:03:14.199',NULL),('���呚G��U�Al���','�/p�L���M�4�8','Norwegisch Bokmål','Norwegen',NULL,'2020-04-04 21:03:14.199',NULL),('�ߥ�C\"�R����','/�_��Mp�XT�|��','Northen Samian','Norway',NULL,'2020-04-04 21:03:14.201',NULL),('�ߥ�C\"�R����','�/p�L���M�4�8','Nord-Samisch','Norwegen',NULL,'2020-04-04 21:03:14.201',NULL),('����W�M�ۜ�jk','/�_��Mp�XT�|��','Uighur','China',NULL,'2020-04-04 21:03:14.203',NULL),('����W�M�ۜ�jk','�/p�L���M�4�8','Uigurisch','China',NULL,'2020-04-04 21:03:14.203',NULL),('�S��rL�}�b+�^�','/�_��Mp�XT�|��','Italian','Italy',NULL,'2020-04-04 21:03:14.196',NULL),('�S��rL�}�b+�^�','�/p�L���M�4�8','Italienisch','Italien',NULL,'2020-04-04 21:03:14.196',NULL),('��\r��C{�$��~3)�','/�_��Mp�XT�|��','Hindi','India',NULL,'2020-04-04 21:03:14.196',NULL),('��\r��C{�$��~3)�','�/p�L���M�4�8','Hindi','Indien',NULL,'2020-04-04 21:03:14.196',NULL),('��ANS��Lq�B','/�_��Mp�XT�|��','Japanese','Japan',NULL,'2020-04-04 21:03:14.196',NULL),('��ANS��Lq�B','�/p�L���M�4�8','Japanisch','Japan',NULL,'2020-04-04 21:03:14.196',NULL),('��q��PM���Ru���','/�_��Mp�XT�|��','Vietnamese','Vietnam',NULL,'2020-04-04 21:03:14.204',NULL),('��q��PM���Ru���','�/p�L���M�4�8','Vietnamesisch','Vietnam',NULL,'2020-04-04 21:03:14.204',NULL),('�>!�Bj��gO�}','/�_��Mp�XT�|��','Uzbek','Uzbekistan',NULL,'2020-04-04 21:03:14.204',NULL),('�>!�Bj��gO�}','�/p�L���M�4�8','Usbekisch','Usbekistan',NULL,'2020-04-04 21:03:14.204',NULL),('�x�ũsN!�\"��kk','/�_��Mp�XT�|��','Chinese','Taiwan',NULL,'2020-04-04 21:03:14.205',NULL),('�x�ũsN!�\"��kk','�/p�L���M�4�8','Chinesisch','Taiwan',NULL,'2020-04-04 21:03:14.205',NULL);
/*!40000 ALTER TABLE `locale_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_entry`
--

DROP TABLE IF EXISTS `log_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_entry` (
  `id` binary(16) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  CONSTRAINT `json.log_entry.context` CHECK (json_valid(`context`)),
  CONSTRAINT `json.log_entry.extra` CHECK (json_valid(`extra`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_entry`
--

LOCK TABLES `log_entry` WRITE;
/*!40000 ALTER TABLE `log_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_header_footer`
--

DROP TABLE IF EXISTS `mail_header_footer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_header_footer` (
  `id` binary(16) NOT NULL,
  `system_default` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_header_footer`
--

LOCK TABLES `mail_header_footer` WRITE;
/*!40000 ALTER TABLE `mail_header_footer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_header_footer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_header_footer_translation`
--

DROP TABLE IF EXISTS `mail_header_footer_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_header_footer_translation` (
  `mail_header_footer_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_html` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_plain` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_html` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_plain` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`mail_header_footer_id`,`language_id`),
  KEY `fk.mail_header_footer_translation.language_id` (`language_id`),
  CONSTRAINT `fk.mail_header_footer_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.mail_header_footer_translation.mail_header_footer_id` FOREIGN KEY (`mail_header_footer_id`) REFERENCES `mail_header_footer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_header_footer_translation`
--

LOCK TABLES `mail_header_footer_translation` WRITE;
/*!40000 ALTER TABLE `mail_header_footer_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_header_footer_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_template`
--

DROP TABLE IF EXISTS `mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_template` (
  `id` binary(16) NOT NULL,
  `mail_template_type_id` binary(16) DEFAULT NULL,
  `system_default` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.mail_template.mail_template_type_id` (`mail_template_type_id`),
  CONSTRAINT `fk.mail_template.mail_template_type_id` FOREIGN KEY (`mail_template_type_id`) REFERENCES `mail_template_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_template`
--

LOCK TABLES `mail_template` WRITE;
/*!40000 ALTER TABLE `mail_template` DISABLE KEYS */;
INSERT INTO `mail_template` VALUES ('�L�%Oڿ�\"dy�','�?\nVFkJL���Bs�',1,'2020-04-04 21:03:19.497',NULL),('��\"Mۨ�_�,G�p','�\"ԻRK��+<2�',1,'2020-04-04 21:03:19.528',NULL),('\r��GT�Nِ���A#�','X�!�NA����1�\Z`�',1,'2020-04-04 21:03:19.534',NULL),('1>���E�����Rj��','�Y\n�X�C2�x4.���C',1,'2020-04-04 21:03:19.570',NULL),('%P�/:M����K橪','�ς��\ZKǻо^sz',1,'2020-04-04 21:03:19.576',NULL),(',OK��AX���l�k�;','�f��E7����D�t',1,'2020-04-04 21:03:19.558',NULL),('-F��H��8��Ƞ9�','��ByfH��h9ډ��',1,'2020-04-04 21:03:14.421',NULL),('0r{��E����nx��','�x�S<�F+��J%3]4�',1,'2020-04-04 21:03:19.625',NULL),('>��Ev�J3���}-��G','?CL�ѼJ���>�aѣ',1,'2020-04-04 21:03:19.545',NULL),('\\��h�NM3�����t','/�ņ�+J�-�(װ�',1,'2020-04-04 21:03:19.588',NULL),('d��&�I{����6�','/�t���I��7�=�j�\\',1,'2020-04-04 21:03:19.959',NULL),('���͍�@�����K	','�i73H�� �\Z[\"T',1,'2020-04-04 21:03:14.423',NULL),('��R���C���`\Z���','�7�l�BQ��p4>��',1,'2020-04-04 21:03:19.552',NULL),('�J\\zրFِM��<�4','���(	h@��7��V��',1,'2020-04-04 21:03:18.791',NULL),('�>T�D\"�{>p��L7','9O��nB���i+��',1,'2020-04-04 21:03:14.430',NULL),('�;/���I��&þ�2M�','������M^��=�B�AL',1,'2020-04-04 21:03:16.027',NULL),('��0�{L왽�Un-FF','Wb��<�Ji�䪴�~]\n',1,'2020-04-04 21:03:19.612',NULL),('�#ȴO+����O#','W$UM�C��	d!}��',1,'2020-04-04 21:03:14.423',NULL),('���Q��Ik�\"����L�','�292JM��w��`P',1,'2020-04-04 21:03:19.516',NULL),('¨���A���~P)�z','8�1>��NG���r��',1,'2020-04-04 21:03:19.564',NULL),('�ኞ08Il�����e��','��\0�N���\"~�f�',1,'2020-04-04 21:03:14.415',NULL),('�*��#IT�b>���','�u��hyC�����',1,'2020-04-04 21:03:14.414',NULL),('�tAT�(DŃyE��kb','�?w�KN7�kָVr�',1,'2020-04-04 21:03:17.869',NULL),('ڕ���_I>�dMo�V�$','�{�ЖS@���f�$��',1,'2020-04-04 21:03:20.176',NULL),('ۇ�N�GO����:!�s$','��!��G���jN��M',1,'2020-04-04 21:03:19.595',NULL),('�\ZsE��5f�5I)','UA�ڿ�F>����?5�',1,'2020-04-04 21:03:19.509',NULL),('쥑ÃkGA�:K����','ֹ���O˞�%���9�',1,'2020-04-04 21:03:14.437',NULL),('�cvFɅ�W&�R�o','��+�D+���M�M�',1,'2020-04-04 21:03:19.600',NULL);
/*!40000 ALTER TABLE `mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_template_media`
--

DROP TABLE IF EXISTS `mail_template_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_template_media` (
  `id` binary(16) NOT NULL,
  `mail_template_id` binary(16) NOT NULL,
  `language_id` binary(16) DEFAULT NULL,
  `media_id` binary(16) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk.mail_template_media.mail_template_id` (`mail_template_id`),
  KEY `fk.mail_template_media.media_id` (`media_id`),
  KEY `fk.mail_template_media.language_id` (`language_id`),
  CONSTRAINT `fk.mail_template_media.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.mail_template_media.mail_template_id` FOREIGN KEY (`mail_template_id`) REFERENCES `mail_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.mail_template_media.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_template_media`
--

LOCK TABLES `mail_template_media` WRITE;
/*!40000 ALTER TABLE `mail_template_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_template_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_template_sales_channel`
--

DROP TABLE IF EXISTS `mail_template_sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_template_sales_channel` (
  `id` binary(16) NOT NULL,
  `mail_template_id` binary(16) NOT NULL,
  `mail_template_type_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  UNIQUE KEY `uniq.mail_template_id__sales_channel_id` (`mail_template_id`,`sales_channel_id`),
  KEY `fk.mail_template_sales_channel.mail_template_type_id` (`mail_template_type_id`),
  KEY `fk.mail_template_sales_channel.sales_channel_id` (`sales_channel_id`),
  CONSTRAINT `fk.mail_template_sales_channel.mail_template_id` FOREIGN KEY (`mail_template_id`) REFERENCES `mail_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.mail_template_sales_channel.mail_template_type_id` FOREIGN KEY (`mail_template_type_id`) REFERENCES `mail_template_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.mail_template_sales_channel.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_template_sales_channel`
--

LOCK TABLES `mail_template_sales_channel` WRITE;
/*!40000 ALTER TABLE `mail_template_sales_channel` DISABLE KEYS */;
INSERT INTO `mail_template_sales_channel` VALUES ('t^��RF������7��','�J\\zրFِM��<�4','���(	h@��7��V��','�C-�9�F$�2�k��M','2020-04-04 21:03:18.796',NULL);
/*!40000 ALTER TABLE `mail_template_sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_template_translation`
--

DROP TABLE IF EXISTS `mail_template_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_template_translation` (
  `mail_template_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_plain` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`mail_template_id`,`language_id`),
  KEY `fk.mail_template_translation.language_id` (`language_id`),
  CONSTRAINT `fk.mail_template_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.mail_template_translation.mail_template_id` FOREIGN KEY (`mail_template_id`) REFERENCES `mail_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.mail_template_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_template_translation`
--

LOCK TABLES `mail_template_translation` WRITE;
/*!40000 ALTER TABLE `mail_template_translation` DISABLE KEYS */;
INSERT INTO `mail_template_translation` VALUES ('�L�%Oڿ�\"dy�','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is partially delivered','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n               <br/>\n               <p>\n                   {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                   <br/>\n                   the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                   <strong>The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                   <br/>\n                   You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    However, in case you have purchased without a registration or a customer account, you do not have this option.\n               </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.498',NULL),('�L�%Oڿ�\"dy�','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellung bei {{ salesChannel.name }} wurde teilweise ausgeliefert','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Lieferstatys für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert.<br/>\n                    <strong>Die Bestellung hat jetzt den Bestellstatus: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>','\n            {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Bestellstatus: {{order.deliveries.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.500',NULL),('��\"Mۨ�_�,G�p','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is cancelled','Shopware Default Template','<div style=\"font-family:arial; font-size:12px;\">\n                    <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n                </div>','\n            {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n            the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n            The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.\n\n            You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n            However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.529',NULL),('��\"Mۨ�_�,G�p','�/p�L���M�4�8','{{ salesChannel.name }}','Stornierung der Bestellung bei {{ salesChannel.name }}','Shopware Basis Template','\n        <div style=\"font-family:arial; font-size:12px;\">\n           <br/>\n           <p>\n               {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n               <br/>\n               der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert.<br/>\n               <strong>Die Bestellung hat jetzt den Zahlungsstatus: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n               <br/>\n               Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n               </br>\n               Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n           </p>\n        </div>','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Zahlungsstatus: {{order.deliveries.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.530',NULL),('\r��GT�Nِ���A#�','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is delivered','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    However, in case you have purchased without a registration or a customer account, you do not have this option.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.535',NULL),('\r��GT�Nِ���A#�','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellung bei {{ salesChannel.name }} wurde ausgeliefert','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert.<br/>\n                    <strong>Die Bestellung hat jetzt den Bestellstatus: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Bestellstatus: {{order.deliveries.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.536',NULL),('1>���E�����Rj��','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is partially refunded','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.transactions.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.571',NULL),('1>���E�����Rj��','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellung bei {{ salesChannel.name }} wurde teilweise erstattet','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.572',NULL),('%P�/:M����K橪','/�_��Mp�XT�|��','{{ salesChannel.name }}','Reminder for your order with {{ salesChannel.name }}','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.transactions.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.577',NULL),('%P�/:M����K橪','�/p�L���M�4�8','{{ salesChannel.name }}','Zahlungserinnerung für die Bestellung bei {{ salesChannel.name }}','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.584',NULL),(',OK��AX���l�k�;','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is completed','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.559',NULL),(',OK��AX���l�k�;','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellung bei {{ salesChannel.name }} ist komplett abgeschlossen','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Bestellstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>Die Bestellung hat jetzt den Bestellstatus: {{order.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Bestellstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Bestellstatus: {{order.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.560',NULL),('-F��H��8��Ƞ9�','/�_��Mp�XT�|��','{{ salesChannel.name }}','Order confirmation','','\n            <div style=\"font-family:arial; font-size:12px;\">\n\n            {% set currencyIsoCode = order.currency.isoCode %}\n            {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br>\n            <br>\n            Thank you for your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}.<br>\n            <br>\n            <strong>Information on your order:</strong><br>\n            <br>\n\n            <table width=\"80%\" border=\"0\" style=\"font-family:Arial, Helvetica, sans-serif; font-size:12px;\">\n                <tr>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Pos.</strong></td>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Description</strong></td>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Quantities</strong></td>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Price</strong></td>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Total</strong></td>\n                </tr>\n\n                {% for lineItem in order.lineItems %}\n                <tr>\n                    <td style=\"border-bottom:1px solid #cccccc;\">{{ loop.index }} </td>\n                    <td style=\"border-bottom:1px solid #cccccc;\">\n                      {{ lineItem.label|u.wordwrap(80) }}<br>\n                      {% if lineItem.payload.productNumber is defined %}Art. No.: {{ lineItem.payload.productNumber|u.wordwrap(80) }}{% endif %}\n                    </td>\n                    <td style=\"border-bottom:1px solid #cccccc;\">{{ lineItem.quantity }}</td>\n                    <td style=\"border-bottom:1px solid #cccccc;\">{{ lineItem.unitPrice|currency(currencyIsoCode) }}</td>\n                    <td style=\"border-bottom:1px solid #cccccc;\">{{ lineItem.totalPrice|currency(currencyIsoCode) }}</td>\n                </tr>\n                {% endfor %}\n            </table>\n\n            {% set delivery = order.deliveries.first %}\n            <p>\n                <br>\n                <br>\n                Shipping costs: {{order.deliveries.first.shippingCosts.totalPrice|currency(currencyIsoCode) }}<br>\n\n                Net total: {{ order.amountNet|currency(currencyIsoCode) }}<br>\n                {% for calculatedTax in order.price.calculatedTaxes %}\n                    {% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>\n                {% endfor %}\n                <strong>Total gross: {{ order.amountTotal|currency(currencyIsoCode) }}</strong><br>\n\n                <br>\n\n                <strong>Selected payment type:</strong> {{ order.transactions.first.paymentMethod.name }}<br>\n                {{ order.transactions.first.paymentMethod.description }}<br>\n                <br>\n\n                <strong>Selected shipping type:</strong> {{ delivery.shippingMethod.name }}<br>\n                {{ delivery.shippingMethod.description }}<br>\n                <br>\n\n                {% set billingAddress = order.addresses.get(order.billingAddressId) %}\n                <strong>Billing address:</strong><br>\n                {{ billingAddress.company }}<br>\n                {{ billingAddress.firstName }} {{ billingAddress.lastName }}<br>\n                {{ billingAddress.street }} <br>\n                {{ billingAddress.zipcode }} {{ billingAddress.city }}<br>\n                {{ billingAddress.country.name }}<br>\n                <br>\n\n                <strong>Shipping address:</strong><br>\n                {{ delivery.shippingOrderAddress.company }}<br>\n                {{ delivery.shippingOrderAddress.firstName }} {{ delivery.shippingOrderAddress.lastName }}<br>\n                {{ delivery.shippingOrderAddress.street }} <br>\n                {{ delivery.shippingOrderAddress.zipcode}} {{ delivery.shippingOrderAddress.city }}<br>\n                {{ delivery.shippingOrderAddress.country.name }}<br>\n                <br>\n                {% if billingAddress.vatId %}\n                    Your VAT-ID: {{ billingAddress.vatId }}\n                    In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.<br>\n                {% endif %}\n                <br/>\n                You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                </br>\n                If you have any questions, do not hesitate to contact us.\n\n            </p>\n            <br>\n            </div>\n        ','\n        {% set currencyIsoCode = order.currency.isoCode %}\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        Thank you for your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}.\n\n        Information on your order:\n\n        Pos.   Art.No.			Description			Quantities			Price			Total\n        {% for lineItem in order.lineItems %}\n        {{ loop.index }}      {% if lineItem.payload.productNumber is defined %}{{ lineItem.payload.productNumber|u.wordwrap(80) }}{% endif %}				{{ lineItem.label|u.wordwrap(80) }}			{{ lineItem.quantity }}			{{ lineItem.unitPrice|currency(currencyIsoCode) }}			{{ lineItem.totalPrice|currency(currencyIsoCode) }}\n        {% endfor %}\n\n        {% set delivery = order.deliveries.first %}\n\n        Shipping costs: {{order.deliveries.first.shippingCosts.totalPrice|currency(currencyIsoCode) }}\n        Net total: {{ order.amountNet|currency(currencyIsoCode) }}\n            {% for calculatedTax in order.price.calculatedTaxes %}\n                   {% if order.taxStatus is same as(\'net\') %}plus{% else %}including{% endif %} {{ calculatedTax.taxRate }}% VAT. {{ calculatedTax.tax|currency(currencyIsoCode) }}\n            {% endfor %}\n        Total gross: {{ order.amountTotal|currency(currencyIsoCode) }}\n\n\n        Selected payment type: {{ order.transactions.first.paymentMethod.name }}\n        {{ order.transactions.first.paymentMethod.description }}\n\n        Selected shipping type: {{ delivery.shippingMethod.name }}\n        {{ delivery.shippingMethod.description }}\n\n        {% set billingAddress = order.addresses.get(order.billingAddressId) %}\n        Billing address:\n        {{ billingAddress.company }}\n        {{ billingAddress.firstName }} {{ billingAddress.lastName }}\n        {{ billingAddress.street }}\n        {{ billingAddress.zipcode }} {{ billingAddress.city }}\n        {{ billingAddress.country.name }}\n\n        Shipping address:\n        {{ delivery.shippingOrderAddress.company }}\n        {{ delivery.shippingOrderAddress.firstName }} {{ delivery.shippingOrderAddress.lastName }}\n        {{ delivery.shippingOrderAddress.street }}\n        {{ delivery.shippingOrderAddress.zipcode}} {{ delivery.shippingOrderAddress.city }}\n        {{ delivery.shippingOrderAddress.country.name }}\n\n        {% if billingAddress.vatId %}\n        Your VAT-ID: {{ billingAddress.vatId }}\n        In case of a successful order and if you are based in one of the EU countries, you will receive your goods exempt from turnover tax.\n        {% endif %}\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        If you have any questions, do not hesitate to contact us.\n\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:14.422',NULL),('-F��H��8��Ƞ9�','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellbestätigung','','\n            <div style=\"font-family:arial; font-size:12px;\">\n\n            {% set currencyIsoCode = order.currency.isoCode %}\n            Hallo {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br>\n            <br>\n            vielen Dank für Ihre Bestellung im {{ salesChannel.name }} (Nummer: {{order.orderNumber}}) am {{ order.orderDateTime|date }}.<br>\n            <br>\n            <strong>Informationen zu Ihrer Bestellung:</strong><br>\n            <br>\n\n            <table width=\"80%\" border=\"0\" style=\"font-family:Arial, Helvetica, sans-serif; font-size:12px;\">\n                <tr>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Pos.</strong></td>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Bezeichnung</strong></td>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Menge</strong></td>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Preis</strong></td>\n                    <td bgcolor=\"#F7F7F2\" style=\"border-bottom:1px solid #cccccc;\"><strong>Summe</strong></td>\n                </tr>\n\n                {% for lineItem in order.lineItems %}\n                <tr>\n                    <td style=\"border-bottom:1px solid #cccccc;\">{{ loop.index }} </td>\n                    <td style=\"border-bottom:1px solid #cccccc;\">\n                      {{ lineItem.label|u.wordwrap(80) }}<br>\n                      {% if lineItem.payload.productNumber is defined %}Artikel-Nr: {{ lineItem.payload.productNumber|u.wordwrap(80) }}{% endif %}\n                    </td>\n                    <td style=\"border-bottom:1px solid #cccccc;\">{{ lineItem.quantity }}</td>\n                    <td style=\"border-bottom:1px solid #cccccc;\">{{ lineItem.unitPrice|currency(currencyIsoCode) }}</td>\n                    <td style=\"border-bottom:1px solid #cccccc;\">{{ lineItem.totalPrice|currency(currencyIsoCode) }}</td>\n                </tr>\n                {% endfor %}\n            </table>\n\n            {% set delivery = order.deliveries.first %}\n            <p>\n                <br>\n                <br>\n                Versandkosten: {{order.deliveries.first.shippingCosts.totalPrice|currency(currencyIsoCode) }}<br>\n                Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}<br>\n                    {% for calculatedTax in order.price.calculatedTaxes %}\n                        {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}<br>\n                    {% endfor %}\n                <strong>Gesamtkosten Brutto: {{ order.amountTotal|currency(currencyIsoCode) }}</strong><br>\n                <br>\n\n                <strong>Gewählte Zahlungsart:</strong> {{ order.transactions.first.paymentMethod.name }}<br>\n                {{ order.transactions.first.paymentMethod.description }}<br>\n                <br>\n\n                <strong>Gewählte Versandart:</strong> {{ delivery.shippingMethod.name }}<br>\n                {{ delivery.shippingMethod.description }}<br>\n                <br>\n\n                {% set billingAddress = order.addresses.get(order.billingAddressId) %}\n                <strong>Rechnungsadresse:</strong><br>\n                {{ billingAddress.company }}<br>\n                {{ billingAddress.firstName }} {{ billingAddress.lastName }}<br>\n                {{ billingAddress.street }} <br>\n                {{ billingAddress.zipcode }} {{ billingAddress.city }}<br>\n                {{ billingAddress.country.name }}<br>\n                <br>\n\n                <strong>Lieferadresse:</strong><br>\n                {{ delivery.shippingOrderAddress.company }}<br>\n                {{ delivery.shippingOrderAddress.firstName }} {{ delivery.shippingOrderAddress.lastName }}<br>\n                {{ delivery.shippingOrderAddress.street }} <br>\n                {{ delivery.shippingOrderAddress.zipcode}} {{ delivery.shippingOrderAddress.city }}<br>\n                {{ delivery.shippingOrderAddress.country.name }}<br>\n                <br>\n                {% if billingAddress.vatId %}\n                    Ihre Umsatzsteuer-ID: {{ billingAddress.vatId }}\n                    Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland\n                    bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit. <br>\n                {% endif %}\n                <br/>\n                Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                </br>\n                Für Rückfragen stehen wir Ihnen jederzeit gerne zur Verfügung.\n\n            </p>\n            <br>\n            </div>\n        ','\n        {% set currencyIsoCode = order.currency.isoCode %}\n        Hallo {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        vielen Dank für Ihre Bestellung im {{ salesChannel.name }} (Nummer: {{order.orderNumber}}) am {{ order.orderDateTime|date }}.\n\n        Informationen zu Ihrer Bestellung:\n\n        Pos.   Artikel-Nr.			Beschreibung			Menge			Preis			Summe\n        {% for lineItem in order.lineItems %}\n        {{ loop.index }}     {% if lineItem.payload.productNumber is defined %}{{ lineItem.payload.productNumber|u.wordwrap(80) }}{% endif %}				{{ lineItem.label|u.wordwrap(80) }}			{{ lineItem.quantity }}			{{ lineItem.unitPrice|currency(currencyIsoCode) }}			{{ lineItem.totalPrice|currency(currencyIsoCode) }}\n        {% endfor %}\n\n        {% set delivery = order.deliveries.first %}\n\n        Versandkosten: {{order.deliveries.first.shippingCosts.totalPrice|currency(currencyIsoCode) }}\n        Gesamtkosten Netto: {{ order.amountNet|currency(currencyIsoCode) }}\n            {% for calculatedTax in order.price.calculatedTaxes %}\n                {% if order.taxStatus is same as(\'net\') %}zzgl.{% else %}inkl.{% endif %} {{ calculatedTax.taxRate }}% MwSt. {{ calculatedTax.tax|currency(currencyIsoCode) }}\n            {% endfor %}\n        Gesamtkosten Brutto: {{ order.amountTotal|currency(currencyIsoCode) }}\n\n\n        Gewählte Zahlungsart: {{ order.transactions.first.paymentMethod.name }}\n        {{ order.transactions.first.paymentMethod.description }}\n\n        Gewählte Versandart: {{ delivery.shippingMethod.name }}\n        {{ delivery.shippingMethod.description }}\n\n        {% set billingAddress = order.addresses.get(order.billingAddressId) %}\n        Rechnungsadresse:\n        {{ billingAddress.company }}\n        {{ billingAddress.firstName }} {{ billingAddress.lastName }}\n        {{ billingAddress.street }}\n        {{ billingAddress.zipcode }} {{ billingAddress.city }}\n        {{ billingAddress.country.name }}\n\n        Lieferadresse:\n        {{ delivery.shippingOrderAddress.company }}\n        {{ delivery.shippingOrderAddress.firstName }} {{ delivery.shippingOrderAddress.lastName }}\n        {{ delivery.shippingOrderAddress.street }}\n        {{ delivery.shippingOrderAddress.zipcode}} {{ delivery.shippingOrderAddress.city }}\n        {{ delivery.shippingOrderAddress.country.name }}\n\n        {% if billingAddress.vatId %}\n        Ihre Umsatzsteuer-ID: {{ billingAddress.vatId }}\n        Bei erfolgreicher Prüfung und sofern Sie aus dem EU-Ausland\n        bestellen, erhalten Sie Ihre Ware umsatzsteuerbefreit.\n        {% endif %}\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Für Rückfragen stehen wir Ihnen jederzeit gerne zur Verfügung.',NULL,'2020-04-04 21:03:14.422',NULL),('0r{��E����nx��','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is partially paid','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.transactions.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.626',NULL),('0r{��E����nx��','�/p�L���M�4�8','{{ salesChannel.name }}','Deine Bestellung bei {{ salesChannel.name }} wurde teilweise bezahlt','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.628',NULL),('>��Ev�J3���}-��G','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is open','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.546',NULL),('>��Ev�J3���}-��G','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellung bei {{ salesChannel.name }} ist offen','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Bestellstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>Die Bestellung hat jetzt den Bestellstatus: {{order.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Bestellstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Bestellstatus: {{order.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.548',NULL),('\\��h�NM3�����t','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }}','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.transactions.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.589',NULL),('\\��h�NM3�����t','�/p�L���M�4�8','{{ salesChannel.name }}','Deine Bestellung bei {{ salesChannel.name }}','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.591',NULL),('d��&�I{����6�','/�_��Mp�XT�|��','{{ salesChannel.name }}','Please confirm your registration at {{ salesChannel.name }}','Registration confirmation','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <p>\n                    Hello {{ customer.salutation.displayName }} {{ customer.lastName }},<br/>\n                    <br/>\n                    thank you for your registration at {{ salesChannel.name }}.<br/>\n                    Please confirm the registration via the following link:<br/>\n                    <br/>\n                    <a href=\"{{ confirmUrl }}\">Completing registration</a><br/>\n                    <br/>\n                    By this confirmation, you also agree that we may send you further emails as part of the fulfillment of the contract.\n                </p>\n            </div>\n        ','\n            Hello {{ customer.salutation.displayName }} {{ customer.lastName }},\n            \n            thank you for your registration at {{ salesChannel.name }}.\n            Please confirm the registration via the following link:\n            \n            {{ confirmUrl }}\n            \n            By this confirmation, you also agree that we may send you further emails as part of the fulfillment of the contract.\n        ',NULL,'2020-04-04 21:03:19.961',NULL),('d��&�I{����6�','�/p�L���M�4�8','{{ salesChannel.name }}','Bitte bestätigen Sie Ihre Anmeldung bei {{ salesChannel.name }}','Anmeldebestätigung','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <p>\n                    Hallo {{ customer.salutation.displayName }} {{ customer.lastName }},<br/>\n                    <br/>\n                    vielen Dank für Ihre Anmeldung bei {{ salesChannel.name }}.<br/>\n                    Bitte bestätigen Sie die Registrierung über den nachfolgenden Link:<br/>\n                    <br/>\n                    <a href=\"{{ confirmUrl }}\">Anmeldung abschließen</a><br/>\n                    <br/>\n                    Durch diese Bestätigung erklären Sie sich ebenso damit einverstanden, dass wir Ihnen im Rahmen der Vertragserfüllung weitere E-Mails senden dürfen.\n                </p>\n            </div>\n        ','\n            Hallo {{ customer.salutation.displayName }} {{ customer.lastName }},\n            \n            vielen Dank für Ihre Anmeldung bei {{ salesChannel.name }}.\n            Bitte bestätigen Sie die Registrierung über den nachfolgenden Link:\n            \n            {{ confirmUrl }}\n            \n            Durch diese Bestätigung erklären Sie sich ebenso damit einverstanden, dass wir Ihnen im Rahmen der Vertragserfüllung weitere E-Mails senden dürfen.\n        ',NULL,'2020-04-04 21:03:19.962',NULL),('���͍�@�����K	','/�_��Mp�XT�|��','{{ salesChannel.name }}','Password reset - {{ salesChannel.name }}','Password reset request','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        {{ customer.salutation.letterName }} {{ customer.firstName }} {{ customer.lastName }},<br/>\n        <br/>\n        there has been a request to reset you Password in the Shop {{ salesChannel.name }}\n        Please confirm the link below to specify a new password.<br/>\n        <br/>\n        <a href=\"{{ urlResetPassword }}\">Reset passwort</a><br/>\n        <br/>\n        This link is valid for the next 2 hours. After that you have to request a new confirmation link.<br/>\n        If you do not want to reset your password, please ignore this email. No changes will be made.\n    </p>\n</div>','\n        {{ customer.salutation.letterName }} {{customer.firstName}} {{ customer.lastName }},\n\n        there has been a request to reset you Password in the Shop {{ salesChannel.name }}\n        Please confirm the link below to specify a new password.\n\n        Reset password: {{ urlResetPassword }}\n\n        This link is valid for the next 2 hours. After that you have to request a new confirmation link.\n        If you do not want to reset your password, please ignore this email. No changes will be made.\n    ',NULL,'2020-04-04 21:03:14.423',NULL),('���͍�@�����K	','�/p�L���M�4�8','{{ salesChannel.name }}','Password zurücksetzen - {{ salesChannel.name }}','Passwort zurücksetzen Anfrage','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Hallo {{ customer.salutation.letterName }} {{customer.firstName}} {{ customer.lastName }},<br/>\n        <br/>\n        im Shop {{ salesChannel.name }} wurde eine Anfrage gestellt, um Ihr Passwort zurück zu setzen.\n        Bitte bestätigen Sie den unten stehenden Link, um ein neues Passwort zu definieren.<br/>\n        <br/>\n        <a href=\"{{ urlResetPassword }}\">Passwort zurücksetzen</a><br/>\n        <br/>\n        Dieser Link ist nur für die nächsten 2 Stunden gültig. Danach muss das Zurücksetzen des Passwortes erneut beantragt werden.\n        Falls Sie Ihr Passwort nicht zurücksetzen möchten, ignorieren Sie diese E-Mail - es wird dann keine Änderung vorgenommen.\n    </p>\n</div>','\n        Hallo {{ customer.salutation.letterName }} {{customer.firstName}} {{ customer.lastName }},\n    \n        im Shop {{ salesChannel.name }} wurde eine Anfrage gestellt, um Ihr Passwort zurück zu setzen.\n        Bitte bestätigen Sie den unten stehenden Link, um ein neues Passwort zu definieren.\n\n        Passwort zurücksetzen: {{ urlResetPassword }}\n\n        Dieser Link ist nur für die nächsten 2 Stunden gültig. Danach muss das Zurücksetzen des Passwortes erneut beantragt werden.\n        Falls Sie Ihr Passwort nicht zurücksetzen möchten, ignorieren Sie diese E-Mail - es wird dann keine Änderung vorgenommen.\n',NULL,'2020-04-04 21:03:14.424',NULL),('��R���C���`\Z���','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is in process','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.553',NULL),('��R���C���`\Z���','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellung bei {{ salesChannel.name }} ist in Bearbeitung','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Bestellstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>Die Bestellung hat jetzt den Bestellstatus: {{order.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Bestellstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Bestellstatus: {{order.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.554',NULL),('�J\\zրFِM��<�4','/�_��Mp�XT�|��','{{ shopName }}','Password recovery','','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Hello {{ customerRecovery.customer.firstName }} {{ customerRecovery.customer.lastName }},<br/>\n        <br/>\n        You have requested a new password for your {{ shopName }} account.\n        Click on the following link to reset your password:<br/>\n        <br/>\n        <a href=\"{{ resetUrl }}\">{{ resetUrl }}</a><br/>\n        <br/>\n        This link is valid for the next 2 hours.\n        If you don\'t want to reset your password, ignore this email and no changes will be made.<br/>\n        <br/>\n        Yours sincerely\n        Your {{ shopName }} team\n    </p>\n</div>','        Hello {{ customerRecovery.customer.firstName }} {{ customerRecovery.customer.lastName }},\n        \n        You have requested a new password for your {{ shopName }} account.\n        Click on the following link to reset your password:\n        \n        {{ resetUrl }}\n        \n        This link is valid for the next 2 hours.\n        If you don\'t want to reset your password, ignore this email and no changes will be made.\n        \n        Yours sincerely\n        Your {{ shopName }}-Team',NULL,'2020-04-04 21:03:18.794',NULL),('�J\\zրFِM��<�4','�/p�L���M�4�8','{{ shopName }}','Password Wiederherstellung','','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Hallo {{ customerRecovery.customer.firstName }} {{ customerRecovery.customer.lastName }},<br/>\n        <br/>\n        Sie haben ein neues Passwort für Ihren {{ shopName }}-Account angefordert.\n        Klicken Sie auf folgenden Link, um Ihr Passwort zurückzusetzen:<br/>\n        <br/>\n        <a href=\"{{ resetUrl }}\">{{ resetUrl }}</a><br/>\n        <br/>\n        Dieser Link ist für die nächsten 2 Stunden gültig.\n        Falls Sie Ihr Passwort nicht zurücksetzen möchten, ignorieren Sie diese E-Mail - es wird dann keine Änderung vorgenommen.<br/>\n        <br/>\n        Mit freundlichen Grüßen\n        Ihr {{ shopName }}-Team\n    </p>\n</div>','        Hallo {{ customerRecovery.customer.firstName }} {{ customerRecovery.customer.lastName }},\n        \n        Sie haben ein neues Passwort für Ihren {{ shopName }}-Account angefordert.\n        Klicken Sie auf folgenden Link, um Ihr Passwort zurückzusetzen:\n        \n        {{ resetUrl }}\n        \n        Dieser Link ist für die nächsten 2 Stunden gültig.\n        Falls Sie Ihr Passwort nicht zurücksetzen möchten, ignorieren Sie diese E-Mail - es wird dann keine Änderung vorgenommen.\n        \n        Mit freundlichen Grüßen\n        Ihr {{ shopName }}-Team',NULL,'2020-04-04 21:03:18.792',NULL),('�>T�D\"�{>p��L7','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your merchant account has been unlocked - {{ salesChannel.name }}','Customer Group Change accepted','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Hello,<br/>\n        <br/>\n        your merchant account at {{ salesChannel.name }} has been unlocked.<br/>\n        From now on, we will charge you the net purchase price.\n    </p>\n</div>','\n        Hello,\n\n        your merchant account at {{ salesChannel.name }} has been unlocked.\n        From now on, we will charge you the net purchase price.\n    ',NULL,'2020-04-04 21:03:14.430',NULL),('�>T�D\"�{>p��L7','�/p�L���M�4�8','{{ salesChannel.name }}','Ihr Händleraccount wurde freigeschaltet - {{ salesChannel.name }}','Kundengruppenwechsel freigeschaltet','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Hallo,<br/>\n        <br/>\n        ihr Händlerkonto bei {{ salesChannel.name }} wurde freigeschaltet.<br/>\n        Von nun an werden wir Ihnen den Netto-Preis berechnen.\n    </p>\n</div>','\n        Hallo,\n    \n        ihr Händlerkonto bei {{ salesChannel.name }} wurde freigeschaltet.\n        Von nun an werden wir Ihnen den Netto-Preis berechnen.\n    ',NULL,'2020-04-04 21:03:14.437',NULL),('�;/���I��&þ�2M�','/�_��Mp�XT�|��','Shopware Administration','Password recovery','','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Dear {{ userRecovery.user.firstName }} {{ userRecovery.user.lastName }},<br/>\n        <br/>\n        there has been a request to reset your password.\n        Please confirm the link below to specify a new password.<br/>\n        <br/>\n        <a href=\"{{ resetUrl }}\">Reset passwort</a><br/>\n        <br/>\n        This link is valid for the next 2 hours. After that you have to request a new confirmation link.<br/>\n        If you do not want to reset your password, please ignore this email. No changes will be made.\n    </p>\n</div>','        Dear {{ userRecovery.user.firstName }} {{ userRecovery.user.lastName }},\n\n        there has been a request to reset your password.\n        Please confirm the link below to specify a new password.\n\n        Reset password: {{ resetUrl }}\n\n        This link is valid for the next 2 hours. After that you have to request a new confirmation link.\n        If you do not want to reset your password, please ignore this email. No changes will be made.',NULL,'2020-04-04 21:03:16.030',NULL),('�;/���I��&þ�2M�','�/p�L���M�4�8','Shopware Administration','Password Wiederherstellung','','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Hallo {{ userRecovery.user.firstName }} {{ userRecovery.user.lastName }},<br/>\n        <br/>\n        es wurde eine Anfrage gestellt, um Ihr Passwort zurück zu setzen.\n        Bitte bestätigen Sie den unten stehenden Link, um ein neues Passwort zu definieren.<br/>\n        <br/>\n        <a href=\"{{ resetUrl }}\">Passwort zurücksetzen</a><br/>\n        <br/>\n        Dieser Link ist nur für die nächsten 2 Stunden gültig. Danach muss das Zurücksetzen des Passwortes erneut beantragt werden.\n        Falls Sie Ihr Passwort nicht zurücksetzen möchten, ignorieren Sie diese E-Mail - es wird dann keine Änderung vorgenommen.\n    </p>\n</div>','        Hallo {{ userRecovery.user.firstName }} {{ userRecovery.user.lastName }},\n    \n        es wurde eine Anfrage gestellt, um Ihr Passwort zurück zu setzen.\n        Bitte bestätigen Sie den unten stehenden Link, um ein neues Passwort zu definieren.\n\n        Passwort zurücksetzen: {{ resetUrl }}\n\n        Dieser Link ist nur für die nächsten 2 Stunden gültig. Danach muss das Zurücksetzen des Passwortes erneut beantragt werden.\n        Falls Sie Ihr Passwort nicht zurücksetzen möchten, ignorieren Sie diese E-Mail - es wird dann keine Änderung vorgenommen.',NULL,'2020-04-04 21:03:16.029',NULL),('��0�{L왽�Un-FF','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is refunded','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.transactions.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.613',NULL),('��0�{L왽�Un-FF','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellung bei {{ salesChannel.name }} wurde erstattet','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.615',NULL),('�#ȴO+����O#','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your Registration at {{ salesChannel.name }}','Registration confirmation','<div style=\"font-family:arial; font-size:12px;\">\n            <p>\n                {{ customer.salutation.letterName }} {{ customer.firstName }} {{ customer.lastName }},<br/>\n                <br/>\n                thank you for your registration with our Shop.<br/>\n                You will gain access via the email address <strong>{{ customer.email }}</strong> and the password you have chosen.<br/>\n                You can change your password anytime.\n            </p>\n        </div>','{{ customer.salutation.letterName }} {{customer.firstName}} {{ customer.lastName }},\n                \n                thank you for your registration with our Shop.\n                You will gain access via the email address {{ customer.email }} and the password you have chosen.\n                You can change your password anytime.        \n        ',NULL,'2020-04-04 21:03:14.423',NULL),('�#ȴO+����O#','�/p�L���M�4�8','{{ salesChannel.name }}','Deine Registrierung bei {{ salesChannel.name }}','Registrierungsbestätigung','<div style=\"font-family:arial; font-size:12px;\">\n            <p>\n                Hallo {{ customer.salutation.letterName }} {{customer.firstName}} {{ customer.lastName }},<br/>\n                <br/>\n                vielen Dank für Ihre Anmeldung in unserem Shop.<br/>\n                Sie erhalten Zugriff über Ihre E-Mail-Adresse <strong>{{ customer.email }}</strong> und dem von Ihnen gewählten Kennwort.<br/>\n                Sie können Ihr Kennwort jederzeit nachträglich ändern.\n            </p>\n        </div>','Hallo {{ customer.salutation.letterName }} {{customer.firstName}} {{ customer.lastName }},\n                \n                vielen Dank für Ihre Anmeldung in unserem Shop.\n                Sie erhalten Zugriff über Ihre E-Mail-Adresse {{ customer.email }} und dem von Ihnen gewählten Kennwort.\n                Sie können Ihr Kennwort jederzeit nachträglich ändern.\n',NULL,'2020-04-04 21:03:14.423',NULL),('���Q��Ik�\"����L�','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is returned','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                  <p>\n                      {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                      <br/>\n                      the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                      <strong>The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                      <br/>\n                      You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                      </br>\n                      However, in case you have purchased without a registration or a customer account, you do not have this option.\n                </p>\n            </div>\n        ','\n            {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n            the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n            The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.\n\n            You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n            However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.516',NULL),('���Q��Ik�\"����L�','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellung bei {{ salesChannel.name }} wurde retourniert','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert.<br/>\n                    <strong>Die Bestellung hat jetzt den Bestellstatus: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Bestellstatus: {{order.deliveries.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.524',NULL),('¨���A���~P)�z','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is cancelled','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n             <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>The new status is as follows: {{order.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    However, in case you have purchased without a registration or a customer account, you do not have this option.</p>\n            </div>\n        ','\n\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.565',NULL),('¨���A���~P)�z','�/p�L���M�4�8','{{ salesChannel.name }}','Stornierung der Bestellung bei {{ salesChannel.name }}','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert.<br/>\n                    <strong>Die Bestellung hat jetzt den Bestellstatus: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Bestellstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Bestellstatus: {{order.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.566',NULL),('�ኞ08Il�����e��','/�_��Mp�XT�|��','{{ salesChannel.name }}','Register','','<h3>Hello {{ newsletterRecipient.firstName }} {{ newsletterRecipient.lastName }}</h3>\n                <p>thank you very much for your registration.</p>\n                <p>You have successfully subscribed to our newsletter.</p>\n        ','Hello {{ newsletterRecipient.firstName }} {{ newsletterRecipient.lastName }}\n            \n                thank you very much for your registration.\n            \n                You have successfully subscribed to our newsletter.\n        ',NULL,'2020-04-04 21:03:14.415',NULL),('�ኞ08Il�����e��','�/p�L���M�4�8','{{ salesChannel.name }}','Register','','<h3>Hallo {{ newsletterRecipient.firstName }} {{ newsletterRecipient.lastName }}</h3>\n                <p>vielen Dank für Ihre Anmeldung.</p>\n                <p>Sie haben sich erfolgreich zu unserem Newsletter angemeldet.</p>\n        ','Hallo {{ newsletterRecipient.firstName }} {{ newsletterRecipient.lastName }}\n            \n                vielen Dank für Ihre Anmeldung.\n            \n                Sie haben sich erfolgreich zu unserem Newsletter angemeldet.\n        ',NULL,'2020-04-04 21:03:14.415',NULL),('�*��#IT�b>���','/�_��Mp�XT�|��','{{ salesChannel.name }}','Newsletter','','<h3>Hello {{ newsletterRecipient.firstName }} {{ newsletterRecipient.lastName }}</h3>\n                <p>Thank you for your interest in our newsletter!</p>\n                <p>In order to prevent misuse of your email address, we have sent you this confirmation email. Confirm that you wish to receive the newsletter regularly by clicking <a href=\"{{ url }}\">here</a>.</p>\n                <p>If you have not subscribed to the newsletter, please ignore this email.</p>\n        ','Hello {{ newsletterRecipient.firstName }} {{ newsletterRecipient.lastName }}\n        \n                Thank you for your interest in our newsletter!\n                \n                In order to prevent misuse of your email address, we have sent you this confirmation email. Confirm that you wish to receive the newsletter regularly by clicking on the link: {{ url }}\n                \n                If you have not subscribed to the newsletter, please ignore this email.\n        ',NULL,'2020-04-04 21:03:14.414',NULL),('�*��#IT�b>���','�/p�L���M�4�8','{{ salesChannel.name }}','Newsletter','','<h3>Hallo {{ newsletterRecipient.firstName }} {{ newsletterRecipient.lastName }}</h3>\n                <p>Schön, dass Sie sich für unseren Newsletter interessieren!</p>\n                <p>Um einem Missbrauch Ihrer E-Mail-Adresse vorzubeugen, haben wir Ihnen diese Bestätigungsmail gesendet. Bestätigen Sie, dass Sie den Newsletter regelmäßig erhalten wollen, indem Sie <a href=\"{{ url }}\">hier</a> klicken.</p>\n                <p>Sollten Sie den Newsletter nicht angefordert haben, ignorieren Sie diese E-Mail.</p>\n        ','Hallo {{ newsletterRecipient.firstName }} {{ newsletterRecipient.lastName }}\n        \n                Schön, dass Sie sich für unseren Newsletter interessieren! \n                \n                Um einem Missbrauch Ihrer E-Mail-Adresse vorzubeugen, haben wir Ihnen diese Bestätigungsmail gesendet. Bestätigen Sie, dass Sie den Newsletter regelmäßig erhalten wollen, indem Sie auf den folgenden Link klicken: {{ url }} \n                \n                Sollten Sie den Newsletter nicht angefordert haben, ignorieren Sie diese E-Mail.\n        ',NULL,'2020-04-04 21:03:14.415',NULL),('�tAT�(DŃyE��kb','/�_��Mp�XT�|��','{{ salesChannel.name }}','Contact form received - {{ salesChannel.name }}','Contact form received','<div style=\"font-family:arial; font-size:12px;\">\n            <p>\n                Following Message was sent to you by {{ contactFormData.firstName }} {{ contactFormData.lastName }} via the contact form.<br/>\n                <br/>\n                Contact email address: {{ contactFormData.email }}<br/>\n                Phone: {{ contactFormData.phone }}<br/><br/>\n                Subject: {{ contactFormData.subject }}<br/>\n                <br/>\n                Message: {{ contactFormData.comment }}<br/>\n            </p>\n        </div>','Following Message was sent to you by {{ contactFormData.firstName }} {{ contactFormData.lastName }} via the contact form.\n\n                Contact email address: {{ contactFormData.email }}\n                Phone: {{ contactFormData.phone }}\n                \n                Subject: {{ contactFormData.subject }}\n                \n                Message: {{ contactFormData.comment }}',NULL,'2020-04-04 21:03:17.870',NULL),('�tAT�(DŃyE��kb','�/p�L���M�4�8','{{ salesChannel.name }}','Kontaktanfrage erhalten - {{ salesChannel.name }}','Kontaktanfrage erhalten','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Folgende Nachricht wurde von {{ contactFormData.firstName }} {{ contactFormData.lastName }} an Sie via Kontakt-Formular gesendet.<br/>\n        <br/>\n        Kontakt E-Mail: {{ contactFormData.email }}<br/>\n        <br>\n        Telefonnummer: {{ contactFormData.phone }}<br/>\n        <br/>\n        Betreff: {{ contactFormData.subject }}<br/>\n        <br/>\n        Message: {{ contactFormData.comment }}<br/>\n    </p>\n</div>','Folgende Nachricht wurde von {{ contactFormData.firstName }} {{ contactFormData.lastName }} an Sie via Kontakt-Formular gesendet.\n\nKontakt E-Mail: {{ contactFormData.email }}\n\nTelefonnummer: {{ contactFormData.phone }}\n\nBetreff: {{ contactFormData.subject }}\n\nNachricht: {{ contactFormData.comment }}',NULL,'2020-04-04 21:03:23.000',NULL),('ڕ���_I>�dMo�V�$','/�_��Mp�XT�|��','{{ salesChannel.name }}','Please confirm your email address at {{ salesChannel.name }}','Email confirmation at guest orders','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <p>\n                    Hello {{ customer.salutation.displayName }} {{ customer.lastName }},<br/>\n                    <br/>\n                    Please confirm your email address via the following link:<br/>\n                    <br/>\n                    <a href=\"{{ confirmUrl }}\">Confirm email</a><br/>\n                    <br/>\n                    After the confirmation, you will be directed to the checkout, where you can check and complete your order again.<br/>\n                    By this confirmation, you also agree that we may send you further emails as part of the fulfillment of the contract.\n                </p>\n            </div>\n        ','\n            Hello {{ customer.salutation.displayName }} {{ customer.lastName }},\n            \n            Please confirm your email address via the following link:\n            \n            {{ confirmUrl }}\n            \n            After the confirmation, you will be directed to the checkout, where you can check and complete your order again.\n            By this confirmation, you also agree that we may send you further emails as part of the fulfillment of the contract.\n        ',NULL,'2020-04-04 21:03:20.178',NULL),('ڕ���_I>�dMo�V�$','�/p�L���M�4�8','{{ salesChannel.name }}','Bitte bestätigen Sie Ihre E-Mail-Adresse bei {{ salesChannel.name }}','Anmeldebestätigung bei Gastbestellungen','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <p>\n                    Hallo {{ customer.salutation.displayName }} {{ customer.lastName }},<br/>\n                    <br/>\n                    Bitte bestätigen Sie Ihre E-Mail-Adresse über den nachfolgenden Link:<br/>\n                    <br/>\n                    <a href=\"{{ confirmUrl }}\">E-Mail bestätigen</a><br/>\n                    <br/>\n                    Nach der Bestätigung werden Sie in den Bestellabschluss geleitet, dort können Sie Ihre Bestellung nochmals überprüfen und abschließen.<br/>\n                    Durch diese Bestätigung erklären Sie sich ebenso damit einverstanden, dass wir Ihnen im Rahmen der Vertragserfüllung weitere E-Mails senden dürfen.\n                </p>\n            </div>\n        ','\n            Hallo {{ customer.salutation.displayName }} {{ customer.lastName }},\n            \n            Bitte bestätigen Sie Ihre E-Mail-Adresse über den nachfolgenden Link:\n            \n            {{ confirmUrl }}\n            \n            Nach der Bestätigung werden Sie in den Bestellabschluss geleitet, dort können Sie Ihre Bestellung nochmals überprüfen und abschließen.\n            Durch diese Bestätigung erklären Sie sich ebenso damit einverstanden, dass wir Ihnen im Rahmen der Vertragserfüllung weitere E-Mails senden dürfen.\n        ',NULL,'2020-04-04 21:03:20.179',NULL),('ۇ�N�GO����:!�s$','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is completly paid','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.transactions.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.595',NULL),('ۇ�N�GO����:!�s$','�/p�L���M�4�8','{{ salesChannel.name }}','Deine Bestellung bei {{ salesChannel.name }} wurde komplett bezahlt','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Zahlungsstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Zahlungsstatus: {{order.transactions.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.597',NULL),('�\ZsE��5f�5I)','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your order with {{ salesChannel.name }} is partially returned','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                    <strong>The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    However, in case you have purchased without a registration or a customer account, you do not have this option.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.510',NULL),('�\ZsE��5f�5I)','�/p�L���M�4�8','{{ salesChannel.name }}','Bestellung bei {{ salesChannel.name }} wurde teilweise retourniert','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                    {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                    <br/>\n                    der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert.<br/>\n                    <strong>Die Bestellung hat jetzt den Bestellstatus: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                    <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Bestellstatus: {{order.deliveries.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.512',NULL),('쥑ÃkGA�:K����','/�_��Mp�XT�|��','{{ salesChannel.name }}','Your trader account has not been accepted - {{ salesChannel.name }}','Customer Group Change rejected','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Hello,<br/>\n		<br/>\n        thank you for your interest in our trade prices. \n        Unfortunately, we do not have a trading license yet so that we cannot accept you as a merchant.<br/>\n        In case of further questions please do not hesitate to contact us via telephone, fax or email.\n    </p>\n</div>','\n        Hello,\n\n        thank you for your interest in our trade prices. Unfortunately, \n        we do not have a trading license yet so that we cannot accept you as a merchant.\n        In case of further questions please do not hesitate to contact us via telephone, fax or email.\n    ',NULL,'2020-04-04 21:03:14.438',NULL),('쥑ÃkGA�:K����','�/p�L���M�4�8','{{ salesChannel.name }}','Ihr Händleraccountantrag wurde abgelehnt - {{ salesChannel.name }}','Kundengruppenwechsel abgelehnt','<div style=\"font-family:arial; font-size:12px;\">\n    <p>\n        Hallo,<br/>\n        <br/>\n        elen Dank für ihr Interesse an unseren Großhandelspreisen. Leider liegt uns bisher keine <br/>\n        Händlerauthentifizierung vor, und daher können wir Ihre Anfrage nicht bestätigen. <br/>\n        Bei weiteren Fragen kontaktieren Sie uns gerne per Telefon, Fax oder E-Mail. <br/>\n    </p>\n</div>','\n        Hallo,\n\n        vielen Dank für ihr Interesse an unseren Großhandelspreisen. Leider liegt uns bisher keine \n        Händlerauthentifizierung vor, und daher können wir Ihre Anfrage nicht bestätigen.\n        Bei weiteren Fragen kontaktieren Sie uns gerne per Telefon, Fax oder E-Mail.\n    ',NULL,'2020-04-04 21:03:14.439',NULL),('�cvFɅ�W&�R�o','/�_��Mp�XT�|��','{{ salesChannel.name }}','The payment for your order with {{ salesChannel.name }} is cancelled','Shopware Default Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                    <p>\n                        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                        <br/>\n                        the status of your delivery at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }} has changed.<br/>\n                        <strong>The new status is as follows: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                        <br/>\n                        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                        </br>\n                        However, in case you have purchased without a registration or a customer account, you do not have this option.\n                    </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        the status of your order at {{ salesChannel.name }} (Number: {{order.orderNumber}}) on {{ order.orderDateTime|date }}  has changed.\n        The new status is as follows: {{order.transactions.first.stateMachineState.name}}.\n\n        You can check the current status of your order on our website under \"My account\" - \"My orders\" anytime: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        However, in case you have purchased without a registration or a customer account, you do not have this option.',NULL,'2020-04-04 21:03:19.601',NULL),('�cvFɅ�W&�R�o','�/p�L���M�4�8','{{ salesChannel.name }}','Die Zahlung für ihre Bestellung bei {{ salesChannel.name }} wurde storniert','Shopware Basis Template','\n            <div style=\"font-family:arial; font-size:12px;\">\n                <br/>\n                <p>\n                   {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},<br/>\n                   <br/>\n                   der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert.<br/>\n                   <strong>Die Bestellung hat jetzt den Zahlungsstatus: {{order.deliveries.first.stateMachineState.name}}.</strong><br/>\n                   <br/>\n                    Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n                    </br>\n                    Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.\n                </p>\n            </div>\n        ','\n        {{order.orderCustomer.salutation.letterName }} {{order.orderCustomer.firstName}} {{order.orderCustomer.lastName}},\n\n        der Lieferstatus für Ihre Bestellung bei {{ salesChannel.name }} (Number: {{order.orderNumber}}) vom {{ order.orderDateTime|date }} hat sich geändert!\n        Die Bestellung hat jetzt den Zahlungsstatus: {{order.deliveries.first.stateMachineState.name}}.\n\n        Den aktuellen Status Ihrer Bestellung können Sie auch jederzeit auf unserer Webseite im  Bereich \"Mein Konto\" - \"Meine Bestellungen\" abrufen: {{ path(\'frontend.account.edit-order.page\', { \'orderId\': order.id}) }}\n        Sollten Sie allerdings den Kauf ohne Registrierung, also ohne Anlage eines Kundenkontos, gewählt haben, steht Ihnen diese Möglichkeit nicht zur Verfügung.',NULL,'2020-04-04 21:03:19.603',NULL);
/*!40000 ALTER TABLE `mail_template_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_template_type`
--

DROP TABLE IF EXISTS `mail_template_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_template_type` (
  `id` binary(16) NOT NULL,
  `technical_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_entities` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.mail_template_type.technical_name` (`technical_name`),
  CONSTRAINT `json.mail_template_type.available_entities` CHECK (json_valid(`available_entities`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_template_type`
--

LOCK TABLES `mail_template_type` WRITE;
/*!40000 ALTER TABLE `mail_template_type` DISABLE KEYS */;
INSERT INTO `mail_template_type` VALUES ('X�!�NA����1�\Z`�','order_delivery.state.shipped','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.410',NULL),('�i73H�� �\Z[\"T','password_change','{\"customer\":\"customer\",\"urlResetPassword\":null,\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.408',NULL),('�\"ԻRK��+<2�','order_delivery.state.cancelled','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.410',NULL),('/�t���I��7�=�j�\\','customer_register.double_opt_in','{\"customer\":\"customer\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:19.954',NULL),('/�ņ�+J�-�(װ�','order_transaction.state.open','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.413',NULL),('8�1>��NG���r��','order.state.cancelled','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.414',NULL),('9O��nB���i+��','customer_group_change_accept','{\"customer\":\"customer\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.408',NULL),('?CL�ѼJ���>�aѣ','order.state.open','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.413',NULL),('UA�ڿ�F>����?5�','order_delivery.state.returned_partially','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.409',NULL),('W$UM�C��	d!}��','customer_register','{\"customer\":\"customer\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.406',NULL),('Wb��<�Ji�䪴�~]\n','order_transaction.state.refunded','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.412',NULL),('�7�l�BQ��p4>��','order.state.in_progress','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.413',NULL),('��CI�C\r�C�F.�','product_stock_warning','{\"product\":\"product\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.409',NULL),('��ByfH��h9ډ��','order_confirmation_mail','{\"order\":\"order\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.407',NULL),('�?\nVFkJL���Bs�','order_delivery.state.shipped_partially','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.410',NULL),('������M^��=�B�AL','user.recovery.request','{\"userRecovery\":\"user_recovery\"}','2020-04-04 21:03:16.023',NULL),('�ς��\ZKǻо^sz','order_transaction.state.reminded','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.411',NULL),('��?��D��F{�PA','sepa_confirmation','{\"order\":\"order\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.409',NULL),('���(	h@��7��V��','customer.recovery.request','{\"customerRecovery\":\"customer_recovery\"}','2020-04-04 21:03:18.786',NULL),('��+�D+���M�M�','order_transaction.state.cancelled','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.411',NULL),('�292JM��w��`P','order_delivery.state.returned','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.410',NULL),('�{�ЖS@���f�$��','guest_order.double_opt_in','{\"customer\":\"customer\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:20.172',NULL),('�Y\n�X�C2�x4.���C','order_transaction.state.refunded_partially','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.411',NULL),('�?w�KN7�kָVr�','contact_form','{\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:16.758',NULL),('ֹ���O˞�%���9�','customer_group_change_reject','{\"customer\":\"customer\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.408',NULL),('��\0�N���\"~�f�','newsletterRegister','{\"newsletterRecipient\":\"newsletter_recipient\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.407',NULL),('�u��hyC�����','newsletterDoubleOptIn','{\"newsletterRecipient\":\"newsletter_recipient\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.406',NULL),('��!��G���jN��M','order_transaction.state.paid','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.412',NULL),('�f��E7����D�t','order.state.completed','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.414',NULL),('�x�S<�F+��J%3]4�','order_transaction.state.paid_partially','{\"order\":\"order\",\"previousState\":\"state_machine_state\",\"newState\":\"state_machine_state\",\"salesChannel\":\"sales_channel\"}','2020-04-04 21:03:14.412',NULL);
/*!40000 ALTER TABLE `mail_template_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_template_type_translation`
--

DROP TABLE IF EXISTS `mail_template_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_template_type_translation` (
  `mail_template_type_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`mail_template_type_id`,`language_id`),
  KEY `fk.mail_template_type_translation.language_id` (`language_id`),
  CONSTRAINT `fk.mail_template_type_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.mail_template_type_translation.mail_template_type_id` FOREIGN KEY (`mail_template_type_id`) REFERENCES `mail_template_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.mail_template_type_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_template_type_translation`
--

LOCK TABLES `mail_template_type_translation` WRITE;
/*!40000 ALTER TABLE `mail_template_type_translation` DISABLE KEYS */;
INSERT INTO `mail_template_type_translation` VALUES ('X�!�NA����1�\Z`�','/�_��Mp�XT�|��','Enter delivery state: Shipped',NULL,'2020-04-04 21:03:14.410',NULL),('X�!�NA����1�\Z`�','�/p�L���M�4�8','Eintritt Lieferstatus: Versandt',NULL,'2020-04-04 21:03:14.410',NULL),('�i73H�� �\Z[\"T','/�_��Mp�XT�|��','Password change request',NULL,'2020-04-04 21:03:14.408',NULL),('�i73H�� �\Z[\"T','�/p�L���M�4�8','Passwort Änderungsanfrage',NULL,'2020-04-04 21:03:14.408',NULL),('�\"ԻRK��+<2�','/�_��Mp�XT�|��','Enter delivery state: Cancelled',NULL,'2020-04-04 21:03:14.411',NULL),('�\"ԻRK��+<2�','�/p�L���M�4�8','Eintritt Lieferstatus: Abgebrochen',NULL,'2020-04-04 21:03:14.411',NULL),('/�t���I��7�=�j�\\','/�_��Mp�XT�|��','Double opt in registration',NULL,'2020-04-04 21:03:19.957',NULL),('/�t���I��7�=�j�\\','�/p�L���M�4�8','Double-Opt-In-Registrierung',NULL,'2020-04-04 21:03:19.958',NULL),('/�ņ�+J�-�(װ�','/�_��Mp�XT�|��','Enter payment state: Open',NULL,'2020-04-04 21:03:14.413',NULL),('/�ņ�+J�-�(װ�','�/p�L���M�4�8','Eintritt Zahlungsstatus: Offen',NULL,'2020-04-04 21:03:14.413',NULL),('8�1>��NG���r��','/�_��Mp�XT�|��','Enter order state: Cancelled',NULL,'2020-04-04 21:03:14.414',NULL),('8�1>��NG���r��','�/p�L���M�4�8','Eintritt Bestellstatus: Abgebrochen',NULL,'2020-04-04 21:03:14.414',NULL),('9O��nB���i+��','/�_��Mp�XT�|��','Customer group change accepted',NULL,'2020-04-04 21:03:14.408',NULL),('9O��nB���i+��','�/p�L���M�4�8','Kundengruppenwechsel akzeptiert',NULL,'2020-04-04 21:03:14.408',NULL),('?CL�ѼJ���>�aѣ','/�_��Mp�XT�|��','Enter order state: Open',NULL,'2020-04-04 21:03:14.413',NULL),('?CL�ѼJ���>�aѣ','�/p�L���M�4�8','Eintritt Bestellstatus: Offen',NULL,'2020-04-04 21:03:14.413',NULL),('UA�ڿ�F>����?5�','/�_��Mp�XT�|��','Enter delivery state: Open',NULL,'2020-04-04 21:03:14.409',NULL),('UA�ڿ�F>����?5�','�/p�L���M�4�8','Eintritt Lieferstatus: Offen',NULL,'2020-04-04 21:03:14.409',NULL),('W$UM�C��	d!}��','/�_��Mp�XT�|��','Customer registration',NULL,'2020-04-04 21:03:14.406',NULL),('W$UM�C��	d!}��','�/p�L���M�4�8','Kunden-Registrierung',NULL,'2020-04-04 21:03:14.406',NULL),('Wb��<�Ji�䪴�~]\n','/�_��Mp�XT�|��','Enter payment state: Refunded',NULL,'2020-04-04 21:03:14.412',NULL),('Wb��<�Ji�䪴�~]\n','�/p�L���M�4�8','Eintritt Zahlungsstatus: Erstattet',NULL,'2020-04-04 21:03:14.412',NULL),('�7�l�BQ��p4>��','/�_��Mp�XT�|��','Enter order state: In progress',NULL,'2020-04-04 21:03:14.413',NULL),('�7�l�BQ��p4>��','�/p�L���M�4�8','Eintritt Bestellstatus: In Bearbeitung',NULL,'2020-04-04 21:03:14.414',NULL),('��CI�C\r�C�F.�','/�_��Mp�XT�|��','Product stock warning',NULL,'2020-04-04 21:03:14.409',NULL),('��CI�C\r�C�F.�','�/p�L���M�4�8','Lagerbestandshinweis',NULL,'2020-04-04 21:03:14.409',NULL),('��ByfH��h9ډ��','/�_��Mp�XT�|��','Order confirmation',NULL,'2020-04-04 21:03:14.407',NULL),('��ByfH��h9ډ��','�/p�L���M�4�8','Bestellbestätigung',NULL,'2020-04-04 21:03:14.408',NULL),('�?\nVFkJL���Bs�','/�_��Mp�XT�|��','Enter delivery state: Shipped (partially)',NULL,'2020-04-04 21:03:14.410',NULL),('�?\nVFkJL���Bs�','�/p�L���M�4�8','Eintritt Lieferstatus: Teilweise versandt',NULL,'2020-04-04 21:03:14.410',NULL),('������M^��=�B�AL','/�_��Mp�XT�|��','User password recovery',NULL,'2020-04-04 21:03:16.025',NULL),('������M^��=�B�AL','�/p�L���M�4�8','Benutzer Passwort Wiederherstellung',NULL,'2020-04-04 21:03:16.026',NULL),('�ς��\ZKǻо^sz','/�_��Mp�XT�|��','Enter payment state: Reminded',NULL,'2020-04-04 21:03:14.411',NULL),('�ς��\ZKǻо^sz','�/p�L���M�4�8','Eintritt Zahlungsstatus: Erinnert',NULL,'2020-04-04 21:03:14.411',NULL),('��?��D��F{�PA','/�_��Mp�XT�|��','SEPA authorization',NULL,'2020-04-04 21:03:14.409',NULL),('��?��D��F{�PA','�/p�L���M�4�8','SEPA-Autorisierung',NULL,'2020-04-04 21:03:14.409',NULL),('���(	h@��7��V��','/�_��Mp�XT�|��','Customer password recovery',NULL,'2020-04-04 21:03:18.788',NULL),('���(	h@��7��V��','�/p�L���M�4�8','Benutzer Passwort Wiederherstellung',NULL,'2020-04-04 21:03:18.790',NULL),('��+�D+���M�M�','/�_��Mp�XT�|��','Enter payment state: Cancelled',NULL,'2020-04-04 21:03:14.412',NULL),('��+�D+���M�M�','�/p�L���M�4�8','Eintritt Zahlungsstatus: Abgebrochen',NULL,'2020-04-04 21:03:14.412',NULL),('�292JM��w��`P','/�_��Mp�XT�|��','Enter delivery state: Returned',NULL,'2020-04-04 21:03:14.410',NULL),('�292JM��w��`P','�/p�L���M�4�8','Eintritt Lieferstatus: Retour',NULL,'2020-04-04 21:03:14.410',NULL),('�{�ЖS@���f�$��','/�_��Mp�XT�|��','Double opt in guest order',NULL,'2020-04-04 21:03:20.174',NULL),('�{�ЖS@���f�$��','�/p�L���M�4�8','Double-Opt-In-Gast-Bestellung',NULL,'2020-04-04 21:03:20.175',NULL),('�Y\n�X�C2�x4.���C','/�_��Mp�XT�|��','Enter payment state: Refunded (partially)',NULL,'2020-04-04 21:03:14.411',NULL),('�Y\n�X�C2�x4.���C','�/p�L���M�4�8','Eintritt Zahlungsstatus: Teilweise erstattet',NULL,'2020-04-04 21:03:14.411',NULL),('�?w�KN7�kָVr�','/�_��Mp�XT�|��','Contact form',NULL,'2020-04-04 21:03:16.759',NULL),('�?w�KN7�kָVr�','�/p�L���M�4�8','Kontaktformular',NULL,'2020-04-04 21:03:16.761',NULL),('ֹ���O˞�%���9�','/�_��Mp�XT�|��','Customer group change rejected',NULL,'2020-04-04 21:03:14.408',NULL),('ֹ���O˞�%���9�','�/p�L���M�4�8','Kundengruppenwechsel abgelehnt',NULL,'2020-04-04 21:03:14.408',NULL),('��\0�N���\"~�f�','/�_��Mp�XT�|��','Newsletter registration',NULL,'2020-04-04 21:03:14.407',NULL),('��\0�N���\"~�f�','�/p�L���M�4�8','Newsletter-Registrierung',NULL,'2020-04-04 21:03:14.407',NULL),('�u��hyC�����','/�_��Mp�XT�|��','Newsletter double opt-in',NULL,'2020-04-04 21:03:14.407',NULL),('�u��hyC�����','�/p�L���M�4�8','Newsletter Double-Opt-In',NULL,'2020-04-04 21:03:14.407',NULL),('��!��G���jN��M','/�_��Mp�XT�|��','Enter payment state: Paid',NULL,'2020-04-04 21:03:14.412',NULL),('��!��G���jN��M','�/p�L���M�4�8','Eintritt Zahlungsstatus: Bezahlt',NULL,'2020-04-04 21:03:14.412',NULL),('�f��E7����D�t','/�_��Mp�XT�|��','Enter order state: Done',NULL,'2020-04-04 21:03:14.414',NULL),('�f��E7����D�t','�/p�L���M�4�8','Eintritt Bestellstatus: Abgeschlossen',NULL,'2020-04-04 21:03:14.414',NULL),('�x�S<�F+��J%3]4�','/�_��Mp�XT�|��','Enter payment state: Paid (partially)',NULL,'2020-04-04 21:03:14.412',NULL),('�x�S<�F+��J%3]4�','�/p�L���M�4�8','Eintritt Zahlungsstatus: Teilweise bezahlt',NULL,'2020-04-04 21:03:14.413',NULL);
/*!40000 ALTER TABLE `mail_template_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_category`
--

DROP TABLE IF EXISTS `main_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_category` (
  `id` binary(16) NOT NULL,
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `category_id` binary(16) NOT NULL,
  `category_version_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.main_category.sales_channel_product` (`product_id`,`product_version_id`,`sales_channel_id`),
  KEY `fk.main_category.sales_channel_id` (`sales_channel_id`),
  KEY `fk.main_category.category_id` (`category_id`,`category_version_id`),
  CONSTRAINT `fk.main_category.category_id` FOREIGN KEY (`category_id`, `category_version_id`) REFERENCES `category` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.main_category.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.main_category.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_category`
--

LOCK TABLES `main_category` WRITE;
/*!40000 ALTER TABLE `main_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` binary(16) NOT NULL,
  `user_id` binary(16) DEFAULT NULL,
  `media_folder_id` binary(16) DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_extension` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `file_name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` longblob DEFAULT NULL,
  `thumbnails_ro` longblob DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `uploaded_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.media.user_id` (`user_id`),
  KEY `fk.media.media_folder_id` (`media_folder_id`),
  CONSTRAINT `fk.media.media_folder_id` FOREIGN KEY (`media_folder_id`) REFERENCES `media_folder` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk.media.user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `json.media.meta_data` CHECK (json_valid(`meta_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES ('*�+�sG��\n�y\r�','+B��[Bl��5��|:�','��w��C\'����.','image/jpeg','jpg',21481,'{\"width\":600,\"height\":600,\"type\":2}','shirt_600x600','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"61d90db94bd04f559662f020372d5ec3\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:6:\"\0*\0url\";s:58:\"/thumbnail/f9/0d/df/1586034317/shirt_600x600_1920x1920.jpg\";s:10:\"\0*\0mediaId\";s:32:\"102ac62ba27347a688030a05c1790db7\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"61d90db94bd04f559662f020372d5ec3\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:18.427000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"61d90db94bd04f559662f020372d5ec3\";}s:32:\"8a54aad35fe14e1ea2f155e745c37453\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:6:\"\0*\0url\";s:56:\"/thumbnail/f9/0d/df/1586034317/shirt_600x600_800x800.jpg\";s:10:\"\0*\0mediaId\";s:32:\"102ac62ba27347a688030a05c1790db7\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"8a54aad35fe14e1ea2f155e745c37453\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:18.427000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"8a54aad35fe14e1ea2f155e745c37453\";}s:32:\"ac0ae80bbc204d8b9849d9250e9678d8\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:6:\"\0*\0url\";s:56:\"/thumbnail/f9/0d/df/1586034317/shirt_600x600_400x400.jpg\";s:10:\"\0*\0mediaId\";s:32:\"102ac62ba27347a688030a05c1790db7\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"ac0ae80bbc204d8b9849d9250e9678d8\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:18.426000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"ac0ae80bbc204d8b9849d9250e9678d8\";}}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-04 21:05:17.317','2020-04-04 21:05:17.185','2020-04-04 21:05:18.427'),('-�)��H��l�\\�s�','+B��[Bl��5��|:�','��w��C\'����.','image/jpeg','jpg',20132,'{\"width\":600,\"height\":600,\"type\":2}','handschuh_600x600','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"5d24ff9af165428c813ed1200829fca6\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:6:\"\0*\0url\";s:60:\"/thumbnail/4c/81/b7/1586034317/handschuh_600x600_400x400.jpg\";s:10:\"\0*\0mediaId\";s:32:\"2de02991cd0548a4ac6cc35cb11773a0\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"5d24ff9af165428c813ed1200829fca6\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:18.826000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"5d24ff9af165428c813ed1200829fca6\";}s:32:\"79fbcd55fee64db6be40afc24f142104\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:6:\"\0*\0url\";s:62:\"/thumbnail/4c/81/b7/1586034317/handschuh_600x600_1920x1920.jpg\";s:10:\"\0*\0mediaId\";s:32:\"2de02991cd0548a4ac6cc35cb11773a0\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"79fbcd55fee64db6be40afc24f142104\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:18.826000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"79fbcd55fee64db6be40afc24f142104\";}s:32:\"e2843a0a6eb74c1d8185cf88dd23ee81\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:6:\"\0*\0url\";s:60:\"/thumbnail/4c/81/b7/1586034317/handschuh_600x600_800x800.jpg\";s:10:\"\0*\0mediaId\";s:32:\"2de02991cd0548a4ac6cc35cb11773a0\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"e2843a0a6eb74c1d8185cf88dd23ee81\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:18.827000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"e2843a0a6eb74c1d8185cf88dd23ee81\";}}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-04 21:05:17.356','2020-04-04 21:05:17.210','2020-04-04 21:05:18.827'),(':fߺt�J*���\'�4!&',NULL,'�T��D ��3nrl#','image/png','png',4840,'{\"width\":237,\"height\":35,\"type\":3}','demostore-logo','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:1:{i:0;s:11:\"transparent\";}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-28 16:31:04.715','2020-04-28 16:31:04.673','2020-04-28 16:31:04.716'),('Xє�AT��x-�ܒ�','+B��[Bl��5��|:�','��w��C\'����.','image/jpeg','jpg',21518,'{\"width\":600,\"height\":600,\"type\":2}','hemd_600x600','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"60a38eec7273495b92810ef0a966e9f2\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:6:\"\0*\0url\";s:57:\"/thumbnail/2f/b0/e2/1586034317/hemd_600x600_1920x1920.jpg\";s:10:\"\0*\0mediaId\";s:32:\"5808d194947f415495d9782d8fdc92ae\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"60a38eec7273495b92810ef0a966e9f2\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:19.281000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"60a38eec7273495b92810ef0a966e9f2\";}s:32:\"9e6476b75a914615a59d97e03d00ff32\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:6:\"\0*\0url\";s:55:\"/thumbnail/2f/b0/e2/1586034317/hemd_600x600_400x400.jpg\";s:10:\"\0*\0mediaId\";s:32:\"5808d194947f415495d9782d8fdc92ae\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"9e6476b75a914615a59d97e03d00ff32\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:19.280000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"9e6476b75a914615a59d97e03d00ff32\";}s:32:\"e377ec931fe24b8cb12cea8ca203b003\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:6:\"\0*\0url\";s:55:\"/thumbnail/2f/b0/e2/1586034317/hemd_600x600_800x800.jpg\";s:10:\"\0*\0mediaId\";s:32:\"5808d194947f415495d9782d8fdc92ae\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"e377ec931fe24b8cb12cea8ca203b003\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:19.281000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"e377ec931fe24b8cb12cea8ca203b003\";}}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-04 21:05:17.382','2020-04-04 21:05:17.222','2020-04-04 21:05:19.281'),('ih�d��Dg��8�I��','+B��[Bl��5��|:�','��w��C\'����.','image/jpeg','jpg',13088,'{\"width\":600,\"height\":600,\"type\":2}','schokolade_600x600','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"3f1ad19fa8a24e7ca84b19fa747a81a6\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:6:\"\0*\0url\";s:61:\"/thumbnail/11/34/dd/1586034317/schokolade_600x600_800x800.jpg\";s:10:\"\0*\0mediaId\";s:32:\"6968ad64888844679918c638e449ffc5\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"3f1ad19fa8a24e7ca84b19fa747a81a6\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:19.656000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"3f1ad19fa8a24e7ca84b19fa747a81a6\";}s:32:\"5c4ae6609513476582e0c8d45d7b87b5\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:6:\"\0*\0url\";s:61:\"/thumbnail/11/34/dd/1586034317/schokolade_600x600_400x400.jpg\";s:10:\"\0*\0mediaId\";s:32:\"6968ad64888844679918c638e449ffc5\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"5c4ae6609513476582e0c8d45d7b87b5\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:19.655000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"5c4ae6609513476582e0c8d45d7b87b5\";}s:32:\"91c92a9e2bb84022958547e7b078bbfa\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:6:\"\0*\0url\";s:63:\"/thumbnail/11/34/dd/1586034317/schokolade_600x600_1920x1920.jpg\";s:10:\"\0*\0mediaId\";s:32:\"6968ad64888844679918c638e449ffc5\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"91c92a9e2bb84022958547e7b078bbfa\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:19.655000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"91c92a9e2bb84022958547e7b078bbfa\";}}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-04 21:05:17.412','2020-04-04 21:05:17.234','2020-04-04 21:05:19.656'),('l���?B����Rա�','+B��[Bl��5��|:�','��w��C\'����.','image/jpeg','jpg',20017,'{\"width\":600,\"height\":600,\"type\":2}','shirt_blue_600x600','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"109d3a5840334b45aecded03dfe73b3c\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:6:\"\0*\0url\";s:61:\"/thumbnail/1d/01/7b/1586034317/shirt_blue_600x600_800x800.jpg\";s:10:\"\0*\0mediaId\";s:32:\"6cbbdc03b43f4207be80b5f752d5a1c4\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"109d3a5840334b45aecded03dfe73b3c\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.017000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"109d3a5840334b45aecded03dfe73b3c\";}s:32:\"406ed87cf1d74e799854c00aa9664302\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:6:\"\0*\0url\";s:61:\"/thumbnail/1d/01/7b/1586034317/shirt_blue_600x600_400x400.jpg\";s:10:\"\0*\0mediaId\";s:32:\"6cbbdc03b43f4207be80b5f752d5a1c4\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"406ed87cf1d74e799854c00aa9664302\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.016000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"406ed87cf1d74e799854c00aa9664302\";}s:32:\"e56551de8c49469faa24a0235c3f2eb6\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:6:\"\0*\0url\";s:63:\"/thumbnail/1d/01/7b/1586034317/shirt_blue_600x600_1920x1920.jpg\";s:10:\"\0*\0mediaId\";s:32:\"6cbbdc03b43f4207be80b5f752d5a1c4\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"e56551de8c49469faa24a0235c3f2eb6\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.017000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"e56551de8c49469faa24a0235c3f2eb6\";}}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-04 21:05:17.441','2020-04-04 21:05:17.246','2020-04-04 21:05:21.017'),('p�R \\E	��Z[G	J*','+B��[Bl��5��|:�','��w��C\'����.','image/jpeg','jpg',11756,'{\"width\":600,\"height\":600,\"type\":2}','mobile_600x600','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"19254c1750ba4124af97ef0c8f55f321\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:6:\"\0*\0url\";s:59:\"/thumbnail/3a/ee/ba/1586034317/mobile_600x600_1920x1920.jpg\";s:10:\"\0*\0mediaId\";s:32:\"70e352200b5c45098dc65a5b47094a2a\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"19254c1750ba4124af97ef0c8f55f321\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.363000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"19254c1750ba4124af97ef0c8f55f321\";}s:32:\"7b1a97ab993649d892a2f794626ac71b\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:6:\"\0*\0url\";s:57:\"/thumbnail/3a/ee/ba/1586034317/mobile_600x600_400x400.jpg\";s:10:\"\0*\0mediaId\";s:32:\"70e352200b5c45098dc65a5b47094a2a\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"7b1a97ab993649d892a2f794626ac71b\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.363000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"7b1a97ab993649d892a2f794626ac71b\";}s:32:\"8c29e04dcc884901892ae24e694a3f5d\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:6:\"\0*\0url\";s:57:\"/thumbnail/3a/ee/ba/1586034317/mobile_600x600_800x800.jpg\";s:10:\"\0*\0mediaId\";s:32:\"70e352200b5c45098dc65a5b47094a2a\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"8c29e04dcc884901892ae24e694a3f5d\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.364000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"8c29e04dcc884901892ae24e694a3f5d\";}}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-04 21:05:17.466','2020-04-04 21:05:17.260','2020-04-04 21:05:21.364'),('zr��lC)�#��t��',NULL,'�T��D ��3nrl#','image/png','png',549,'{\"width\":32,\"height\":32,\"type\":3}','favicon','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:1:{i:0;s:11:\"transparent\";}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-28 16:31:04.730','2020-04-28 16:31:04.674','2020-04-28 16:31:04.731'),('�5jq#=K>�A}̈P�/','+B��[Bl��5��|:�','��w��C\'����.','image/jpeg','jpg',22648,'{\"width\":600,\"height\":600,\"type\":2}','waschmaschine_600x600','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"4e9203011305455681f541d854c1fbff\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:6:\"\0*\0url\";s:64:\"/thumbnail/63/80/61/1586034317/waschmaschine_600x600_400x400.jpg\";s:10:\"\0*\0mediaId\";s:32:\"84356a71233d4b3e9f417dcc8850c82f\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"4e9203011305455681f541d854c1fbff\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.682000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"4e9203011305455681f541d854c1fbff\";}s:32:\"f8b45fd7010045ac9800fcdbc9a0c6c8\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:6:\"\0*\0url\";s:66:\"/thumbnail/63/80/61/1586034317/waschmaschine_600x600_1920x1920.jpg\";s:10:\"\0*\0mediaId\";s:32:\"84356a71233d4b3e9f417dcc8850c82f\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"f8b45fd7010045ac9800fcdbc9a0c6c8\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.682000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"f8b45fd7010045ac9800fcdbc9a0c6c8\";}s:32:\"ff64ea36d92b46589647381e6d3d7d6f\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:6:\"\0*\0url\";s:64:\"/thumbnail/63/80/61/1586034317/waschmaschine_600x600_800x800.jpg\";s:10:\"\0*\0mediaId\";s:32:\"84356a71233d4b3e9f417dcc8850c82f\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"ff64ea36d92b46589647381e6d3d7d6f\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.682000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"ff64ea36d92b46589647381e6d3d7d6f\";}}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-04 21:05:17.508','2020-04-04 21:05:17.272','2020-04-04 21:05:21.683'),('��|թ�C=�a���K�',NULL,'�T��D ��3nrl#','image/jpeg','jpg',35472,'{\"width\":228,\"height\":138,\"type\":2}','defaultThemePreview','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-28 16:31:04.699','2020-04-28 16:31:04.672','2020-04-28 16:31:04.700'),('�K}���CP�˅�l�(','+B��[Bl��5��|:�','�\r\n�qI����','image/jpeg','jpg',178768,'{\"width\":1280,\"height\":528,\"type\":2}','hq_1280x1280','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"0253b5c0c138449086b63bce222dddf8\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:6:\"\0*\0url\";s:57:\"/thumbnail/a8/56/1c/1586034317/hq_1280x1280_1920x1920.jpg\";s:10:\"\0*\0mediaId\";s:32:\"de4b7dbe9d95435092cb85ce146ced28\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"0253b5c0c138449086b63bce222dddf8\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.875000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"0253b5c0c138449086b63bce222dddf8\";}s:32:\"2f4a39e3c06147f7847490cf1573b787\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:6:\"\0*\0url\";s:55:\"/thumbnail/a8/56/1c/1586034317/hq_1280x1280_800x800.jpg\";s:10:\"\0*\0mediaId\";s:32:\"de4b7dbe9d95435092cb85ce146ced28\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"2f4a39e3c06147f7847490cf1573b787\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.876000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"2f4a39e3c06147f7847490cf1573b787\";}s:32:\"fc4bf9c8025b43f99956f45ee3a3b553\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:6:\"\0*\0url\";s:55:\"/thumbnail/a8/56/1c/1586034317/hq_1280x1280_400x400.jpg\";s:10:\"\0*\0mediaId\";s:32:\"de4b7dbe9d95435092cb85ce146ced28\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"fc4bf9c8025b43f99956f45ee3a3b553\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:21.875000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"fc4bf9c8025b43f99956f45ee3a3b553\";}}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-04 21:05:17.533','2020-04-04 21:05:17.297','2020-04-04 21:05:21.876'),('����B�N����/�<','+B��[Bl��5��|:�','��w��C\'����.','image/jpeg','jpg',21914,'{\"width\":600,\"height\":600,\"type\":2}','shirt_red_600x600','O:47:\"Shopware\\Core\\Content\\Media\\MediaType\\ImageType\":3:{s:7:\"\0*\0name\";s:5:\"IMAGE\";s:8:\"\0*\0flags\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}','O:77:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"51507f5d95f5489ba3eef505a3e3e36c\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:6:\"\0*\0url\";s:60:\"/thumbnail/05/23/ee/1586034317/shirt_red_600x600_800x800.jpg\";s:10:\"\0*\0mediaId\";s:32:\"f69ab8ae42d04e17b2bab5ec2ff0a93c\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"51507f5d95f5489ba3eef505a3e3e36c\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:22.195000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"51507f5d95f5489ba3eef505a3e3e36c\";}s:32:\"a4504ea74ae84d9c91535feffdf42951\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:6:\"\0*\0url\";s:60:\"/thumbnail/05/23/ee/1586034317/shirt_red_600x600_400x400.jpg\";s:10:\"\0*\0mediaId\";s:32:\"f69ab8ae42d04e17b2bab5ec2ff0a93c\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"a4504ea74ae84d9c91535feffdf42951\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:22.195000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"a4504ea74ae84d9c91535feffdf42951\";}s:32:\"fca01babc0b4406b9df34cbf1d4d8af5\";O:73:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnail\\MediaThumbnailEntity\":14:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:6:\"\0*\0url\";s:62:\"/thumbnail/05/23/ee/1586034317/shirt_red_600x600_1920x1920.jpg\";s:10:\"\0*\0mediaId\";s:32:\"f69ab8ae42d04e17b2bab5ec2ff0a93c\";s:8:\"\0*\0media\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"fca01babc0b4406b9df34cbf1d4d8af5\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:05:22.195000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:15:\"media_thumbnail\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"fca01babc0b4406b9df34cbf1d4d8af5\";}}s:13:\"\0*\0extensions\";a:0:{}}',0,'2020-04-04 21:05:17.563','2020-04-04 21:05:17.284','2020-04-04 21:05:22.196');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_default_folder`
--

DROP TABLE IF EXISTS `media_default_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_default_folder` (
  `id` binary(16) NOT NULL,
  `association_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `entity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.media_default_folder.entity` (`entity`),
  CONSTRAINT `json.media_default_folder.custom_fields` CHECK (json_valid(`custom_fields`)),
  CONSTRAINT `json.media_default_folder.association_fields` CHECK (json_valid(`association_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_default_folder`
--

LOCK TABLES `media_default_folder` WRITE;
/*!40000 ALTER TABLE `media_default_folder` DISABLE KEYS */;
INSERT INTO `media_default_folder` VALUES ('7q���F;�K\Z�x�T','[\"documents\"]','document',NULL,'2020-04-04 21:03:14.400',NULL),('^ɜ��\"G*�C�K��-�','[\"avatarUser\"]','user',NULL,'2020-04-04 21:03:14.400',NULL),('wK7��B��b���[','[\"productManufacturers\"]','product_manufacturer',NULL,'2020-04-04 21:03:14.400',NULL),('�]�`�N&���(`�','[\"categories\"]','category',NULL,'2020-04-04 21:03:14.400',NULL),('����`&L���+V�\Z�','[]','cms_page',NULL,'2020-04-04 21:03:14.400',NULL),('��:���NZ�1�W┒U','[\"mailTemplateMedia\"]','mail_template',NULL,'2020-04-04 21:03:14.400',NULL),('�\\Ȧ�@*�<�h�2o�','[\"productMedia\"]','product',NULL,'2020-04-04 21:03:14.400',NULL),('�5��#pG��!e��\0�','[]','import_export_profile',NULL,'2020-04-28 16:30:57.889',NULL),('��;K<B�5\'$�-!�','[\"media\"]','theme',NULL,'2020-04-04 00:00:00.000',NULL);
/*!40000 ALTER TABLE `media_default_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folder`
--

DROP TABLE IF EXISTS `media_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_folder` (
  `id` binary(16) NOT NULL,
  `parent_id` binary(16) DEFAULT NULL,
  `default_folder_id` binary(16) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_count` int(11) unsigned NOT NULL DEFAULT 0,
  `media_folder_configuration_id` binary(16) DEFAULT NULL,
  `use_parent_configuration` tinyint(1) DEFAULT 1,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.media_folder.default_folder_id` (`default_folder_id`),
  KEY `fk.media_folder.parent_id` (`parent_id`),
  CONSTRAINT `fk.media_folder.default_folder_id` FOREIGN KEY (`default_folder_id`) REFERENCES `media_default_folder` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk.media_folder.parent_id` FOREIGN KEY (`parent_id`) REFERENCES `media_folder` (`id`) ON DELETE CASCADE,
  CONSTRAINT `json.media_folder.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folder`
--

LOCK TABLES `media_folder` WRITE;
/*!40000 ALTER TABLE `media_folder` DISABLE KEYS */;
INSERT INTO `media_folder` VALUES ('q���@��!�g',NULL,'�]�`�N&���(`�','Category Media',0,'Wګ�nF���m��',0,NULL,'2020-04-04 21:03:14.402',NULL),('�T��D ��3nrl#',NULL,'��;K<B�5\'$�-!�','Theme Media',0,'QX���Gأ_��xw',1,NULL,'2020-04-04 00:00:00.000',NULL),('�UQ.v�I��#�D7��',NULL,'�5��#pG��!e��\0�','Import Media',0,'$N��@������9O',1,NULL,'2020-04-28 16:30:57.900',NULL),('�H�UN�O�D����',NULL,'7q���F;�K\Z�x�T','Document Media',0,'>�hڀpD���3���',0,NULL,'2020-04-04 21:03:14.403',NULL),('��w��C\'����.',NULL,'�\\Ȧ�@*�<�h�2o�','Product Media',0,'�����J&�cm=B�3',0,NULL,'2020-04-04 21:03:14.403',NULL),('���:�YM%�-� ,�m',NULL,'��:���NZ�1�W┒U','Mail Template Media',0,'�K�XO���FL?��',0,NULL,'2020-04-04 21:03:14.403',NULL),('�\r\n�qI����',NULL,'����`&L���+V�\Z�','Cms Page Media',0,'�Bu]�A������\0�',0,NULL,'2020-04-04 21:03:14.402',NULL),('�+���K���T���t�',NULL,'^ɜ��\"G*�C�K��-�','User Media',0,'�o���Ex����q�',0,NULL,'2020-04-04 21:03:14.404',NULL),('�V�|�G}����f�H',NULL,'wK7��B��b���[','Product Manufacturer Media',0,'��%z@HG�K|)M��V',0,NULL,'2020-04-04 21:03:14.404',NULL);
/*!40000 ALTER TABLE `media_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folder_configuration`
--

DROP TABLE IF EXISTS `media_folder_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_folder_configuration` (
  `id` binary(16) NOT NULL,
  `create_thumbnails` tinyint(1) DEFAULT 1,
  `thumbnail_quality` int(11) DEFAULT 80,
  `media_thumbnail_sizes_ro` longblob DEFAULT NULL,
  `keep_aspect_ratio` tinyint(1) DEFAULT 1,
  `private` tinyint(1) DEFAULT 0,
  `no_association` tinyint(1) DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `json.media_folder_configuration.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folder_configuration`
--

LOCK TABLES `media_folder_configuration` WRITE;
/*!40000 ALTER TABLE `media_folder_configuration` DISABLE KEYS */;
INSERT INTO `media_folder_configuration` VALUES ('QX���Gأ_��xw',1,80,'O:85:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeCollection\":2:{s:11:\"\0*\0elements\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}',1,0,1,NULL,'2020-04-04 00:00:00.000',NULL),('�Bu]�A������\0�',1,80,'O:85:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"ac9d023367d84f89a5e4e92885b6859b\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"ac9d023367d84f89a5e4e92885b6859b\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.768000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"ac9d023367d84f89a5e4e92885b6859b\";}s:32:\"bbfd89c79b39483eafc90896f379bdca\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"bbfd89c79b39483eafc90896f379bdca\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.771000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"bbfd89c79b39483eafc90896f379bdca\";}s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.769000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";}}s:13:\"\0*\0extensions\";a:0:{}}',1,0,NULL,NULL,'2020-04-04 21:03:14.402',NULL),('�K�XO���FL?��',1,80,'O:85:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeCollection\":2:{s:11:\"\0*\0elements\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}',1,0,NULL,NULL,'2020-04-04 21:03:14.403',NULL),('$N��@������9O',1,80,'O:85:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"ac9d023367d84f89a5e4e92885b6859b\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"ac9d023367d84f89a5e4e92885b6859b\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.768000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"ac9d023367d84f89a5e4e92885b6859b\";}s:32:\"bbfd89c79b39483eafc90896f379bdca\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"bbfd89c79b39483eafc90896f379bdca\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.771000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"bbfd89c79b39483eafc90896f379bdca\";}s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.769000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";}}s:13:\"\0*\0extensions\";a:0:{}}',1,0,NULL,NULL,'2020-04-28 16:30:57.891',NULL),('>�hڀpD���3���',1,80,'O:85:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeCollection\":2:{s:11:\"\0*\0elements\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}',1,1,NULL,NULL,'2020-04-04 21:03:14.403',NULL),('Wګ�nF���m��',1,80,'O:85:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"ac9d023367d84f89a5e4e92885b6859b\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"ac9d023367d84f89a5e4e92885b6859b\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.768000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"ac9d023367d84f89a5e4e92885b6859b\";}s:32:\"bbfd89c79b39483eafc90896f379bdca\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"bbfd89c79b39483eafc90896f379bdca\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.771000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"bbfd89c79b39483eafc90896f379bdca\";}s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.769000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";}}s:13:\"\0*\0extensions\";a:0:{}}',1,0,NULL,NULL,'2020-04-04 21:03:14.401',NULL),('�o���Ex����q�',1,80,'O:85:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeCollection\":2:{s:11:\"\0*\0elements\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}',1,0,NULL,NULL,'2020-04-04 21:03:14.404',NULL),('�����J&�cm=B�3',1,80,'O:85:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeCollection\":2:{s:11:\"\0*\0elements\";a:3:{s:32:\"ac9d023367d84f89a5e4e92885b6859b\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:400;s:9:\"\0*\0height\";i:400;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"ac9d023367d84f89a5e4e92885b6859b\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.768000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"ac9d023367d84f89a5e4e92885b6859b\";}s:32:\"bbfd89c79b39483eafc90896f379bdca\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:1920;s:9:\"\0*\0height\";i:1920;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"bbfd89c79b39483eafc90896f379bdca\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.771000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"bbfd89c79b39483eafc90896f379bdca\";}s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";O:81:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeEntity\":12:{s:8:\"\0*\0width\";i:800;s:9:\"\0*\0height\";i:800;s:28:\"\0*\0mediaFolderConfigurations\";N;s:15:\"\0*\0customFields\";N;s:20:\"\0*\0_uniqueIdentifier\";s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";s:12:\"\0*\0versionId\";N;s:13:\"\0*\0translated\";a:0:{}s:12:\"\0*\0createdAt\";O:17:\"DateTimeImmutable\":3:{s:4:\"date\";s:26:\"2020-04-04 21:03:16.769000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}s:12:\"\0*\0updatedAt\";N;s:14:\"\0*\0_entityName\";s:20:\"media_thumbnail_size\";s:13:\"\0*\0extensions\";a:1:{s:11:\"foreignKeys\";O:42:\"Shopware\\Core\\Framework\\Struct\\ArrayStruct\":2:{s:7:\"\0*\0data\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}}s:5:\"\0*\0id\";s:32:\"cd09c2fb9b91429eb5c0305ef4a4d921\";}}s:13:\"\0*\0extensions\";a:0:{}}',1,0,NULL,NULL,'2020-04-04 21:03:14.403',NULL),('��%z@HG�K|)M��V',1,80,'O:85:\"Shopware\\Core\\Content\\Media\\Aggregate\\MediaThumbnailSize\\MediaThumbnailSizeCollection\":2:{s:11:\"\0*\0elements\";a:0:{}s:13:\"\0*\0extensions\";a:0:{}}',1,0,NULL,NULL,'2020-04-04 21:03:14.404',NULL);
/*!40000 ALTER TABLE `media_folder_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folder_configuration_media_thumbnail_size`
--

DROP TABLE IF EXISTS `media_folder_configuration_media_thumbnail_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_folder_configuration_media_thumbnail_size` (
  `media_folder_configuration_id` binary(16) NOT NULL,
  `media_thumbnail_size_id` binary(16) NOT NULL,
  PRIMARY KEY (`media_folder_configuration_id`,`media_thumbnail_size_id`),
  KEY `fk.media_folder_configuration_media_thumbnail_size.size_id` (`media_thumbnail_size_id`),
  CONSTRAINT `fk.media_folder_configuration_media_thumbnail_size.conf_id` FOREIGN KEY (`media_folder_configuration_id`) REFERENCES `media_folder_configuration` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk.media_folder_configuration_media_thumbnail_size.size_id` FOREIGN KEY (`media_thumbnail_size_id`) REFERENCES `media_thumbnail_size` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folder_configuration_media_thumbnail_size`
--

LOCK TABLES `media_folder_configuration_media_thumbnail_size` WRITE;
/*!40000 ALTER TABLE `media_folder_configuration_media_thumbnail_size` DISABLE KEYS */;
INSERT INTO `media_folder_configuration_media_thumbnail_size` VALUES ('�Bu]�A������\0�','��3g�O����(����'),('�Bu]�A������\0�','���Ǜ9H>����y��'),('�Bu]�A������\0�','�	����B���0^���!'),('$N��@������9O','��3g�O����(����'),('$N��@������9O','���Ǜ9H>����y��'),('$N��@������9O','�	����B���0^���!'),('Wګ�nF���m��','��3g�O����(����'),('Wګ�nF���m��','���Ǜ9H>����y��'),('Wګ�nF���m��','�	����B���0^���!'),('�����J&�cm=B�3','��3g�O����(����'),('�����J&�cm=B�3','���Ǜ9H>����y��'),('�����J&�cm=B�3','�	����B���0^���!');
/*!40000 ALTER TABLE `media_folder_configuration_media_thumbnail_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_tag`
--

DROP TABLE IF EXISTS `media_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_tag` (
  `media_id` binary(16) NOT NULL,
  `tag_id` binary(16) NOT NULL,
  PRIMARY KEY (`media_id`,`tag_id`),
  KEY `fk.media_tag.tag_id` (`tag_id`),
  CONSTRAINT `fk.media_tag.id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk.media_tag.tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_tag`
--

LOCK TABLES `media_tag` WRITE;
/*!40000 ALTER TABLE `media_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_thumbnail`
--

DROP TABLE IF EXISTS `media_thumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_thumbnail` (
  `id` binary(16) NOT NULL,
  `media_id` binary(16) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.media_thumbnail.media_id` (`media_id`),
  CONSTRAINT `fk.media_thumbnail.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.media_thumbnail.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_thumbnail`
--

LOCK TABLES `media_thumbnail` WRITE;
/*!40000 ALTER TABLE `media_thumbnail` DISABLE KEYS */;
INSERT INTO `media_thumbnail` VALUES ('S���8D���;�\"-��','�K}���CP�˅�l�(',1920,1920,NULL,'2020-04-04 21:05:21.875',NULL),('�:X@3KE�����;<','l���?B����Rա�',800,800,NULL,'2020-04-04 21:05:21.017',NULL),('%LP�A$����U�!','p�R \\E	��Z[G	J*',1920,1920,NULL,'2020-04-04 21:05:21.363',NULL),('/J9��aG��t��s��','�K}���CP�˅�l�(',800,800,NULL,'2020-04-04 21:05:21.876',NULL),('?\Zџ��N|�K�tz��','ih�d��Dg��8�I��',800,800,NULL,'2020-04-04 21:05:19.656',NULL),('@n�|��Ny�T�\n�fC','l���?B����Rա�',400,400,NULL,'2020-04-04 21:05:21.016',NULL),('N�EV��A�T���','�5jq#=K>�A}̈P�/',400,400,NULL,'2020-04-04 21:05:21.682',NULL),('QP]��H�������l','����B�N����/�<',800,800,NULL,'2020-04-04 21:05:22.195',NULL),('\\J�`�Ge����]{��','ih�d��Dg��8�I��',400,400,NULL,'2020-04-04 21:05:19.655',NULL),(']$���eB��>� )��','-�)��H��l�\\�s�',400,400,NULL,'2020-04-04 21:05:18.826',NULL),('`���rsI[���f��','Xє�AT��x-�ܒ�',1920,1920,NULL,'2020-04-04 21:05:19.281',NULL),('a�\r�K�OU�b� 7-^�','*�+�sG��\n�y\r�',1920,1920,NULL,'2020-04-04 21:05:18.427',NULL),('y��U��M��@��O!','-�)��H��l�\\�s�',1920,1920,NULL,'2020-04-04 21:05:18.826',NULL),('{\Z���6Iؒ���bj�','p�R \\E	��Z[G	J*',400,400,NULL,'2020-04-04 21:05:21.363',NULL),('�T��_�N��U�E�tS','*�+�sG��\n�y\r�',800,800,NULL,'2020-04-04 21:05:18.427',NULL),('�)�M̈I�*�NiJ?]','p�R \\E	��Z[G	J*',800,800,NULL,'2020-04-04 21:05:21.364',NULL),('��*�+�@\"��G�x��','ih�d��Dg��8�I��',1920,1920,NULL,'2020-04-04 21:05:19.655',NULL),('�dv�Z�F����=\0�2','Xє�AT��x-�ܒ�',400,400,NULL,'2020-04-04 21:05:19.280',NULL),('�PN�J�M��S_���)Q','����B�N����/�<',400,400,NULL,'2020-04-04 21:05:22.195',NULL),('�\n�� M��I�%�x�','*�+�sG��\n�y\r�',400,400,NULL,'2020-04-04 21:05:18.426',NULL),('�:\nn�L��ψ�#�','-�)��H��l�\\�s�',800,800,NULL,'2020-04-04 21:05:18.827',NULL),('�w��K��,ꌢ�','Xє�AT��x-�ܒ�',800,800,NULL,'2020-04-04 21:05:19.281',NULL),('�eQތIF��$�#\\?.�','l���?B����Rա�',1920,1920,NULL,'2020-04-04 21:05:21.017',NULL),('��_�\0E��\0��ɠ��','�5jq#=K>�A}̈P�/',1920,1920,NULL,'2020-04-04 21:05:21.682',NULL),('�K��[C��V�^㣵S','�K}���CP�˅�l�(',400,400,NULL,'2020-04-04 21:05:21.875',NULL),('�����@k��L�M��','����B�N����/�<',1920,1920,NULL,'2020-04-04 21:05:22.195',NULL),('�d�6�+FX�G8m=}o','�5jq#=K>�A}̈P�/',800,800,NULL,'2020-04-04 21:05:21.682',NULL);
/*!40000 ALTER TABLE `media_thumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_thumbnail_size`
--

DROP TABLE IF EXISTS `media_thumbnail_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_thumbnail_size` (
  `id` binary(16) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.width` (`width`,`height`),
  CONSTRAINT `json.media_thumbnail_size.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_thumbnail_size`
--

LOCK TABLES `media_thumbnail_size` WRITE;
/*!40000 ALTER TABLE `media_thumbnail_size` DISABLE KEYS */;
INSERT INTO `media_thumbnail_size` VALUES ('��3g�O����(����',400,400,NULL,'2020-04-04 21:03:16.768',NULL),('���Ǜ9H>����y��',1920,1920,NULL,'2020-04-04 21:03:16.771',NULL),('�	����B���0^���!',800,800,NULL,'2020-04-04 21:03:16.769',NULL);
/*!40000 ALTER TABLE `media_thumbnail_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_translation`
--

DROP TABLE IF EXISTS `media_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_translation` (
  `media_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`media_id`,`language_id`),
  KEY `fk.media_translation.language_id` (`language_id`),
  CONSTRAINT `fk.media_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.media_translation.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.media_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_translation`
--

LOCK TABLES `media_translation` WRITE;
/*!40000 ALTER TABLE `media_translation` DISABLE KEYS */;
INSERT INTO `media_translation` VALUES ('*�+�sG��\n�y\r�','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-04 21:05:17.184',NULL),('-�)��H��l�\\�s�','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-04 21:05:17.210',NULL),(':fߺt�J*���\'�4!&','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-28 16:31:04.673',NULL),('Xє�AT��x-�ܒ�','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-04 21:05:17.222',NULL),('ih�d��Dg��8�I��','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-04 21:05:17.233',NULL),('l���?B����Rա�','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-04 21:05:17.246',NULL),('p�R \\E	��Z[G	J*','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-04 21:05:17.260',NULL),('zr��lC)�#��t��','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-28 16:31:04.674',NULL),('�5jq#=K>�A}̈P�/','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-04 21:05:17.272',NULL),('��|թ�C=�a���K�','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-28 16:31:04.672',NULL),('�K}���CP�˅�l�(','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-04 21:05:17.297',NULL),('����B�N����/�<','/�_��Mp�XT�|��',NULL,NULL,NULL,'2020-04-04 21:05:17.284',NULL);
/*!40000 ALTER TABLE `media_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_queue_stats`
--

DROP TABLE IF EXISTS `message_queue_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_queue_stats` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.message_queue_stats.name` (`name`),
  CONSTRAINT `check.message_queue_stats.size` CHECK (`size` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_queue_stats`
--

LOCK TABLES `message_queue_stats` WRITE;
/*!40000 ALTER TABLE `message_queue_stats` DISABLE KEYS */;
INSERT INTO `message_queue_stats` VALUES ('��}\ZI��Ч|����','Shopware\\Core\\Framework\\DataAbstractionLayer\\Indexing\\MessageQueue\\IndexerMessage',0,'2020-04-04 21:03:25.363','2020-04-04 21:05:55.672'),('>;�_F��U�R��T�','Shopware\\Core\\Content\\Sitemap\\ScheduledTask\\SitemapGenerateTask',0,'2020-04-04 21:05:53.188',NULL),('9�6�@<��݋��5','Shopware\\Core\\Content\\ProductExport\\ScheduledTask\\ProductExportGenerateTask',0,'2020-04-04 21:05:53.188',NULL),('S��zn1H�su�c�','Shopware\\Core\\Content\\Sitemap\\ScheduledTask\\SitemapMessage',0,'2020-04-04 21:05:53.783','2020-04-04 21:05:53.982'),('��g q�Nk��ʑNh�','Shopware\\Elasticsearch\\Framework\\Indexing\\CreateAliasTask',0,'2020-04-04 21:05:53.189',NULL),('��r�1�Lβx6<lQh','Shopware\\Core\\Framework\\MessageQueue\\ScheduledTask\\RequeueDeadMessagesTask',0,'2020-04-04 21:05:53.187',NULL),('�����#E͎8�Ӱ+$','Shopware\\Core\\Content\\Media\\Message\\GenerateThumbnailsMessage',0,'2020-04-04 21:03:25.220','2020-04-28 16:31:04.741'),('�Hl��M�>7�n��','Shopware\\Core\\Content\\Media\\Message\\DeleteFileMessage',0,'2020-04-04 21:05:54.771','2020-04-28 16:31:04.617'),('Ģ�X�IAꣂ\0UlH��','Shopware\\Core\\Content\\Newsletter\\ScheduledTask\\NewsletterRecipientTask',0,'2020-04-04 21:05:53.181',NULL);
/*!40000 ALTER TABLE `message_queue_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_timestamp` int(8) NOT NULL,
  `update` timestamp(6) NULL DEFAULT NULL,
  `update_destructive` timestamp(6) NULL DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('Shopware\\Core\\Migration\\Migration1536232600Language',1536232600,'2020-04-04 21:03:07.001855','2020-04-04 21:03:23.441924',NULL),('Shopware\\Core\\Migration\\Migration1536232610Locale',1536232610,'2020-04-04 21:03:07.267582','2020-04-04 21:03:23.442320',NULL),('Shopware\\Core\\Migration\\Migration1536232620SalesChannelType',1536232620,'2020-04-04 21:03:07.322874','2020-04-04 21:03:23.442731',NULL),('Shopware\\Core\\Migration\\Migration1536232630PropertyGroup',1536232630,'2020-04-04 21:03:07.375469','2020-04-04 21:03:23.443135',NULL),('Shopware\\Core\\Migration\\Migration1536232640Currency',1536232640,'2020-04-04 21:03:07.430124','2020-04-04 21:03:23.443497',NULL),('Shopware\\Core\\Migration\\Migration1536232650CustomerGroup',1536232650,'2020-04-04 21:03:07.483164','2020-04-04 21:03:23.443911',NULL),('Shopware\\Core\\Migration\\Migration1536232660Tax',1536232660,'2020-04-04 21:03:07.515952','2020-04-04 21:03:23.444479',NULL),('Shopware\\Core\\Migration\\Migration1536232670Unit',1536232670,'2020-04-04 21:03:07.642944','2020-04-04 21:03:23.445052',NULL),('Shopware\\Core\\Migration\\Migration1536232680Rule',1536232680,'2020-04-04 21:03:07.689597','2020-04-04 21:03:23.445528',NULL),('Shopware\\Core\\Migration\\Migration1536232690Version',1536232690,'2020-04-04 21:03:07.753812','2020-04-04 21:03:23.445970',NULL),('Shopware\\Core\\Migration\\Migration1536232700VersionCommit',1536232700,'2020-04-04 21:03:07.786252','2020-04-04 21:03:23.446425',NULL),('Shopware\\Core\\Migration\\Migration1536232710Integration',1536232710,'2020-04-04 21:03:07.816741','2020-04-04 21:03:23.446816',NULL),('Shopware\\Core\\Migration\\Migration1536232720Country',1536232720,'2020-04-04 21:03:07.871027','2020-04-04 21:03:23.452721',NULL),('Shopware\\Core\\Migration\\Migration1536232730CountryState',1536232730,'2020-04-04 21:03:07.932207','2020-04-04 21:03:23.453301',NULL),('Shopware\\Core\\Migration\\Migration1536232740SnippetSet',1536232740,'2020-04-04 21:03:07.957569','2020-04-04 21:03:23.453756',NULL),('Shopware\\Core\\Migration\\Migration1536232750Snippet',1536232750,'2020-04-04 21:03:07.991569','2020-04-04 21:03:23.454180',NULL),('Shopware\\Core\\Migration\\Migration1536232760StateMachine',1536232760,'2020-04-04 21:03:08.863885','2020-04-04 21:03:23.454579',NULL),('Shopware\\Core\\Migration\\Migration1536232770VersionCommitData',1536232770,'2020-04-04 21:03:08.925188','2020-04-04 21:03:23.454975',NULL),('Shopware\\Core\\Migration\\Migration1536232790MailHeaderFooter',1536232790,'2020-04-04 21:03:09.029532','2020-04-04 21:03:23.455361',NULL),('Shopware\\Core\\Migration\\Migration1536232800DeliveryTime',1536232800,'2020-04-04 21:03:09.128837','2020-04-04 21:03:23.455711',NULL),('Shopware\\Core\\Migration\\Migration1536232810User',1536232810,'2020-04-04 21:03:09.219155','2020-04-04 21:03:23.455996',NULL),('Shopware\\Core\\Migration\\Migration1536232820UserAccessKey',1536232820,'2020-04-04 21:03:09.306158','2020-04-04 21:03:23.456247',NULL),('Shopware\\Core\\Migration\\Migration1536232830MediaDefaultFolder',1536232830,'2020-04-04 21:03:09.370334','2020-04-04 21:03:23.476393',NULL),('Shopware\\Core\\Migration\\Migration1536232840MediaFolder',1536232840,'2020-04-04 21:03:09.450630','2020-04-04 21:03:23.477587',NULL),('Shopware\\Core\\Migration\\Migration1536232850Media',1536232850,'2020-04-04 21:03:09.760585','2020-04-04 21:03:23.478809',NULL),('Shopware\\Core\\Migration\\Migration1536232860ShippingMethod',1536232860,'2020-04-04 21:03:09.833408','2020-04-04 21:03:23.480128',NULL),('Shopware\\Core\\Migration\\Migration1536232870ShippingMethodPrice',1536232870,'2020-04-04 21:03:09.882921','2020-04-04 21:03:23.481295',NULL),('Shopware\\Core\\Migration\\Migration1536232880Category',1536232880,'2020-04-04 21:03:09.970518','2020-04-04 21:03:23.487936',NULL),('Shopware\\Core\\Migration\\Migration1536232890CmsPage',1536232890,'2020-04-04 21:03:10.037394','2020-04-04 21:03:23.489245',NULL),('Shopware\\Core\\Migration\\Migration1536232900CmsBlock',1536232900,'2020-04-04 21:03:10.074698','2020-04-04 21:03:23.490257',NULL),('Shopware\\Core\\Migration\\Migration1536232910CmsSlot',1536232910,'2020-04-04 21:03:10.136406','2020-04-04 21:03:23.491277',NULL),('Shopware\\Core\\Migration\\Migration1536232920PaymentMethod',1536232920,'2020-04-04 21:03:10.211305','2020-04-04 21:03:23.492238',NULL),('Shopware\\Core\\Migration\\Migration1536232930Navigation',1536232930,'2020-04-04 21:03:10.310553','2020-04-04 21:03:23.493397',NULL),('Shopware\\Core\\Migration\\Migration1536232940SalesChannel',1536232940,'2020-04-04 21:03:10.625443','2020-04-04 21:03:23.499290',NULL),('Shopware\\Core\\Migration\\Migration1536232950Salutation',1536232950,'2020-04-04 21:03:10.687470','2020-04-04 21:03:23.500476',NULL),('Shopware\\Core\\Migration\\Migration1536232960Customer',1536232960,'2020-04-04 21:03:10.777400','2020-04-04 21:03:23.501490',NULL),('Shopware\\Core\\Migration\\Migration1536232970CustomerAddress',1536232970,'2020-04-04 21:03:10.836888','2020-04-04 21:03:23.502555',NULL),('Shopware\\Core\\Migration\\Migration1536232980Cart',1536232980,'2020-04-04 21:03:10.900108','2020-04-04 21:03:23.503631',NULL),('Shopware\\Core\\Migration\\Migration1536232990Order',1536232990,'2020-04-04 21:03:10.957500','2020-04-04 21:03:23.504614',NULL),('Shopware\\Core\\Migration\\Migration1536233000OrderCustomer',1536233000,'2020-04-04 21:03:11.061664','2020-04-04 21:03:23.506624',NULL),('Shopware\\Core\\Migration\\Migration1536233010OrderAddress',1536233010,'2020-04-04 21:03:11.113431','2020-04-04 21:03:23.507621',NULL),('Shopware\\Core\\Migration\\Migration1536233020OrderDelivery',1536233020,'2020-04-04 21:03:11.167825','2020-04-04 21:03:23.508592',NULL),('Shopware\\Core\\Migration\\Migration1536233030OrderLineItem',1536233030,'2020-04-04 21:03:11.212975','2020-04-04 21:03:23.509619',NULL),('Shopware\\Core\\Migration\\Migration1536233040OrderDeliveryPosition',1536233040,'2020-04-04 21:03:11.251454','2020-04-04 21:03:23.510636',NULL),('Shopware\\Core\\Migration\\Migration1536233050OrderTransaction',1536233050,'2020-04-04 21:03:11.295963','2020-04-04 21:03:23.511620',NULL),('Shopware\\Core\\Migration\\Migration1536233060MediaFolderConfiguration',1536233060,'2020-04-04 21:03:11.321136','2020-04-04 21:03:23.512607',NULL),('Shopware\\Core\\Migration\\Migration1536233070MediaThumbnailSize',1536233070,'2020-04-04 21:03:11.352589','2020-04-04 21:03:23.513682',NULL),('Shopware\\Core\\Migration\\Migration1536233080MediaFolderConfigurationMediaThumbnailSize',1536233080,'2020-04-04 21:03:11.384482','2020-04-04 21:03:23.514662',NULL),('Shopware\\Core\\Migration\\Migration1536233090MediaThumbnail',1536233090,'2020-04-04 21:03:11.415834','2020-04-04 21:03:23.515577',NULL),('Shopware\\Core\\Migration\\Migration1536233100PropertyGroupOption',1536233100,'2020-04-04 21:03:11.492890','2020-04-04 21:03:23.516485',NULL),('Shopware\\Core\\Migration\\Migration1536233110ProductManufacturer',1536233110,'2020-04-04 21:03:11.562804','2020-04-04 21:03:23.517502',NULL),('Shopware\\Core\\Migration\\Migration1536233120Product',1536233120,'2020-04-04 21:03:11.659356','2020-04-04 21:03:23.518507',NULL),('Shopware\\Core\\Migration\\Migration1536233130ProductMedia',1536233130,'2020-04-04 21:03:11.832333','2020-04-04 21:03:23.519489',NULL),('Shopware\\Core\\Migration\\Migration1536233140ProductProperty',1536233140,'2020-04-04 21:03:11.863770','2020-04-04 21:03:23.520365',NULL),('Shopware\\Core\\Migration\\Migration1536233150ProductOption',1536233150,'2020-04-04 21:03:11.895280','2020-04-04 21:03:23.521384',NULL),('Shopware\\Core\\Migration\\Migration1536233160ProductConfigurator',1536233160,'2020-04-04 21:03:11.938696','2020-04-04 21:03:23.522284',NULL),('Shopware\\Core\\Migration\\Migration1536233170ProductCategoryTree',1536233170,'2020-04-04 21:03:11.970428','2020-04-04 21:03:23.523018',NULL),('Shopware\\Core\\Migration\\Migration1536233180ProductCategory',1536233180,'2020-04-04 21:03:12.002566','2020-04-04 21:03:23.523825',NULL),('Shopware\\Core\\Migration\\Migration1536233190ProductPriceRule',1536233190,'2020-04-04 21:03:12.046332','2020-04-04 21:03:23.524599',NULL),('Shopware\\Core\\Migration\\Migration1536233200RuleCondition',1536233200,'2020-04-04 21:03:12.083576','2020-04-04 21:03:23.525391',NULL),('Shopware\\Core\\Migration\\Migration1536233210SalesChannelDomain',1536233210,'2020-04-04 21:03:12.132166','2020-04-04 21:03:23.526152',NULL),('Shopware\\Core\\Migration\\Migration1536233220PluginTranslation',1536233220,'2020-04-04 21:03:12.163829','2020-04-04 21:03:23.526949',NULL),('Shopware\\Core\\Migration\\Migration1536233230ProductStream',1536233230,'2020-04-04 21:03:12.219291','2020-04-04 21:03:23.527809',NULL),('Shopware\\Core\\Migration\\Migration1536233240ProductStreamFilter',1536233240,'2020-04-04 21:03:12.257477','2020-04-04 21:03:23.528681',NULL),('Shopware\\Core\\Migration\\Migration1536233250MessageQueueStats',1536233250,'2020-04-04 21:03:12.288203','2020-04-04 21:03:23.529498',NULL),('Shopware\\Core\\Migration\\Migration1536233260StateMachineHistory',1536233260,'2020-04-04 21:03:12.336935','2020-04-04 21:03:23.530357',NULL),('Shopware\\Core\\Migration\\Migration1536233270SystemConfig',1536233270,'2020-04-04 21:03:12.367914','2020-04-04 21:03:23.531279',NULL),('Shopware\\Core\\Migration\\Migration1536233280CustomFieldSet',1536233280,'2020-04-04 21:03:12.395187','2020-04-04 21:03:23.532228',NULL),('Shopware\\Core\\Migration\\Migration1536233290CustomFieldSetRelation',1536233290,'2020-04-04 21:03:12.426005','2020-04-04 21:03:23.533008',NULL),('Shopware\\Core\\Migration\\Migration1536233300CustomField',1536233300,'2020-04-04 21:03:12.462126','2020-04-04 21:03:23.534015',NULL),('Shopware\\Core\\Migration\\Migration1536233310ScheduledTask',1536233310,'2020-04-04 21:03:12.492842','2020-04-04 21:03:23.534961',NULL),('Shopware\\Core\\Migration\\Migration1536233320DeadMessage',1536233320,'2020-04-04 21:03:12.524836','2020-04-04 21:03:23.535835',NULL),('Shopware\\Core\\Migration\\Migration1536233330MailTemplate',1536233330,'2020-04-04 21:03:12.700983','2020-04-04 21:03:23.536659',NULL),('Shopware\\Core\\Migration\\Migration1536233340NumberRange',1536233340,'2020-04-04 21:03:12.898874','2020-04-04 21:03:23.537459',NULL),('Shopware\\Core\\Migration\\Migration1536233350ProductVisibility',1536233350,'2020-04-04 21:03:12.936595','2020-04-04 21:03:23.538342',NULL),('Shopware\\Core\\Migration\\Migration1536233360Document',1536233360,'2020-04-04 21:03:13.047295','2020-04-04 21:03:23.539059',NULL),('Shopware\\Core\\Migration\\Migration1536233370EventAction',1536233370,'2020-04-04 21:03:13.083718','2020-04-04 21:03:23.539738',NULL),('Shopware\\Core\\Migration\\Migration1536233380UserRecovery',1536233380,'2020-04-04 21:03:13.109333','2020-04-04 21:03:23.540402',NULL),('Shopware\\Core\\Migration\\Migration1536233390Promotion',1536233390,'2020-04-04 21:03:13.177253','2020-04-04 21:03:23.541057',NULL),('Shopware\\Core\\Migration\\Migration1536233400MailTemplateMedia',1536233400,'2020-04-04 21:03:13.215407','2020-04-04 21:03:23.541786',NULL),('Shopware\\Core\\Migration\\Migration1536233410PromotionSalesChannel',1536233410,'2020-04-04 21:03:13.256070','2020-04-04 21:03:23.542464',NULL),('Shopware\\Core\\Migration\\Migration1536233420PromotionDiscount',1536233420,'2020-04-04 21:03:13.288880','2020-04-04 21:03:23.543097',NULL),('Shopware\\Core\\Migration\\Migration1536233430NewsletterRecipient',1536233430,'2020-04-04 21:03:13.339165','2020-04-04 21:03:23.543640',NULL),('Shopware\\Core\\Migration\\Migration1536233440PromotionPersonaCustomer',1536233440,'2020-04-04 21:03:13.371729','2020-04-04 21:03:23.544066',NULL),('Shopware\\Core\\Migration\\Migration1536233450PromotionPersonaRules',1536233450,'2020-04-04 21:03:13.405242','2020-04-04 21:03:23.545128',NULL),('Shopware\\Core\\Migration\\Migration1536233460NumberRangeTranslationAndConfiguration',1536233460,'2020-04-04 21:03:13.406419','2020-04-04 21:03:23.545654',NULL),('Shopware\\Core\\Migration\\Migration1536233470PromotionOrderRule',1536233470,'2020-04-04 21:03:13.439188','2020-04-04 21:03:23.546254',NULL),('Shopware\\Core\\Migration\\Migration1536233480SalesChannelApiContext',1536233480,'2020-04-04 21:03:13.465042','2020-04-04 21:03:23.546785',NULL),('Shopware\\Core\\Migration\\Migration1536233500PromotionDiscountRule',1536233500,'2020-04-04 21:03:13.496726','2020-04-04 21:03:23.547250',NULL),('Shopware\\Core\\Migration\\Migration1536233510DocumentConfiguration',1536233510,'2020-04-04 21:03:13.589468','2020-04-04 21:03:23.547703',NULL),('Shopware\\Core\\Migration\\Migration1536233520PromotionCartRule',1536233520,'2020-04-04 21:03:13.621819','2020-04-04 21:03:23.548145',NULL),('Shopware\\Core\\Migration\\Migration1536233530SalesChannelCategoryId',1536233530,'2020-04-04 21:03:13.829590','2020-04-04 21:03:23.854938',NULL),('Shopware\\Core\\Migration\\Migration1536233540ProductSearchKeyword',1536233540,'2020-04-04 21:03:13.906273','2020-04-04 21:03:23.855220',NULL),('Shopware\\Core\\Migration\\Migration1536233550Tag',1536233550,'2020-04-04 21:03:14.154062','2020-04-04 21:03:23.855445',NULL),('Shopware\\Core\\Migration\\Migration1536233560BasicData',1536233560,'2020-04-04 21:03:14.489538','2020-04-04 21:03:23.855693',NULL),('Shopware\\Core\\Migration\\Migration1552360944MediaFolderConfigurationNoAssoc',1552360944,'2020-04-04 21:03:14.595787','2020-04-04 21:03:23.856176',NULL),('Shopware\\Core\\Migration\\Migration1554199340AddImportExportProfile',1554199340,'2020-04-04 21:03:14.722772','2020-04-04 21:03:23.856608',NULL),('Shopware\\Core\\Migration\\Migration1554200141ImportExportFile',1554200141,'2020-04-04 21:03:14.748227','2020-04-04 21:03:23.856798',NULL),('Shopware\\Core\\Migration\\Migration1554203706AddImportExportLog',1554203706,'2020-04-04 21:03:14.791197','2020-04-04 21:03:23.856983',NULL),('Shopware\\Core\\Migration\\Migration1554900301AddReviewTable',1554900301,'2020-04-04 21:03:14.840998','2020-04-04 21:03:23.857192',NULL),('Shopware\\Core\\Migration\\Migration1556809270AddAverageRatingToProduct',1556809270,'2020-04-04 21:03:14.966921','2020-04-04 21:03:23.857610',NULL),('Shopware\\Core\\Migration\\Migration1558082916AddBreadcrumb',1558082916,'2020-04-04 21:03:15.046651','2020-04-04 21:03:23.857840',NULL),('Shopware\\Core\\Migration\\Migration1558105657CurrencyPrices',1558105657,'2020-04-04 21:03:15.124678','2020-04-04 21:03:23.858333',NULL),('Shopware\\Core\\Migration\\Migration1558443337PromotionSalesChannel',1558443337,'2020-04-04 21:03:15.322026','2020-04-04 21:03:23.858570',NULL),('Shopware\\Core\\Migration\\Migration1558505525Logging',1558505525,'2020-04-04 21:03:15.349870','2020-04-04 21:03:23.858764',NULL),('Shopware\\Core\\Migration\\Migration1558594334PromotionDiscountPrice',1558594334,'2020-04-04 21:03:15.387633','2020-04-04 21:03:23.858953',NULL),('Shopware\\Core\\Migration\\Migration1558938938ChangeGroupSortingColumn',1558938938,'2020-04-04 21:03:15.669868','2020-04-04 21:03:23.859144',NULL),('Shopware\\Core\\Migration\\Migration1559050088Promotion',1559050088,'2020-04-04 21:03:15.720189','2020-04-04 21:03:23.859334',NULL),('Shopware\\Core\\Migration\\Migration1559050903PromotionExclusion',1559050903,'2020-04-04 21:03:15.766740','2020-04-04 21:03:23.859566',NULL),('Shopware\\Core\\Migration\\Migration1559134989Promotion',1559134989,'2020-04-04 21:03:15.879866','2020-04-04 21:03:23.859780',NULL),('Shopware\\Core\\Migration\\Migration1559306391PromotionIndividualCode',1559306391,'2020-04-04 21:03:15.916906','2020-04-04 21:03:23.860004',NULL),('Shopware\\Core\\Migration\\Migration1561370284AddImportExportProductProfile',1561370284,'2020-04-04 21:03:15.919651','2020-04-04 21:03:23.860233',NULL),('Shopware\\Core\\Migration\\Migration1561377793AddAvailableAsShippingCountry',1561377793,'2020-04-04 21:03:15.986860','2020-04-04 21:03:23.860420',NULL),('Shopware\\Core\\Migration\\Migration1561442979ElasticsearchIndexTask',1561442979,'2020-04-04 21:03:16.011928','2020-04-04 21:03:23.860610',NULL),('Shopware\\Core\\Migration\\Migration1561452005Update',1561452005,'2020-04-04 21:03:16.015488','2020-04-04 21:03:23.860782',NULL),('Shopware\\Core\\Migration\\Migration1561712450NewSystemConfigsAndDefaultValues',1561712450,'2020-04-04 21:03:16.020481','2020-04-04 21:03:23.860958',NULL),('Shopware\\Core\\Migration\\Migration1562228335SetConfigDefaults',1562228335,'2020-04-04 21:03:16.023084','2020-04-04 21:03:23.861142',NULL),('Shopware\\Core\\Migration\\Migration1562240231UserPasswordRecovery',1562240231,'2020-04-04 21:03:16.032932','2020-04-04 21:03:23.861321',NULL),('Shopware\\Core\\Migration\\Migration1562306893MakeCustomerFirstLoginDateTime',1562306893,'2020-04-04 21:03:16.167083','2020-04-04 21:03:23.861497',NULL),('Shopware\\Core\\Migration\\Migration1562324772AddOrderDateToOrder',1562324772,'2020-04-04 21:03:16.282382','2020-04-04 21:03:23.861733',NULL),('Shopware\\Core\\Migration\\Migration1562579120ProductAvailableFields',1562579120,'2020-04-04 21:03:16.559089','2020-04-04 21:03:23.861956',NULL),('Shopware\\Core\\Migration\\Migration1562683944ImportExportProfileIdentifierFields',1562683944,'2020-04-04 21:03:16.564176','2020-04-04 21:03:23.862174',NULL),('Shopware\\Core\\Migration\\Migration1562684474AddDeliveryTime',1562684474,'2020-04-04 21:03:16.664419','2020-04-04 21:03:23.862366',NULL),('Shopware\\Core\\Migration\\Migration1562841035AddProductChildCount',1562841035,'2020-04-04 21:03:16.757235','2020-04-04 21:03:23.862541',NULL),('Shopware\\Core\\Migration\\Migration1562933907ContactForm',1562933907,'2020-04-04 21:03:16.764441','2020-04-04 21:03:23.862716',NULL),('Shopware\\Core\\Migration\\Migration1563180880AddDefaultThumbnailSizes',1563180880,'2020-04-04 21:03:16.782602','2020-04-04 21:03:23.862890',NULL),('Shopware\\Core\\Migration\\Migration1563288227MarkAsNewConfig',1563288227,'2020-04-04 21:03:16.784334','2020-04-04 21:03:23.863065',NULL),('Shopware\\Core\\Migration\\Migration1563518181PromotionDiscount',1563518181,'2020-04-04 21:03:16.844447','2020-04-04 21:03:23.863235',NULL),('Shopware\\Core\\Migration\\Migration1563805586AddLanguageToOrder',1563805586,'2020-04-04 21:03:17.217499','2020-04-04 21:03:23.863582',NULL),('Shopware\\Core\\Migration\\Migration1563949275AddCompanyToOrderCustomer',1563949275,'2020-04-04 21:03:17.286971','2020-04-04 21:03:23.863765',NULL),('Shopware\\Core\\Migration\\Migration1564475053RemoveSaveDocumentsConfig',1564475053,'2020-04-04 21:03:17.380034','2020-04-04 21:03:23.864291',NULL),('Shopware\\Core\\Migration\\Migration1565007156RemoveAutoIncrement',1565007156,'2020-04-04 21:03:17.380999','2020-04-04 21:03:24.086471',NULL),('Shopware\\Core\\Migration\\Migration1565079228AddAclStructure',1565079228,'2020-04-04 21:03:17.553358','2020-04-04 21:03:24.087525',NULL),('Shopware\\Core\\Migration\\Migration1565270155PromotionSetGroup',1565270155,'2020-04-04 21:03:17.586057','2020-04-04 21:03:24.088498',NULL),('Shopware\\Core\\Migration\\Migration1565270366PromotionSetGroupRule',1565270366,'2020-04-04 21:03:17.627372','2020-04-04 21:03:24.089482',NULL),('Shopware\\Core\\Migration\\Migration1565346846Promotion',1565346846,'2020-04-04 21:03:17.691656','2020-04-04 21:03:24.090381',NULL),('Shopware\\Core\\Migration\\Migration1565705280ProductExport',1565705280,'2020-04-04 21:03:17.769571','2020-04-04 21:03:24.092768',NULL),('Shopware\\Core\\Migration\\Migration1566293076AddAutoIncrement',1566293076,'2020-04-04 21:03:17.770517','2020-04-04 21:03:24.322235',NULL),('Shopware\\Core\\Migration\\Migration1566460168UpdateTexts',1566460168,'2020-04-04 21:03:17.771614','2020-04-04 21:03:24.324886',NULL),('Shopware\\Core\\Migration\\Migration1566817701AddDisplayGroup',1566817701,'2020-04-04 21:03:17.866563','2020-04-04 21:03:24.414740',NULL),('Shopware\\Core\\Migration\\Migration1567431050ContactFormTemplate',1567431050,'2020-04-04 21:03:17.872508','2020-04-04 21:03:24.415784',NULL),('Shopware\\Core\\Migration\\Migration1568120239CmsSection',1568120239,'2020-04-04 21:03:17.909166','2020-04-04 21:03:24.416743',NULL),('Shopware\\Core\\Migration\\Migration1568120302CmsBlockUpdate',1568120302,'2020-04-04 21:03:18.198162','2020-04-04 21:03:24.523002',NULL),('Shopware\\Core\\Migration\\Migration1568645037AddEnqueueDbal',1568645037,'2020-04-04 21:03:18.242341','2020-04-04 21:03:24.523853',NULL),('Shopware\\Core\\Migration\\Migration1568901713PromotionDiscount',1568901713,'2020-04-04 21:03:18.505590','2020-04-04 21:03:24.525408',NULL),('Shopware\\Core\\Migration\\Migration1569403146ProductVisibilityUnique',1569403146,'2020-04-04 21:03:18.521290','2020-04-04 21:03:24.526123',NULL),('Shopware\\Core\\Migration\\Migration1570187167AddedAppConfig',1570187167,'2020-04-04 21:03:18.707933','2020-04-04 21:03:24.663047',NULL),('Shopware\\Core\\Migration\\Migration1570459127AddCmsSidebarLayout',1570459127,'2020-04-04 21:03:18.737586','2020-04-04 21:03:24.663859',NULL),('Shopware\\Core\\Migration\\Migration1570621541UpdateDefaultMailTemplates',1570621541,'2020-04-04 21:03:18.761630','2020-04-04 21:03:24.664647',NULL),('Shopware\\Core\\Migration\\Migration1570622696CustomerPasswordRecovery',1570622696,'2020-04-04 21:03:18.798064','2020-04-04 21:03:24.665472',NULL),('Shopware\\Core\\Migration\\Migration1570629862ClearCategoryBreadcrumbs',1570629862,'2020-04-04 21:03:18.799441','2020-04-04 21:03:24.666332',NULL),('Shopware\\Core\\Migration\\Migration1570684913ScheduleIndexer',1570684913,'2020-04-04 21:03:18.837616','2020-04-04 21:03:24.667317',NULL),('Shopware\\Core\\Migration\\Migration1571059598ChangeGreatBritainToUnitedKingdom',1571059598,'2020-04-04 21:03:18.840730','2020-04-04 21:03:24.668221',NULL),('Shopware\\Core\\Migration\\Migration1571210820AddPaymentMethodIdsToSalesChannel',1571210820,'2020-04-04 21:03:18.997093','2020-04-04 21:03:24.669183',NULL),('Shopware\\Core\\Migration\\Migration1571660203FixOrderDeliveryStateNames',1571660203,'2020-04-04 21:03:19.015595','2020-04-04 21:03:24.670338',NULL),('Shopware\\Core\\Migration\\Migration1571724915MultipleTrackingCodesInOrderDelivery',1571724915,'2020-04-04 21:03:19.194701','2020-04-04 21:03:24.830019',NULL),('Shopware\\Core\\Migration\\Migration1571981437AddSeoColumns',1571981437,'2020-04-04 21:03:19.490596','2020-04-04 21:03:24.911359',NULL),('Shopware\\Core\\Migration\\Migration1571990395UpdateDefaultStatusMailTemplates',1571990395,'2020-04-04 21:03:19.634993','2020-04-04 21:03:24.912100',NULL),('Shopware\\Core\\Migration\\Migration1572193798TaxRule',1572193798,'2020-04-04 21:03:19.752087','2020-04-04 21:03:24.912331',NULL),('Shopware\\Core\\Migration\\Migration1572264837AddCacheId',1572264837,'2020-04-04 21:03:19.804937','2020-04-04 21:03:24.912529',NULL),('Shopware\\Core\\Migration\\Migration1572273565AddUniqueConstraintToTechnicalNameOfDocumentType',1572273565,'2020-04-04 21:03:19.840503','2020-04-04 21:03:24.912733',NULL),('Shopware\\Core\\Migration\\Migration1572421282AddDoubleOptInRegistration',1572421282,'2020-04-04 21:03:19.954129','2020-04-04 21:03:24.912907',NULL),('Shopware\\Core\\Migration\\Migration1572425108AddDoubleOptInRegistrationMailTemplate',1572425108,'2020-04-04 21:03:19.965956','2020-04-04 21:03:24.913070',NULL),('Shopware\\Core\\Migration\\Migration1572957455AddAffiliateTrackingColumns',1572957455,'2020-04-04 21:03:20.168055','2020-04-04 21:03:24.913405',NULL),('Shopware\\Core\\Migration\\Migration1573049297AddReopenTransitionToDeliveryStates',1573049297,'2020-04-04 21:03:20.171609','2020-04-04 21:03:24.913551',NULL),('Shopware\\Core\\Migration\\Migration1573569685DoubleOptInGuestMailTemplate',1573569685,'2020-04-04 21:03:20.188041','2020-04-04 21:03:24.913699',NULL),('Shopware\\Core\\Migration\\Migration1573729158AddSitemapConfig',1573729158,'2020-04-04 21:03:20.190730','2020-04-04 21:03:24.913847',NULL),('Shopware\\Core\\Migration\\Migration1574063550AddCurrencyToProductExport',1574063550,'2020-04-04 21:03:20.263575','2020-04-04 21:03:24.913992',NULL),('Shopware\\Core\\Migration\\Migration1574082635AddOrderLineItemProductId',1574082635,'2020-04-04 21:03:20.467595','2020-04-04 21:03:24.914137',NULL),('Shopware\\Core\\Migration\\Migration1574258787ProductSearchLanguageKey',1574258787,'2020-04-04 21:03:20.697289','2020-04-04 21:03:24.914432',NULL),('Shopware\\Core\\Migration\\Migration1574258788TaxRuleLanguageKey',1574258788,'2020-04-04 21:03:20.787011','2020-04-04 21:03:24.914591',NULL),('Shopware\\Core\\Migration\\Migration1574258789ProductReviewLanguageKey',1574258789,'2020-04-04 21:03:20.895482','2020-04-04 21:03:24.914737',NULL),('Shopware\\Core\\Migration\\Migration1574520220AddSalesChannelMaintenance',1574520220,'2020-04-04 21:03:21.344696','2020-04-04 21:03:24.914916',NULL),('Shopware\\Core\\Migration\\Migration1574672450RemoteAddressIntoCustomerAndOrderCustomerTable',1574672450,'2020-04-04 21:03:21.507478','2020-04-04 21:03:24.915099',NULL),('Shopware\\Core\\Migration\\Migration1574695657ProductCrossSelling',1574695657,'2020-04-04 21:03:21.654537','2020-04-04 21:03:24.915375',NULL),('Shopware\\Core\\Migration\\Migration1574925962FixTaxConstraint',1574925962,'2020-04-04 21:03:21.750414','2020-04-04 21:03:24.915529',NULL),('Shopware\\Core\\Migration\\Migration1575010262AddCmsFormLayouts',1575010262,'2020-04-04 21:03:21.766844','2020-04-04 21:03:24.915676',NULL),('Shopware\\Core\\Migration\\Migration1575021466AddCurrencies',1575021466,'2020-04-04 21:03:21.818437','2020-04-04 21:03:24.915840',NULL),('Shopware\\Core\\Migration\\Migration1575034234FixOrderDeliveryAddressConstraint',1575034234,'2020-04-04 21:03:21.923992','2020-04-04 21:03:24.915992',NULL),('Shopware\\Core\\Migration\\Migration1575036586FixProductConfiguratorSettingsConstraint',1575036586,'2020-04-04 21:03:22.026743','2020-04-04 21:03:24.916146',NULL),('Shopware\\Core\\Migration\\Migration1575039284FixProductReviewConstraint',1575039284,'2020-04-04 21:03:22.236875','2020-04-04 21:03:24.916418',NULL),('Shopware\\Core\\Migration\\Migration1575197543MailTemplateCustomFields',1575197543,'2020-04-04 21:03:22.498551','2020-04-04 21:03:24.920066',NULL),('Shopware\\Core\\Migration\\Migration1575274700FixSalesChannelMailHeaderFooterConstraint',1575274700,'2020-04-04 21:03:22.664874','2020-04-04 21:03:24.920323',NULL),('Shopware\\Core\\Migration\\Migration1575293069OrderMailTemplates',1575293069,'2020-04-04 21:03:22.675081','2020-04-04 21:03:24.920564',NULL),('Shopware\\Core\\Migration\\Migration1575451283AddLimitToCrossSelling',1575451283,'2020-04-04 21:03:22.740382','2020-04-04 21:03:24.920791',NULL),('Shopware\\Core\\Migration\\Migration1575626180RemoveSearchKeywordInheritance',1575626180,'2020-04-04 21:03:22.741519','2020-04-04 21:03:25.024340',NULL),('Shopware\\Core\\Migration\\Migration1575883959ResetListingPrices',1575883959,'2020-04-04 21:03:22.748238','2020-04-04 21:03:25.024687',NULL),('Shopware\\Core\\Migration\\Migration1576488398AddOrderLineItemPosition',1576488398,'2020-04-04 21:03:22.821367','2020-04-04 21:03:25.024970',NULL),('Shopware\\Core\\Migration\\Migration1576590301FixSalesChannelDomainLanguageFk',1576590301,'2020-04-04 21:03:23.040865','2020-04-04 21:03:25.025212',NULL),('Shopware\\Core\\Migration\\Migration1578042218DefaultPages',1578042218,'2020-04-04 21:03:23.093298','2020-04-04 21:03:25.025490',NULL),('Shopware\\Core\\Migration\\Migration1578044453AddedNavigationDepth',1578044453,'2020-04-04 21:03:23.333926','2020-04-04 21:03:25.025857',NULL),('Shopware\\Core\\Migration\\Migration1578470886FixPurchaseSteps',1578470886,'2020-04-04 21:03:23.337196','2020-04-04 21:03:25.026188',NULL),('Shopware\\Core\\Migration\\Migration1578475268FixSloveneLocale',1578475268,'2020-04-04 21:03:23.340523','2020-04-04 21:03:25.026505',NULL),('Shopware\\Core\\Migration\\Migration1578485775UseStableUpdateChannel',1578485775,'2020-04-04 21:03:23.351390','2020-04-04 21:03:25.026804',NULL),('Shopware\\Core\\Migration\\Migration1578491480Hreflang',1578491480,'2020-04-28 16:30:56.468190',NULL,NULL),('Shopware\\Core\\Migration\\Migration1578590702AddedPropertyGroupPosition',1578590702,'2020-04-28 16:30:56.556096',NULL,NULL),('Shopware\\Core\\Migration\\Migration1578648299ReindexSeoUrls',1578648299,'2020-04-04 21:03:23.354459','2020-04-04 21:03:25.027090',NULL),('Shopware\\Core\\Migration\\Migration1578650334AddGoogleAnalyticsTable',1578650334,'2020-04-28 16:30:56.757857',NULL,NULL),('Shopware\\Core\\Migration\\Migration1580202210DefaultRule',1580202210,'2020-04-28 16:30:56.768853',NULL,NULL),('Shopware\\Core\\Migration\\Migration1580218617RefactorShippingMethodPrice',1580218617,'2020-04-28 16:30:57.130531',NULL,NULL),('Shopware\\Core\\Migration\\Migration1580743279UpdateDeliveryMailTemplates',1580743279,'2020-04-04 21:03:23.404003','2020-04-04 21:03:25.027402',NULL),('Shopware\\Core\\Migration\\Migration1580746806AddPaymentStates',1580746806,'2020-04-28 16:30:57.168169',NULL,NULL),('Shopware\\Core\\Migration\\Migration1580808849AddGermanContactFormTranslation',1580808849,'2020-04-04 21:03:23.408074','2020-04-04 21:03:25.027710',NULL),('Shopware\\Core\\Migration\\Migration1580819350AddTrackingUrl',1580819350,'2020-04-28 16:30:57.259175',NULL,NULL),('Shopware\\Core\\Migration\\Migration1580827023ProductCrossSellingAssignedProductsDefinition',1580827023,'2020-04-28 16:30:57.430837',NULL,NULL),('Shopware\\Core\\Migration\\Migration1582011195FixCountryStateGermanTranslation',1582011195,'2020-04-28 16:30:57.472878',NULL,NULL),('Shopware\\Core\\Migration\\Migration1583142266FixDefaultOrderConfirmationMailTemplateVATDisplay',1583142266,'2020-04-28 16:30:57.479458',NULL,NULL),('Shopware\\Core\\Migration\\Migration1583402586GoogleShoppingAccount',1583402586,'2020-04-28 16:30:57.511746',NULL,NULL),('Shopware\\Core\\Migration\\Migration1583416186KeywordUniques',1583416186,'2020-04-28 16:30:57.591131',NULL,NULL),('Shopware\\Core\\Migration\\Migration1583483691GoogleShoppingMerchantAccount',1583483691,'2020-04-28 16:30:57.625997',NULL,NULL),('Shopware\\Core\\Migration\\Migration1583657587GoogleShoppingSalesChannel',1583657587,'2020-04-28 16:30:57.632281',NULL,NULL),('Shopware\\Core\\Migration\\Migration1583756864FixDeliveryForeignKey',1583756864,'2020-04-28 16:30:57.641405',NULL,NULL),('Shopware\\Core\\Migration\\Migration1583844433AddRefreshTokenTable',1583844433,'2020-04-28 16:30:57.673878',NULL,NULL),('Shopware\\Core\\Migration\\Migration1584002637NewImportExport',1584002637,'2020-04-28 16:30:57.902086',NULL,NULL),('Shopware\\Core\\Migration\\Migration1584953715UpdateMailTemplatesAfterOrderLink',1584953715,'2020-04-28 16:30:57.983527',NULL,NULL),('Shopware\\Core\\Migration\\Migration1585056571AddLanguageToMailTemplateMedia',1585056571,'2020-04-28 16:30:58.074737',NULL,NULL),('Shopware\\Core\\Migration\\Migration1585126355AddOrderCommentField',1585126355,'2020-04-28 16:30:58.167637',NULL,NULL),('Shopware\\Core\\Migration\\Migration1585490020ActivateHoneypotCaptcha',1585490020,'2020-04-28 16:30:58.172137',NULL,NULL),('Shopware\\Core\\Migration\\Migration1585744384ChangeCategoryProfile',1585744384,'2020-04-28 16:30:58.177106',NULL,NULL),('Shopware\\Core\\Migration\\Migration1585816139FixMediaMapping',1585816139,'2020-04-28 16:30:58.181513',NULL,NULL),('Shopware\\Core\\Migration\\Migration1586158920AddImportExportProfileConfig',1586158920,'2020-04-28 16:30:58.258510',NULL,NULL),('Shopware\\Core\\Migration\\Migration1586173614AddAdditionalImportExportProfiles',1586173614,'2020-04-28 16:30:58.263671',NULL,NULL),('Shopware\\Core\\Migration\\Migration1586260286AddProductMainVariant',1586260286,'2020-04-28 16:30:58.396615',NULL,NULL),('Shopware\\Core\\Migration\\Migration1586334003AddParentIdToProductProfile',1586334003,'2020-04-28 16:30:58.399660',NULL,NULL),('Shopware\\Core\\Migration\\Migration1587039363AddImportExportLabelField',1587039363,'2020-04-28 16:30:58.525417',NULL,NULL),('Shopware\\Core\\Migration\\Migration1587109484AddAfterOrderPaymentFlag',1587109484,'2020-04-28 16:30:58.636963',NULL,NULL),('Shopware\\Core\\Migration\\Migration1587461582AddOpenToPaidTransition',1587461582,'2020-04-28 16:30:58.643456',NULL,NULL),('Shopware\\Storefront\\Migration\\Migration1536232990SeoUrl',1536232990,'2020-04-04 21:03:11.016547','2020-04-04 21:03:23.505661',NULL),('Shopware\\Storefront\\Migration\\Migration1551969523SeoUrlTemplate',1551969523,'2020-04-04 21:03:14.527489','2020-04-04 21:03:23.855911',NULL),('Shopware\\Storefront\\Migration\\Migration1552899789Theme',1552899789,'2020-04-04 21:03:14.690000','2020-04-04 21:03:23.856412',NULL),('Shopware\\Storefront\\Migration\\Migration1555406153SalesChannelTheme',1555406153,'2020-04-04 21:03:14.871917','2020-04-04 21:03:23.857382',NULL),('Shopware\\Storefront\\Migration\\Migration1563785071AddThemeHelpText',1563785071,'2020-04-04 21:03:16.902966','2020-04-04 21:03:23.863408',NULL),('Shopware\\Storefront\\Migration\\Migration1564385954ThemeMedia',1564385954,'2020-04-04 21:03:17.318646','2020-04-04 21:03:23.863944',NULL),('Shopware\\Storefront\\Migration\\Migration1564385960ThemeAddActiveFlag',1564385960,'2020-04-04 21:03:17.378144','2020-04-04 21:03:23.864114',NULL),('Shopware\\Storefront\\Migration\\Migration1565640170ThemeMigrateMedia',1565640170,'2020-04-04 21:03:17.694471','2020-04-04 21:03:24.091178',NULL),('Shopware\\Storefront\\Migration\\Migration1565640175RemoveSalesChannelTheme',1565640175,'2020-04-04 21:03:17.709479','2020-04-04 21:03:24.091991',NULL),('Shopware\\Storefront\\Migration\\Migration1568787535AddSeoUrlConstraints',1568787535,'2020-04-04 21:03:18.343778','2020-04-04 21:03:24.524583',NULL),('Shopware\\Storefront\\Migration\\Migration1569482074AddProductMainCategory',1569482074,'2020-04-04 21:03:18.566129','2020-04-04 21:03:24.526821',NULL),('Shopware\\Storefront\\Migration\\Migration1569907970RemoveUnusedSeoColumns',1569907970,'2020-04-04 21:03:18.681827','2020-04-04 21:03:24.661999',NULL),('Shopware\\Storefront\\Migration\\Migration1572858066UpdateDefaultCategorySeoUrlTemplate',1572858066,'2020-04-04 21:03:19.967609','2020-04-04 21:03:24.913253',NULL),('Shopware\\Storefront\\Migration\\Migration1574258786SeoUrlLanguageKeyCascade',1574258786,'2020-04-04 21:03:20.590910','2020-04-04 21:03:24.914283',NULL);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_recipient`
--

DROP TABLE IF EXISTS `newsletter_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_recipient` (
  `id` binary(16) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salutation_id` binary(16) DEFAULT NULL,
  `language_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `confirmed_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `fk.newsletter_recipient.salutation_id` (`salutation_id`),
  KEY `fk.newsletter_recipient.language_id` (`language_id`),
  KEY `fk.newsletter_recipient.sales_channel_id` (`sales_channel_id`),
  CONSTRAINT `fk.newsletter_recipient.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `fk.newsletter_recipient.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`),
  CONSTRAINT `fk.newsletter_recipient.salutation_id` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`id`),
  CONSTRAINT `json.newsletter_recipient.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_recipient`
--

LOCK TABLES `newsletter_recipient` WRITE;
/*!40000 ALTER TABLE `newsletter_recipient` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_recipient_tag`
--

DROP TABLE IF EXISTS `newsletter_recipient_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_recipient_tag` (
  `newsletter_recipient_id` binary(16) NOT NULL,
  `tag_id` binary(16) NOT NULL,
  PRIMARY KEY (`newsletter_recipient_id`,`tag_id`),
  KEY `fk.newsletter_recipient_tag.tag_id` (`tag_id`),
  CONSTRAINT `fk.newsletter_recipient_tag.newsletter_recipient_id` FOREIGN KEY (`newsletter_recipient_id`) REFERENCES `newsletter_recipient` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.newsletter_recipient_tag.tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_recipient_tag`
--

LOCK TABLES `newsletter_recipient_tag` WRITE;
/*!40000 ALTER TABLE `newsletter_recipient_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_recipient_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_range`
--

DROP TABLE IF EXISTS `number_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_range` (
  `id` binary(16) NOT NULL,
  `type_id` binary(16) NOT NULL,
  `global` tinyint(1) NOT NULL,
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` int(8) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_range`
--

LOCK TABLES `number_range` WRITE;
/*!40000 ALTER TABLE `number_range` DISABLE KEYS */;
INSERT INTO `number_range` VALUES ('*A|ˌF���9�!0Xx','|-\\_��@բ�*Z<Sz',1,'{n}',10000,'2020-04-04 21:03:14.451',NULL),('/��y�@�:�	#eg_','��KTkM���SSM#',1,'{n}',1000,'2020-04-04 21:03:14.421',NULL),('T(���wK���\Z5umN','����I9������`',1,'{n}',1000,'2020-04-04 21:03:14.421',NULL),('g[F;zJN��$�ˀJ','��F��xC����p*(',1,'SW{n}',10000,'2020-04-04 21:03:14.448',NULL),('hn����D���d6��t','˭4�G��S���\\',1,'{n}',1000,'2020-04-04 21:03:14.420',NULL),('������I*��\Zt�0�','D��9EJ���N��',1,'{n}',1000,'2020-04-04 21:03:14.420',NULL),('�@�*�J3�ܷ@�^Z','Y�n�@_��BfR\Z��',1,'{n}',10000,'2020-04-04 21:03:14.449',NULL);
/*!40000 ALTER TABLE `number_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_range_sales_channel`
--

DROP TABLE IF EXISTS `number_range_sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_range_sales_channel` (
  `id` binary(16) NOT NULL,
  `number_range_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) DEFAULT NULL,
  `number_range_type_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.numer_range_id__sales_channel_id` (`number_range_id`,`sales_channel_id`),
  KEY `fk.number_range_sales_channel.sales_channel_id` (`sales_channel_id`),
  KEY `fk.number_range_sales_channel.number_range_type_id` (`number_range_type_id`),
  CONSTRAINT `fk.number_range_sales_channel.number_range_id` FOREIGN KEY (`number_range_id`) REFERENCES `number_range` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.number_range_sales_channel.number_range_type_id` FOREIGN KEY (`number_range_type_id`) REFERENCES `number_range_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.number_range_sales_channel.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_range_sales_channel`
--

LOCK TABLES `number_range_sales_channel` WRITE;
/*!40000 ALTER TABLE `number_range_sales_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `number_range_sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_range_state`
--

DROP TABLE IF EXISTS `number_range_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_range_state` (
  `id` binary(16) NOT NULL,
  `number_range_id` binary(16) NOT NULL,
  `last_value` int(8) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`number_range_id`),
  UNIQUE KEY `uniq.id` (`id`),
  KEY `idx.number_range_id` (`number_range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_range_state`
--

LOCK TABLES `number_range_state` WRITE;
/*!40000 ALTER TABLE `number_range_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `number_range_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_range_translation`
--

DROP TABLE IF EXISTS `number_range_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_range_translation` (
  `number_range_id` binary(16) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `language_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`number_range_id`,`language_id`),
  KEY `fk.number_range_translation.language_id` (`language_id`),
  CONSTRAINT `fk.number_range_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.number_range_translation.number_range_id` FOREIGN KEY (`number_range_id`) REFERENCES `number_range` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.number_range_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_range_translation`
--

LOCK TABLES `number_range_translation` WRITE;
/*!40000 ALTER TABLE `number_range_translation` DISABLE KEYS */;
INSERT INTO `number_range_translation` VALUES ('*A|ˌF���9�!0Xx','Customers',NULL,NULL,'/�_��Mp�XT�|��','2020-04-04 21:03:14.452',NULL),('*A|ˌF���9�!0Xx','Kunden',NULL,NULL,'�/p�L���M�4�8','2020-04-04 21:03:14.452',NULL),('/��y�@�:�	#eg_','Delivery notes',NULL,NULL,'/�_��Mp�XT�|��','2020-04-04 21:03:14.421',NULL),('/��y�@�:�	#eg_','Lieferscheine',NULL,NULL,'�/p�L���M�4�8','2020-04-04 21:03:14.421',NULL),('T(���wK���\Z5umN','Credit notes',NULL,NULL,'/�_��Mp�XT�|��','2020-04-04 21:03:14.421',NULL),('T(���wK���\Z5umN','Gutschriften',NULL,NULL,'�/p�L���M�4�8','2020-04-04 21:03:14.421',NULL),('g[F;zJN��$�ˀJ','Products',NULL,NULL,'/�_��Mp�XT�|��','2020-04-04 21:03:14.448',NULL),('g[F;zJN��$�ˀJ','Produkte',NULL,NULL,'�/p�L���M�4�8','2020-04-04 21:03:14.449',NULL),('hn����D���d6��t','Invoices',NULL,NULL,'/�_��Mp�XT�|��','2020-04-04 21:03:14.420',NULL),('hn����D���d6��t','Rechnungen',NULL,NULL,'�/p�L���M�4�8','2020-04-04 21:03:14.420',NULL),('������I*��\Zt�0�','Cancellations',NULL,NULL,'/�_��Mp�XT�|��','2020-04-04 21:03:14.420',NULL),('������I*��\Zt�0�','Stornos',NULL,NULL,'�/p�L���M�4�8','2020-04-04 21:03:14.421',NULL),('�@�*�J3�ܷ@�^Z','Orders',NULL,NULL,'/�_��Mp�XT�|��','2020-04-04 21:03:14.450',NULL),('�@�*�J3�ܷ@�^Z','Bestellungen',NULL,NULL,'�/p�L���M�4�8','2020-04-04 21:03:14.451',NULL);
/*!40000 ALTER TABLE `number_range_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_range_type`
--

DROP TABLE IF EXISTS `number_range_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_range_type` (
  `id` binary(16) NOT NULL,
  `technical_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global` tinyint(1) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.technical_name` (`technical_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_range_type`
--

LOCK TABLES `number_range_type` WRITE;
/*!40000 ALTER TABLE `number_range_type` DISABLE KEYS */;
INSERT INTO `number_range_type` VALUES ('D��9EJ���N��','document_storno',0,'2020-04-04 21:03:14.418',NULL),('Y�n�@_��BfR\Z��','order',0,'2020-04-04 21:03:14.444',NULL),('|-\\_��@բ�*Z<Sz','customer',0,'2020-04-04 21:03:14.446',NULL),('��KTkM���SSM#','document_delivery_note',0,'2020-04-04 21:03:14.419',NULL),('����I9������`','document_credit_note',0,'2020-04-04 21:03:14.419',NULL),('˭4�G��S���\\','document_invoice',0,'2020-04-04 21:03:14.418',NULL),('��F��xC����p*(','product',1,'2020-04-04 21:03:14.443',NULL);
/*!40000 ALTER TABLE `number_range_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `number_range_type_translation`
--

DROP TABLE IF EXISTS `number_range_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `number_range_type_translation` (
  `number_range_type_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `type_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`number_range_type_id`,`language_id`),
  KEY `fk.number_range_type_translation.language_id` (`language_id`),
  CONSTRAINT `fk.number_range_type_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.number_range_type_translation.number_range_type_id` FOREIGN KEY (`number_range_type_id`) REFERENCES `number_range_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.number_range_type_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `number_range_type_translation`
--

LOCK TABLES `number_range_type_translation` WRITE;
/*!40000 ALTER TABLE `number_range_type_translation` DISABLE KEYS */;
INSERT INTO `number_range_type_translation` VALUES ('D��9EJ���N��','/�_��Mp�XT�|��','Cancellation',NULL,'2020-04-04 21:03:14.419',NULL),('D��9EJ���N��','�/p�L���M�4�8','Storno',NULL,'2020-04-04 21:03:14.419',NULL),('Y�n�@_��BfR\Z��','/�_��Mp�XT�|��','Order',NULL,'2020-04-04 21:03:14.445',NULL),('Y�n�@_��BfR\Z��','�/p�L���M�4�8','Bestellung',NULL,'2020-04-04 21:03:14.446',NULL),('|-\\_��@բ�*Z<Sz','/�_��Mp�XT�|��','Customer',NULL,'2020-04-04 21:03:14.447',NULL),('|-\\_��@բ�*Z<Sz','�/p�L���M�4�8','Kunde',NULL,'2020-04-04 21:03:14.447',NULL),('��KTkM���SSM#','/�_��Mp�XT�|��','Delivery note',NULL,'2020-04-04 21:03:14.419',NULL),('��KTkM���SSM#','�/p�L���M�4�8','Lieferschein',NULL,'2020-04-04 21:03:14.419',NULL),('����I9������`','/�_��Mp�XT�|��','Credit note',NULL,'2020-04-04 21:03:14.419',NULL),('����I9������`','�/p�L���M�4�8','Gutschrift',NULL,'2020-04-04 21:03:14.420',NULL),('˭4�G��S���\\','/�_��Mp�XT�|��','Invoice',NULL,'2020-04-04 21:03:14.418',NULL),('˭4�G��S���\\','�/p�L���M�4�8','Rechnung',NULL,'2020-04-04 21:03:14.418',NULL),('��F��xC����p*(','/�_��Mp�XT�|��','Product',NULL,'2020-04-04 21:03:14.443',NULL),('��F��xC����p*(','�/p�L���M�4�8','Produkt',NULL,'2020-04-04 21:03:14.444',NULL);
/*!40000 ALTER TABLE `number_range_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `state_id` binary(16) NOT NULL,
  `auto_increment` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `currency_factor` double DEFAULT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  `billing_address_id` binary(16) NOT NULL,
  `billing_address_version_id` binary(16) NOT NULL,
  `price` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_date_time` datetime(3) NOT NULL,
  `order_date` date GENERATED ALWAYS AS (cast(`order_date_time` as date)) STORED,
  `amount_total` double GENERATED ALWAYS AS (json_unquote(json_extract(`price`,'$.totalPrice'))) VIRTUAL,
  `amount_net` double GENERATED ALWAYS AS (json_unquote(json_extract(`price`,'$.netPrice'))) VIRTUAL,
  `position_price` double GENERATED ALWAYS AS (json_unquote(json_extract(`price`,'$.positionPrice'))) VIRTUAL,
  `tax_status` varchar(255) GENERATED ALWAYS AS (json_unquote(json_extract(`price`,'$.taxStatus'))) VIRTUAL,
  `shipping_costs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `shipping_total` double GENERATED ALWAYS AS (json_unquote(json_extract(`shipping_costs`,'$.totalPrice'))) VIRTUAL,
  `deep_link_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `affiliate_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  UNIQUE KEY `uniq.auto_increment` (`auto_increment`),
  UNIQUE KEY `uniq.deep_link_code` (`deep_link_code`,`version_id`),
  KEY `idx.state_index` (`state_id`),
  KEY `fk.order.currency_id` (`currency_id`),
  KEY `fk.order.sales_channel_id` (`sales_channel_id`),
  KEY `fk.language_id` (`language_id`),
  CONSTRAINT `fk.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.order.currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.order.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `char_length.order.deep_link_code` CHECK (char_length(`deep_link_code`) = 32),
  CONSTRAINT `json.order.price` CHECK (json_valid(`price`)),
  CONSTRAINT `json.order.shipping_costs` CHECK (json_valid(`shipping_costs`)),
  CONSTRAINT `json.order.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_address`
--

DROP TABLE IF EXISTS `order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_address` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `country_id` binary(16) NOT NULL,
  `country_state_id` binary(16) DEFAULT NULL,
  `order_id` binary(16) NOT NULL,
  `order_version_id` binary(16) NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salutation_id` binary(16) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_address_line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_address_line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `fk.order_address.country_id` (`country_id`),
  KEY `fk.order_address.country_state_id` (`country_state_id`),
  KEY `fk.order_address.order_id` (`order_id`,`order_version_id`),
  KEY `fk.order_address.salutation_id` (`salutation_id`),
  CONSTRAINT `fk.order_address.country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.order_address.country_state_id` FOREIGN KEY (`country_state_id`) REFERENCES `country_state` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk.order_address.order_id` FOREIGN KEY (`order_id`, `order_version_id`) REFERENCES `order` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.order_address.salutation_id` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.order_address.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_address`
--

LOCK TABLES `order_address` WRITE;
/*!40000 ALTER TABLE `order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_customer`
--

DROP TABLE IF EXISTS `order_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_customer` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `customer_id` binary(16) DEFAULT NULL,
  `order_id` binary(16) NOT NULL,
  `order_version_id` binary(16) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salutation_id` binary(16) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `remote_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `fk.order_customer.customer_id` (`customer_id`),
  KEY `fk.order_customer.order_id` (`order_id`,`order_version_id`),
  KEY `fk.order_customer.salutation_id` (`salutation_id`),
  CONSTRAINT `fk.order_customer.customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk.order_customer.order_id` FOREIGN KEY (`order_id`, `order_version_id`) REFERENCES `order` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.order_customer.salutation_id` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.order_customer.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_customer`
--

LOCK TABLES `order_customer` WRITE;
/*!40000 ALTER TABLE `order_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery`
--

DROP TABLE IF EXISTS `order_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_delivery` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `order_id` binary(16) NOT NULL,
  `order_version_id` binary(16) NOT NULL,
  `state_id` binary(16) NOT NULL,
  `shipping_order_address_id` binary(16) DEFAULT NULL,
  `shipping_order_address_version_id` binary(16) DEFAULT NULL,
  `shipping_method_id` binary(16) NOT NULL,
  `tracking_codes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `shipping_date_earliest` date NOT NULL,
  `shipping_date_latest` date NOT NULL,
  `shipping_costs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `idx.state_index` (`state_id`),
  KEY `fk.order_delivery.order_id` (`order_id`,`order_version_id`),
  KEY `fk.order_delivery.shipping_method_id` (`shipping_method_id`),
  KEY `fk.order_delivery.shipping_order_address_id` (`shipping_order_address_id`,`shipping_order_address_version_id`),
  CONSTRAINT `fk.order_delivery.order_id` FOREIGN KEY (`order_id`, `order_version_id`) REFERENCES `order` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.order_delivery.shipping_method_id` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.order_delivery.shipping_costs` CHECK (json_valid(`shipping_costs`)),
  CONSTRAINT `json.order_delivery.custom_fields` CHECK (json_valid(`custom_fields`)),
  CONSTRAINT `json.order_delivery.tracking_codes` CHECK (json_valid(`tracking_codes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery`
--

LOCK TABLES `order_delivery` WRITE;
/*!40000 ALTER TABLE `order_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery_position`
--

DROP TABLE IF EXISTS `order_delivery_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_delivery_position` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `order_delivery_id` binary(16) NOT NULL,
  `order_delivery_version_id` binary(16) NOT NULL,
  `order_line_item_id` binary(16) NOT NULL,
  `order_line_item_version_id` binary(16) NOT NULL,
  `price` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `total_price` int(11) GENERATED ALWAYS AS (json_unquote(json_extract(`price`,'$.totalPrice'))) VIRTUAL,
  `unit_price` int(11) GENERATED ALWAYS AS (json_unquote(json_extract(`price`,'$.unitPrice'))) VIRTUAL,
  `quantity` int(11) GENERATED ALWAYS AS (json_unquote(json_extract(`price`,'$.quantity'))) VIRTUAL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `fk.order_delivery_position.order_delivery_id` (`order_delivery_id`,`order_delivery_version_id`),
  KEY `fk.order_delivery_position.order_line_item_id` (`order_line_item_id`,`order_line_item_version_id`),
  CONSTRAINT `fk.order_delivery_position.order_delivery_id` FOREIGN KEY (`order_delivery_id`, `order_delivery_version_id`) REFERENCES `order_delivery` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.order_delivery_position.order_line_item_id` FOREIGN KEY (`order_line_item_id`, `order_line_item_version_id`) REFERENCES `order_line_item` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.order_delivery_position.price` CHECK (json_valid(`price`)),
  CONSTRAINT `json.order_delivery_position.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_position`
--

LOCK TABLES `order_delivery_position` WRITE;
/*!40000 ALTER TABLE `order_delivery_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_delivery_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_item`
--

DROP TABLE IF EXISTS `order_line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_item` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `order_id` binary(16) NOT NULL,
  `order_version_id` binary(16) NOT NULL,
  `parent_id` binary(16) DEFAULT NULL,
  `parent_version_id` binary(16) DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referenced_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` binary(16) DEFAULT NULL,
  `product_version_id` binary(16) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_id` binary(16) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` double GENERATED ALWAYS AS (json_unquote(json_extract(`price`,'$.unitPrice'))) VIRTUAL,
  `total_price` double GENERATED ALWAYS AS (json_unquote(json_extract(`price`,'$.totalPrice'))) VIRTUAL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price_definition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stackable` tinyint(1) NOT NULL DEFAULT 1,
  `removable` tinyint(1) NOT NULL DEFAULT 1,
  `good` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 1,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `fk.order_line_item.order_id` (`order_id`,`order_version_id`),
  KEY `fk.order_line_item.parent_id` (`parent_id`,`parent_version_id`),
  KEY `fk.order_line_item.cover_id` (`cover_id`),
  KEY `product_id` (`product_id`,`product_version_id`),
  CONSTRAINT `fk.order_line_item.cover_id` FOREIGN KEY (`cover_id`) REFERENCES `media` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.order_line_item.order_id` FOREIGN KEY (`order_id`, `order_version_id`) REFERENCES `order` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.order_line_item.parent_id` FOREIGN KEY (`parent_id`, `parent_version_id`) REFERENCES `order_line_item` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_line_item_ibfk_1` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `json.order_line_item.payload` CHECK (json_valid(`payload`)),
  CONSTRAINT `json.order_line_item.price` CHECK (json_valid(`price`)),
  CONSTRAINT `json.order_line_item.price_definition` CHECK (json_valid(`price_definition`)),
  CONSTRAINT `json.order_line_item.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_item`
--

LOCK TABLES `order_line_item` WRITE;
/*!40000 ALTER TABLE `order_line_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tag`
--

DROP TABLE IF EXISTS `order_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_tag` (
  `order_id` binary(16) NOT NULL,
  `order_version_id` binary(16) NOT NULL,
  `tag_id` binary(16) NOT NULL,
  PRIMARY KEY (`order_id`,`order_version_id`,`tag_id`),
  KEY `fk.order_tag.tag_id` (`tag_id`),
  CONSTRAINT `fk.order_tag.order_tag__order_version_id` FOREIGN KEY (`order_id`, `order_version_id`) REFERENCES `order` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.order_tag.tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tag`
--

LOCK TABLES `order_tag` WRITE;
/*!40000 ALTER TABLE `order_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transaction`
--

DROP TABLE IF EXISTS `order_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_transaction` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `order_id` binary(16) NOT NULL,
  `order_version_id` binary(16) NOT NULL,
  `state_id` binary(16) NOT NULL,
  `payment_method_id` binary(16) NOT NULL,
  `amount` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `idx.state_index` (`state_id`),
  KEY `fk.order_transaction.order_id` (`order_id`,`order_version_id`),
  KEY `fk.order_transaction.payment_method_id` (`payment_method_id`),
  CONSTRAINT `fk.order_transaction.order_id` FOREIGN KEY (`order_id`, `order_version_id`) REFERENCES `order` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.order_transaction.payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.order_transaction.state_id` FOREIGN KEY (`state_id`) REFERENCES `state_machine_state` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.order_transaction.amount` CHECK (json_valid(`amount`)),
  CONSTRAINT `json.order_transaction.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transaction`
--

LOCK TABLES `order_transaction` WRITE;
/*!40000 ALTER TABLE `order_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method` (
  `id` binary(16) NOT NULL,
  `handler_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Shopware\\Core\\Checkout\\Payment\\Cart\\PaymentHandler\\DefaultPayment',
  `position` int(11) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `after_order_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `availability_rule_id` binary(16) DEFAULT NULL,
  `plugin_id` binary(16) DEFAULT NULL,
  `media_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.payment_method.availability_rule_id` (`availability_rule_id`),
  KEY `fk.payment_method.plugin_id` (`plugin_id`),
  KEY `fk.payment_method.media_id` (`media_id`),
  CONSTRAINT `fk.payment_method.availability_rule_id` FOREIGN KEY (`availability_rule_id`) REFERENCES `rule` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk.payment_method.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk.payment_method.plugin_id` FOREIGN KEY (`plugin_id`) REFERENCES `plugin` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES ('	��\n�\0F9�1Qb�6�M','Swag\\PayPal\\Payment\\PayPalPuiPaymentHandler',-99,0,0,'�e���A��T��$���',NULL,NULL,'2020-04-04 21:05:47.381',NULL),('����IS��C��E��','Shopware\\Core\\Checkout\\Payment\\Cart\\PaymentHandler\\PrePayment',2,1,1,NULL,NULL,NULL,'2020-04-04 21:03:14.386',NULL),('���ߪ�DQ�\n�?���R','Shopware\\Core\\Checkout\\Payment\\Cart\\PaymentHandler\\InvoicePayment',5,1,1,NULL,NULL,NULL,'2020-04-04 21:03:14.385',NULL),('�q��C����\n�qk','Swag\\PayPal\\Payment\\PayPalPaymentHandler',-100,0,0,NULL,NULL,NULL,'2020-04-04 21:05:47.379',NULL),('ڕKD4�L����DQ�','Shopware\\Core\\Checkout\\Payment\\Cart\\PaymentHandler\\DebitPayment',4,0,1,NULL,NULL,NULL,'2020-04-04 21:03:14.384',NULL),('�����8B�������','Shopware\\Core\\Checkout\\Payment\\Cart\\PaymentHandler\\CashPayment',1,1,1,NULL,NULL,NULL,'2020-04-04 21:03:14.386',NULL);
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method_translation`
--

DROP TABLE IF EXISTS `payment_method_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_method_translation` (
  `payment_method_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`,`language_id`),
  KEY `fk.payment_method_translation.language_id` (`language_id`),
  CONSTRAINT `fk.payment_method_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.payment_method_translation.payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.payment_method_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method_translation`
--

LOCK TABLES `payment_method_translation` WRITE;
/*!40000 ALTER TABLE `payment_method_translation` DISABLE KEYS */;
INSERT INTO `payment_method_translation` VALUES ('	��\n�\0F9�1Qb�6�M','/�_��Mp�XT�|��','Pay upon invoice','Buy comfortably on invoice and pay later.',NULL,'2020-04-04 21:05:47.380',NULL),('	��\n�\0F9�1Qb�6�M','�/p�L���M�4�8','Rechnungskauf','Kaufen Sie ganz bequem auf Rechnung und bezahlen Sie später.',NULL,'2020-04-04 21:05:47.380',NULL),('����IS��C��E��','/�_��Mp�XT�|��','Paid in advance','Pay in advance and get your order afterwards',NULL,'2020-04-04 21:03:14.386',NULL),('����IS��C��E��','�/p�L���M�4�8','Vorkasse','Sie zahlen einfach vorab und erhalten die Ware bequem und günstig bei Zahlungseingang nach Hause geliefert.',NULL,'2020-04-04 21:03:14.386',NULL),('���ߪ�DQ�\n�?���R','/�_��Mp�XT�|��','Invoice','Payment by invoice. Shopware provides automatic invoicing for all customers on orders after the first. This is to avoid defaults on payment.',NULL,'2020-04-04 21:03:14.385',NULL),('���ߪ�DQ�\n�?���R','�/p�L���M�4�8','Rechnung','Sie zahlen einfach und bequem auf Rechnung. Shopware bietet z.B. auch die Möglichkeit, Rechnungen automatisiert erst ab der 2. Bestellung für Kunden zur Verfügung zu stellen, um Zahlungsausfälle zu vermeiden.',NULL,'2020-04-04 21:03:14.386',NULL),('�q��C����\n�qk','/�_��Mp�XT�|��','PayPal','Payment via PayPal - easy, fast and secure.',NULL,'2020-04-04 21:05:47.378',NULL),('�q��C����\n�qk','�/p�L���M�4�8',NULL,'Bezahlung per PayPal - einfach, schnell und sicher.',NULL,'2020-04-04 21:05:47.379',NULL),('ڕKD4�L����DQ�','/�_��Mp�XT�|��','Direct Debit','Pre-authorized payment, funds are withdrawn directly from the debited account.',NULL,'2020-04-04 21:03:14.385',NULL),('ڕKD4�L����DQ�','�/p�L���M�4�8','Lastschrift','Vorab autorisierte Zahlungsvereinbarung, Zahlungen werden direkt vom zu belastenden Konto abgebucht.',NULL,'2020-04-04 21:03:14.385',NULL),('�����8B�������','/�_��Mp�XT�|��','Cash on delivery','Payment upon receipt of goods.',NULL,'2020-04-04 21:03:14.386',NULL),('�����8B�������','�/p�L���M�4�8','Nachnahme','Zahlung bei Erhalt der Ware.',NULL,'2020-04-04 21:03:14.386',NULL);
/*!40000 ALTER TABLE `payment_method_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `composer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `managed_by_composer` tinyint(1) NOT NULL DEFAULT 0,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autoload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upgrade_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` mediumblob DEFAULT NULL,
  `installed_at` datetime(3) DEFAULT NULL,
  `upgraded_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.name` (`name`),
  UNIQUE KEY `uniq.baseClass` (`base_class`),
  CONSTRAINT `json.autoload` CHECK (json_valid(`autoload`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_translation`
--

DROP TABLE IF EXISTS `plugin_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_translation` (
  `plugin_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changelog` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`plugin_id`,`language_id`),
  KEY `fk.plugin_translation.language_id` (`language_id`),
  CONSTRAINT `fk.plugin_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.plugin_translation.plugin_id` FOREIGN KEY (`plugin_id`) REFERENCES `plugin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.plugin_translation.changelog` CHECK (json_valid(`changelog`)),
  CONSTRAINT `json.plugin_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_translation`
--

LOCK TABLES `plugin_translation` WRITE;
/*!40000 ALTER TABLE `plugin_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `auto_increment` int(11) NOT NULL AUTO_INCREMENT,
  `product_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `parent_id` binary(16) DEFAULT NULL,
  `parent_version_id` binary(16) DEFAULT NULL,
  `tax_id` binary(16) DEFAULT NULL,
  `product_manufacturer_id` binary(16) DEFAULT NULL,
  `product_manufacturer_version_id` binary(16) DEFAULT NULL,
  `delivery_time_id` binary(16) DEFAULT NULL,
  `deliveryTime` binary(16) DEFAULT NULL,
  `product_media_id` binary(16) DEFAULT NULL,
  `product_media_version_id` binary(16) DEFAULT NULL,
  `unit_id` binary(16) DEFAULT NULL,
  `category_tree` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `option_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `property_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `tax` binary(16) DEFAULT NULL,
  `manufacturer` binary(16) DEFAULT NULL,
  `cover` binary(16) DEFAULT NULL,
  `unit` binary(16) DEFAULT NULL,
  `media` binary(16) DEFAULT NULL,
  `prices` binary(16) DEFAULT NULL,
  `visibilities` binary(16) DEFAULT NULL,
  `properties` binary(16) DEFAULT NULL,
  `categories` binary(16) DEFAULT NULL,
  `translations` binary(16) DEFAULT NULL,
  `price` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `listing_prices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `manufacturer_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ean` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `available_stock` int(11) DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `restock_time` int(11) DEFAULT NULL,
  `is_closeout` tinyint(1) DEFAULT NULL,
  `purchase_steps` int(11) unsigned DEFAULT NULL,
  `max_purchase` int(11) unsigned DEFAULT NULL,
  `min_purchase` int(11) unsigned DEFAULT NULL,
  `purchase_unit` decimal(11,4) unsigned DEFAULT NULL,
  `reference_unit` decimal(10,3) unsigned DEFAULT NULL,
  `shipping_free` tinyint(1) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `mark_as_topseller` tinyint(1) unsigned DEFAULT NULL,
  `weight` decimal(10,3) unsigned DEFAULT NULL,
  `width` decimal(10,3) unsigned DEFAULT NULL,
  `height` decimal(10,3) unsigned DEFAULT NULL,
  `length` decimal(10,3) unsigned DEFAULT NULL,
  `release_date` datetime(3) DEFAULT NULL,
  `whitelist_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blacklist_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `tag_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `tags` binary(16) DEFAULT NULL,
  `variant_restrictions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `configurator_group_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `main_variant_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `rating_average` float DEFAULT NULL,
  `display_group` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_count` int(11) DEFAULT NULL,
  `crossSellings` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  UNIQUE KEY `auto_increment` (`auto_increment`),
  UNIQUE KEY `uniq.product.product_number__version_id` (`product_number`,`version_id`),
  KEY `fk.product.product_manufacturer_id` (`product_manufacturer_id`,`product_manufacturer_version_id`),
  KEY `fk.product.tax_id` (`tax_id`),
  KEY `fk.product.unit_id` (`unit_id`),
  KEY `fk.product.parent_id` (`parent_id`,`parent_version_id`),
  KEY `fk.product.product_media_id` (`product_media_id`,`product_media_version_id`),
  KEY `fk.product.main_variant_id` (`main_variant_id`),
  CONSTRAINT `fk.product.main_variant_id` FOREIGN KEY (`main_variant_id`) REFERENCES `product` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk.product.parent_id` FOREIGN KEY (`parent_id`, `parent_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product.product_manufacturer_id` FOREIGN KEY (`product_manufacturer_id`, `product_manufacturer_version_id`) REFERENCES `product_manufacturer` (`id`, `version_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.product.product_media_id` FOREIGN KEY (`product_media_id`, `product_media_version_id`) REFERENCES `product_media` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product.tax_id` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.product.unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.product.category_tree` CHECK (json_valid(`category_tree`)),
  CONSTRAINT `json.product.option_ids` CHECK (json_valid(`option_ids`)),
  CONSTRAINT `json.product.property_ids` CHECK (json_valid(`property_ids`)),
  CONSTRAINT `json.product.price` CHECK (json_valid(`price`)),
  CONSTRAINT `json.product.listing_prices` CHECK (json_valid(`listing_prices`)),
  CONSTRAINT `json.product.blacklist_ids` CHECK (json_valid(`blacklist_ids`)),
  CONSTRAINT `json.product.whitelist_ids` CHECK (json_valid(`whitelist_ids`)),
  CONSTRAINT `json.product.tag_ids` CHECK (json_valid(`tag_ids`)),
  CONSTRAINT `json.product.variant_restrictions` CHECK (json_valid(`variant_restrictions`))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('�h@�OF�ˣT��g','���jK¾K��u,4%',1,'SWDEMO10002',1,NULL,'���jK¾K��u,4%','�H0�ôF���®E�gt','� �e�L����<>��P','���jK¾K��u,4%',NULL,NULL,'�5jq#=K>�A}̈P�/',NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"251448b91bc742de85643f5fccd89051\"]',NULL,NULL,'�H0�ôF���®E�gt','� �e�L����<>��P','�5jq#=K>�A}̈P�/',NULL,'�h@�OF�ˣT��g','�h@�OF�ˣT��g','�h@�OF�ˣT��g','�h@�OF�ˣT��g','�h@�OF�ˣT��g','�h@�OF�ˣT��g','{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"net\":798.31999999999994,\"gross\":950,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"}}','{\"structs\":\"O:75:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\ListingPriceCollection\\\":2:{s:11:\\\"\\u0000*\\u0000elements\\\";a:8:{i:0;O:65:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\ListingPrice\\\":5:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"26edc9d01f694f53b7cb13285d57e4f1\\\";s:9:\\\"\\u0000*\\u0000ruleId\\\";s:32:\\\"28caae75a5624f0d985abd0eb32aa160\\\";s:7:\\\"\\u0000*\\u0000from\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"26edc9d01f694f53b7cb13285d57e4f1\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:2728.98;s:8:\\\"\\u0000*\\u0000gross\\\";d:3247.5;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:5:\\\"\\u0000*\\u0000to\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"26edc9d01f694f53b7cb13285d57e4f1\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:2910.9299999999998;s:8:\\\"\\u0000*\\u0000gross\\\";d:3464;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}i:1;O:65:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\ListingPrice\\\":5:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"829a26c8162c4fb3a04cc7f12d0013b0\\\";s:9:\\\"\\u0000*\\u0000ruleId\\\";s:32:\\\"28caae75a5624f0d985abd0eb32aa160\\\";s:7:\\\"\\u0000*\\u0000from\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"829a26c8162c4fb3a04cc7f12d0013b0\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:4707.9700000000003;s:8:\\\"\\u0000*\\u0000gross\\\";d:5602.5;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:5:\\\"\\u0000*\\u0000to\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"829a26c8162c4fb3a04cc7f12d0013b0\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:5021.8599999999997;s:8:\\\"\\u0000*\\u0000gross\\\";d:5976;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}i:2;O:65:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\ListingPrice\\\":5:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"8777a2d74b944ff09edb52d7d62fdd17\\\";s:9:\\\"\\u0000*\\u0000ruleId\\\";s:32:\\\"28caae75a5624f0d985abd0eb32aa160\\\";s:7:\\\"\\u0000*\\u0000from\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"8777a2d74b944ff09edb52d7d62fdd17\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:62.390000000000001;s:8:\\\"\\u0000*\\u0000gross\\\";d:74.25;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:5:\\\"\\u0000*\\u0000to\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"8777a2d74b944ff09edb52d7d62fdd17\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:66.549999999999997;s:8:\\\"\\u0000*\\u0000gross\\\";d:79.200000000000003;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}i:3;O:65:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\ListingPrice\\\":5:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"9dc04b67373e44678bbbc05e67981946\\\";s:9:\\\"\\u0000*\\u0000ruleId\\\";s:32:\\\"28caae75a5624f0d985abd0eb32aa160\\\";s:7:\\\"\\u0000*\\u0000from\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"9dc04b67373e44678bbbc05e67981946\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:737.92999999999995;s:8:\\\"\\u0000*\\u0000gross\\\";d:878.13999999999999;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:5:\\\"\\u0000*\\u0000to\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"9dc04b67373e44678bbbc05e67981946\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:787.13;s:8:\\\"\\u0000*\\u0000gross\\\";d:936.67999999999995;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}i:4;O:65:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\ListingPrice\\\":5:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"a89f2c126e4144e4b20aec69d51b5ec8\\\";s:9:\\\"\\u0000*\\u0000ruleId\\\";s:32:\\\"28caae75a5624f0d985abd0eb32aa160\\\";s:7:\\\"\\u0000*\\u0000from\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"a89f2c126e4144e4b20aec69d51b5ec8\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:6623.9300000000003;s:8:\\\"\\u0000*\\u0000gross\\\";d:7882.5;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:5:\\\"\\u0000*\\u0000to\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"a89f2c126e4144e4b20aec69d51b5ec8\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:7065.5600000000004;s:8:\\\"\\u0000*\\u0000gross\\\";d:8408;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}i:5;O:65:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\ListingPrice\\\":5:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"b7d2554b0ce847cd82f3ac9bd1c0dfca\\\";s:9:\\\"\\u0000*\\u0000ruleId\\\";s:32:\\\"28caae75a5624f0d985abd0eb32aa160\\\";s:7:\\\"\\u0000*\\u0000from\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"b7d2554b0ce847cd82f3ac9bd1c0dfca\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:630.25;s:8:\\\"\\u0000*\\u0000gross\\\";i:750;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:5:\\\"\\u0000*\\u0000to\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"b7d2554b0ce847cd82f3ac9bd1c0dfca\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:672.26999999999998;s:8:\\\"\\u0000*\\u0000gross\\\";i:800;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}i:6;O:65:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\ListingPrice\\\":5:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"ba44934e9ab148e0888502fb7ef3e2a1\\\";s:9:\\\"\\u0000*\\u0000ruleId\\\";s:32:\\\"28caae75a5624f0d985abd0eb32aa160\\\";s:7:\\\"\\u0000*\\u0000from\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"ba44934e9ab148e0888502fb7ef3e2a1\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:693.27999999999997;s:8:\\\"\\u0000*\\u0000gross\\\";d:825;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:5:\\\"\\u0000*\\u0000to\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"ba44934e9ab148e0888502fb7ef3e2a1\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:739.5;s:8:\\\"\\u0000*\\u0000gross\\\";d:880;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}i:7;O:65:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\ListingPrice\\\":5:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"dc1e92f1a30149c2b72110bf17fd42cf\\\";s:9:\\\"\\u0000*\\u0000ruleId\\\";s:32:\\\"28caae75a5624f0d985abd0eb32aa160\\\";s:7:\\\"\\u0000*\\u0000from\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"dc1e92f1a30149c2b72110bf17fd42cf\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:561.90999999999997;s:8:\\\"\\u0000*\\u0000gross\\\";d:668.67999999999995;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:5:\\\"\\u0000*\\u0000to\\\";O:58:\\\"Shopware\\\\Core\\\\Framework\\\\DataAbstractionLayer\\\\Pricing\\\\Price\\\":6:{s:13:\\\"\\u0000*\\u0000currencyId\\\";s:32:\\\"dc1e92f1a30149c2b72110bf17fd42cf\\\";s:6:\\\"\\u0000*\\u0000net\\\";d:599.38;s:8:\\\"\\u0000*\\u0000gross\\\";d:713.25999999999999;s:9:\\\"\\u0000*\\u0000linked\\\";b:1;s:12:\\\"\\u0000*\\u0000listPrice\\\";N;s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}}s:13:\\\"\\u0000*\\u0000extensions\\\";a:0:{}}\",\"formatted\":{\"r28caae75a5624f0d985abd0eb32aa160\":{\"c26edc9d01f694f53b7cb13285d57e4f1\":{\"currencyId\":\"26edc9d01f694f53b7cb13285d57e4f1\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"from\":{\"net\":2728.98,\"gross\":3247.5,\"linked\":true,\"currencyId\":\"26edc9d01f694f53b7cb13285d57e4f1\"},\"to\":{\"net\":2910.9299999999998,\"gross\":3464,\"linked\":true,\"currencyId\":\"26edc9d01f694f53b7cb13285d57e4f1\"}},\"c829a26c8162c4fb3a04cc7f12d0013b0\":{\"currencyId\":\"829a26c8162c4fb3a04cc7f12d0013b0\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"from\":{\"net\":4707.9700000000003,\"gross\":5602.5,\"linked\":true,\"currencyId\":\"829a26c8162c4fb3a04cc7f12d0013b0\"},\"to\":{\"net\":5021.8599999999997,\"gross\":5976,\"linked\":true,\"currencyId\":\"829a26c8162c4fb3a04cc7f12d0013b0\"}},\"c8777a2d74b944ff09edb52d7d62fdd17\":{\"currencyId\":\"8777a2d74b944ff09edb52d7d62fdd17\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"from\":{\"net\":62.390000000000001,\"gross\":74.25,\"linked\":true,\"currencyId\":\"8777a2d74b944ff09edb52d7d62fdd17\"},\"to\":{\"net\":66.549999999999997,\"gross\":79.200000000000003,\"linked\":true,\"currencyId\":\"8777a2d74b944ff09edb52d7d62fdd17\"}},\"c9dc04b67373e44678bbbc05e67981946\":{\"currencyId\":\"9dc04b67373e44678bbbc05e67981946\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"from\":{\"net\":737.92999999999995,\"gross\":878.13999999999999,\"linked\":true,\"currencyId\":\"9dc04b67373e44678bbbc05e67981946\"},\"to\":{\"net\":787.13,\"gross\":936.67999999999995,\"linked\":true,\"currencyId\":\"9dc04b67373e44678bbbc05e67981946\"}},\"ca89f2c126e4144e4b20aec69d51b5ec8\":{\"currencyId\":\"a89f2c126e4144e4b20aec69d51b5ec8\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"from\":{\"net\":6623.9300000000003,\"gross\":7882.5,\"linked\":true,\"currencyId\":\"a89f2c126e4144e4b20aec69d51b5ec8\"},\"to\":{\"net\":7065.5600000000004,\"gross\":8408,\"linked\":true,\"currencyId\":\"a89f2c126e4144e4b20aec69d51b5ec8\"}},\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"from\":{\"net\":630.25,\"gross\":750,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"},\"to\":{\"net\":672.26999999999998,\"gross\":800,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"}},\"cba44934e9ab148e0888502fb7ef3e2a1\":{\"currencyId\":\"ba44934e9ab148e0888502fb7ef3e2a1\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"from\":{\"net\":693.27999999999997,\"gross\":825,\"linked\":true,\"currencyId\":\"ba44934e9ab148e0888502fb7ef3e2a1\"},\"to\":{\"net\":739.5,\"gross\":880,\"linked\":true,\"currencyId\":\"ba44934e9ab148e0888502fb7ef3e2a1\"}},\"cdc1e92f1a30149c2b72110bf17fd42cf\":{\"currencyId\":\"dc1e92f1a30149c2b72110bf17fd42cf\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"from\":{\"net\":561.90999999999997,\"gross\":668.67999999999995,\"linked\":true,\"currencyId\":\"dc1e92f1a30149c2b72110bf17fd42cf\"},\"to\":{\"net\":599.38,\"gross\":713.25999999999999,\"linked\":true,\"currencyId\":\"dc1e92f1a30149c2b72110bf17fd42cf\"}}}}}',NULL,NULL,10,10,1,3,0,1,NULL,1,1.0000,1.000,1,950,NULL,45.000,590.000,600.000,840.000,'2020-04-04 21:05:18.643',NULL,NULL,NULL,'�h@�OF�ˣT��g',NULL,NULL,NULL,'2020-04-04 21:05:18.657',NULL,NULL,'9cc83811832d4b1f1593acb545f36678',0,'�h@�OF�ˣT��g'),('!FqG�䖴�I\0','���jK¾K��u,4%',7,'SWDEMO10005.2',1,'C�>�L�`U�_��','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"8de9b484c54f441c894774e5f57e485c\"]','[\"2bfd278e87204807a890da4a3e81dd90\",\"acfd7586d02848f1ac801f4776efa414\"]','[\"5997d91dc0784997bdef68dfc5a08912\",\"7cab88165ae5420f921232511b6e8f7d\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','*�+�sG��\n�y\r�',NULL,'C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C�>�L�`U�_��',NULL,NULL,NULL,'2020-04-04 21:05:19.099',NULL,NULL,'d88fdc25bf3013e9cc57d679009b77a0',0,'C�>�L�`U�_��'),('�^��K��,_\0U@','���jK¾K��u,4%',2,'SWDEMO100013',0,NULL,'���jK¾K��u,4%','�H0�ôF���®E�gt','#&�tL���R���','���jK¾K��u,4%',NULL,NULL,'ih�d��Dg��8�I��',NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"77b959cf66de4c1590c7f9b7da3982f3\",\"bb22b05bff9140f3808b1cff975b75eb\"]',NULL,'[\"22bdaee755804c1d8099c0d3696e852c\",\"77421c4f75af40c8a57657cdc2ad49a2\"]','�H0�ôF���®E�gt','#&�tL���R���','ih�d��Dg��8�I��',NULL,'�^��K��,_\0U@','�^��K��,_\0U@','�^��K��,_\0U@','�^��K��,_\0U@','�^��K��,_\0U@','�^��K��,_\0U@','{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"net\":1.6699999999999999,\"gross\":1.99,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"}}',NULL,NULL,NULL,40,40,1,3,0,1,NULL,1,250.0000,250.000,0,1.99,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:18.643',NULL,NULL,NULL,'�^��K��,_\0U@',NULL,NULL,NULL,'2020-04-04 21:05:18.795',NULL,NULL,'27c34d8a0a473716816a8631d55e660a',0,'�^��K��,_\0U@'),('$k�. K�KX�KM�\n','���jK¾K��u,4%',6,'SWDEMO10005.1',1,'C�>�L�`U�_��','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"8de9b484c54f441c894774e5f57e485c\"]','[\"2bfd278e87204807a890da4a3e81dd90\",\"5997d91dc0784997bdef68dfc5a08912\"]','[\"5997d91dc0784997bdef68dfc5a08912\",\"7cab88165ae5420f921232511b6e8f7d\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','*�+�sG��\n�y\r�',NULL,'C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C�>�L�`U�_��',NULL,NULL,NULL,'2020-04-04 21:05:19.098',NULL,NULL,'d88fdc25bf3013e9cc57d679009b77a0',0,'C�>�L�`U�_��'),('*�ٵ�GL~���qd��<','���jK¾K��u,4%',3,'SWDEMO10001',1,NULL,'���jK¾K��u,4%','�H0�ôF���®E�gt','$�fv�D���� �g(�','���jK¾K��u,4%',NULL,NULL,'p�R \\E	��Z[G	J*',NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"251448b91bc742de85643f5fccd89051\"]',NULL,'[\"6f9359239c994b48b7de282ee19a714d\",\"78c53f3f6dd14eb4927978415bfb74db\",\"7cab88165ae5420f921232511b6e8f7d\",\"dc6f98beeca44852beb078a9e8e21e7d\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','p�R \\E	��Z[G	J*',NULL,'*�ٵ�GL~���qd��<','*�ٵ�GL~���qd��<','*�ٵ�GL~���qd��<','*�ٵ�GL~���qd��<','*�ٵ�GL~���qd��<','*�ٵ�GL~���qd��<','{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"net\":416.75999999999999,\"gross\":495.94999999999999,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"}}',NULL,NULL,NULL,10,10,1,3,0,1,NULL,1,1.0000,1.000,0,495.95,NULL,0.170,NULL,NULL,NULL,'2020-04-04 21:05:18.643',NULL,NULL,NULL,'*�ٵ�GL~���qd��<',NULL,NULL,NULL,'2020-04-04 21:05:18.897',NULL,NULL,'ad2fab7ad7babdd7322b341443c0033b',0,'*�ٵ�GL~���qd��<'),('8!ܪlVK���RFy�,','���jK¾K��u,4%',10,'SWDEMO10005.5',1,'C�>�L�`U�_��','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"8de9b484c54f441c894774e5f57e485c\"]','[\"5997d91dc0784997bdef68dfc5a08912\",\"ad735af1ebfb421e93e408b073c4a89a\"]','[\"5997d91dc0784997bdef68dfc5a08912\",\"7cab88165ae5420f921232511b6e8f7d\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','*�+�sG��\n�y\r�',NULL,'C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C�>�L�`U�_��',NULL,NULL,NULL,'2020-04-04 21:05:19.105',NULL,NULL,'d88fdc25bf3013e9cc57d679009b77a0',0,'C�>�L�`U�_��'),(':��)�KW��墟4w�','���jK¾K��u,4%',4,'SWDEMO10006',1,NULL,'���jK¾K��u,4%','�H0�ôF���®E�gt','� �e�L����<>��P','���jK¾K��u,4%',NULL,NULL,'-�)��H��l�\\�s�',NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"2185182cbbd4462ea844abeb2a438b33\"]',NULL,'[\"5997d91dc0784997bdef68dfc5a08912\",\"78c53f3f6dd14eb4927978415bfb74db\",\"c53fa30db00e4a84b4516f6b07c02e8d\"]','�H0�ôF���®E�gt','� �e�L����<>��P','-�)��H��l�\\�s�',NULL,':��)�KW��墟4w�',':��)�KW��墟4w�',':��)�KW��墟4w�',':��)�KW��墟4w�',':��)�KW��墟4w�',':��)�KW��墟4w�','{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"net\":15,\"gross\":20,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"}}',NULL,NULL,NULL,50,50,1,3,0,1,NULL,1,1.0000,1.000,1,20,NULL,0.150,NULL,NULL,NULL,'2020-04-04 21:05:18.643',NULL,NULL,NULL,':��)�KW��墟4w�',NULL,NULL,NULL,'2020-04-04 21:05:18.988',NULL,NULL,'72358a503f8624b7a92020a0e3e551b3',0,':��)�KW��墟4w�'),('C�>�L�`U�_��','���jK¾K��u,4%',5,'SWDEMO10005',1,NULL,'���jK¾K��u,4%','�H0�ôF���®E�gt','$�fv�D���� �g(�','���jK¾K��u,4%',NULL,NULL,'*�+�sG��\n�y\r�',NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"8de9b484c54f441c894774e5f57e485c\"]',NULL,'[\"5997d91dc0784997bdef68dfc5a08912\",\"7cab88165ae5420f921232511b6e8f7d\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','*�+�sG��\n�y\r�',NULL,'C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"net\":16.799999999999997,\"gross\":19.989999999999998,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"}}',NULL,NULL,NULL,50,50,1,3,0,1,NULL,1,1.0000,1.000,1,19.99,NULL,0.500,NULL,NULL,NULL,'2020-04-04 21:05:18.643',NULL,NULL,NULL,'C�>�L�`U�_��',NULL,NULL,NULL,'2020-04-04 21:05:19.097',NULL,NULL,NULL,6,'C�>�L�`U�_��'),('m3�A��G��||��|6�','���jK¾K��u,4%',8,'SWDEMO10005.3',1,'C�>�L�`U�_��','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"8de9b484c54f441c894774e5f57e485c\"]','[\"52454db2adf942b2ac079a296f454a10\",\"5997d91dc0784997bdef68dfc5a08912\"]','[\"5997d91dc0784997bdef68dfc5a08912\",\"7cab88165ae5420f921232511b6e8f7d\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','*�+�sG��\n�y\r�',NULL,'C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C�>�L�`U�_��',NULL,NULL,NULL,'2020-04-04 21:05:19.101',NULL,NULL,'d88fdc25bf3013e9cc57d679009b77a0',0,'C�>�L�`U�_��'),('p��f*qC���M�','���jK¾K��u,4%',14,'SWDEMO10007.2',1,'Ǽ�\'S�M��P+AF','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"2185182cbbd4462ea844abeb2a438b33\"]','[\"54147692cbfb43419a6d11e26cad44dc\"]','[\"41e5013b67d64d3a92b7a275da8af441\",\"5193ffa5de8648a1bcfba1fa8a26c02b\",\"54147692cbfb43419a6d11e26cad44dc\",\"5997d91dc0784997bdef68dfc5a08912\",\"78c53f3f6dd14eb4927978415bfb74db\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','Xє�AT��x-�ܒ�',NULL,'Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ǽ�\'S�M��P+AF',NULL,NULL,NULL,'2020-04-04 21:05:19.282',NULL,NULL,'af160339563fcd7ae2c9becf4cd95adb',0,'Ǽ�\'S�M��P+AF'),('��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%',15,'SWDEMO10007.3',1,'Ǽ�\'S�M��P+AF','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"2185182cbbd4462ea844abeb2a438b33\"]','[\"5997d91dc0784997bdef68dfc5a08912\"]','[\"41e5013b67d64d3a92b7a275da8af441\",\"5193ffa5de8648a1bcfba1fa8a26c02b\",\"54147692cbfb43419a6d11e26cad44dc\",\"5997d91dc0784997bdef68dfc5a08912\",\"78c53f3f6dd14eb4927978415bfb74db\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','Xє�AT��x-�ܒ�',NULL,'Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ǽ�\'S�M��P+AF',NULL,NULL,NULL,'2020-04-04 21:05:19.283',NULL,NULL,'af160339563fcd7ae2c9becf4cd95adb',0,'Ǽ�\'S�M��P+AF'),('��me�qOq�RH�71>','���jK¾K��u,4%',9,'SWDEMO10005.4',1,'C�>�L�`U�_��','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"8de9b484c54f441c894774e5f57e485c\"]','[\"52454db2adf942b2ac079a296f454a10\",\"acfd7586d02848f1ac801f4776efa414\"]','[\"5997d91dc0784997bdef68dfc5a08912\",\"7cab88165ae5420f921232511b6e8f7d\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','*�+�sG��\n�y\r�',NULL,'C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C�>�L�`U�_��',NULL,NULL,NULL,'2020-04-04 21:05:19.103',NULL,NULL,'d88fdc25bf3013e9cc57d679009b77a0',0,'C�>�L�`U�_��'),('�X��� O��ό���','���jK¾K��u,4%',11,'SWDEMO10005.6',1,'C�>�L�`U�_��','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"8de9b484c54f441c894774e5f57e485c\"]','[\"acfd7586d02848f1ac801f4776efa414\",\"ad735af1ebfb421e93e408b073c4a89a\"]','[\"5997d91dc0784997bdef68dfc5a08912\",\"7cab88165ae5420f921232511b6e8f7d\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','*�+�sG��\n�y\r�',NULL,'C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��','C�>�L�`U�_��',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'C�>�L�`U�_��',NULL,NULL,NULL,'2020-04-04 21:05:19.106',NULL,NULL,'d88fdc25bf3013e9cc57d679009b77a0',0,'C�>�L�`U�_��'),('���쨪L������\n�','���jK¾K��u,4%',13,'SWDEMO10007.1',1,'Ǽ�\'S�M��P+AF','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"2185182cbbd4462ea844abeb2a438b33\"]','[\"41e5013b67d64d3a92b7a275da8af441\"]','[\"41e5013b67d64d3a92b7a275da8af441\",\"5193ffa5de8648a1bcfba1fa8a26c02b\",\"54147692cbfb43419a6d11e26cad44dc\",\"5997d91dc0784997bdef68dfc5a08912\",\"78c53f3f6dd14eb4927978415bfb74db\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','Xє�AT��x-�ܒ�',NULL,'Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ǽ�\'S�M��P+AF',NULL,NULL,NULL,'2020-04-04 21:05:19.281',NULL,NULL,'af160339563fcd7ae2c9becf4cd95adb',0,'Ǽ�\'S�M��P+AF'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%',12,'SWDEMO10007',1,NULL,'���jK¾K��u,4%','�H0�ôF���®E�gt','$�fv�D���� �g(�','���jK¾K��u,4%',NULL,NULL,'Xє�AT��x-�ܒ�',NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"2185182cbbd4462ea844abeb2a438b33\"]',NULL,'[\"41e5013b67d64d3a92b7a275da8af441\",\"5193ffa5de8648a1bcfba1fa8a26c02b\",\"54147692cbfb43419a6d11e26cad44dc\",\"5997d91dc0784997bdef68dfc5a08912\",\"78c53f3f6dd14eb4927978415bfb74db\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','Xє�AT��x-�ܒ�',NULL,'Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"net\":16.799999999999997,\"gross\":19.989999999999998,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"}}',NULL,NULL,NULL,50,50,1,3,0,1,NULL,1,1.0000,1.000,1,19.99,NULL,NULL,NULL,NULL,NULL,'2020-04-04 21:05:18.643',NULL,NULL,NULL,'Ǽ�\'S�M��P+AF',NULL,NULL,NULL,'2020-04-04 21:05:19.280',NULL,NULL,NULL,4,'Ǽ�\'S�M��P+AF'),('�ZI���C��\r4E��-','���jK¾K��u,4%',16,'SWDEMO10007.4',1,'Ǽ�\'S�M��P+AF','���jK¾K��u,4%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[\"0c8312bca2c0411d82320304db4e9f28\",\"a515ae260223466f8e37471d279e6406\",\"2185182cbbd4462ea844abeb2a438b33\"]','[\"acfd7586d02848f1ac801f4776efa414\"]','[\"41e5013b67d64d3a92b7a275da8af441\",\"5193ffa5de8648a1bcfba1fa8a26c02b\",\"54147692cbfb43419a6d11e26cad44dc\",\"5997d91dc0784997bdef68dfc5a08912\",\"78c53f3f6dd14eb4927978415bfb74db\",\"96638a1c7ab847bbb3ca64167ab30a3e\",\"acfd7586d02848f1ac801f4776efa414\"]','�H0�ôF���®E�gt','$�fv�D���� �g(�','Xє�AT��x-�ܒ�',NULL,'Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF','Ǽ�\'S�M��P+AF',NULL,NULL,NULL,NULL,50,50,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ǽ�\'S�M��P+AF',NULL,NULL,NULL,'2020-04-04 21:05:19.285',NULL,NULL,'af160339563fcd7ae2c9becf4cd95adb',0,'Ǽ�\'S�M��P+AF');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `category_id` binary(16) NOT NULL,
  `category_version_id` binary(16) NOT NULL,
  PRIMARY KEY (`product_id`,`product_version_id`,`category_id`,`category_version_id`),
  KEY `fk.product_category.category_id` (`category_id`,`category_version_id`),
  CONSTRAINT `fk.product_category.category_id` FOREIGN KEY (`category_id`, `category_version_id`) REFERENCES `category` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_category.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES ('�h@�OF�ˣT��g','���jK¾K��u,4%','%H��Bޅd?_�ؐQ','���jK¾K��u,4%'),('�^��K��,_\0U@','���jK¾K��u,4%','�\"�[��@���[u�','���jK¾K��u,4%'),('*�ٵ�GL~���qd��<','���jK¾K��u,4%','%H��Bޅd?_�ؐQ','���jK¾K��u,4%'),(':��)�KW��墟4w�','���jK¾K��u,4%','!�,��F.�D��*C�3','���jK¾K��u,4%'),('C�>�L�`U�_��','���jK¾K��u,4%','�鴄�OD�Gt��~H\\','���jK¾K��u,4%'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','!�,��F.�D��*C�3','���jK¾K��u,4%');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category_tree`
--

DROP TABLE IF EXISTS `product_category_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category_tree` (
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `category_id` binary(16) NOT NULL,
  `category_version_id` binary(16) NOT NULL,
  PRIMARY KEY (`product_id`,`product_version_id`,`category_id`,`category_version_id`),
  KEY `fk.product_category_tree.category_id` (`category_id`,`category_version_id`),
  CONSTRAINT `fk.product_category_tree.category_id` FOREIGN KEY (`category_id`, `category_version_id`) REFERENCES `category` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_category_tree.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category_tree`
--

LOCK TABLES `product_category_tree` WRITE;
/*!40000 ALTER TABLE `product_category_tree` DISABLE KEYS */;
INSERT INTO `product_category_tree` VALUES ('�h@�OF�ˣT��g','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('�h@�OF�ˣT��g','���jK¾K��u,4%','%H��Bޅd?_�ؐQ','���jK¾K��u,4%'),('!FqG�䖴�I\0','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('!FqG�䖴�I\0','���jK¾K��u,4%','�鴄�OD�Gt��~H\\','���jK¾K��u,4%'),('!FqG�䖴�I\0','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('�^��K��,_\0U@','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('�^��K��,_\0U@','���jK¾K��u,4%','w�Y�f�L�����9��','���jK¾K��u,4%'),('�^��K��,_\0U@','���jK¾K��u,4%','�\"�[��@���[u�','���jK¾K��u,4%'),('$k�. K�KX�KM�\n','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('$k�. K�KX�KM�\n','���jK¾K��u,4%','�鴄�OD�Gt��~H\\','���jK¾K��u,4%'),('$k�. K�KX�KM�\n','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('*�ٵ�GL~���qd��<','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('*�ٵ�GL~���qd��<','���jK¾K��u,4%','%H��Bޅd?_�ؐQ','���jK¾K��u,4%'),('8!ܪlVK���RFy�,','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('8!ܪlVK���RFy�,','���jK¾K��u,4%','�鴄�OD�Gt��~H\\','���jK¾K��u,4%'),('8!ܪlVK���RFy�,','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),(':��)�KW��墟4w�','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),(':��)�KW��墟4w�','���jK¾K��u,4%','!�,��F.�D��*C�3','���jK¾K��u,4%'),(':��)�KW��墟4w�','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('C�>�L�`U�_��','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('C�>�L�`U�_��','���jK¾K��u,4%','�鴄�OD�Gt��~H\\','���jK¾K��u,4%'),('C�>�L�`U�_��','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('m3�A��G��||��|6�','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('m3�A��G��||��|6�','���jK¾K��u,4%','�鴄�OD�Gt��~H\\','���jK¾K��u,4%'),('m3�A��G��||��|6�','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('p��f*qC���M�','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('p��f*qC���M�','���jK¾K��u,4%','!�,��F.�D��*C�3','���jK¾K��u,4%'),('p��f*qC���M�','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','!�,��F.�D��*C�3','���jK¾K��u,4%'),('��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('��me�qOq�RH�71>','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('��me�qOq�RH�71>','���jK¾K��u,4%','�鴄�OD�Gt��~H\\','���jK¾K��u,4%'),('��me�qOq�RH�71>','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('�X��� O��ό���','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('�X��� O��ό���','���jK¾K��u,4%','�鴄�OD�Gt��~H\\','���jK¾K��u,4%'),('�X��� O��ό���','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('���쨪L������\n�','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('���쨪L������\n�','���jK¾K��u,4%','!�,��F.�D��*C�3','���jK¾K��u,4%'),('���쨪L������\n�','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','!�,��F.�D��*C�3','���jK¾K��u,4%'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%'),('�ZI���C��\r4E��-','���jK¾K��u,4%','����A�2�N�(','���jK¾K��u,4%'),('�ZI���C��\r4E��-','���jK¾K��u,4%','!�,��F.�D��*C�3','���jK¾K��u,4%'),('�ZI���C��\r4E��-','���jK¾K��u,4%','��&#Fo�7G\'�d','���jK¾K��u,4%');
/*!40000 ALTER TABLE `product_category_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_configurator_setting`
--

DROP TABLE IF EXISTS `product_configurator_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_configurator_setting` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `property_group_option_id` binary(16) NOT NULL,
  `price` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `media_id` binary(16) DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `fk.product_configurator_setting.product_id` (`product_id`,`product_version_id`),
  KEY `fk.product_configurator_setting.media_id` (`media_id`),
  KEY `fk.product_configurator_setting.property_group_option_id` (`property_group_option_id`),
  CONSTRAINT `fk.product_configurator_setting.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk.product_configurator_setting.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_configurator_setting.property_group_option_id` FOREIGN KEY (`property_group_option_id`) REFERENCES `property_group_option` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.product_configurator_setting.price` CHECK (json_valid(`price`)),
  CONSTRAINT `json.product_configurator_setting.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_configurator_setting`
--

LOCK TABLES `product_configurator_setting` WRITE;
/*!40000 ALTER TABLE `product_configurator_setting` DISABLE KEYS */;
INSERT INTO `product_configurator_setting` VALUES ('/����L��)���1P$','���jK¾K��u,4%','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','A�;g�M:���uڊ�A',NULL,0,NULL,NULL,'2020-04-04 21:05:19.279',NULL),('2z_ZͽJ����2w�\Z�','���jK¾K��u,4%','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','��u��(H�Gv�',NULL,0,NULL,NULL,'2020-04-04 21:05:19.278',NULL),(']�i�tpC���Lh�S�$','���jK¾K��u,4%','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','Tv���CA�m�l�D�',NULL,0,NULL,NULL,'2020-04-04 21:05:19.280',NULL),('k0�a�O���h�[Zb^','���jK¾K��u,4%','C�>�L�`U�_��','���jK¾K��u,4%','+�\'�� H���J>�ݐ',NULL,0,'l���?B����Rա�',NULL,'2020-04-04 21:05:19.095',NULL),('mv%\\��F`�4�6��\'R','���jK¾K��u,4%','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','Y���xI���h�Š�',NULL,0,NULL,NULL,'2020-04-04 21:05:19.279',NULL),('������H�6�*�N�a','���jK¾K��u,4%','C�>�L�`U�_��','���jK¾K��u,4%','�sZ���B���sĨ�',NULL,0,'*�+�sG��\n�y\r�',NULL,'2020-04-04 21:05:19.096',NULL),('�R@��5M%�&\\~��w','���jK¾K��u,4%','C�>�L�`U�_��','���jK¾K��u,4%','REM���B���)oEJ',NULL,0,'����B�N����/�<',NULL,'2020-04-04 21:05:19.096',NULL),('��/��%L_���q�nc','���jK¾K��u,4%','C�>�L�`U�_��','���jK¾K��u,4%','��u��(H�Gv�',NULL,0,NULL,NULL,'2020-04-04 21:05:19.094',NULL),('���\r��B&�քW��','���jK¾K��u,4%','C�>�L�`U�_��','���jK¾K��u,4%','Y���xI���h�Š�',NULL,0,NULL,NULL,'2020-04-04 21:05:19.096',NULL);
/*!40000 ALTER TABLE `product_configurator_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_selling`
--

DROP TABLE IF EXISTS `product_cross_selling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_cross_selling` (
  `id` binary(16) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `sort_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT 0,
  `limit` int(11) NOT NULL DEFAULT 24,
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `product_stream_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.product_cross_selling.product_id` (`product_id`,`product_version_id`),
  KEY `fk.product_cross_selling.product_stream_id` (`product_stream_id`),
  CONSTRAINT `fk.product_cross_selling.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_cross_selling.product_stream_id` FOREIGN KEY (`product_stream_id`) REFERENCES `product_stream` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_selling`
--

LOCK TABLES `product_cross_selling` WRITE;
/*!40000 ALTER TABLE `product_cross_selling` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_selling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_selling_assigned_products`
--

DROP TABLE IF EXISTS `product_cross_selling_assigned_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_cross_selling_assigned_products` (
  `id` binary(16) NOT NULL,
  `cross_selling_id` binary(16) NOT NULL,
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.product_cross_selling_assigned_products.cross_selling_id` (`cross_selling_id`),
  KEY `product_id` (`product_id`,`product_version_id`),
  CONSTRAINT `fk.product_cross_selling_assigned_products.cross_selling_id` FOREIGN KEY (`cross_selling_id`) REFERENCES `product_cross_selling` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_cross_selling_assigned_products_ibfk_2` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_selling_assigned_products`
--

LOCK TABLES `product_cross_selling_assigned_products` WRITE;
/*!40000 ALTER TABLE `product_cross_selling_assigned_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_selling_assigned_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_selling_translation`
--

DROP TABLE IF EXISTS `product_cross_selling_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_cross_selling_translation` (
  `product_cross_selling_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`product_cross_selling_id`,`language_id`),
  KEY `fk.product_cross_selling_translation.language_id` (`language_id`),
  CONSTRAINT `fk.product_cross_selling_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_cross_selling_translation.product_cross_selling_id` FOREIGN KEY (`product_cross_selling_id`) REFERENCES `product_cross_selling` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_selling_translation`
--

LOCK TABLES `product_cross_selling_translation` WRITE;
/*!40000 ALTER TABLE `product_cross_selling_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_selling_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_export`
--

DROP TABLE IF EXISTS `product_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_export` (
  `id` binary(16) NOT NULL,
  `product_stream_id` binary(16) NOT NULL,
  `storefront_sales_channel_id` binary(16) DEFAULT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  `sales_channel_domain_id` binary(16) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encoding` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `include_variants` tinyint(1) DEFAULT 0,
  `generate_by_cronjob` tinyint(1) NOT NULL DEFAULT 0,
  `generated_at` datetime(3) DEFAULT NULL,
  `interval` int(11) NOT NULL,
  `header_template` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_template` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_template` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `currency_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_name` (`file_name`),
  KEY `fk.product_export.product_stream_id` (`product_stream_id`),
  KEY `fk.product_export.storefront_sales_channel_id` (`storefront_sales_channel_id`),
  KEY `fk.product_export.sales_channel_id` (`sales_channel_id`),
  KEY `fk.product_export.sales_channel_domain_id` (`sales_channel_domain_id`),
  CONSTRAINT `fk.product_export.product_stream_id` FOREIGN KEY (`product_stream_id`) REFERENCES `product_stream` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_export.sales_channel_domain_id` FOREIGN KEY (`sales_channel_domain_id`) REFERENCES `sales_channel_domain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_export.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_export.storefront_sales_channel_id` FOREIGN KEY (`storefront_sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_export`
--

LOCK TABLES `product_export` WRITE;
/*!40000 ALTER TABLE `product_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_keyword_dictionary`
--

DROP TABLE IF EXISTS `product_keyword_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_keyword_dictionary` (
  `id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `keyword` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reversed` varchar(500) GENERATED ALWAYS AS (reverse(`keyword`)) STORED,
  PRIMARY KEY (`id`,`language_id`),
  UNIQUE KEY `uniq.language_id_keyword` (`language_id`,`keyword`),
  KEY `idx.product_keyword_dictionary.language_id` (`language_id`),
  CONSTRAINT `fk.product_keyword_dictionary.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_keyword_dictionary`
--

LOCK TABLES `product_keyword_dictionary` WRITE;
/*!40000 ALTER TABLE `product_keyword_dictionary` DISABLE KEYS */;
INSERT INTO `product_keyword_dictionary` VALUES ('\0�Z�F_�W;�ϙވ','/�_��Mp�XT�|��','prices','secirp'),('9�\ZO��c��:`\n','�/p�L���M�4�8','SWDEMO10007.1','1.70001OMEDWS'),('�-;?�M/�awօ9�','/�_��Mp�XT�|��','shipping','gnippihs'),('����YF/�����M�','/�_��Mp�XT�|��','advanced','decnavda'),('���VA�P\\��X�K','�/p�L���M�4�8','SWDEMO10005.5','5.50001OMEDWS'),('��ia�A6�d\"\\<3�','/�_��Mp�XT�|��','SWDEMO10005.3','3.50001OMEDWS'),('#��=Aɗ��t		�','/�_��Mp�XT�|��','SWDEMO10005.6','6.50001OMEDWS'),('|%��ZI&���n�Ҧ','�/p�L���M�4�8','versandkostenfrei','ierfnetsokdnasrev'),('\Z�j�zA�7�\n@�[�','/�_��Mp�XT�|��','highlighting','gnithgilhgih'),('\Z�o!+MP������','/�_��Mp�XT�|��','free','eerf'),('+��N�E��Fd�m#ڽ','/�_��Mp�XT�|��','SWDEMO10007','70001OMEDWS'),('1�JUu\\L���P,ǵI','/�_��Mp�XT�|��','properties','seitreporp'),(':g���I֟��8�&�','�/p�L���M�4�8','SWDEMO10007.2','2.70001OMEDWS'),(';��{;B(�\r �3t','�/p�L���M�4�8','hervorhebung','gnubehrovreh'),('>l?=�AK聧>�D�#�','/�_��Mp�XT�|��','SWDEMO10001','10001OMEDWS'),('>pBV��G4�\nxwq\nD','�/p�L���M�4�8','bewertungen','negnutreweb'),('I�fY1�Lj��w��k�','�/p�L���M�4�8','SWDEMO10002','20001OMEDWS'),('N�JYL��3]++�K�','�/p�L���M�4�8','SWDEMO10005','50001OMEDWS'),('Ps�_J:��=w�|*','�/p�L���M�4�8','variantenprodukt','tkudorpnetnairav'),('S���A���\0����','�/p�L���M�4�8','SWDEMO10007.3','3.70001OMEDWS'),('Y�h��K2��%��','/�_��Mp�XT�|��','main','niam'),('ZT�\"��J��>�\\�q,','/�_��Mp�XT�|��','SWDEMO10007.4','4.70001OMEDWS'),('Z���z�E���\"50PH','�/p�L���M�4�8','SWDEMO10006','60001OMEDWS'),('[~�2w�JX��fǇ�҃','/�_��Mp�XT�|��','SWDEMO10002','20001OMEDWS'),('f�z�K�J����ԑ�','/�_��Mp�XT�|��','with','htiw'),('n�-�1tG襃Kq��V�','/�_��Mp�XT�|��','SWDEMO10005.1','1.50001OMEDWS'),('q���Eo��8Ʊ �','�/p�L���M�4�8','SWDEMO10001','10001OMEDWS'),('r�x��B��b_���;|','�/p�L���M�4�8','eigenschaften','netfahcsnegie'),('sĲIӇE���jO�GQ�','�/p�L���M�4�8','SWDEMO100013','310001OMEDWS'),('w6]�J�f:���','�/p�L���M�4�8','preisen','nesierp'),('��LI\rK�\0��8�#','/�_��Mp�XT�|��','SWDEMO10005.5','5.50001OMEDWS'),('�e5��I��=���9/','/�_��Mp�XT�|��','SWDEMO10005.2','2.50001OMEDWS'),('���i�A���zE@Ն','/�_��Mp�XT�|��','SWDEMO100013','310001OMEDWS'),('�6��$HM��/��f�','�/p�L���M�4�8','mit','tim'),('�_(0A�������','�/p�L���M�4�8','erweiterten','netretiewre'),('����jCP���1$��','�/p�L���M�4�8','SWDEMO10007','70001OMEDWS'),('�l	ީ{E�E���&?','�/p�L���M�4�8','SWDEMO10005.3','3.50001OMEDWS'),('����Nu�Ig����?','/�_��Mp�XT�|��','SWDEMO10007.2','2.70001OMEDWS'),('����I�Nڨ`�ϛ���','/�_��Mp�XT�|��','product','tcudorp'),('���`I�Ay��^���$','�/p�L���M�4�8','hauptartikel','lekitratpuah'),('����f�B��^v','/�_��Mp�XT�|��','SWDEMO10005.4','4.50001OMEDWS'),('�{�53Lj�s���R','�/p�L���M�4�8','SWDEMO10005.2','2.50001OMEDWS'),('śN�@O�0/�D��','�/p�L���M�4�8','SWDEMO10005.1','1.50001OMEDWS'),('�\0��a	A:�(	��N,','�/p�L���M�4�8','SWDEMO10005.6','6.50001OMEDWS'),('˩N^�O5�n���$','�/p�L���M�4�8','SWDEMO10007.4','4.70001OMEDWS'),('�19zp�IM�C�a�\Z?�','/�_��Mp�XT�|��','SWDEMO10005','50001OMEDWS'),('��H|dAb���F��','/�_��Mp�XT�|��','SWDEMO10007.1','1.70001OMEDWS'),('�¤�d]DӇ�yM+&�v','�/p�L���M�4�8','hauptprodukt','tkudorptpuah'),('�1�#L��7>zX\"','/�_��Mp�XT�|��','SWDEMO10007.3','3.70001OMEDWS'),('��XAs�HH����Ҕ`D','/�_��Mp�XT�|��','SWDEMO10006','60001OMEDWS'),('�Z�߀5F���v؝�r','/�_��Mp�XT�|��','reviews','sweiver'),('�7�B�MM?�B�1f=w','/�_��Mp�XT�|��','variant','tnairav'),('�͉W��N��p��z���','�/p�L���M�4�8','SWDEMO10005.4','4.50001OMEDWS');
/*!40000 ALTER TABLE `product_keyword_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_manufacturer`
--

DROP TABLE IF EXISTS `product_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_manufacturer` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `fk.product_manufacturer.media_id` (`media_id`),
  CONSTRAINT `fk.product_manufacturer.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_manufacturer`
--

LOCK TABLES `product_manufacturer` WRITE;
/*!40000 ALTER TABLE `product_manufacturer` DISABLE KEYS */;
INSERT INTO `product_manufacturer` VALUES ('#&�tL���R���','���jK¾K��u,4%',NULL,NULL,'2020-04-04 21:05:18.792',NULL),('_���C9�`᷄','���jK¾K��u,4%',NULL,NULL,'2020-04-04 21:03:14.399',NULL),('$�fv�D���� �g(�','���jK¾K��u,4%',NULL,NULL,'2020-04-04 21:05:18.895',NULL),('� �e�L����<>��P','���jK¾K��u,4%',NULL,NULL,'2020-04-04 21:05:18.651',NULL);
/*!40000 ALTER TABLE `product_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_manufacturer_translation`
--

DROP TABLE IF EXISTS `product_manufacturer_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_manufacturer_translation` (
  `product_manufacturer_id` binary(16) NOT NULL,
  `product_manufacturer_version_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`product_manufacturer_id`,`product_manufacturer_version_id`,`language_id`),
  KEY `fk.product_manufacturer_translation.language_id` (`language_id`),
  CONSTRAINT `fk.product_manufacturer_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_manufacturer_translation.product_manufacturer_id` FOREIGN KEY (`product_manufacturer_id`, `product_manufacturer_version_id`) REFERENCES `product_manufacturer` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.product_manufacturer_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_manufacturer_translation`
--

LOCK TABLES `product_manufacturer_translation` WRITE;
/*!40000 ALTER TABLE `product_manufacturer_translation` DISABLE KEYS */;
INSERT INTO `product_manufacturer_translation` VALUES ('#&�tL���R���','���jK¾K��u,4%','/�_��Mp�XT�|��','Shopware Food',NULL,NULL,'2020-04-04 21:05:18.792',NULL),('#&�tL���R���','���jK¾K��u,4%','�/p�L���M�4�8','Shopware Lebensmittel',NULL,NULL,'2020-04-04 21:05:18.791',NULL),('_���C9�`᷄','���jK¾K��u,4%','/�_��Mp�XT�|��','shopware AG',NULL,NULL,'2020-04-04 21:03:14.399',NULL),('_���C9�`᷄','���jK¾K��u,4%','�/p�L���M�4�8','shopware AG',NULL,NULL,'2020-04-04 21:03:14.399',NULL),('$�fv�D���� �g(�','���jK¾K��u,4%','/�_��Mp�XT�|��','Shopware Fashion',NULL,NULL,'2020-04-04 21:05:18.895',NULL),('$�fv�D���� �g(�','���jK¾K��u,4%','�/p�L���M�4�8','Shopware Kleidung',NULL,NULL,'2020-04-04 21:05:18.895',NULL),('� �e�L����<>��P','���jK¾K��u,4%','/�_��Mp�XT�|��','Shopware Freetime',NULL,NULL,'2020-04-04 21:05:18.651',NULL),('� �e�L����<>��P','���jK¾K��u,4%','�/p�L���M�4�8','Shopware Freizeit',NULL,NULL,'2020-04-04 21:05:18.650',NULL);
/*!40000 ALTER TABLE `product_manufacturer_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_media`
--

DROP TABLE IF EXISTS `product_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_media` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `media_id` binary(16) NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `fk.product_media.media_id` (`media_id`),
  KEY `fk.product_media.product_id` (`product_id`,`product_version_id`),
  CONSTRAINT `fk.product_media.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_media.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.product_media.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_media`
--

LOCK TABLES `product_media` WRITE;
/*!40000 ALTER TABLE `product_media` DISABLE KEYS */;
INSERT INTO `product_media` VALUES ('*�+�sG��\n�y\r�','���jK¾K��u,4%',1,'C�>�L�`U�_��','���jK¾K��u,4%','*�+�sG��\n�y\r�',NULL,'2020-04-04 21:05:19.092',NULL),('-�)��H��l�\\�s�','���jK¾K��u,4%',1,':��)�KW��墟4w�','���jK¾K��u,4%','-�)��H��l�\\�s�',NULL,'2020-04-04 21:05:18.987',NULL),('Xє�AT��x-�ܒ�','���jK¾K��u,4%',1,'Ǽ�\'S�M��P+AF','���jK¾K��u,4%','Xє�AT��x-�ܒ�',NULL,'2020-04-04 21:05:19.277',NULL),('ih�d��Dg��8�I��','���jK¾K��u,4%',1,'�^��K��,_\0U@','���jK¾K��u,4%','ih�d��Dg��8�I��',NULL,'2020-04-04 21:05:18.794',NULL),('p�R \\E	��Z[G	J*','���jK¾K��u,4%',1,'*�ٵ�GL~���qd��<','���jK¾K��u,4%','p�R \\E	��Z[G	J*',NULL,'2020-04-04 21:05:18.896',NULL),('�5jq#=K>�A}̈P�/','���jK¾K��u,4%',1,'�h@�OF�ˣT��g','���jK¾K��u,4%','�5jq#=K>�A}̈P�/',NULL,'2020-04-04 21:05:18.655',NULL);
/*!40000 ALTER TABLE `product_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_option` (
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `property_group_option_id` binary(16) NOT NULL,
  PRIMARY KEY (`product_id`,`product_version_id`,`property_group_option_id`),
  KEY `fk.product_option.property_group_option_id` (`property_group_option_id`),
  CONSTRAINT `fk.product_option.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_option.property_group_option_id` FOREIGN KEY (`property_group_option_id`) REFERENCES `property_group_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
INSERT INTO `product_option` VALUES ('!FqG�䖴�I\0','���jK¾K��u,4%','+�\'�� H���J>�ݐ'),('!FqG�䖴�I\0','���jK¾K��u,4%','��u��(H�Gv�'),('$k�. K�KX�KM�\n','���jK¾K��u,4%','+�\'�� H���J>�ݐ'),('$k�. K�KX�KM�\n','���jK¾K��u,4%','Y���xI���h�Š�'),('8!ܪlVK���RFy�,','���jK¾K��u,4%','Y���xI���h�Š�'),('8!ܪlVK���RFy�,','���jK¾K��u,4%','�sZ���B���sĨ�'),('m3�A��G��||��|6�','���jK¾K��u,4%','REM���B���)oEJ'),('m3�A��G��||��|6�','���jK¾K��u,4%','Y���xI���h�Š�'),('p��f*qC���M�','���jK¾K��u,4%','Tv���CA�m�l�D�'),('��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','Y���xI���h�Š�'),('��me�qOq�RH�71>','���jK¾K��u,4%','REM���B���)oEJ'),('��me�qOq�RH�71>','���jK¾K��u,4%','��u��(H�Gv�'),('�X��� O��ό���','���jK¾K��u,4%','��u��(H�Gv�'),('�X��� O��ό���','���jK¾K��u,4%','�sZ���B���sĨ�'),('���쨪L������\n�','���jK¾K��u,4%','A�;g�M:���uڊ�A'),('�ZI���C��\r4E��-','���jK¾K��u,4%','��u��(H�Gv�');
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `rule_id` binary(16) NOT NULL,
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `price` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `quantity_start` int(11) NOT NULL,
  `quantity_end` int(11) DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`),
  KEY `fk.product_price.product_id` (`product_id`,`product_version_id`),
  KEY `fk.product_price.rule_id` (`rule_id`),
  CONSTRAINT `fk.product_price.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_price.rule_id` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.product_price.price` CHECK (json_valid(`price`)),
  CONSTRAINT `json.product_price.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price`
--

LOCK TABLES `product_price` WRITE;
/*!40000 ALTER TABLE `product_price` DISABLE KEYS */;
INSERT INTO `product_price` VALUES ('Y�R�dA��2_Ŭ��Y','���jK¾K��u,4%','(ʮu�bO\r�Z��*�`','�h@�OF�ˣT��g','���jK¾K��u,4%','{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"net\":630.25,\"gross\":750,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"}}',12,NULL,NULL,'2020-04-04 21:05:18.653',NULL),('�^�ǈH}�p]!���','���jK¾K��u,4%','(ʮu�bO\r�Z��*�`','�h@�OF�ˣT��g','���jK¾K��u,4%','{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"net\":672.26999999999998,\"gross\":800,\"linked\":true,\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\"}}',1,11,NULL,'2020-04-04 21:05:18.654',NULL);
/*!40000 ALTER TABLE `product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_property`
--

DROP TABLE IF EXISTS `product_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_property` (
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `property_group_option_id` binary(16) NOT NULL,
  PRIMARY KEY (`product_id`,`product_version_id`,`property_group_option_id`),
  KEY `fk.product_property.configuration_option_id` (`property_group_option_id`),
  CONSTRAINT `fk.product_property.configuration_option_id` FOREIGN KEY (`property_group_option_id`) REFERENCES `property_group_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_property.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_property`
--

LOCK TABLES `product_property` WRITE;
/*!40000 ALTER TABLE `product_property` DISABLE KEYS */;
INSERT INTO `product_property` VALUES ('�^��K��,_\0U@','���jK¾K��u,4%','\"���U�L����in�,'),('�^��K��,_\0U@','���jK¾K��u,4%','wBOu�@ȥvW�­I�'),('*�ٵ�GL~���qd��<','���jK¾K��u,4%','o�Y#��KH��(.�qM'),('*�ٵ�GL~���qd��<','���jK¾K��u,4%','x�??m�N��yxA[�t�'),('*�ٵ�GL~���qd��<','���jK¾K��u,4%','|��Z�B�2Qn�}'),('*�ٵ�GL~���qd��<','���jK¾K��u,4%','�o���HR��x���}'),(':��)�KW��墟4w�','���jK¾K��u,4%','Y���xI���h�Š�'),(':��)�KW��墟4w�','���jK¾K��u,4%','x�??m�N��yxA[�t�'),(':��)�KW��墟4w�','���jK¾K��u,4%','�?�\r�J��Qok�.�'),('C�>�L�`U�_��','���jK¾K��u,4%','Y���xI���h�Š�'),('C�>�L�`U�_��','���jK¾K��u,4%','|��Z�B�2Qn�}'),('C�>�L�`U�_��','���jK¾K��u,4%','�c�z�G���dz�\n>'),('C�>�L�`U�_��','���jK¾K��u,4%','��u��(H�Gv�'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','A�;g�M:���uڊ�A'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','Q���ކH������&�+'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','Tv���CA�m�l�D�'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','Y���xI���h�Š�'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','x�??m�N��yxA[�t�'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','�c�z�G���dz�\n>'),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','��u��(H�Gv�');
/*!40000 ALTER TABLE `product_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_review` (
  `id` binary(16) NOT NULL,
  `product_id` binary(16) NOT NULL,
  `customer_id` binary(16) DEFAULT NULL,
  `sales_channel_id` binary(16) DEFAULT NULL,
  `language_id` binary(16) DEFAULT NULL,
  `external_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.product_review.product_id` (`product_id`,`product_version_id`),
  KEY `fk.product_review.customer_id` (`customer_id`),
  KEY `fk.product_review.sales_channel_id` (`sales_channel_id`),
  KEY `fk.product_review.language_id` (`language_id`),
  CONSTRAINT `fk.product_review.customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_review.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_review.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_review.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_search_keyword`
--

DROP TABLE IF EXISTS `product_search_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_search_keyword` (
  `id` binary(16) NOT NULL,
  `version_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ranking` double NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`,`version_id`,`language_id`),
  KEY `idx.product_search_keyword.product_id` (`product_id`,`product_version_id`),
  KEY `idx.product_search_keyword.language_id` (`language_id`),
  CONSTRAINT `fk.product_search_keyword.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_search_keyword.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_search_keyword`
--

LOCK TABLES `product_search_keyword` WRITE;
/*!40000 ALTER TABLE `product_search_keyword` DISABLE KEYS */;
INSERT INTO `product_search_keyword` VALUES ('��#�B���7+ 4��','���jK¾K��u,4%','/�_��Mp�XT�|��','C�>�L�`U�_��','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('����AY�V��g��','���jK¾K��u,4%','�/p�L���M�4�8','p��f*qC���M�','���jK¾K��u,4%','hauptprodukt',700,'2020-04-28 16:31:01.703',NULL),('~���F���(��','���jK¾K��u,4%','�/p�L���M�4�8','��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','mit',700,'2020-04-28 16:31:01.703',NULL),('[D�/�M�ʥ�X�!�','���jK¾K��u,4%','/�_��Mp�XT�|��','!FqG�䖴�I\0','���jK¾K��u,4%','SWDEMO10005.2',1000,'2020-04-28 16:31:01.741',NULL),(' g��Eƛ[%�g�','���jK¾K��u,4%','/�_��Mp�XT�|��','���쨪L������\n�','���jK¾K��u,4%','main',700,'2020-04-28 16:31:01.741',NULL),('�Fg�G��s�b','���jK¾K��u,4%','/�_��Mp�XT�|��','��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('�|S�wM�Wӻ4 ��','���jK¾K��u,4%','�/p�L���M�4�8','�ZI���C��\r4E��-','���jK¾K��u,4%','SWDEMO10007.4',1000,'2020-04-28 16:31:01.703',NULL),('�X�gG��U@C+%','���jK¾K��u,4%','/�_��Mp�XT�|��','C�>�L�`U�_��','���jK¾K��u,4%','SWDEMO10005',1000,'2020-04-28 16:31:01.741',NULL),('���}�M��G`��s\'','���jK¾K��u,4%','/�_��Mp�XT�|��','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('D����DT�NI���','���jK¾K��u,4%','/�_��Mp�XT�|��','C�>�L�`U�_��','���jK¾K��u,4%','variant',700,'2020-04-28 16:31:01.741',NULL),(' ��bL�H��w���l','���jK¾K��u,4%','�/p�L���M�4�8','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','eigenschaften',700,'2020-04-28 16:31:01.703',NULL),('!`,�PK��{�,s�','���jK¾K��u,4%','�/p�L���M�4�8','!FqG�䖴�I\0','���jK¾K��u,4%','variantenprodukt',700,'2020-04-28 16:31:01.703',NULL),('%��I�(AK�#vK\"z�','���jK¾K��u,4%','/�_��Mp�XT�|��','��me�qOq�RH�71>','���jK¾K��u,4%','SWDEMO10005.4',1000,'2020-04-28 16:31:01.741',NULL),('%��\rp�A�N�y����','���jK¾K��u,4%','/�_��Mp�XT�|��','�X��� O��ό���','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('&�`�m/F��G\n���)','���jK¾K��u,4%','�/p�L���M�4�8','m3�A��G��||��|6�','���jK¾K��u,4%','SWDEMO10005.3',1000,'2020-04-28 16:31:01.703',NULL),('+����M��g$x(F�','���jK¾K��u,4%','�/p�L���M�4�8',':��)�KW��墟4w�','���jK¾K��u,4%','versandkostenfrei',700,'2020-04-28 16:31:01.703',NULL),(',vO���G��}n�w','���jK¾K��u,4%','/�_��Mp�XT�|��','���쨪L������\n�','���jK¾K��u,4%','with',700,'2020-04-28 16:31:01.741',NULL),('.j�j��O����^��T�','���jK¾K��u,4%','/�_��Mp�XT�|��','���쨪L������\n�','���jK¾K��u,4%','properties',700,'2020-04-28 16:31:01.741',NULL),('/i�\\��A�S��ǧE`','���jK¾K��u,4%','/�_��Mp�XT�|��','m3�A��G��||��|6�','���jK¾K��u,4%','variant',700,'2020-04-28 16:31:01.741',NULL),('0���%UIκ����\\�','���jK¾K��u,4%','�/p�L���M�4�8','��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','SWDEMO10007.3',1000,'2020-04-28 16:31:01.703',NULL),('1j�|s�B�r�4k�','���jK¾K��u,4%','�/p�L���M�4�8','�h@�OF�ˣT��g','���jK¾K��u,4%','mit',700,'2020-04-28 16:31:01.703',NULL),('5\Z�C��K��p�]�|3�','���jK¾K��u,4%','/�_��Mp�XT�|��','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','main',700,'2020-04-28 16:31:01.741',NULL),('6�y\'�aIX�e�ӕ��','���jK¾K��u,4%','/�_��Mp�XT�|��','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','SWDEMO10007',1000,'2020-04-28 16:31:01.741',NULL),('6��{K�GD�BT!��','���jK¾K��u,4%','�/p�L���M�4�8','�ZI���C��\r4E��-','���jK¾K��u,4%','hauptprodukt',700,'2020-04-28 16:31:01.703',NULL),('8�K}��D٭�l�pN�','���jK¾K��u,4%','�/p�L���M�4�8','p��f*qC���M�','���jK¾K��u,4%','SWDEMO10007.2',1000,'2020-04-28 16:31:01.703',NULL),('9�bk�MO��|��`F�7','���jK¾K��u,4%','�/p�L���M�4�8',':��)�KW��墟4w�','���jK¾K��u,4%','hervorhebung',700,'2020-04-28 16:31:01.703',NULL),(';B�NE�dvqb��','���jK¾K��u,4%','�/p�L���M�4�8','�^��K��,_\0U@','���jK¾K��u,4%','bewertungen',700,'2020-04-28 16:31:01.703',NULL),('=Y��S�C����k�R','���jK¾K��u,4%','/�_��Mp�XT�|��','$k�. K�KX�KM�\n','���jK¾K��u,4%','SWDEMO10005.1',1000,'2020-04-28 16:31:01.741',NULL),('=]���sL)���AQN�','���jK¾K��u,4%','/�_��Mp�XT�|��','�h@�OF�ˣT��g','���jK¾K��u,4%','with',700,'2020-04-28 16:31:01.741',NULL),('=�A�F�ER���j�n','���jK¾K��u,4%','�/p�L���M�4�8',':��)�KW��墟4w�','���jK¾K��u,4%','hauptprodukt',700,'2020-04-28 16:31:01.703',NULL),('@���QF.��#���$�','���jK¾K��u,4%','/�_��Mp�XT�|��',':��)�KW��墟4w�','���jK¾K��u,4%','with',700,'2020-04-28 16:31:01.741',NULL),('B��\nuH���`�r�ڪ','���jK¾K��u,4%','�/p�L���M�4�8','�h@�OF�ˣT��g','���jK¾K��u,4%','hauptprodukt',700,'2020-04-28 16:31:01.703',NULL),('E��x�J�����n�','���jK¾K��u,4%','�/p�L���M�4�8','�^��K��,_\0U@','���jK¾K��u,4%','mit',700,'2020-04-28 16:31:01.703',NULL),('GL��PD��]����A:','���jK¾K��u,4%','/�_��Mp�XT�|��',':��)�KW��墟4w�','���jK¾K��u,4%','main',700,'2020-04-28 16:31:01.741',NULL),('Iʅ�C��|��%�','���jK¾K��u,4%','�/p�L���M�4�8','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','SWDEMO10007',1000,'2020-04-28 16:31:01.703',NULL),('IN0|�:C����M\Z��','���jK¾K��u,4%','/�_��Mp�XT�|��','��me�qOq�RH�71>','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('Imc�]Hg�q)Ԙc0�','���jK¾K��u,4%','�/p�L���M�4�8','C�>�L�`U�_��','���jK¾K��u,4%','variantenprodukt',700,'2020-04-28 16:31:01.703',NULL),('L!T���GZ�S��MS�','���jK¾K��u,4%','/�_��Mp�XT�|��','��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','SWDEMO10007.3',1000,'2020-04-28 16:31:01.741',NULL),('LU^R�?F{�%q����','���jK¾K��u,4%','/�_��Mp�XT�|��','���쨪L������\n�','���jK¾K��u,4%','SWDEMO10007.1',1000,'2020-04-28 16:31:01.741',NULL),('L�P� M.�ԔQ>�^&','���jK¾K��u,4%','/�_��Mp�XT�|��',':��)�KW��墟4w�','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('N����N����','���jK¾K��u,4%','/�_��Mp�XT�|��','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','with',700,'2020-04-28 16:31:01.741',NULL),('P��#29K��^�P2\"�','���jK¾K��u,4%','�/p�L���M�4�8','��me�qOq�RH�71>','���jK¾K��u,4%','SWDEMO10005.4',1000,'2020-04-28 16:31:01.703',NULL),('R�`�>�B����Ა','���jK¾K��u,4%','�/p�L���M�4�8','���쨪L������\n�','���jK¾K��u,4%','hauptprodukt',700,'2020-04-28 16:31:01.703',NULL),('U���L�z�j���','���jK¾K��u,4%','�/p�L���M�4�8','�X��� O��ό���','���jK¾K��u,4%','SWDEMO10005.6',1000,'2020-04-28 16:31:01.703',NULL),('UV�ExN��FBx_�A�','���jK¾K��u,4%','/�_��Mp�XT�|��','��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','main',700,'2020-04-28 16:31:01.741',NULL),('W�&:1L��M��H\'�','���jK¾K��u,4%','/�_��Mp�XT�|��','!FqG�䖴�I\0','���jK¾K��u,4%','variant',700,'2020-04-28 16:31:01.741',NULL),('X�n��Dq���E(G','���jK¾K��u,4%','/�_��Mp�XT�|��','�^��K��,_\0U@','���jK¾K��u,4%','main',700,'2020-04-28 16:31:01.741',NULL),('Y��lS�A�pց-��','���jK¾K��u,4%','�/p�L���M�4�8','�h@�OF�ˣT��g','���jK¾K��u,4%','SWDEMO10002',1000,'2020-04-28 16:31:01.703',NULL),('Z���þL��,qGJп','���jK¾K��u,4%','�/p�L���M�4�8','��me�qOq�RH�71>','���jK¾K��u,4%','variantenprodukt',700,'2020-04-28 16:31:01.703',NULL),('^��ґEL����h#�:','���jK¾K��u,4%','/�_��Mp�XT�|��','�h@�OF�ˣT��g','���jK¾K��u,4%','advanced',700,'2020-04-28 16:31:01.741',NULL),('e��=N�c��ȥ�2','���jK¾K��u,4%','/�_��Mp�XT�|��','�ZI���C��\r4E��-','���jK¾K��u,4%','properties',700,'2020-04-28 16:31:01.741',NULL),('i���O��`�	38','���jK¾K��u,4%','/�_��Mp�XT�|��',':��)�KW��墟4w�','���jK¾K��u,4%','SWDEMO10006',1000,'2020-04-28 16:31:01.741',NULL),('l�S�D����m���','���jK¾K��u,4%','�/p�L���M�4�8','�^��K��,_\0U@','���jK¾K��u,4%','hauptprodukt',700,'2020-04-28 16:31:01.703',NULL),('mqk8@_E�+3�f��','���jK¾K��u,4%','/�_��Mp�XT�|��','*�ٵ�GL~���qd��<','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('p��+w-M��y�e�<�','���jK¾K��u,4%','/�_��Mp�XT�|��','m3�A��G��||��|6�','���jK¾K��u,4%','SWDEMO10005.3',1000,'2020-04-28 16:31:01.741',NULL),('qu_��B���s�F','���jK¾K��u,4%','/�_��Mp�XT�|��','�X��� O��ό���','���jK¾K��u,4%','SWDEMO10005.6',1000,'2020-04-28 16:31:01.741',NULL),('t�hˉ7B��(�jة�','���jK¾K��u,4%','�/p�L���M�4�8','�ZI���C��\r4E��-','���jK¾K��u,4%','eigenschaften',700,'2020-04-28 16:31:01.703',NULL),('y(>12FJd�	�a37�','���jK¾K��u,4%','/�_��Mp�XT�|��','m3�A��G��||��|6�','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('z\'K�}�I���U��','���jK¾K��u,4%','/�_��Mp�XT�|��','�h@�OF�ˣT��g','���jK¾K��u,4%','prices',700,'2020-04-28 16:31:01.741',NULL),('z�}�f4M���x2�3','���jK¾K��u,4%','/�_��Mp�XT�|��','*�ٵ�GL~���qd��<','���jK¾K��u,4%','main',700,'2020-04-28 16:31:01.741',NULL),('�5��w@���$�|�','���jK¾K��u,4%','/�_��Mp�XT�|��','*�ٵ�GL~���qd��<','���jK¾K��u,4%','SWDEMO10001',1000,'2020-04-28 16:31:01.741',NULL),('�(Zv��O�6���R|v','���jK¾K��u,4%','/�_��Mp�XT�|��','�^��K��,_\0U@','���jK¾K��u,4%','SWDEMO100013',1000,'2020-04-28 16:31:01.741',NULL),('�����HP�Z��FE�','���jK¾K��u,4%','/�_��Mp�XT�|��','�h@�OF�ˣT��g','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('��9X�\rD��9I��O�','���jK¾K��u,4%','/�_��Mp�XT�|��','�h@�OF�ˣT��g','���jK¾K��u,4%','main',700,'2020-04-28 16:31:01.741',NULL),('���\\\nwN�^����A','���jK¾K��u,4%','/�_��Mp�XT�|��',':��)�KW��墟4w�','���jK¾K��u,4%','highlighting',700,'2020-04-28 16:31:01.741',NULL),('���H�N�����I','���jK¾K��u,4%','/�_��Mp�XT�|��','�ZI���C��\r4E��-','���jK¾K��u,4%','SWDEMO10007.4',1000,'2020-04-28 16:31:01.741',NULL),('���9Y�CӸw ҷ�','���jK¾K��u,4%','/�_��Mp�XT�|��','�ZI���C��\r4E��-','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('����eK+�3�n�մ','���jK¾K��u,4%','�/p�L���M�4�8','$k�. K�KX�KM�\n','���jK¾K��u,4%','SWDEMO10005.1',1000,'2020-04-28 16:31:01.703',NULL),('��~�J0��D�k-�','���jK¾K��u,4%','/�_��Mp�XT�|��','$k�. K�KX�KM�\n','���jK¾K��u,4%','variant',700,'2020-04-28 16:31:01.741',NULL),('��%�5�G��>�wka','���jK¾K��u,4%','�/p�L���M�4�8','�h@�OF�ˣT��g','���jK¾K��u,4%','preisen',700,'2020-04-28 16:31:01.703',NULL),('�:$	�C��+a���','���jK¾K��u,4%','�/p�L���M�4�8',':��)�KW��墟4w�','���jK¾K��u,4%','mit',700,'2020-04-28 16:31:01.703',NULL),('�P7��A��ճv�x�%','���jK¾K��u,4%','/�_��Mp�XT�|��','���쨪L������\n�','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('���>VO�7�5<\n','���jK¾K��u,4%','/�_��Mp�XT�|��','�ZI���C��\r4E��-','���jK¾K��u,4%','with',700,'2020-04-28 16:31:01.741',NULL),('�\n��<!E.���y@���','���jK¾K��u,4%','/�_��Mp�XT�|��',':��)�KW��墟4w�','���jK¾K��u,4%','shipping',700,'2020-04-28 16:31:01.741',NULL),('���Q�\\M �P�]��>','���jK¾K��u,4%','�/p�L���M�4�8','���쨪L������\n�','���jK¾K��u,4%','eigenschaften',700,'2020-04-28 16:31:01.703',NULL),('�T�SdN�|)��h�','���jK¾K��u,4%','�/p�L���M�4�8','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','mit',700,'2020-04-28 16:31:01.703',NULL),('���_PlD͛9��Lp�W','���jK¾K��u,4%','/�_��Mp�XT�|��','�^��K��,_\0U@','���jK¾K��u,4%','reviews',700,'2020-04-28 16:31:01.741',NULL),('��q^tMX�%��E0','���jK¾K��u,4%','/�_��Mp�XT�|��','�h@�OF�ˣT��g','���jK¾K��u,4%','SWDEMO10002',1000,'2020-04-28 16:31:01.741',NULL),('��gK�Kn�����s','���jK¾K��u,4%','/�_��Mp�XT�|��','��me�qOq�RH�71>','���jK¾K��u,4%','variant',700,'2020-04-28 16:31:01.741',NULL),('����\rwL���̇E}d�','���jK¾K��u,4%','�/p�L���M�4�8','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','hauptprodukt',700,'2020-04-28 16:31:01.703',NULL),('�՚�@���L��D��','���jK¾K��u,4%','�/p�L���M�4�8','m3�A��G��||��|6�','���jK¾K��u,4%','variantenprodukt',700,'2020-04-28 16:31:01.703',NULL),('�#���F+��<��ֵ','���jK¾K��u,4%','/�_��Mp�XT�|��','p��f*qC���M�','���jK¾K��u,4%','main',700,'2020-04-28 16:31:01.741',NULL),('���.�O1���,v��','���jK¾K��u,4%','�/p�L���M�4�8','$k�. K�KX�KM�\n','���jK¾K��u,4%','variantenprodukt',700,'2020-04-28 16:31:01.703',NULL),('��r�>It���~$7y','���jK¾K��u,4%','/�_��Mp�XT�|��','�^��K��,_\0U@','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('�Q<A��KC�HX�a7�','���jK¾K��u,4%','/�_��Mp�XT�|��','p��f*qC���M�','���jK¾K��u,4%','SWDEMO10007.2',1000,'2020-04-28 16:31:01.741',NULL),('�p��]Ey���n˧�~','���jK¾K��u,4%','�/p�L���M�4�8','8!ܪlVK���RFy�,','���jK¾K��u,4%','variantenprodukt',700,'2020-04-28 16:31:01.703',NULL),('�&�$Ey��6Z�\Z�O','���jK¾K��u,4%','�/p�L���M�4�8','��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','hauptprodukt',700,'2020-04-28 16:31:01.703',NULL),('�ؗ��3M6�����O�','���jK¾K��u,4%','�/p�L���M�4�8','p��f*qC���M�','���jK¾K��u,4%','mit',700,'2020-04-28 16:31:01.703',NULL),('����Be�[C�)��','���jK¾K��u,4%','/�_��Mp�XT�|��','$k�. K�KX�KM�\n','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('��ˣ\\�F���1��8E[','���jK¾K��u,4%','�/p�L���M�4�8','��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','eigenschaften',700,'2020-04-28 16:31:01.703',NULL),('����\\�OE���u�\r-�','���jK¾K��u,4%','/�_��Mp�XT�|��','p��f*qC���M�','���jK¾K��u,4%','with',700,'2020-04-28 16:31:01.741',NULL),('��#��7N��x���lF','���jK¾K��u,4%','/�_��Mp�XT�|��','��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','properties',700,'2020-04-28 16:31:01.741',NULL),('�Z\0���Lȱ$�m$','���jK¾K��u,4%','/�_��Mp�XT�|��','�X��� O��ό���','���jK¾K��u,4%','variant',700,'2020-04-28 16:31:01.741',NULL),('q��qI-�\\Qhn��','���jK¾K��u,4%','/�_��Mp�XT�|��','8!ܪlVK���RFy�,','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('�%�$MB�4�P��','���jK¾K��u,4%','�/p�L���M�4�8','*�ٵ�GL~���qd��<','���jK¾K��u,4%','SWDEMO10001',1000,'2020-04-28 16:31:01.703',NULL),('�p��ޚE�����	m','���jK¾K��u,4%','�/p�L���M�4�8','�^��K��,_\0U@','���jK¾K��u,4%','SWDEMO100013',1000,'2020-04-28 16:31:01.703',NULL),('ǓL]�D��[�U[,P','���jK¾K��u,4%','/�_��Mp�XT�|��','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','properties',700,'2020-04-28 16:31:01.741',NULL),('�e��&�E:���\'','���jK¾K��u,4%','/�_��Mp�XT�|��','p��f*qC���M�','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('�%�r��M|��ØPb','���jK¾K��u,4%','/�_��Mp�XT�|��','!FqG�䖴�I\0','���jK¾K��u,4%','product',700,'2020-04-28 16:31:01.741',NULL),('��W�@U�	�5Q\0','���jK¾K��u,4%','�/p�L���M�4�8','!FqG�䖴�I\0','���jK¾K��u,4%','SWDEMO10005.2',1000,'2020-04-28 16:31:01.703',NULL),('��clY�GW��2ߥ','���jK¾K��u,4%','/�_��Mp�XT�|��',':��)�KW��墟4w�','���jK¾K��u,4%','free',700,'2020-04-28 16:31:01.741',NULL),('�})�C������^�','���jK¾K��u,4%','/�_��Mp�XT�|��','8!ܪlVK���RFy�,','���jK¾K��u,4%','variant',700,'2020-04-28 16:31:01.741',NULL),('�?���MＡAY�K�j','���jK¾K��u,4%','�/p�L���M�4�8','�h@�OF�ˣT��g','���jK¾K��u,4%','erweiterten',700,'2020-04-28 16:31:01.703',NULL),('��w|��GU��FpCĵ�','���jK¾K��u,4%','/�_��Mp�XT�|��','��V\Z|�JΊj��ߙ1�','���jK¾K��u,4%','with',700,'2020-04-28 16:31:01.741',NULL),('�ȯ��mGˉ��I�=','���jK¾K��u,4%','�/p�L���M�4�8','���쨪L������\n�','���jK¾K��u,4%','SWDEMO10007.1',1000,'2020-04-28 16:31:01.703',NULL),('�z�>��F��y7-�','���jK¾K��u,4%','�/p�L���M�4�8','�X��� O��ό���','���jK¾K��u,4%','variantenprodukt',700,'2020-04-28 16:31:01.703',NULL),('���X�C��N��d�W�','���jK¾K��u,4%','/�_��Mp�XT�|��','p��f*qC���M�','���jK¾K��u,4%','properties',700,'2020-04-28 16:31:01.741',NULL),('���5=)MZ�76Nc[��','���jK¾K��u,4%','/�_��Mp�XT�|��','�ZI���C��\r4E��-','���jK¾K��u,4%','main',700,'2020-04-28 16:31:01.741',NULL),('�J�#U�E���m����n','���jK¾K��u,4%','�/p�L���M�4�8','C�>�L�`U�_��','���jK¾K��u,4%','SWDEMO10005',1000,'2020-04-28 16:31:01.703',NULL),('�4�?��O��0��#�','���jK¾K��u,4%','�/p�L���M�4�8','8!ܪlVK���RFy�,','���jK¾K��u,4%','SWDEMO10005.5',1000,'2020-04-28 16:31:01.703',NULL),('�=&�AN���c��U','���jK¾K��u,4%','�/p�L���M�4�8','p��f*qC���M�','���jK¾K��u,4%','eigenschaften',700,'2020-04-28 16:31:01.703',NULL),('�f����I����.��\"r','���jK¾K��u,4%','/�_��Mp�XT�|��','�^��K��,_\0U@','���jK¾K��u,4%','with',700,'2020-04-28 16:31:01.741',NULL),('�ʞ3\\OM�OY_oĸ�','���jK¾K��u,4%','�/p�L���M�4�8','���쨪L������\n�','���jK¾K��u,4%','mit',700,'2020-04-28 16:31:01.703',NULL),('�.���E��C|#	k�','���jK¾K��u,4%','�/p�L���M�4�8','�ZI���C��\r4E��-','���jK¾K��u,4%','mit',700,'2020-04-28 16:31:01.703',NULL),('�&�F\0K3���)e�','���jK¾K��u,4%','�/p�L���M�4�8',':��)�KW��墟4w�','���jK¾K��u,4%','SWDEMO10006',1000,'2020-04-28 16:31:01.703',NULL),('��;\n�K�ĩś�*','���jK¾K��u,4%','/�_��Mp�XT�|��','8!ܪlVK���RFy�,','���jK¾K��u,4%','SWDEMO10005.5',1000,'2020-04-28 16:31:01.741',NULL),('��ɼ�O{�ӽvCm�B','���jK¾K��u,4%','�/p�L���M�4�8','*�ٵ�GL~���qd��<','���jK¾K��u,4%','hauptartikel',700,'2020-04-28 16:31:01.703',NULL);
/*!40000 ALTER TABLE `product_search_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stream`
--

DROP TABLE IF EXISTS `product_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_stream` (
  `id` binary(16) NOT NULL,
  `api_filter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `invalid` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `json.product_stream.api_filter` CHECK (json_valid(`api_filter`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stream`
--

LOCK TABLES `product_stream` WRITE;
/*!40000 ALTER TABLE `product_stream` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stream_filter`
--

DROP TABLE IF EXISTS `product_stream_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_stream_filter` (
  `id` binary(16) NOT NULL,
  `product_stream_id` binary(16) NOT NULL,
  `parent_id` binary(16) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.product_stream_filter.product_stream_id` (`product_stream_id`),
  KEY `fk.product_stream_filter.parent_id` (`parent_id`),
  CONSTRAINT `fk.product_stream_filter.parent_id` FOREIGN KEY (`parent_id`) REFERENCES `product_stream_filter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_stream_filter.product_stream_id` FOREIGN KEY (`product_stream_id`) REFERENCES `product_stream` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.product_stream_filter.parameters` CHECK (json_valid(`parameters`)),
  CONSTRAINT `json.product_stream_filter.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stream_filter`
--

LOCK TABLES `product_stream_filter` WRITE;
/*!40000 ALTER TABLE `product_stream_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_stream_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stream_translation`
--

DROP TABLE IF EXISTS `product_stream_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_stream_translation` (
  `product_stream_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`product_stream_id`,`language_id`),
  KEY `fk.product_stream_translation.language_id` (`language_id`),
  CONSTRAINT `fk.product_stream_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_stream_translation.product_stream_id` FOREIGN KEY (`product_stream_id`) REFERENCES `product_stream` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.product_stream_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stream_translation`
--

LOCK TABLES `product_stream_translation` WRITE;
/*!40000 ALTER TABLE `product_stream_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_stream_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tag` (
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `tag_id` binary(16) NOT NULL,
  PRIMARY KEY (`product_id`,`product_version_id`,`tag_id`),
  KEY `fk.product_tag.tag_id` (`tag_id`),
  CONSTRAINT `fk.product_tag.product_version_id__product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_tag.tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag`
--

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_translation`
--

DROP TABLE IF EXISTS `product_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_translation` (
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pack_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`product_version_id`,`language_id`),
  KEY `fk.product_translation.language_id` (`language_id`),
  CONSTRAINT `fk.product_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_translation.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.product_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_translation`
--

LOCK TABLES `product_translation` WRITE;
/*!40000 ALTER TABLE `product_translation` DISABLE KEYS */;
INSERT INTO `product_translation` VALUES ('�h@�OF�ˣT��g','���jK¾K��u,4%','/�_��Mp�XT�|��',NULL,'Main product with advanced prices',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:18.648',NULL),('�h@�OF�ˣT��g','���jK¾K��u,4%','�/p�L���M�4�8',NULL,'Hauptprodukt mit erweiterten Preisen',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:18.648',NULL),('�^��K��,_\0U@','���jK¾K��u,4%','/�_��Mp�XT�|��',NULL,'Main product with reviews',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:18.790',NULL),('�^��K��,_\0U@','���jK¾K��u,4%','�/p�L���M�4�8',NULL,'Hauptprodukt mit Bewertungen',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:18.789',NULL),('*�ٵ�GL~���qd��<','���jK¾K��u,4%','/�_��Mp�XT�|��',NULL,'Main product',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:18.894',NULL),('*�ٵ�GL~���qd��<','���jK¾K��u,4%','�/p�L���M�4�8',NULL,'Hauptartikel',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:18.893',NULL),(':��)�KW��墟4w�','���jK¾K��u,4%','/�_��Mp�XT�|��',NULL,'Main product, free shipping with highlighting',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:18.985',NULL),(':��)�KW��墟4w�','���jK¾K��u,4%','�/p�L���M�4�8',NULL,'Hauptprodukt, versandkostenfrei mit Hervorhebung',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:18.983',NULL),('C�>�L�`U�_��','���jK¾K��u,4%','/�_��Mp�XT�|��',NULL,'Variant product',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:19.091',NULL),('C�>�L�`U�_��','���jK¾K��u,4%','�/p�L���M�4�8',NULL,'Variantenprodukt',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:19.089',NULL),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','/�_��Mp�XT�|��',NULL,'Main product with properties',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:19.275',NULL),('Ǽ�\'S�M��P+AF','���jK¾K��u,4%','�/p�L���M�4�8',NULL,'Hauptprodukt mit Eigenschaften',NULL,'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',NULL,NULL,NULL,'2020-04-04 21:05:19.274',NULL);
/*!40000 ALTER TABLE `product_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_visibility`
--

DROP TABLE IF EXISTS `product_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_visibility` (
  `id` binary(16) NOT NULL,
  `product_id` binary(16) NOT NULL,
  `product_version_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  `visibility` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.product_id__sales_channel_id` (`product_id`,`product_version_id`,`sales_channel_id`),
  KEY `idx.product_visibility.product_id` (`product_id`,`product_version_id`),
  KEY `idx.product_visibility.sales_channel_id` (`sales_channel_id`),
  CONSTRAINT `fk.product_visibility.product_id` FOREIGN KEY (`product_id`, `product_version_id`) REFERENCES `product` (`id`, `version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.product_visibility.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_visibility`
--

LOCK TABLES `product_visibility` WRITE;
/*!40000 ALTER TABLE `product_visibility` DISABLE KEYS */;
INSERT INTO `product_visibility` VALUES ('?��.�mAb�Z���dO?','*�ٵ�GL~���qd��<','���jK¾K��u,4%','7�>�R�Kޚ��t�\"ð',30,'2020-04-04 21:05:18.897',NULL),('c`T��F��ʤx^��','Ǽ�\'S�M��P+AF','���jK¾K��u,4%','7�>�R�Kޚ��t�\"ð',30,'2020-04-04 21:05:19.280',NULL),('gp����N@�\0�>4�|�','�^��K��,_\0U@','���jK¾K��u,4%','7�>�R�Kޚ��t�\"ð',30,'2020-04-04 21:05:18.795',NULL),('���C\Z�Kr�>��j�Q','�h@�OF�ˣT��g','���jK¾K��u,4%','7�>�R�Kޚ��t�\"ð',30,'2020-04-04 21:05:18.657',NULL),('��Q(K��0����B','C�>�L�`U�_��','���jK¾K��u,4%','7�>�R�Kޚ��t�\"ð',30,'2020-04-04 21:05:19.097',NULL),('�/�У�Ga�4~La#�H',':��)�KW��墟4w�','���jK¾K��u,4%','7�>�R�Kޚ��t�\"ð',30,'2020-04-04 21:05:18.988',NULL);
/*!40000 ALTER TABLE `product_visibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `id` binary(16) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `valid_from` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `max_redemptions_global` int(11) NOT NULL DEFAULT 1,
  `max_redemptions_per_customer` int(11) NOT NULL DEFAULT 1,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `orders_per_customer_count` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `exclusive` tinyint(1) NOT NULL DEFAULT 0,
  `code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `use_codes` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `customer_restriction` tinyint(1) NOT NULL DEFAULT 0,
  `exclusion_ids` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `use_individual_codes` tinyint(1) NOT NULL DEFAULT 0,
  `individual_code_pattern` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `use_setgroups` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `individual_code_pattern` (`individual_code_pattern`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_cart_rule`
--

DROP TABLE IF EXISTS `promotion_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_cart_rule` (
  `promotion_id` binary(16) NOT NULL,
  `rule_id` binary(16) NOT NULL,
  PRIMARY KEY (`promotion_id`,`rule_id`),
  KEY `fk.promotion_cart_rule.rule_id` (`rule_id`),
  CONSTRAINT `fk.promotion_cart_rule.promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk.promotion_cart_rule.rule_id` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_cart_rule`
--

LOCK TABLES `promotion_cart_rule` WRITE;
/*!40000 ALTER TABLE `promotion_cart_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_discount`
--

DROP TABLE IF EXISTS `promotion_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_discount` (
  `id` binary(16) NOT NULL,
  `promotion_id` binary(16) NOT NULL,
  `scope` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `consider_advanced_rules` tinyint(1) NOT NULL DEFAULT 0,
  `max_value` float DEFAULT NULL,
  `sorter_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applier_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx.promotion_discount.promotion_id` (`promotion_id`),
  CONSTRAINT `fk.promotion_discount.promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_discount`
--

LOCK TABLES `promotion_discount` WRITE;
/*!40000 ALTER TABLE `promotion_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_discount_prices`
--

DROP TABLE IF EXISTS `promotion_discount_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_discount_prices` (
  `id` binary(16) NOT NULL,
  `discount_id` binary(16) NOT NULL,
  `currency_id` binary(16) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.promotion_discount_prices.discount_id` (`discount_id`),
  KEY `fk.promotion_discount_prices.currency_id` (`currency_id`),
  CONSTRAINT `fk.promotion_discount_prices.currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.promotion_discount_prices.discount_id` FOREIGN KEY (`discount_id`) REFERENCES `promotion_discount` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_discount_prices`
--

LOCK TABLES `promotion_discount_prices` WRITE;
/*!40000 ALTER TABLE `promotion_discount_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_discount_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_discount_rule`
--

DROP TABLE IF EXISTS `promotion_discount_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_discount_rule` (
  `discount_id` binary(16) NOT NULL,
  `rule_id` binary(16) NOT NULL,
  PRIMARY KEY (`discount_id`,`rule_id`),
  KEY `fk.promotion_discount_rule.rule_id` (`rule_id`),
  CONSTRAINT `fk.promotion_discount_rule.promotion_id` FOREIGN KEY (`discount_id`) REFERENCES `promotion_discount` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk.promotion_discount_rule.rule_id` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_discount_rule`
--

LOCK TABLES `promotion_discount_rule` WRITE;
/*!40000 ALTER TABLE `promotion_discount_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_discount_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_individual_code`
--

DROP TABLE IF EXISTS `promotion_individual_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_individual_code` (
  `id` binary(16) NOT NULL,
  `promotion_id` binary(16) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `idx.promotion_individual_code.promotion_id` (`promotion_id`),
  CONSTRAINT `fk.promotion_individual_code.promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_individual_code`
--

LOCK TABLES `promotion_individual_code` WRITE;
/*!40000 ALTER TABLE `promotion_individual_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_individual_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_order_rule`
--

DROP TABLE IF EXISTS `promotion_order_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_order_rule` (
  `promotion_id` binary(16) NOT NULL,
  `rule_id` binary(16) NOT NULL,
  PRIMARY KEY (`promotion_id`,`rule_id`),
  KEY `fk.promotion_order_rule.rule_id` (`rule_id`),
  CONSTRAINT `fk.promotion_order_rule.promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk.promotion_order_rule.rule_id` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_order_rule`
--

LOCK TABLES `promotion_order_rule` WRITE;
/*!40000 ALTER TABLE `promotion_order_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_order_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_persona_customer`
--

DROP TABLE IF EXISTS `promotion_persona_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_persona_customer` (
  `promotion_id` binary(16) NOT NULL,
  `customer_id` binary(16) NOT NULL,
  PRIMARY KEY (`promotion_id`,`customer_id`),
  KEY `fk.promotion_persona_customer.customer_id` (`customer_id`),
  CONSTRAINT `fk.promotion_persona_customer.customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk.promotion_persona_customer.promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_persona_customer`
--

LOCK TABLES `promotion_persona_customer` WRITE;
/*!40000 ALTER TABLE `promotion_persona_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_persona_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_persona_rule`
--

DROP TABLE IF EXISTS `promotion_persona_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_persona_rule` (
  `promotion_id` binary(16) NOT NULL,
  `rule_id` binary(16) NOT NULL,
  PRIMARY KEY (`promotion_id`,`rule_id`),
  KEY `fk.promotion_persona_rule.rule_id` (`rule_id`),
  CONSTRAINT `fk.promotion_persona_rule.promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk.promotion_persona_rule.rule_id` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_persona_rule`
--

LOCK TABLES `promotion_persona_rule` WRITE;
/*!40000 ALTER TABLE `promotion_persona_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_persona_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_sales_channel`
--

DROP TABLE IF EXISTS `promotion_sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_sales_channel` (
  `id` binary(16) NOT NULL,
  `promotion_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx.promotion_sales_channel.sales_channel_id` (`sales_channel_id`),
  KEY `idx.promotion_sales_channel.promotion_id` (`promotion_id`),
  CONSTRAINT `fk.promotion_sales_channel.promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.promotion_sales_channel.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_sales_channel`
--

LOCK TABLES `promotion_sales_channel` WRITE;
/*!40000 ALTER TABLE `promotion_sales_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_setgroup`
--

DROP TABLE IF EXISTS `promotion_setgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_setgroup` (
  `id` binary(16) NOT NULL,
  `promotion_id` binary(16) NOT NULL,
  `packager_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorter_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx.promotion_setgroup.promotion_id` (`promotion_id`),
  CONSTRAINT `fk.promotion_setgroup.promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_setgroup`
--

LOCK TABLES `promotion_setgroup` WRITE;
/*!40000 ALTER TABLE `promotion_setgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_setgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_setgroup_rule`
--

DROP TABLE IF EXISTS `promotion_setgroup_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_setgroup_rule` (
  `setgroup_id` binary(16) NOT NULL,
  `rule_id` binary(16) NOT NULL,
  PRIMARY KEY (`setgroup_id`,`rule_id`),
  KEY `fk.promotion_setgroup_rule.rule_id` (`rule_id`),
  CONSTRAINT `fk.promotion_setgroup_rule.rule_id` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk.promotion_setgroup_rule.setgroup_id` FOREIGN KEY (`setgroup_id`) REFERENCES `promotion_setgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_setgroup_rule`
--

LOCK TABLES `promotion_setgroup_rule` WRITE;
/*!40000 ALTER TABLE `promotion_setgroup_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_setgroup_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_translation`
--

DROP TABLE IF EXISTS `promotion_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_translation` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotion_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`promotion_id`,`language_id`),
  KEY `fk.promotion_translation.promotion_id` (`promotion_id`),
  KEY `fk.promotion_translation.language_id` (`language_id`),
  CONSTRAINT `fk.promotion_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.promotion_translation.promotion_id` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_translation`
--

LOCK TABLES `promotion_translation` WRITE;
/*!40000 ALTER TABLE `promotion_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_group`
--

DROP TABLE IF EXISTS `property_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_group` (
  `id` binary(16) NOT NULL,
  `sorting_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'alphanumeric',
  `display_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_group`
--

LOCK TABLES `property_group` WRITE;
/*!40000 ALTER TABLE `property_group` DISABLE KEYS */;
INSERT INTO `property_group` VALUES ('W�0�dHȏ��1�m�','alphanumeric','text','2020-04-04 21:05:18.511',NULL),('&�~@�JF.�N�\0L_{�','alphanumeric','color','2020-04-04 21:05:18.539',NULL),('D�=r�?Jȯ���9��','alphanumeric','text','2020-04-04 21:05:18.567',NULL),('u�S���K􎊚��B+','alphanumeric','text','2020-04-04 21:05:18.595',NULL),('�|ݖ\'�H��͑���n2','alphanumeric','text','2020-04-04 21:05:18.623',NULL);
/*!40000 ALTER TABLE `property_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_group_option`
--

DROP TABLE IF EXISTS `property_group_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_group_option` (
  `id` binary(16) NOT NULL,
  `property_group_id` binary(16) NOT NULL,
  `color_hex_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.property_group_option.property_group_id` (`property_group_id`),
  KEY `fk.property_group_option.media_id` (`media_id`),
  CONSTRAINT `fk.property_group_option.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk.property_group_option.property_group_id` FOREIGN KEY (`property_group_id`) REFERENCES `property_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_group_option`
--

LOCK TABLES `property_group_option` WRITE;
/*!40000 ALTER TABLE `property_group_option` DISABLE KEYS */;
INSERT INTO `property_group_option` VALUES ('\"���U�L����in�,','D�=r�?Jȯ���9��',NULL,NULL,'2020-04-04 21:05:18.558',NULL),('+�\'�� H���J>�ݐ','&�~@�JF.�N�\0L_{�','#0000ffff',NULL,'2020-04-04 21:05:18.533',NULL),('2}l&M{�y��f�#','D�=r�?Jȯ���9��',NULL,NULL,'2020-04-04 21:05:18.560',NULL),('4oŰCFL�����Z�3','D�=r�?Jȯ���9��',NULL,NULL,'2020-04-04 21:05:18.562',NULL),('A�;g�M:���uڊ�A','u�S���K􎊚��B+',NULL,NULL,'2020-04-04 21:05:18.588',NULL),('Q���ކH������&�+','�|ݖ\'�H��͑���n2',NULL,NULL,'2020-04-04 21:05:18.612',NULL),('REM���B���)oEJ','&�~@�JF.�N�\0L_{�','#ff0000ff',NULL,'2020-04-04 21:05:18.536',NULL),('Tv���CA�m�l�D�','u�S���K􎊚��B+',NULL,NULL,'2020-04-04 21:05:18.593',NULL),('Y���xI���h�Š�','u�S���K􎊚��B+',NULL,NULL,'2020-04-04 21:05:18.590',NULL),('g<�$j�G���!�;','D�=r�?Jȯ���9��',NULL,NULL,'2020-04-04 21:05:18.563',NULL),('o�Y#��KH��(.�qM','W�0�dHȏ��1�m�',NULL,NULL,'2020-04-04 21:05:18.511',NULL),('wBOu�@ȥvW�­I�','D�=r�?Jȯ���9��',NULL,NULL,'2020-04-04 21:05:18.565',NULL),('x�??m�N��yxA[�t�','W�0�dHȏ��1�m�',NULL,NULL,'2020-04-04 21:05:18.507',NULL),('|��Z�B�2Qn�}','W�0�dHȏ��1�m�',NULL,NULL,'2020-04-04 21:05:18.509',NULL),('�c�z�G���dz�\n>','�|ݖ\'�H��͑���n2',NULL,NULL,'2020-04-04 21:05:18.614',NULL),('��v�wI`���o�V?�','�|ݖ\'�H��͑���n2',NULL,NULL,'2020-04-04 21:05:18.615',NULL),('��u��(H�Gv�','u�S���K􎊚��B+',NULL,NULL,'2020-04-04 21:05:18.595',NULL),('�sZ���B���sĨ�','&�~@�JF.�N�\0L_{�','#ffffffff',NULL,'2020-04-04 21:05:18.539',NULL),('�mh�|�CɌx7X���\n','�|ݖ\'�H��͑���n2',NULL,NULL,'2020-04-04 21:05:18.616',NULL),('�?�\r�J��Qok�.�','�|ݖ\'�H��͑���n2',NULL,NULL,'2020-04-04 21:05:18.619',NULL),('�ט�lv@���7�+���','D�=r�?Jȯ���9��',NULL,NULL,'2020-04-04 21:05:18.567',NULL),('�o���HR��x���}','�|ݖ\'�H��͑���n2',NULL,NULL,'2020-04-04 21:05:18.621',NULL),('߫�R�Mz������r','�|ݖ\'�H��͑���n2',NULL,NULL,'2020-04-04 21:05:18.623',NULL);
/*!40000 ALTER TABLE `property_group_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_group_option_translation`
--

DROP TABLE IF EXISTS `property_group_option_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_group_option_translation` (
  `property_group_option_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`property_group_option_id`,`language_id`),
  KEY `fk.property_group_option_translation.language_id` (`language_id`),
  CONSTRAINT `fk.property_group_option_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.property_group_option_translation.prop_group_option_id` FOREIGN KEY (`property_group_option_id`) REFERENCES `property_group_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.property_group_option_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_group_option_translation`
--

LOCK TABLES `property_group_option_translation` WRITE;
/*!40000 ALTER TABLE `property_group_option_translation` DISABLE KEYS */;
INSERT INTO `property_group_option_translation` VALUES ('\"���U�L����in�,','/�_��Mp�XT�|��','Sugar',1,NULL,'2020-04-04 21:05:18.558',NULL),('\"���U�L����in�,','�/p�L���M�4�8','Zucker',1,NULL,'2020-04-04 21:05:18.558',NULL),('+�\'�� H���J>�ݐ','/�_��Mp�XT�|��','Blue',1,NULL,'2020-04-04 21:05:18.533',NULL),('+�\'�� H���J>�ݐ','�/p�L���M�4�8','Blau',1,NULL,'2020-04-04 21:05:18.532',NULL),('2}l&M{�y��f�#','/�_��Mp�XT�|��','Fish',1,NULL,'2020-04-04 21:05:18.560',NULL),('2}l&M{�y��f�#','�/p�L���M�4�8','Fisch',1,NULL,'2020-04-04 21:05:18.560',NULL),('4oŰCFL�����Z�3','/�_��Mp�XT�|��','Wheat',1,NULL,'2020-04-04 21:05:18.562',NULL),('4oŰCFL�����Z�3','�/p�L���M�4�8','Weizen',1,NULL,'2020-04-04 21:05:18.561',NULL),('A�;g�M:���uڊ�A','/�_��Mp�XT�|��','S',1,NULL,'2020-04-04 21:05:18.587',NULL),('A�;g�M:���uڊ�A','�/p�L���M�4�8','S',1,NULL,'2020-04-04 21:05:18.586',NULL),('Q���ކH������&�+','/�_��Mp�XT�|��','Polyester',1,NULL,'2020-04-04 21:05:18.612',NULL),('Q���ކH������&�+','�/p�L���M�4�8','Polyester',1,NULL,'2020-04-04 21:05:18.612',NULL),('REM���B���)oEJ','/�_��Mp�XT�|��','Red',1,NULL,'2020-04-04 21:05:18.535',NULL),('REM���B���)oEJ','�/p�L���M�4�8','Rot',1,NULL,'2020-04-04 21:05:18.534',NULL),('Tv���CA�m�l�D�','/�_��Mp�XT�|��','L',1,NULL,'2020-04-04 21:05:18.592',NULL),('Tv���CA�m�l�D�','�/p�L���M�4�8','L',1,NULL,'2020-04-04 21:05:18.592',NULL),('Y���xI���h�Š�','/�_��Mp�XT�|��','M',1,NULL,'2020-04-04 21:05:18.590',NULL),('Y���xI���h�Š�','�/p�L���M�4�8','M',1,NULL,'2020-04-04 21:05:18.589',NULL),('g<�$j�G���!�;','/�_��Mp�XT�|��','Salt',1,NULL,'2020-04-04 21:05:18.563',NULL),('g<�$j�G���!�;','�/p�L���M�4�8','Salz',1,NULL,'2020-04-04 21:05:18.563',NULL),('o�Y#��KH��(.�qM','/�_��Mp�XT�|��','Children',1,NULL,'2020-04-04 21:05:18.511',NULL),('o�Y#��KH��(.�qM','�/p�L���M�4�8','Kinder',1,NULL,'2020-04-04 21:05:18.510',NULL),('wBOu�@ȥvW�­I�','/�_��Mp�XT�|��','Milk',1,NULL,'2020-04-04 21:05:18.565',NULL),('wBOu�@ȥvW�­I�','�/p�L���M�4�8','Milch',1,NULL,'2020-04-04 21:05:18.564',NULL),('x�??m�N��yxA[�t�','/�_��Mp�XT�|��','Man',1,NULL,'2020-04-04 21:05:18.507',NULL),('x�??m�N��yxA[�t�','�/p�L���M�4�8','Mann',1,NULL,'2020-04-04 21:05:18.506',NULL),('|��Z�B�2Qn�}','/�_��Mp�XT�|��','Woman',1,NULL,'2020-04-04 21:05:18.509',NULL),('|��Z�B�2Qn�}','�/p�L���M�4�8','Frau',1,NULL,'2020-04-04 21:05:18.508',NULL),('�c�z�G���dz�\n>','/�_��Mp�XT�|��','Cotton',1,NULL,'2020-04-04 21:05:18.614',NULL),('�c�z�G���dz�\n>','�/p�L���M�4�8','Baumwolle',1,NULL,'2020-04-04 21:05:18.613',NULL),('��v�wI`���o�V?�','/�_��Mp�XT�|��','Silk',1,NULL,'2020-04-04 21:05:18.615',NULL),('��v�wI`���o�V?�','�/p�L���M�4�8','Seide',1,NULL,'2020-04-04 21:05:18.614',NULL),('��u��(H�Gv�','/�_��Mp�XT�|��','XL',1,NULL,'2020-04-04 21:05:18.595',NULL),('��u��(H�Gv�','�/p�L���M�4�8','XL',1,NULL,'2020-04-04 21:05:18.594',NULL),('�sZ���B���sĨ�','/�_��Mp�XT�|��','White',1,NULL,'2020-04-04 21:05:18.538',NULL),('�sZ���B���sĨ�','�/p�L���M�4�8','Weiß',1,NULL,'2020-04-04 21:05:18.537',NULL),('�mh�|�CɌx7X���\n','/�_��Mp�XT�|��','Stainless steel',1,NULL,'2020-04-04 21:05:18.616',NULL),('�mh�|�CɌx7X���\n','�/p�L���M�4�8','Edelstahl',1,NULL,'2020-04-04 21:05:18.615',NULL),('�?�\r�J��Qok�.�','/�_��Mp�XT�|��','Leather',1,NULL,'2020-04-04 21:05:18.618',NULL),('�?�\r�J��Qok�.�','�/p�L���M�4�8','Leder',1,NULL,'2020-04-04 21:05:18.618',NULL),('�ט�lv@���7�+���','/�_��Mp�XT�|��','Pepper',1,NULL,'2020-04-04 21:05:18.566',NULL),('�ט�lv@���7�+���','�/p�L���M�4�8','Pfeffer',1,NULL,'2020-04-04 21:05:18.566',NULL),('�o���HR��x���}','/�_��Mp�XT�|��','Plastic',1,NULL,'2020-04-04 21:05:18.621',NULL),('�o���HR��x���}','�/p�L���M�4�8','Kunstoff',1,NULL,'2020-04-04 21:05:18.620',NULL),('߫�R�Mz������r','/�_��Mp�XT�|��','Nylon',1,NULL,'2020-04-04 21:05:18.623',NULL),('߫�R�Mz������r','�/p�L���M�4�8','Nylon',1,NULL,'2020-04-04 21:05:18.622',NULL);
/*!40000 ALTER TABLE `property_group_option_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_group_translation`
--

DROP TABLE IF EXISTS `property_group_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_group_translation` (
  `property_group_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT 1,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`property_group_id`,`language_id`),
  KEY `fk.property_group_translation.language_id` (`language_id`),
  CONSTRAINT `fk.property_group_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.property_group_translation.property_group_id` FOREIGN KEY (`property_group_id`) REFERENCES `property_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.property_group_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_group_translation`
--

LOCK TABLES `property_group_translation` WRITE;
/*!40000 ALTER TABLE `property_group_translation` DISABLE KEYS */;
INSERT INTO `property_group_translation` VALUES ('W�0�dHȏ��1�m�','/�_��Mp�XT�|��','Target group',NULL,1,NULL,'2020-04-04 21:05:18.504',NULL),('W�0�dHȏ��1�m�','�/p�L���M�4�8','Zielgruppe',NULL,1,NULL,'2020-04-04 21:05:18.503',NULL),('&�~@�JF.�N�\0L_{�','/�_��Mp�XT�|��','Colour',NULL,1,NULL,'2020-04-04 21:05:18.531',NULL),('&�~@�JF.�N�\0L_{�','�/p�L���M�4�8','Farbe',NULL,1,NULL,'2020-04-04 21:05:18.531',NULL),('D�=r�?Jȯ���9��','/�_��Mp�XT�|��','Ingredients',NULL,1,NULL,'2020-04-04 21:05:18.556',NULL),('D�=r�?Jȯ���9��','�/p�L���M�4�8','Zutaten',NULL,1,NULL,'2020-04-04 21:05:18.555',NULL),('u�S���K􎊚��B+','/�_��Mp�XT�|��','Size',NULL,1,NULL,'2020-04-04 21:05:18.584',NULL),('u�S���K􎊚��B+','�/p�L���M�4�8','Größe',NULL,1,NULL,'2020-04-04 21:05:18.583',NULL),('�|ݖ\'�H��͑���n2','/�_��Mp�XT�|��','Material',NULL,1,NULL,'2020-04-04 21:05:18.610',NULL),('�|ݖ\'�H��͑���n2','�/p�L���M�4�8','Material',NULL,1,NULL,'2020-04-04 21:05:18.610',NULL);
/*!40000 ALTER TABLE `property_group_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refresh_token` (
  `id` binary(16) NOT NULL,
  `user_id` binary(16) NOT NULL,
  `token_id` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_at` datetime(3) NOT NULL,
  `expires_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.token_id` (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `id` binary(16) NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `payload` longblob DEFAULT NULL,
  `invalid` tinyint(1) NOT NULL DEFAULT 0,
  `module_types` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `json.rule.module_types` CHECK (json_valid(`module_types`)),
  CONSTRAINT `json.rule.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES ('\"n*n�XL��^k�ؐǘ','Cart >= 0 (Payment)',NULL,100,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:47:\"Shopware\\Core\\Checkout\\Cart\\Rule\\CartAmountRule\":4:{s:9:\"\0*\0amount\";i:0;s:11:\"\0*\0operator\";s:2:\">=\";s:8:\"\0*\0_name\";s:14:\"cartCartAmount\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:03:14.383',NULL),('(ʮu�bO\r�Z��*�`','Alle Kunden der Standard-Kundengruppe',NULL,1,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:45:\"Shopware\\Core\\Framework\\Rule\\Container\\OrRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:54:\"Shopware\\Core\\Checkout\\Customer\\Rule\\CustomerGroupRule\":4:{s:19:\"\0*\0customerGroupIds\";a:1:{i:0;s:32:\"cfbd5018d38d41d8adca10d94fc8bdd6\";}s:11:\"\0*\0operator\";s:1:\"=\";s:8:\"\0*\0_name\";s:21:\"customerCustomerGroup\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:11:\"orContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:05:18.418',NULL),('8X�pdM�H�P���','Warenkorbwert größer/gleich 0 (Zahlungsarten)',NULL,100,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:45:\"Shopware\\Core\\Framework\\Rule\\Container\\OrRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:47:\"Shopware\\Core\\Checkout\\Cart\\Rule\\CartAmountRule\":4:{s:9:\"\0*\0amount\";i:0;s:11:\"\0*\0operator\";s:2:\">=\";s:8:\"\0*\0_name\";s:14:\"cartCartAmount\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:11:\"orContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:05:18.430',NULL),('<�A6�mJ/�\n�hze�-','Ist Sonntag',NULL,2,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:45:\"Shopware\\Core\\Framework\\Rule\\Container\\OrRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:40:\"Shopware\\Core\\Framework\\Rule\\WeekdayRule\":4:{s:11:\"\0*\0operator\";s:1:\"=\";s:12:\"\0*\0dayOfWeek\";i:7;s:8:\"\0*\0_name\";s:9:\"dayOfWeek\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:11:\"orContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:05:18.460',NULL),('R5��3�OS���.����','Sunday sales',NULL,2,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:40:\"Shopware\\Core\\Framework\\Rule\\WeekdayRule\":4:{s:11:\"\0*\0operator\";s:1:\"=\";s:12:\"\0*\0dayOfWeek\";i:7;s:8:\"\0*\0_name\";s:9:\"dayOfWeek\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:03:14.404',NULL),('�.j\ZE�@bp�qI','Kunden aus den USA',NULL,100,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:45:\"Shopware\\Core\\Framework\\Rule\\Container\\OrRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:55:\"Shopware\\Core\\Checkout\\Customer\\Rule\\BillingCountryRule\":4:{s:13:\"\0*\0countryIds\";a:1:{i:0;s:32:\"ba07768a515746af9d33ed0d4ba836cd\";}s:11:\"\0*\0operator\";s:1:\"=\";s:8:\"\0*\0_name\";s:22:\"customerBillingCountry\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:11:\"orContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:05:18.476',NULL),('�e���A��T��$���','PayPalPuiAvailabilityRule','Determines whether or not the PayPal - Pay upon invoice payment method is available for the given rule context.',1,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:4:{i:0;O:47:\"Shopware\\Core\\Checkout\\Cart\\Rule\\CartAmountRule\":4:{s:9:\"\0*\0amount\";d:2;s:11:\"\0*\0operator\";s:2:\">=\";s:8:\"\0*\0_name\";s:14:\"cartCartAmount\";s:13:\"\0*\0extensions\";a:0:{}}i:1;O:55:\"Shopware\\Core\\Checkout\\Customer\\Rule\\BillingCountryRule\":4:{s:13:\"\0*\0countryIds\";a:1:{i:0;s:32:\"851f0cf33e2c4ab2987fbe23d8ff6112\";}s:11:\"\0*\0operator\";s:1:\"=\";s:8:\"\0*\0_name\";s:22:\"customerBillingCountry\";s:13:\"\0*\0extensions\";a:0:{}}i:2;O:47:\"Shopware\\Core\\Checkout\\Cart\\Rule\\CartAmountRule\":4:{s:9:\"\0*\0amount\";d:1470;s:11:\"\0*\0operator\";s:2:\"<=\";s:8:\"\0*\0_name\";s:14:\"cartCartAmount\";s:13:\"\0*\0extensions\";a:0:{}}i:3;O:50:\"Shopware\\Core\\Checkout\\Customer\\Rule\\IsCompanyRule\":3:{s:12:\"\0*\0isCompany\";b:0;s:8:\"\0*\0_name\";s:17:\"customerIsCompany\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:05:47.365',NULL),('��=E�nEF�\0,�\rt��','All customers',NULL,1,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:54:\"Shopware\\Core\\Checkout\\Customer\\Rule\\CustomerGroupRule\":4:{s:19:\"\0*\0customerGroupIds\";a:1:{i:0;s:32:\"cfbd5018d38d41d8adca10d94fc8bdd6\";}s:11:\"\0*\0operator\";s:1:\"=\";s:8:\"\0*\0_name\";s:21:\"customerCustomerGroup\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:03:14.404',NULL),('�Bo�F�dd��v��','Always valid (Default)',NULL,100,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:48:\"Shopware\\Core\\Checkout\\Cart\\Rule\\AlwaysValidRule\":3:{s:8:\"\0*\0_name\";s:11:\"alwaysValid\";s:13:\"\0*\0extensions\";a:0:{}s:13:\"isAlwaysValid\";b:1;}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-28 16:30:56.761',NULL),('׳���Jȯ�?M�m�','Customers from USA',NULL,100,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:55:\"Shopware\\Core\\Checkout\\Customer\\Rule\\BillingCountryRule\":4:{s:13:\"\0*\0countryIds\";a:1:{i:0;s:32:\"ba07768a515746af9d33ed0d4ba836cd\";}s:11:\"\0*\0operator\";s:1:\"=\";s:8:\"\0*\0_name\";s:22:\"customerBillingCountry\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:03:14.405',NULL),('�Xl�ڣCf��l�8��','Cart >= 0',NULL,100,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:47:\"Shopware\\Core\\Checkout\\Cart\\Rule\\CartAmountRule\":4:{s:9:\"\0*\0amount\";i:0;s:11:\"\0*\0operator\";s:2:\">=\";s:8:\"\0*\0_name\";s:14:\"cartCartAmount\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:03:14.389',NULL),('�7����G���\rt\r]l\Z','Warenkorbwert größer/gleich 0',NULL,100,'O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:45:\"Shopware\\Core\\Framework\\Rule\\Container\\OrRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:46:\"Shopware\\Core\\Framework\\Rule\\Container\\AndRule\":3:{s:8:\"\0*\0rules\";a:1:{i:0;O:47:\"Shopware\\Core\\Checkout\\Cart\\Rule\\CartAmountRule\":4:{s:9:\"\0*\0amount\";i:0;s:11:\"\0*\0operator\";s:2:\">=\";s:8:\"\0*\0_name\";s:14:\"cartCartAmount\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:11:\"orContainer\";s:13:\"\0*\0extensions\";a:0:{}}}s:8:\"\0*\0_name\";s:12:\"andContainer\";s:13:\"\0*\0extensions\";a:0:{}}',0,NULL,NULL,'2020-04-04 21:05:18.487',NULL);
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_condition`
--

DROP TABLE IF EXISTS `rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_condition` (
  `id` binary(16) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_id` binary(16) NOT NULL,
  `parent_id` binary(16) DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.rule_condition.rule_id` (`rule_id`),
  KEY `fk.rule_condition.parent_id` (`parent_id`),
  CONSTRAINT `fk.rule_condition.parent_id` FOREIGN KEY (`parent_id`) REFERENCES `rule_condition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.rule_condition.rule_id` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.rule_condition.value` CHECK (json_valid(`value`)),
  CONSTRAINT `json.rule_condition.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_condition`
--

LOCK TABLES `rule_condition` WRITE;
/*!40000 ALTER TABLE `rule_condition` DISABLE KEYS */;
INSERT INTO `rule_condition` VALUES ('�.��@����̖�D�','orContainer','8X�pdM�H�P���',NULL,NULL,0,NULL,'2020-04-04 21:05:18.429',NULL),(':���xN1��BY.��','cartCartAmount','�e���A��T��$���','[��:�I��]��\nH?','{\"operator\":\">=\",\"amount\":2.0}',0,NULL,'2020-04-04 21:05:47.364',NULL),('���J�Aå����{�G','customerBillingCountry','�.j\ZE�@bp�qI','cQ,E�L�N��T@�','{\"operator\":\"=\",\"countryIds\":[\"ba07768a515746af9d33ed0d4ba836cd\"]}',0,NULL,'2020-04-04 21:05:18.476',NULL),('G�4�Ft�+�x�0','andContainer','�7����G���\rt\r]l\Z','����gC���(Ն��',NULL,0,NULL,'2020-04-04 21:05:18.486',NULL),('����gC���(Ն��','orContainer','�7����G���\rt\r]l\Z',NULL,NULL,0,NULL,'2020-04-04 21:05:18.486',NULL),('(\Z�*N���T�9g�b','cartCartAmount','�7����G���\rt\r]l\Z','G�4�Ft�+�x�0','{\"operator\":\">=\",\"amount\":0}',0,NULL,'2020-04-04 21:05:18.487',NULL),('5��3��NC���Tq�%�','alwaysValid','�Bo�F�dd��v��',NULL,'{\"isAlwaysValid\": true}',0,NULL,'2020-04-28 16:30:56.763',NULL),('9o�&�FK��8�X�]','orContainer','(ʮu�bO\r�Z��*�`',NULL,NULL,0,NULL,'2020-04-04 21:05:18.416',NULL),('B�)��F:����cR�','customerCustomerGroup','(ʮu�bO\r�Z��*�`','S5y5Hk����*�!I','{\"operator\":\"=\",\"customerGroupIds\":[\"cfbd5018d38d41d8adca10d94fc8bdd6\"]}',0,NULL,'2020-04-04 21:05:18.418',NULL),('J~VvK��  �F_�','orContainer','�.j\ZE�@bp�qI',NULL,NULL,0,NULL,'2020-04-04 21:05:18.474',NULL),('L���A5�<�k!a�)','customerBillingCountry','�e���A��T��$���','[��:�I��]��\nH?','{\"operator\":\"=\",\"countryIds\":[\"851f0cf33e2c4ab2987fbe23d8ff6112\"]}',0,NULL,'2020-04-04 21:05:47.363',NULL),('S5y5Hk����*�!I','andContainer','(ʮu�bO\r�Z��*�`','9o�&�FK��8�X�]',NULL,0,NULL,'2020-04-04 21:05:18.417',NULL),('[��:�I��]��\nH?','andContainer','�e���A��T��$���',NULL,NULL,0,NULL,'2020-04-04 21:05:47.363',NULL),('cQ,E�L�N��T@�','andContainer','�.j\ZE�@bp�qI','J~VvK��  �F_�',NULL,0,NULL,'2020-04-04 21:05:18.475',NULL),('nL��C\n�2���lJC','cartCartAmount','�Xl�ڣCf��l�8��',NULL,'{\"operator\":\">=\",\"amount\":0}',0,NULL,'2020-04-04 21:03:14.389',NULL),('t�Z+��G	��Tʅ���','cartCartAmount','�e���A��T��$���','[��:�I��]��\nH?','{\"operator\":\"<=\",\"amount\":1470.0}',0,NULL,'2020-04-04 21:05:47.365',NULL),('z=�x�Cۋ�6;C#Ca','cartCartAmount','\"n*n�XL��^k�ؐǘ',NULL,'{\"operator\":\">=\",\"amount\":0}',0,NULL,'2020-04-04 21:03:14.384',NULL),('z&���M��[>�HO�','dayOfWeek','<�A6�mJ/�\n�hze�-','�7D^�`F0���*���X','{\"operator\":\"=\",\"dayOfWeek\":7}',0,NULL,'2020-04-04 21:05:18.460',NULL),('���v2C#�W\\��uO�','orContainer','<�A6�mJ/�\n�hze�-',NULL,NULL,0,NULL,'2020-04-04 21:05:18.458',NULL),('�7D^�`F0���*���X','andContainer','<�A6�mJ/�\n�hze�-','���v2C#�W\\��uO�',NULL,0,NULL,'2020-04-04 21:05:18.459',NULL),('�q�_{CQ�K�S�F','customerIsCompany','�e���A��T��$���','[��:�I��]��\nH?','{\"isCompany\":false}',0,NULL,'2020-04-04 21:05:47.364',NULL),('�|ة�7Dʩ\ZZp�a�l','customerCustomerGroup','��=E�nEF�\0,�\rt��',NULL,'{\"operator\":\"=\",\"customerGroupIds\":[\"cfbd5018d38d41d8adca10d94fc8bdd6\"]}',0,NULL,'2020-04-04 21:03:14.405',NULL),('ԍ��9I\"�Gg �qL','dayOfWeek','R5��3�OS���.����',NULL,'{\"operator\":\"=\",\"dayOfWeek\":7}',0,NULL,'2020-04-04 21:03:14.404',NULL),('�k�/�L�����̃k�','customerBillingCountry','׳���Jȯ�?M�m�',NULL,'{\"operator\":\"=\",\"countryIds\":[\"ba07768a515746af9d33ed0d4ba836cd\"]}',0,NULL,'2020-04-04 21:03:14.405',NULL),('�X�qOT����?��<','andContainer','8X�pdM�H�P���','�.��@����̖�D�',NULL,0,NULL,'2020-04-04 21:05:18.429',NULL),('�`H��WOW�[<�NYż','cartCartAmount','8X�pdM�H�P���','�X�qOT����?��<','{\"operator\":\">=\",\"amount\":0}',0,NULL,'2020-04-04 21:05:18.430',NULL);
/*!40000 ALTER TABLE `rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel`
--

DROP TABLE IF EXISTS `sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel` (
  `id` binary(16) NOT NULL,
  `type_id` binary(16) NOT NULL,
  `short_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `configuration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `access_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` binary(16) NOT NULL,
  `currency_id` binary(16) NOT NULL,
  `payment_method_id` binary(16) NOT NULL,
  `shipping_method_id` binary(16) NOT NULL,
  `country_id` binary(16) NOT NULL,
  `navigation_category_id` binary(16) NOT NULL,
  `navigation_category_version_id` binary(16) NOT NULL,
  `navigation_category_depth` int(11) NOT NULL DEFAULT 2,
  `hreflang_active` tinyint(1) unsigned DEFAULT 0,
  `hreflang_default_domain_id` binary(16) DEFAULT NULL,
  `footer_category_id` binary(16) DEFAULT NULL,
  `footer_category_version_id` binary(16) DEFAULT NULL,
  `service_category_id` binary(16) DEFAULT NULL,
  `service_category_version_id` binary(16) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_ip_whitelist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_group_id` binary(16) NOT NULL,
  `mail_header_footer_id` binary(16) DEFAULT NULL,
  `payment_method_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `analytics_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.access_key` (`access_key`),
  KEY `fk.sales_channel.country_id` (`country_id`),
  KEY `fk.sales_channel.currency_id` (`currency_id`),
  KEY `fk.sales_channel.language_id` (`language_id`),
  KEY `fk.sales_channel.payment_method_id` (`payment_method_id`),
  KEY `fk.sales_channel.shipping_method_id` (`shipping_method_id`),
  KEY `fk.sales_channel.type_id` (`type_id`),
  KEY `fk.sales_channel.navigation_category_id` (`navigation_category_id`,`navigation_category_version_id`),
  KEY `fk.sales_channel.footer_category_id` (`footer_category_id`,`footer_category_version_id`),
  KEY `fk.sales_channel.service_category_id` (`service_category_id`,`service_category_version_id`),
  KEY `fk.sales_channel.customer_group_id` (`customer_group_id`),
  KEY `fk.sales_channel.header_footer_id` (`mail_header_footer_id`),
  KEY `fk.sales_channel.hreflang_default_domain_id` (`hreflang_default_domain_id`),
  KEY `fk.sales_channel.analytics_id` (`analytics_id`),
  CONSTRAINT `fk.sales_channel.analytics_id` FOREIGN KEY (`analytics_id`) REFERENCES `sales_channel_analytics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.customer_group_id` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.footer_category_id` FOREIGN KEY (`footer_category_id`, `footer_category_version_id`) REFERENCES `category` (`id`, `version_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.header_footer_id` FOREIGN KEY (`mail_header_footer_id`) REFERENCES `mail_header_footer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.hreflang_default_domain_id` FOREIGN KEY (`hreflang_default_domain_id`) REFERENCES `sales_channel_domain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.navigation_category_id` FOREIGN KEY (`navigation_category_id`, `navigation_category_version_id`) REFERENCES `category` (`id`, `version_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.service_category_id` FOREIGN KEY (`service_category_id`, `service_category_version_id`) REFERENCES `category` (`id`, `version_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.shipping_method_id` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel.type_id` FOREIGN KEY (`type_id`) REFERENCES `sales_channel_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.sales_channel.configuration` CHECK (json_valid(`configuration`)),
  CONSTRAINT `json.sales_channel.payment_method_ids` CHECK (json_valid(`payment_method_ids`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel`
--

LOCK TABLES `sales_channel` WRITE;
/*!40000 ALTER TABLE `sales_channel` DISABLE KEYS */;
INSERT INTO `sales_channel` VALUES ('7�>�R�Kޚ��t�\"ð','�$0��.Lq�F1KW|�+',NULL,NULL,'SWSCDGZNMMI0DDBTOWPHBEHXMW','/�_��Mp�XT�|��','��UK�G͂�����','�����8B�������','\\�\\Hv�t�y�ſ','��>,J���#��a','����A�2�N�(','���jK¾K��u,4%',2,0,NULL,NULL,NULL,NULL,NULL,1,0,NULL,'ϽPӍAح��OȽ�',NULL,'[\"10bd91fd16a14953a6ed43828b45f6b5\",\"869fa8dfaab744518a0ac23f86c0f152\",\"da954b4434b74c13b5beb1e4b644518f\",\"e0978c8fff38421b840c95e8fa96fdf6\"]',NULL,'2020-04-04 21:03:25.346',NULL),('�C-�9�F$�2�k��M','��VP�KۊwC7WPg�',NULL,NULL,'SWSCSLPZWJL1N3C0RLE5VHF4TW','/�_��Mp�XT�|��','��UK�G͂�����','�����8B�������','\\�\\Hv�t�y�ſ','��>,J���#��a','����A�2�N�(','���jK¾K��u,4%',2,0,NULL,NULL,NULL,NULL,NULL,1,0,NULL,'ϽPӍAح��OȽ�',NULL,'[\"10bd91fd16a14953a6ed43828b45f6b5\",\"869fa8dfaab744518a0ac23f86c0f152\",\"da954b4434b74c13b5beb1e4b644518f\",\"e0978c8fff38421b840c95e8fa96fdf6\"]',NULL,'2020-04-04 21:03:14.395',NULL);
/*!40000 ALTER TABLE `sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_analytics`
--

DROP TABLE IF EXISTS `sales_channel_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_analytics` (
  `id` binary(16) NOT NULL,
  `tracking_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `track_orders` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_analytics`
--

LOCK TABLES `sales_channel_analytics` WRITE;
/*!40000 ALTER TABLE `sales_channel_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_channel_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_api_context`
--

DROP TABLE IF EXISTS `sales_channel_api_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_api_context` (
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_api_context`
--

LOCK TABLES `sales_channel_api_context` WRITE;
/*!40000 ALTER TABLE `sales_channel_api_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_channel_api_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_country`
--

DROP TABLE IF EXISTS `sales_channel_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_country` (
  `sales_channel_id` binary(16) NOT NULL,
  `country_id` binary(16) NOT NULL,
  PRIMARY KEY (`sales_channel_id`,`country_id`),
  KEY `fk.sales_channel_country.country_id` (`country_id`),
  CONSTRAINT `fk.sales_channel_country.country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_country.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_country`
--

LOCK TABLES `sales_channel_country` WRITE;
/*!40000 ALTER TABLE `sales_channel_country` DISABLE KEYS */;
INSERT INTO `sales_channel_country` VALUES ('7�>�R�Kޚ��t�\"ð','\0j�>�NY�cI�H%٢'),('7�>�R�Kޚ��t�\"ð','\r��Z�#N�5B���w'),('7�>�R�Kޚ��t�\"ð','V�\Zd@ȢMǴq��'),('7�>�R�Kޚ��t�\"ð','\Z!�~�K���?��}��'),('7�>�R�Kޚ��t�\"ð','\Zrp��H5�3\\=�\"��'),('7�>�R�Kޚ��t�\"ð','\"f�J��BF�D�3a�cH'),('7�>�R�Kޚ��t�\"ð','&>3	BA��ۃ�+�'),('7�>�R�Kޚ��t�\"ð','.R��)fMT����.�(�'),('7�>�R�Kޚ��t�\"ð','3Pp�i�G�4��=G:�'),('7�>�R�Kޚ��t�\"ð',';[��$J��\Z\n,���9'),('7�>�R�Kޚ��t�\"ð','Hv���G���;̸t��'),('7�>�R�Kޚ��t�\"ð','LM\Z�Hr��$lsZ��'),('7�>�R�Kޚ��t�\"ð','P̯�[�@աA!\rԬ'),('7�>�R�Kޚ��t�\"ð','bE�ۢ�Bf���\\���'),('7�>�R�Kޚ��t�\"ð','o�9?s�F������]'),('7�>�R�Kޚ��t�\"ð','��>,J���#��a'),('7�>�R�Kޚ��t�\"ð','��G��A*����MX;'),('7�>�R�Kޚ��t�\"ð','�\n��N�Pd�(��'),('7�>�R�Kޚ��t�\"ð','��o��O捖9|-��f'),('7�>�R�Kޚ��t�\"ð','�a��p�G3�,��Z���'),('7�>�R�Kޚ��t�\"ð','�v�QWF��3�\rK�6�'),('7�>�R�Kޚ��t�\"ð','�p���B��Y��`�6'),('7�>�R�Kޚ��t�\"ð','Ʒ���H?�D��\n@�o'),('7�>�R�Kޚ��t�\"ð','��Ɲr\'Fn�e�|Ps��'),('7�>�R�Kޚ��t�\"ð','����@��bt�L$�'),('7�>�R�Kޚ��t�\"ð','�k���C��:����L�'),('7�>�R�Kޚ��t�\"ð','�9R�dmG����,�'),('7�>�R�Kޚ��t�\"ð','�mN҆�@e��R*�bP\r'),('7�>�R�Kޚ��t�\"ð','��Fm�Ce����R��'),('7�>�R�Kޚ��t�\"ð','�¼���LG��f�X'),('7�>�R�Kޚ��t�\"ð','�)�8�Di��:�t���'),('7�>�R�Kޚ��t�\"ð','�U��O!�t\ZK���'),('7�>�R�Kޚ��t�\"ð','��^klC�Q���7�'),('�C-�9�F$�2�k��M','\Z!�~�K���?��}��'),('�C-�9�F$�2�k��M','��>,J���#��a');
/*!40000 ALTER TABLE `sales_channel_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_currency`
--

DROP TABLE IF EXISTS `sales_channel_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_currency` (
  `sales_channel_id` binary(16) NOT NULL,
  `currency_id` binary(16) NOT NULL,
  PRIMARY KEY (`sales_channel_id`,`currency_id`),
  KEY `fk.sales_channel_currency.currency_id` (`currency_id`),
  CONSTRAINT `fk.sales_channel_currency.currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_currency.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_currency`
--

LOCK TABLES `sales_channel_currency` WRITE;
/*!40000 ALTER TABLE `sales_channel_currency` DISABLE KEYS */;
INSERT INTO `sales_channel_currency` VALUES ('7�>�R�Kޚ��t�\"ð','&���iOS��(]W��'),('7�>�R�Kޚ��t�\"ð','��&�,O��L��-\0�'),('7�>�R�Kޚ��t�\"ð','�w��K�O��R��/�'),('7�>�R�Kޚ��t�\"ð','��Kg7>Dg���^g�F'),('7�>�R�Kޚ��t�\"ð','��,nAD�\n�i�^�'),('7�>�R�Kޚ��t�\"ð','��UK�G͂�����'),('7�>�R�Kޚ��t�\"ð','�D�N��H����~��'),('7�>�R�Kޚ��t�\"ð','���I·!��B�'),('�C-�9�F$�2�k��M','��Kg7>Dg���^g�F'),('�C-�9�F$�2�k��M','��UK�G͂�����'),('�C-�9�F$�2�k��M','���I·!��B�');
/*!40000 ALTER TABLE `sales_channel_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_domain`
--

DROP TABLE IF EXISTS `sales_channel_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_domain` (
  `id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` binary(16) NOT NULL,
  `snippet_set_id` binary(16) NOT NULL,
  `hreflang_use_only_locale` tinyint(1) unsigned DEFAULT 0,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.sales_channel_domain.url` (`url`),
  KEY `fk.sales_channel_domain.currency_id` (`currency_id`),
  KEY `fk.sales_channel_domain.snippet_set_id` (`snippet_set_id`),
  KEY `fk.sales_channel_domain.language_id` (`language_id`),
  KEY `fk.sales_channel_domain.sales_channel_id` (`sales_channel_id`),
  CONSTRAINT `fk.sales_channel_domain.currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_domain.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_domain.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_domain.snippet_set_id` FOREIGN KEY (`snippet_set_id`) REFERENCES `snippet_set` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.sales_channel_domain.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_domain`
--

LOCK TABLES `sales_channel_domain` WRITE;
/*!40000 ALTER TABLE `sales_channel_domain` DISABLE KEYS */;
INSERT INTO `sales_channel_domain` VALUES ('#ZSW��N���\Z��1�','7�>�R�Kޚ��t�\"ð','/�_��Mp�XT�|��','https://sw620-rc1.ddev.site','��UK�G͂�����','\nI4s��F��N�tԲ',0,NULL,'2020-04-04 21:03:25.346',NULL);
/*!40000 ALTER TABLE `sales_channel_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_language`
--

DROP TABLE IF EXISTS `sales_channel_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_language` (
  `sales_channel_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  PRIMARY KEY (`sales_channel_id`,`language_id`),
  KEY `fk.sales_channel_language.language_id` (`language_id`),
  CONSTRAINT `fk.sales_channel_language.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_language.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_language`
--

LOCK TABLES `sales_channel_language` WRITE;
/*!40000 ALTER TABLE `sales_channel_language` DISABLE KEYS */;
INSERT INTO `sales_channel_language` VALUES ('7�>�R�Kޚ��t�\"ð','/�_��Mp�XT�|��'),('7�>�R�Kޚ��t�\"ð','�/p�L���M�4�8'),('�C-�9�F$�2�k��M','/�_��Mp�XT�|��'),('�C-�9�F$�2�k��M','�/p�L���M�4�8');
/*!40000 ALTER TABLE `sales_channel_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_payment_method`
--

DROP TABLE IF EXISTS `sales_channel_payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_payment_method` (
  `sales_channel_id` binary(16) NOT NULL,
  `payment_method_id` binary(16) NOT NULL,
  PRIMARY KEY (`sales_channel_id`,`payment_method_id`),
  KEY `fk.sales_channel_payment_method.payment_method_id` (`payment_method_id`),
  CONSTRAINT `fk.sales_channel_payment_method.payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_payment_method.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_payment_method`
--

LOCK TABLES `sales_channel_payment_method` WRITE;
/*!40000 ALTER TABLE `sales_channel_payment_method` DISABLE KEYS */;
INSERT INTO `sales_channel_payment_method` VALUES ('7�>�R�Kޚ��t�\"ð','����IS��C��E��'),('7�>�R�Kޚ��t�\"ð','���ߪ�DQ�\n�?���R'),('7�>�R�Kޚ��t�\"ð','ڕKD4�L����DQ�'),('7�>�R�Kޚ��t�\"ð','�����8B�������'),('�C-�9�F$�2�k��M','����IS��C��E��'),('�C-�9�F$�2�k��M','���ߪ�DQ�\n�?���R'),('�C-�9�F$�2�k��M','ڕKD4�L����DQ�'),('�C-�9�F$�2�k��M','�����8B�������');
/*!40000 ALTER TABLE `sales_channel_payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_shipping_method`
--

DROP TABLE IF EXISTS `sales_channel_shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_shipping_method` (
  `sales_channel_id` binary(16) NOT NULL,
  `shipping_method_id` binary(16) NOT NULL,
  PRIMARY KEY (`sales_channel_id`,`shipping_method_id`),
  KEY `fk.sales_channel_shipping_method.shipping_method_id` (`shipping_method_id`),
  CONSTRAINT `fk.sales_channel_shipping_method.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_shipping_method.shipping_method_id` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_shipping_method`
--

LOCK TABLES `sales_channel_shipping_method` WRITE;
/*!40000 ALTER TABLE `sales_channel_shipping_method` DISABLE KEYS */;
INSERT INTO `sales_channel_shipping_method` VALUES ('7�>�R�Kޚ��t�\"ð','\\�\\Hv�t�y�ſ'),('7�>�R�Kޚ��t�\"ð','�&���H��h�iC֪'),('�C-�9�F$�2�k��M','\\�\\Hv�t�y�ſ'),('�C-�9�F$�2�k��M','�&���H��h�iC֪');
/*!40000 ALTER TABLE `sales_channel_shipping_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_translation`
--

DROP TABLE IF EXISTS `sales_channel_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_translation` (
  `sales_channel_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`sales_channel_id`,`language_id`),
  KEY `fk.sales_channel_translation.language_id` (`language_id`),
  CONSTRAINT `fk.sales_channel_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_translation.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.sales_channel_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_translation`
--

LOCK TABLES `sales_channel_translation` WRITE;
/*!40000 ALTER TABLE `sales_channel_translation` DISABLE KEYS */;
INSERT INTO `sales_channel_translation` VALUES ('7�>�R�Kޚ��t�\"ð','/�_��Mp�XT�|��','Storefront',NULL,'2020-04-04 21:03:25.338',NULL),('�C-�9�F$�2�k��M','/�_��Mp�XT�|��','Headless',NULL,'2020-04-04 21:03:14.396',NULL),('�C-�9�F$�2�k��M','�/p�L���M�4�8','Headless',NULL,'2020-04-04 21:03:14.396',NULL);
/*!40000 ALTER TABLE `sales_channel_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_type`
--

DROP TABLE IF EXISTS `sales_channel_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_type` (
  `id` binary(16) NOT NULL,
  `cover_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `screenshot_urls` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `json.sales_channel_type.screenshot_urls` CHECK (json_valid(`screenshot_urls`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_type`
--

LOCK TABLES `sales_channel_type` WRITE;
/*!40000 ALTER TABLE `sales_channel_type` DISABLE KEYS */;
INSERT INTO `sales_channel_type` VALUES ('�$0��.Lq�F1KW|�+',NULL,'default-building-shop',NULL,'2020-04-04 21:03:14.393',NULL),('�S^W\"J��e$�>&�',NULL,'default-object-rocket',NULL,'2020-04-04 21:03:17.766',NULL),('�����E��~X -��O',NULL,'default-shopping-paper-bag',NULL,'2020-04-28 16:30:57.627',NULL),('��VP�KۊwC7WPg�',NULL,'default-shopping-basket',NULL,'2020-04-04 21:03:14.393',NULL);
/*!40000 ALTER TABLE `sales_channel_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_channel_type_translation`
--

DROP TABLE IF EXISTS `sales_channel_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel_type_translation` (
  `sales_channel_type_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_long` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`sales_channel_type_id`,`language_id`),
  KEY `fk.sales_channel_type_translation.language_id` (`language_id`),
  CONSTRAINT `fk.sales_channel_type_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.sales_channel_type_translation.sales_channel_type_id` FOREIGN KEY (`sales_channel_type_id`) REFERENCES `sales_channel_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.sales_channel_type_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_channel_type_translation`
--

LOCK TABLES `sales_channel_type_translation` WRITE;
/*!40000 ALTER TABLE `sales_channel_type_translation` DISABLE KEYS */;
INSERT INTO `sales_channel_type_translation` VALUES ('�$0��.Lq�F1KW|�+','/�_��Mp�XT�|��','Storefront','shopware AG','Sales channel with HTML storefront',NULL,NULL,'2020-04-04 21:03:14.393',NULL),('�$0��.Lq�F1KW|�+','�/p�L���M�4�8','Storefront','shopware AG','Sales channel mit HTML storefront',NULL,NULL,'2020-04-04 21:03:14.393',NULL),('�S^W\"J��e$�>&�','/�_��Mp�XT�|��','Product comparison','shopware AG','Sales channel for product comparison platforms',NULL,NULL,'2020-04-04 21:03:17.767',NULL),('�S^W\"J��e$�>&�','�/p�L���M�4�8','Produktvergleich','shopware AG','Verkaufskanal für Produktvergleichsportale',NULL,NULL,'2020-04-04 21:03:17.768',NULL),('�����E��~X -��O','/�_��Mp�XT�|��','Google Shopping','shopware AG','Sales channel for Google Shopping',NULL,NULL,'2020-04-28 16:30:57.630',NULL),('�����E��~X -��O','�/p�L���M�4�8','Google Shopping','shopware AG','Verkaufskanal für Google Shopping',NULL,NULL,'2020-04-28 16:30:57.631',NULL),('��VP�KۊwC7WPg�','/�_��Mp�XT�|��','Headless','shopware AG','API only sales channel',NULL,NULL,'2020-04-04 21:03:14.393',NULL),('��VP�KۊwC7WPg�','�/p�L���M�4�8','Headless','shopware AG','API only sales channel',NULL,NULL,'2020-04-04 21:03:14.394',NULL);
/*!40000 ALTER TABLE `sales_channel_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salutation`
--

DROP TABLE IF EXISTS `salutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salutation` (
  `id` binary(16) NOT NULL,
  `salutation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.salutation_key` (`salutation_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salutation`
--

LOCK TABLES `salutation` WRITE;
/*!40000 ALTER TABLE `salutation` DISABLE KEYS */;
INSERT INTO `salutation` VALUES ('����L{��~�Y�','mrs','2020-04-04 21:03:14.260',NULL),('���CC4���Xk�','not_specified','2020-04-04 21:03:14.262',NULL),('Ƒn��A۝c����3�','mr','2020-04-04 21:03:14.257',NULL);
/*!40000 ALTER TABLE `salutation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salutation_translation`
--

DROP TABLE IF EXISTS `salutation_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salutation_translation` (
  `salutation_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `letter_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`salutation_id`,`language_id`),
  KEY `fk.salutation_translation.language_id` (`language_id`),
  CONSTRAINT `fk.salutation_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.salutation_translation.salutation_id` FOREIGN KEY (`salutation_id`) REFERENCES `salutation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salutation_translation`
--

LOCK TABLES `salutation_translation` WRITE;
/*!40000 ALTER TABLE `salutation_translation` DISABLE KEYS */;
INSERT INTO `salutation_translation` VALUES ('����L{��~�Y�','/�_��Mp�XT�|��','Mrs.','Dear Mrs.','2020-04-04 21:03:14.261',NULL),('����L{��~�Y�','�/p�L���M�4�8','Frau','Sehr geehrte Frau','2020-04-04 21:03:14.261',NULL),('���CC4���Xk�','/�_��Mp�XT�|��','Not specified',' ','2020-04-04 21:03:14.262',NULL),('���CC4���Xk�','�/p�L���M�4�8','Keine Angabe',' ','2020-04-04 21:03:14.263',NULL),('Ƒn��A۝c����3�','/�_��Mp�XT�|��','Mr.','Dear Mr.','2020-04-04 21:03:14.259',NULL),('Ƒn��A۝c����3�','�/p�L���M�4�8','Herr','Sehr geehrter Herr','2020-04-04 21:03:14.260',NULL);
/*!40000 ALTER TABLE `salutation_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_task`
--

DROP TABLE IF EXISTS `scheduled_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_task` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_task_class` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `run_interval` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_execution_time` datetime(3) DEFAULT NULL,
  `next_execution_time` datetime(3) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.scheduled_task.scheduled_task_class` (`scheduled_task_class`),
  CONSTRAINT `check.scheduled_task.run_interval` CHECK (`run_interval` >= 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_task`
--

LOCK TABLES `scheduled_task` WRITE;
/*!40000 ALTER TABLE `scheduled_task` DISABLE KEYS */;
INSERT INTO `scheduled_task` VALUES ('(V��TB���z�\"I��','delete_newsletter_recipient_task','Shopware\\Core\\Content\\Newsletter\\ScheduledTask\\NewsletterRecipientTask',86400,'scheduled','2020-04-04 21:05:53.685','2020-04-05 21:05:53.685','2020-04-04 21:05:19.450','2020-04-04 21:05:53.686'),('*\\R��D@ׅ.6.o�','requeue_dead_messages','Shopware\\Core\\Framework\\MessageQueue\\ScheduledTask\\RequeueDeadMessagesTask',300,'scheduled','2020-04-04 21:05:53.704','2020-04-04 21:10:53.704','2020-04-04 21:05:19.445','2020-04-04 21:05:53.704'),('|kL��O�b�ei8B�','product_export_generate_task','Shopware\\Core\\Content\\ProductExport\\ScheduledTask\\ProductExportGenerateTask',86400,'scheduled','2020-04-04 21:05:53.767','2020-04-05 21:05:53.767','2020-04-04 21:05:19.457','2020-04-04 21:05:53.767'),('�	��F&��	5a�','shopware.sitemap_generate','Shopware\\Core\\Content\\Sitemap\\ScheduledTask\\SitemapGenerateTask',86400,'scheduled','2020-04-04 21:05:53.784','2020-04-05 21:05:53.784','2020-04-04 21:05:19.463','2020-04-04 21:05:53.784'),('�&�B�{Dݟ�c	M�3','shopware.elasticsearch.create.alias','Shopware\\Elasticsearch\\Framework\\Indexing\\CreateAliasTask',300,'scheduled','2020-04-04 21:05:53.793','2020-04-04 21:10:53.793','2020-04-04 21:05:19.468','2020-04-04 21:05:53.794');
/*!40000 ALTER TABLE `scheduled_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_url`
--

DROP TABLE IF EXISTS `seo_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_url` (
  `id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) DEFAULT NULL,
  `foreign_key` binary(16) NOT NULL,
  `route_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_info` varchar(750) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_path_info` varchar(750) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_canonical` tinyint(1) DEFAULT NULL,
  `is_modified` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.seo_url.seo_path_info` (`language_id`,`sales_channel_id`,`seo_path_info`),
  UNIQUE KEY `uniq.seo_url.foreign_key` (`language_id`,`sales_channel_id`,`foreign_key`,`route_name`,`is_canonical`),
  KEY `idx.foreign_key` (`language_id`,`foreign_key`,`sales_channel_id`,`is_canonical`),
  KEY `fk.seo_url.sales_channel_id` (`sales_channel_id`),
  KEY `idx.path_info` (`language_id`,`sales_channel_id`,`is_canonical`,`path_info`),
  CONSTRAINT `fk.seo_url.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.seo_url.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.seo_url.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_url`
--

LOCK TABLES `seo_url` WRITE;
/*!40000 ALTER TABLE `seo_url` DISABLE KEYS */;
INSERT INTO `seo_url` VALUES ('p@ZէA��g�	�q�[','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','m3�A��G��||��|6�','frontend.detail.page','/detail/6d339741cae547bc977c7cb8fe7c36ad','Variant-product/SWDEMO10005.3',1,0,0,NULL,'2020-04-04 21:05:19.189',NULL),('\"��W}�E@�{����+','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','�@W��O��ř�1xh','frontend.navigation.page','/navigation/19ca405790ff4f07aac8c599d4317868','Food/Bakery-products/',1,0,0,NULL,'2020-04-04 21:05:17.778',NULL),('>^$W��D�-a\0��V�','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','�X��� O��ό���','frontend.detail.page','/detail/9858b0c8ec204fa3bb11cf8cfc860285','Variant-product/SWDEMO10005.6',1,0,0,NULL,'2020-04-04 21:05:19.189',NULL),('A[U�v�O����j���','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','8!ܪlVK���RFy�,','frontend.detail.page','/detail/3821dcaa6c564b179f8eed5246799a2c','Variant-product/SWDEMO10005.5',1,0,0,NULL,'2020-04-04 21:05:19.189',NULL),('B4�	̉K��U�q�u�','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','!�,��F.�D��*C�3','frontend.navigation.page','/navigation/2185182cbbd4462ea844abeb2a438b33','Clothing/Men/',1,0,0,NULL,'2020-04-04 21:05:17.778',NULL),('Kf��\rE��Y̹	�B','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','Ǽ�\'S�M��P+AF','frontend.detail.page','/detail/c7bca22753c84d08b6178a50052b4146','Main-product-with-properties/SWDEMO10007',1,0,0,NULL,'2020-04-04 21:05:19.349',NULL),('K�l��A8�2T��|\"$','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð',':��)�KW��墟4w�','frontend.detail.page','/detail/3ac014f329884b57a2cce5a29f34779c','Main-product-free-shipping-with-highlighting/SWDEMO10006',1,0,0,NULL,'2020-04-04 21:05:19.037',NULL),('vN���K[�ڈ�Ӥ�','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','��me�qOq�RH�71>','frontend.detail.page','/detail/96806d658f714f71b35248d03707313e','Variant-product/SWDEMO10005.4',1,0,0,NULL,'2020-04-04 21:05:19.189',NULL),('�\r\"҅E�����,f','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','�h@�OF�ˣT��g','frontend.detail.page','/detail/11dc680240b04f469ccba354cbf0b967','Main-product-with-advanced-prices/SWDEMO10002',1,0,0,NULL,'2020-04-04 21:05:18.723',NULL),('��P�XJM镃�HT���','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','!FqG�䖴�I\0','frontend.detail.page','/detail/1221467f711947c280b5e496b4af4900','Variant-product/SWDEMO10005.2',1,0,0,NULL,'2020-04-04 21:05:19.189',NULL),('��/�c�Kϟ�9jͧiR','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','��&#Fo�7G\'�d','frontend.navigation.page','/navigation/a515ae260223466f8e37471d279e6406','Clothing/',1,0,0,NULL,'2020-04-04 21:05:17.778',NULL),('�}�m�Oh����\Z�1O','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','$k�. K�KX�KM�\n','frontend.detail.page','/detail/1d246bc02e204be88c4b58d44b4dbf0a','Variant-product/SWDEMO10005.1',1,0,0,NULL,'2020-04-04 21:05:19.189',NULL),('����p�H`���R�q�N','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','���쨪L������\n�','frontend.detail.page','/detail/a984f5eca8aa4c81bc9eeac8ebb10aca','Main-product-with-properties/SWDEMO10007.1',1,0,0,NULL,'2020-04-04 21:05:19.349',NULL),('�4NJ@^�]|\'�l�','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','*�ٵ�GL~���qd��<','frontend.detail.page','/detail/2a88d9b59d474c7e869d8071649be43c','Main-product/SWDEMO10001',1,0,0,NULL,'2020-04-04 21:05:18.932',NULL),('��z���H������','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','C�>�L�`U�_��','frontend.detail.page','/detail/43a23e0c03bf4ceabc6055a2185faa87','Variant-product/SWDEMO10005',1,0,0,NULL,'2020-04-04 21:05:19.189',NULL),('�EۓIO���$F�U','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','�鴄�OD�Gt��~H\\','frontend.navigation.page','/navigation/8de9b484c54f441c894774e5f57e485c','Clothing/Women/',1,0,0,NULL,'2020-04-04 21:05:17.778',NULL),('��\'ܸ�Nֶ�$�3�IJ','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','�ZI���C��\r4E��-','frontend.detail.page','/detail/f25a498992a043b89f0d3445a5ae2d7f','Main-product-with-properties/SWDEMO10007.4',1,0,0,NULL,'2020-04-04 21:05:19.349',NULL),('��|��_L&�v�i�C�','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','p��f*qC���M�','frontend.detail.page','/detail/70b9b4662a7143f1a80cb8ed151b4d8d','Main-product-with-properties/SWDEMO10007.2',1,0,0,NULL,'2020-04-04 21:05:19.349',NULL),('���Ŀ`Bۨ������','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','�^��K��,_\0U@','frontend.detail.page','/detail/1901dc5e888f4b1ea4168c2c5f005540','Main-product-with-reviews/SWDEMO100013',1,0,0,NULL,'2020-04-04 21:05:18.840',NULL),('�`	��Ca�_Z�n�N','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','H�C/�A8�&0A9�','frontend.navigation.page','/navigation/48f97f432fd041388b2630184139cf0e','Food/Fish/',1,0,0,NULL,'2020-04-04 21:05:17.778',NULL),('��q�2M��`�/d�','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','��V\Z|�JΊj��ߙ1�','frontend.detail.page','/detail/8697561a7cea4ace8a6ab59ddf9931be','Main-product-with-properties/SWDEMO10007.3',1,0,0,NULL,'2020-04-04 21:05:19.349',NULL),('���H�DN��glz�!��','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','%H��Bޅd?_�ؐQ','frontend.navigation.page','/navigation/251448b91bc742de85643f5fccd89051','Free-time-electronics/',1,0,0,NULL,'2020-04-04 21:05:17.778',NULL),('��F�Z�C���S���\Z','/�_��Mp�XT�|��','7�>�R�Kޚ��t�\"ð','�\"�[��@���[u�','frontend.navigation.page','/navigation/bb22b05bff9140f3808b1cff975b75eb','Food/Sweets/',1,0,0,NULL,'2020-04-04 21:05:17.778',NULL);
/*!40000 ALTER TABLE `seo_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_url_template`
--

DROP TABLE IF EXISTS `seo_url_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_url_template` (
  `id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) DEFAULT NULL,
  `route_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `entity_name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `template` varchar(750) COLLATE utf8mb4_bin NOT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT 1,
  `custom_fields` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.seo_url_template.route_name` (`sales_channel_id`,`route_name`),
  CONSTRAINT `fk.seo_url_template.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.seo_url_template.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_url_template`
--

LOCK TABLES `seo_url_template` WRITE;
/*!40000 ALTER TABLE `seo_url_template` DISABLE KEYS */;
INSERT INTO `seo_url_template` VALUES ('e�OnM7Ao���#��C',NULL,'frontend.navigation.page','category','{% for part in category.seoBreadcrumb %}{{ part }}/{% endfor %}',1,NULL,'2020-04-04 21:03:14.526',NULL),('��Ƶ��OU�|cŋs�',NULL,'frontend.detail.page','product','{{ product.translated.name }}/{{ product.productNumber }}',1,NULL,'2020-04-04 21:03:14.525',NULL);
/*!40000 ALTER TABLE `seo_url_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method` (
  `id` binary(16) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `availability_rule_id` binary(16) NOT NULL,
  `media_id` binary(16) DEFAULT NULL,
  `delivery_time_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.shipping_method.media_id` (`media_id`),
  KEY `fk.shipping_method.availability_rule_id` (`availability_rule_id`),
  KEY `fk.shipping_method.delivery_time_id` (`delivery_time_id`),
  CONSTRAINT `fk.shipping_method.availability_rule_id` FOREIGN KEY (`availability_rule_id`) REFERENCES `rule` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.shipping_method.delivery_time_id` FOREIGN KEY (`delivery_time_id`) REFERENCES `delivery_time` (`id`),
  CONSTRAINT `fk.shipping_method.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES ('\\�\\Hv�t�y�ſ',1,'\"n*n�XL��^k�ؐǘ',NULL,'�-��j|B:�6bl(Î','2020-04-04 21:03:14.389','2020-04-04 21:05:19.424'),('�&���H��h�iC֪',1,'\"n*n�XL��^k�ؐǘ',NULL,'�-��j|B:�6bl(Î','2020-04-04 21:03:14.390','2020-04-04 21:05:19.429');
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method_price`
--

DROP TABLE IF EXISTS `shipping_method_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method_price` (
  `id` binary(16) NOT NULL,
  `shipping_method_id` binary(16) NOT NULL,
  `calculation` int(1) unsigned DEFAULT NULL,
  `rule_id` binary(16) DEFAULT NULL,
  `currency_id` binary(16) DEFAULT NULL,
  `calculation_rule_id` binary(16) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency_price` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `quantity_start` double DEFAULT NULL,
  `quantity_end` double DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.shipping_method_quantity_start` (`shipping_method_id`,`rule_id`,`currency_id`,`quantity_start`),
  KEY `fk.shipping_method_price.currency_id` (`currency_id`),
  KEY `fk.shipping_method_price.rule_id` (`rule_id`),
  KEY `fk.shipping_method_price.calculation_rule_id` (`calculation_rule_id`),
  CONSTRAINT `fk.shipping_method_price.calculation_rule_id` FOREIGN KEY (`calculation_rule_id`) REFERENCES `rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.shipping_method_price.currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.shipping_method_price.rule_id` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.shipping_method_price.shipping_method_id` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.shipping_method_price.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method_price`
--

LOCK TABLES `shipping_method_price` WRITE;
/*!40000 ALTER TABLE `shipping_method_price` DISABLE KEYS */;
INSERT INTO `shipping_method_price` VALUES ('\r~�EL��U�mV�1s','\\�\\Hv�t�y�ſ',1,NULL,'��UK�G͂�����',NULL,0,'{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":\"0\",\"gross\":\"0\",\"linked\":false}}',0,NULL,NULL,'2020-04-04 21:03:14.390',NULL),('_�&@�vK�UUxN��8','�&���H��h�iC֪',1,NULL,'��UK�G͂�����',NULL,0,'{\"cb7d2554b0ce847cd82f3ac9bd1c0dfca\":{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":\"0\",\"gross\":\"0\",\"linked\":false}}',0,NULL,NULL,'2020-04-04 21:03:14.391',NULL);
/*!40000 ALTER TABLE `shipping_method_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method_tag`
--

DROP TABLE IF EXISTS `shipping_method_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method_tag` (
  `shipping_method_id` binary(16) NOT NULL,
  `tag_id` binary(16) NOT NULL,
  PRIMARY KEY (`shipping_method_id`,`tag_id`),
  KEY `fk.shipping_method_tag.tag_id` (`tag_id`),
  CONSTRAINT `fk.shipping_method_tag.shipping_method_id` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.shipping_method_tag.tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method_tag`
--

LOCK TABLES `shipping_method_tag` WRITE;
/*!40000 ALTER TABLE `shipping_method_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_method_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method_translation`
--

DROP TABLE IF EXISTS `shipping_method_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method_translation` (
  `shipping_method_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_url` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`shipping_method_id`,`language_id`),
  KEY `fk.shipping_method_translation.language_id` (`language_id`),
  CONSTRAINT `fk.shipping_method_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.shipping_method_translation.shipping_method_id` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.shipping_method_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method_translation`
--

LOCK TABLES `shipping_method_translation` WRITE;
/*!40000 ALTER TABLE `shipping_method_translation` DISABLE KEYS */;
INSERT INTO `shipping_method_translation` VALUES ('\\�\\Hv�t�y�ſ','/�_��Mp�XT�|��','Standard',NULL,NULL,NULL,'2020-04-04 21:03:14.390',NULL),('\\�\\Hv�t�y�ſ','�/p�L���M�4�8','Standard',NULL,NULL,NULL,'2020-04-04 21:03:14.390',NULL),('�&���H��h�iC֪','/�_��Mp�XT�|��','Express',NULL,NULL,NULL,'2020-04-04 21:03:14.390',NULL),('�&���H��h�iC֪','�/p�L���M�4�8','Express',NULL,NULL,NULL,'2020-04-04 21:03:14.391',NULL);
/*!40000 ALTER TABLE `shipping_method_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snippet`
--

DROP TABLE IF EXISTS `snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snippet` (
  `id` binary(16) NOT NULL,
  `translation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet_set_id` binary(16) NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.snippet_set_id_translation_key` (`snippet_set_id`,`translation_key`),
  CONSTRAINT `fk.snippet.snippet_set_id` FOREIGN KEY (`snippet_set_id`) REFERENCES `snippet_set` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.snippet.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snippet`
--

LOCK TABLES `snippet` WRITE;
/*!40000 ALTER TABLE `snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snippet_set`
--

DROP TABLE IF EXISTS `snippet_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snippet_set` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `json.snippet_set.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snippet_set`
--

LOCK TABLES `snippet_set` WRITE;
/*!40000 ALTER TABLE `snippet_set` DISABLE KEYS */;
INSERT INTO `snippet_set` VALUES ('\nI4s��F��N�tԲ','BASE en-GB','messages.en-GB','en-GB',NULL,'2020-04-04 21:03:14.399',NULL),('\'�6Sj�I�����','BASE de-DE','messages.de-DE','de-DE',NULL,'2020-04-04 21:03:14.399',NULL);
/*!40000 ALTER TABLE `snippet_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_machine`
--

DROP TABLE IF EXISTS `state_machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machine` (
  `id` binary(16) NOT NULL,
  `technical_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_state_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.state_machine.technical_name` (`technical_name`),
  KEY `fk.state_machine.initial_state_id` (`initial_state_id`),
  CONSTRAINT `fk.state_machine.initial_state_id` FOREIGN KEY (`initial_state_id`) REFERENCES `state_machine_state` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machine`
--

LOCK TABLES `state_machine` WRITE;
/*!40000 ALTER TABLE `state_machine` DISABLE KEYS */;
INSERT INTO `state_machine` VALUES ('	�VY��@���]�@27','order_transaction.state','���-sDp�P��ĝ��','2020-04-04 21:03:14.478',NULL),('�\"4�d�Nw�����e�','order.state','Y�a߭�L5��*KLln�','2020-04-04 21:03:14.453',NULL),('�kj���Ns��R��r�','order_delivery.state','�o�V�I��3Ǌ7	פ','2020-04-04 21:03:14.473',NULL);
/*!40000 ALTER TABLE `state_machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_machine_history`
--

DROP TABLE IF EXISTS `state_machine_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machine_history` (
  `id` binary(16) NOT NULL,
  `state_machine_id` binary(16) NOT NULL,
  `entity_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `from_state_id` binary(16) NOT NULL,
  `to_state_id` binary(16) NOT NULL,
  `action_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.state_machine_history.state_machine_id` (`state_machine_id`),
  KEY `fk.state_machine_history.from_state_id` (`from_state_id`),
  KEY `fk.state_machine_history.to_state_id` (`to_state_id`),
  KEY `fk.state_machine_history.user_id` (`user_id`),
  CONSTRAINT `fk.state_machine_history.from_state_id` FOREIGN KEY (`from_state_id`) REFERENCES `state_machine_state` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk.state_machine_history.state_machine_id` FOREIGN KEY (`state_machine_id`) REFERENCES `state_machine` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk.state_machine_history.to_state_id` FOREIGN KEY (`to_state_id`) REFERENCES `state_machine_state` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk.state_machine_history.user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `json.state_machine_history.entity_id` CHECK (json_valid(`entity_id`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machine_history`
--

LOCK TABLES `state_machine_history` WRITE;
/*!40000 ALTER TABLE `state_machine_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `state_machine_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_machine_state`
--

DROP TABLE IF EXISTS `state_machine_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machine_state` (
  `id` binary(16) NOT NULL,
  `technical_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_machine_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.technical_name_state_machine` (`technical_name`,`state_machine_id`),
  KEY `idx.state_machine_state.state_machine_id` (`state_machine_id`),
  CONSTRAINT `fk.state_machine_state.state_machine_id` FOREIGN KEY (`state_machine_id`) REFERENCES `state_machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machine_state`
--

LOCK TABLES `state_machine_state` WRITE;
/*!40000 ALTER TABLE `state_machine_state` DISABLE KEYS */;
INSERT INTO `state_machine_state` VALUES ('|���C��^��Ye','cancelled','�\"4�d�Nw�����e�','2020-04-04 21:03:14.459',NULL),('j�IϛF��{y;�X9','paid','	�VY��@���]�@27','2020-04-04 21:03:14.479',NULL),('\r/�P�xBr����H�C','shipped_partially','�kj���Ns��R��r�','2020-04-04 21:03:14.475',NULL),('\r�\0>��C0�+����','completed','�\"4�d�Nw�����e�','2020-04-04 21:03:14.457',NULL),('���-sDp�P��ĝ��','open','	�VY��@���]�@27','2020-04-04 21:03:14.479',NULL),('J��@�7K��@�\rv��~','refunded','	�VY��@���]�@27','2020-04-04 21:03:14.480',NULL),('Y�a߭�L5��*KLln�','open','�\"4�d�Nw�����e�','2020-04-04 21:03:14.456',NULL),('r��dD5D��l0��؍','cancelled','	�VY��@���]�@27','2020-04-04 21:03:14.481',NULL),('y3(�\"�A|�9���|÷','returned','�kj���Ns��R��r�','2020-04-04 21:03:14.475',NULL),('K��D�<��gc+�','reminded','	�VY��@���]�@27','2020-04-04 21:03:14.481',NULL),('�;F��B��P��) ��','in_progress','	�VY��@���]�@27','2020-04-28 16:30:57.140',NULL),('��NˈM��#�̅?','paid_partially','	�VY��@���]�@27','2020-04-04 21:03:14.480',NULL),('�[{I�NǊ9)˼?�','returned_partially','�kj���Ns��R��r�','2020-04-04 21:03:14.476',NULL),('��\r�*C��VݖU�','refunded_partially','	�VY��@���]�@27','2020-04-04 21:03:14.480',NULL),('�BPl�;E��NLM','failed','	�VY��@���]�@27','2020-04-28 16:30:57.144',NULL),('�!���N���C��\reD','cancelled','�kj���Ns��R��r�','2020-04-04 21:03:14.476',NULL),('�xN�Fk��D���r','shipped','�kj���Ns��R��r�','2020-04-04 21:03:14.474',NULL),('�o�V�I��3Ǌ7	פ','open','�kj���Ns��R��r�','2020-04-04 21:03:14.474',NULL),('���-�HҸ�u\0�Tv','in_progress','�\"4�d�Nw�����e�','2020-04-04 21:03:14.458',NULL);
/*!40000 ALTER TABLE `state_machine_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_machine_state_translation`
--

DROP TABLE IF EXISTS `state_machine_state_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machine_state_translation` (
  `language_id` binary(16) NOT NULL,
  `state_machine_state_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`language_id`,`state_machine_state_id`),
  KEY `idx.language` (`language_id`),
  KEY `idx.state_machine` (`state_machine_state_id`),
  CONSTRAINT `fk.state_machine_state_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.state_machine_state_translation.state_machine_state_id` FOREIGN KEY (`state_machine_state_id`) REFERENCES `state_machine_state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.state_machine_state_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machine_state_translation`
--

LOCK TABLES `state_machine_state_translation` WRITE;
/*!40000 ALTER TABLE `state_machine_state_translation` DISABLE KEYS */;
INSERT INTO `state_machine_state_translation` VALUES ('/�_��Mp�XT�|��','|���C��^��Ye','Cancelled',NULL,'2020-04-04 21:03:14.453',NULL),('/�_��Mp�XT�|��','j�IϛF��{y;�X9','Paid',NULL,'2020-04-04 21:03:14.478',NULL),('/�_��Mp�XT�|��','\r/�P�xBr����H�C','Shipped (partially)',NULL,'2020-04-04 21:03:14.473',NULL),('/�_��Mp�XT�|��','\r�\0>��C0�+����','Done',NULL,'2020-04-04 21:03:14.453',NULL),('/�_��Mp�XT�|��','���-sDp�P��ĝ��','Open',NULL,'2020-04-04 21:03:14.478',NULL),('/�_��Mp�XT�|��','J��@�7K��@�\rv��~','Refunded',NULL,'2020-04-04 21:03:14.478',NULL),('/�_��Mp�XT�|��','Y�a߭�L5��*KLln�','Open',NULL,'2020-04-04 21:03:14.453',NULL),('/�_��Mp�XT�|��','r��dD5D��l0��؍','Cancelled',NULL,'2020-04-04 21:03:14.478',NULL),('/�_��Mp�XT�|��','y3(�\"�A|�9���|÷','Returned',NULL,'2020-04-04 21:03:14.473',NULL),('/�_��Mp�XT�|��','K��D�<��gc+�','Reminded',NULL,'2020-04-04 21:03:14.478',NULL),('/�_��Mp�XT�|��','�;F��B��P��) ��','In Progress',NULL,'2020-04-28 16:30:57.140',NULL),('/�_��Mp�XT�|��','��NˈM��#�̅?','Paid (partially)',NULL,'2020-04-04 21:03:14.478',NULL),('/�_��Mp�XT�|��','�[{I�NǊ9)˼?�','Returned (partially)',NULL,'2020-04-04 21:03:14.473',NULL),('/�_��Mp�XT�|��','��\r�*C��VݖU�','Refunded (partially)',NULL,'2020-04-04 21:03:14.478',NULL),('/�_��Mp�XT�|��','�BPl�;E��NLM','Failed',NULL,'2020-04-28 16:30:57.140',NULL),('/�_��Mp�XT�|��','�!���N���C��\reD','Cancelled',NULL,'2020-04-04 21:03:14.473',NULL),('/�_��Mp�XT�|��','�xN�Fk��D���r','Shipped',NULL,'2020-04-04 21:03:14.473',NULL),('/�_��Mp�XT�|��','�o�V�I��3Ǌ7	פ','Open',NULL,'2020-04-04 21:03:14.473',NULL),('/�_��Mp�XT�|��','���-�HҸ�u\0�Tv','In progress',NULL,'2020-04-04 21:03:14.453',NULL),('�/p�L���M�4�8','|���C��^��Ye','Abgebrochen',NULL,'2020-04-04 21:03:14.453',NULL),('�/p�L���M�4�8','j�IϛF��{y;�X9','Bezahlt',NULL,'2020-04-04 21:03:14.478',NULL),('�/p�L���M�4�8','\r/�P�xBr����H�C','Teilweise versandt',NULL,'2020-04-04 21:03:14.473',NULL),('�/p�L���M�4�8','\r�\0>��C0�+����','Abgeschlossen',NULL,'2020-04-04 21:03:14.453',NULL),('�/p�L���M�4�8','���-sDp�P��ĝ��','Offen',NULL,'2020-04-04 21:03:14.478',NULL),('�/p�L���M�4�8','J��@�7K��@�\rv��~','Erstattet',NULL,'2020-04-04 21:03:14.478',NULL),('�/p�L���M�4�8','Y�a߭�L5��*KLln�','Offen',NULL,'2020-04-04 21:03:14.453',NULL),('�/p�L���M�4�8','r��dD5D��l0��؍','Abgebrochen',NULL,'2020-04-04 21:03:14.478',NULL),('�/p�L���M�4�8','y3(�\"�A|�9���|÷','Retour',NULL,'2020-04-04 21:03:14.473',NULL),('�/p�L���M�4�8','K��D�<��gc+�','Erinnert',NULL,'2020-04-04 21:03:14.478',NULL),('�/p�L���M�4�8','�;F��B��P��) ��','In Bearbeitung',NULL,'2020-04-28 16:30:57.140',NULL),('�/p�L���M�4�8','��NˈM��#�̅?','Teilweise bezahlt',NULL,'2020-04-04 21:03:14.478',NULL),('�/p�L���M�4�8','�[{I�NǊ9)˼?�','Teilretour',NULL,'2020-04-04 21:03:14.473',NULL),('�/p�L���M�4�8','��\r�*C��VݖU�','Teilweise erstattet',NULL,'2020-04-04 21:03:14.478',NULL),('�/p�L���M�4�8','�BPl�;E��NLM','Fehlgeschlagen',NULL,'2020-04-28 16:30:57.140',NULL),('�/p�L���M�4�8','�!���N���C��\reD','Abgebrochen',NULL,'2020-04-04 21:03:14.473',NULL),('�/p�L���M�4�8','�xN�Fk��D���r','Versandt',NULL,'2020-04-04 21:03:14.473',NULL),('�/p�L���M�4�8','�o�V�I��3Ǌ7	פ','Offen',NULL,'2020-04-04 21:03:14.473',NULL),('�/p�L���M�4�8','���-�HҸ�u\0�Tv','In Bearbeitung',NULL,'2020-04-04 21:03:14.453',NULL);
/*!40000 ALTER TABLE `state_machine_state_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_machine_transition`
--

DROP TABLE IF EXISTS `state_machine_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machine_transition` (
  `id` binary(16) NOT NULL,
  `action_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_machine_id` binary(16) NOT NULL,
  `from_state_id` binary(16) NOT NULL,
  `to_state_id` binary(16) NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.state_machine_transition.action_name_state_machine` (`action_name`,`state_machine_id`,`from_state_id`,`to_state_id`),
  KEY `idx.state_machine_transition.state_machine_id` (`state_machine_id`),
  KEY `idx.state_machine_transition.from_state_id` (`from_state_id`),
  KEY `idx.state_machine_transition.to_state_id` (`to_state_id`),
  CONSTRAINT `fk.state_machine_transition.from_state_id` FOREIGN KEY (`from_state_id`) REFERENCES `state_machine_state` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.state_machine_transition.state_machine_id` FOREIGN KEY (`state_machine_id`) REFERENCES `state_machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.state_machine_transition.to_state_id` FOREIGN KEY (`to_state_id`) REFERENCES `state_machine_state` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.state_machine_transition.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machine_transition`
--

LOCK TABLES `state_machine_transition` WRITE;
/*!40000 ALTER TABLE `state_machine_transition` DISABLE KEYS */;
INSERT INTO `state_machine_transition` VALUES ('\0��R]�O���*ca','pay','	�VY��@���]�@27','K��D�<��gc+�','j�IϛF��{y;�X9',NULL,'2020-04-04 21:03:14.482',NULL),('0]~�H��@���*H�','cancel','�kj���Ns��R��r�','\r/�P�xBr����H�C','�!���N���C��\reD',NULL,'2020-04-04 21:03:14.478',NULL),('\n��N\rN5����˭r','reopen','�\"4�d�Nw�����e�','|���C��^��Ye','Y�a߭�L5��*KLln�',NULL,'2020-04-04 21:03:14.462',NULL),('U����K0�*�|wL�','retour','�kj���Ns��R��r�','\r/�P�xBr����H�C','y3(�\"�A|�9���|÷',NULL,'2020-04-04 21:03:14.477',NULL),(':�� �Lо4R5d�0�','do_pay','	�VY��@���]�@27','���-sDp�P��ĝ��','�;F��B��P��) ��',NULL,'2020-04-28 16:30:57.161',NULL),('\Z@S��C\'����\\','process','�\"4�d�Nw�����e�','Y�a߭�L5��*KLln�','���-�HҸ�u\0�Tv',NULL,'2020-04-04 21:03:14.460',NULL),('\']���N��p;yr�','fail','	�VY��@���]�@27','���-sDp�P��ĝ��','�BPl�;E��NLM',NULL,'2020-04-28 16:30:57.162',NULL),('\'���J#�\0�6\r�','cancel','	�VY��@���]�@27','��NˈM��#�̅?','r��dD5D��l0��؍',NULL,'2020-04-04 21:03:14.483',NULL),('*W��vF��/�_۳i�','refund','	�VY��@���]�@27','��NˈM��#�̅?','J��@�7K��@�\rv��~',NULL,'2020-04-04 21:03:14.483',NULL),(',ʢ?�dA>�@zW뎒','cancel','�\"4�d�Nw�����e�','Y�a߭�L5��*KLln�','|���C��^��Ye',NULL,'2020-04-04 21:03:14.460',NULL),('/��68H��2/���\\','paid','	�VY��@���]�@27','���-sDp�P��ĝ��','j�IϛF��{y;�X9',NULL,'2020-04-28 16:30:58.641',NULL),('7(��6SNv�cR	$�@','pay_partially','	�VY��@���]�@27','K��D�<��gc+�','��NˈM��#�̅?',NULL,'2020-04-04 21:03:14.482',NULL),('8�@<�J���mG�iNo','cancel','	�VY��@���]�@27','j�IϛF��{y;�X9','r��dD5D��l0��؍',NULL,'2020-04-04 21:03:14.483',NULL),(';L�)sdI^��	Ψ�B','refund','	�VY��@���]�@27','r��dD5D��l0��؍','J��@�7K��@�\rv��~',NULL,'2020-04-04 21:03:14.484',NULL),('<K�t\Z�N���V�=L��','pay','	�VY��@���]�@27','���-sDp�P��ĝ��','j�IϛF��{y;�X9',NULL,'2020-04-04 21:03:14.481',NULL),('>$�9xE�!]\'f�','complete','�\"4�d�Nw�����e�','���-�HҸ�u\0�Tv','\r�\0>��C0�+����',NULL,'2020-04-04 21:03:14.461',NULL),('G�L��rO\"��M��`�','reopen','�kj���Ns��R��r�','�!���N���C��\reD','�o�V�I��3Ǌ7	פ',NULL,'2020-04-04 21:03:20.170',NULL),('I$�\'vHH��Fp&�J;�','reopen','	�VY��@���]�@27','��NˈM��#�̅?','���-sDp�P��ĝ��',NULL,'2020-04-28 16:30:57.164',NULL),('Ks����G,���s3C��','retour_partially','�kj���Ns��R��r�','\r/�P�xBr����H�C','�[{I�NǊ9)˼?�',NULL,'2020-04-04 21:03:14.478',NULL),('X�+�NH��w���˅�','pay_partially','	�VY��@���]�@27','�BPl�;E��NLM','��NˈM��#�̅?',NULL,'2020-04-28 16:30:57.160',NULL),('c���_�I��p�O�2','reopen','	�VY��@���]�@27','j�IϛF��{y;�X9','���-sDp�P��ĝ��',NULL,'2020-04-28 16:30:57.166',NULL),('e�Z���J֌\0�K4�^','refund','	�VY��@���]�@27','��\r�*C��VݖU�','J��@�7K��@�\rv��~',NULL,'2020-04-04 21:03:14.483',NULL),('f�R��hE��{��\rwe�','reopen','	�VY��@���]�@27','�BPl�;E��NLM','���-sDp�P��ĝ��',NULL,'2020-04-28 16:30:57.152',NULL),('gT�IG�J&�	�oN��','cancel','	�VY��@���]�@27','�;F��B��P��) ��','r��dD5D��l0��؍',NULL,'2020-04-28 16:30:57.148',NULL),('j�v_�I��Z#���','refund_partially','	�VY��@���]�@27','r��dD5D��l0��؍','��\r�*C��VݖU�',NULL,'2020-04-04 21:03:14.484',NULL),('u�\ZXC���aQt�a�','retour','�kj���Ns��R��r�','�xN�Fk��D���r','y3(�\"�A|�9���|÷',NULL,'2020-04-04 21:03:14.477',NULL),('va٩�^J���8�\\ԃ','reopen','	�VY��@���]�@27','K��D�<��gc+�','���-sDp�P��ĝ��',NULL,'2020-04-28 16:30:57.162',NULL),('x���u@����鉔��','pay','	�VY��@���]�@27','��NˈM��#�̅?','j�IϛF��{y;�X9',NULL,'2020-04-04 21:03:14.482',NULL),('yuȅ��@·��Ҝb��','refund_partially','	�VY��@���]�@27','��NˈM��#�̅?','��\r�*C��VݖU�',NULL,'2020-04-04 21:03:14.482',NULL),('y��2�GG���ˌ #','paid_partially','	�VY��@���]�@27','���-sDp�P��ĝ��','��NˈM��#�̅?',NULL,'2020-04-28 16:30:58.642',NULL),('{��k�H����_���','remind','	�VY��@���]�@27','��NˈM��#�̅?','K��D�<��gc+�',NULL,'2020-04-04 21:03:14.482',NULL),('�}:��N)�#��|2�','do_pay','	�VY��@���]�@27','�BPl�;E��NLM','�;F��B��P��) ��',NULL,'2020-04-28 16:30:57.156',NULL),('�j���7I2��i��r','retour_partially','�kj���Ns��R��r�','�xN�Fk��D���r','�[{I�NǊ9)˼?�',NULL,'2020-04-04 21:03:14.477',NULL),('��M-�LǞ��3���','reopen','�\"4�d�Nw�����e�','\r�\0>��C0�+����','Y�a߭�L5��*KLln�',NULL,'2020-04-04 21:03:14.462',NULL),('�Ӄ���Ft��r��L�+','do_pay','	�VY��@���]�@27','K��D�<��gc+�','�;F��B��P��) ��',NULL,'2020-04-28 16:30:57.163',NULL),('���V	�J$�P�A��k�','reopen','	�VY��@���]�@27','r��dD5D��l0��؍','���-sDp�P��ĝ��',NULL,'2020-04-04 21:03:14.484',NULL),('��.��vB��$z�Ds','cancel','�\"4�d�Nw�����e�','���-�HҸ�u\0�Tv','|���C��^��Ye',NULL,'2020-04-04 21:03:14.461',NULL),('�$�T��G��_���','paid','	�VY��@���]�@27','�BPl�;E��NLM','j�IϛF��{y;�X9',NULL,'2020-04-28 16:30:57.158',NULL),('�^_E�Bu���P��*�','pay','	�VY��@���]�@27','�BPl�;E��NLM','j�IϛF��{y;�X9',NULL,'2020-04-28 16:30:57.157',NULL),('�`ZLJ���Ww�>��','paid_partially','	�VY��@���]�@27','�;F��B��P��) ��','��NˈM��#�̅?',NULL,'2020-04-28 16:30:57.150',NULL),('����j�J��W���GKG','cancel','	�VY��@���]�@27','��\r�*C��VݖU�','r��dD5D��l0��؍',NULL,'2020-04-04 21:03:14.483',NULL),('�����G���L�m�c','pay_partially','	�VY��@���]�@27','���-sDp�P��ĝ��','��NˈM��#�̅?',NULL,'2020-04-04 21:03:14.481',NULL),('§�;zrM����ƶg��','do_pay','	�VY��@���]�@27','��NˈM��#�̅?','�;F��B��P��) ��',NULL,'2020-04-28 16:30:57.165',NULL),('�1�FzE���k��~/�','cancel','�kj���Ns��R��r�','�o�V�I��3Ǌ7	פ','�!���N���C��\reD',NULL,'2020-04-04 21:03:14.477',NULL),('��.q�}B~��#DD','remind','	�VY��@���]�@27','���-sDp�P��ĝ��','K��D�<��gc+�',NULL,'2020-04-04 21:03:14.482',NULL),('˒`�m�Hۡ:��(?','reopen','	�VY��@���]�@27','�;F��B��P��) ��','���-sDp�P��ĝ��',NULL,'2020-04-28 16:30:57.147',NULL),('�ոn\0`C-��W��ϣ','reopen','	�VY��@���]�@27','��\r�*C��VݖU�','���-sDp�P��ĝ��',NULL,'2020-04-28 16:30:57.167',NULL),('͈�e��N����,���','fail','	�VY��@���]�@27','�;F��B��P��) ��','�BPl�;E��NLM',NULL,'2020-04-28 16:30:57.148',NULL),('յ��F&��\n��','cancel','	�VY��@���]�@27','���-sDp�P��ĝ��','r��dD5D��l0��؍',NULL,'2020-04-04 21:03:14.482',NULL),('�&�,�0N����\r���','refund','	�VY��@���]�@27','j�IϛF��{y;�X9','J��@�7K��@�\rv��~',NULL,'2020-04-04 21:03:14.483',NULL),('�e60��L\Z�p>[5�\n','ship','�kj���Ns��R��r�','�o�V�I��3Ǌ7	פ','�xN�Fk��D���r',NULL,'2020-04-04 21:03:14.476',NULL),('�բ6ۀC��Wʸ6\\L','refund_partially','	�VY��@���]�@27','j�IϛF��{y;�X9','��\r�*C��VݖU�',NULL,'2020-04-04 21:03:14.483',NULL),('�����;K�m��9B�','paid_partially','	�VY��@���]�@27','�BPl�;E��NLM','��NˈM��#�̅?',NULL,'2020-04-28 16:30:57.159',NULL),('��%iRH�j?�֌>','cancel','�kj���Ns��R��r�','�xN�Fk��D���r','�!���N���C��\reD',NULL,'2020-04-04 21:03:14.477',NULL),('�x���I`��M��k8','pay_partially','	�VY��@���]�@27','�;F��B��P��) ��','��NˈM��#�̅?',NULL,'2020-04-28 16:30:57.151',NULL),('�̑�C��-ǞƷP','cancel','	�VY��@���]�@27','K��D�<��gc+�','r��dD5D��l0��؍',NULL,'2020-04-04 21:03:14.482',NULL),('�gClI��y�D]��D','ship_partially','�kj���Ns��R��r�','�o�V�I��3Ǌ7	פ','\r/�P�xBr����H�C',NULL,'2020-04-04 21:03:14.477',NULL),('�V�,@e��l�&�_�','paid','	�VY��@���]�@27','�;F��B��P��) ��','j�IϛF��{y;�X9',NULL,'2020-04-28 16:30:57.149',NULL),('���;�*IF��}\rR��','fail','	�VY��@���]�@27','�BPl�;E��NLM','�BPl�;E��NLM',NULL,'2020-04-28 16:30:57.157',NULL),('��;��8I�H����K','ship','�kj���Ns��R��r�','\r/�P�xBr����H�C','�xN�Fk��D���r',NULL,'2020-04-04 21:03:14.478',NULL);
/*!40000 ALTER TABLE `state_machine_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_machine_translation`
--

DROP TABLE IF EXISTS `state_machine_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machine_translation` (
  `language_id` binary(16) NOT NULL,
  `state_machine_id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`language_id`,`state_machine_id`),
  KEY `idx.state_machine_translation.language` (`language_id`),
  KEY `idx.state_machine_translation.state_machine` (`state_machine_id`),
  CONSTRAINT `fk.state_machine_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.state_machine_translation.state_machine_id` FOREIGN KEY (`state_machine_id`) REFERENCES `state_machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.state_machine_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_machine_translation`
--

LOCK TABLES `state_machine_translation` WRITE;
/*!40000 ALTER TABLE `state_machine_translation` DISABLE KEYS */;
INSERT INTO `state_machine_translation` VALUES ('/�_��Mp�XT�|��','	�VY��@���]�@27','Payment state',NULL,'2020-04-04 21:03:14.479',NULL),('/�_��Mp�XT�|��','�\"4�d�Nw�����e�','Order state',NULL,'2020-04-04 21:03:14.455',NULL),('/�_��Mp�XT�|��','�kj���Ns��R��r�','Order state',NULL,'2020-04-04 21:03:14.474',NULL),('�/p�L���M�4�8','	�VY��@���]�@27','Zahlungsstatus',NULL,'2020-04-04 21:03:14.478',NULL),('�/p�L���M�4�8','�\"4�d�Nw�����e�','Bestellstatus',NULL,'2020-04-04 21:03:14.455',NULL),('�/p�L���M�4�8','�kj���Ns��R��r�','Bestellstatus',NULL,'2020-04-04 21:03:14.473',NULL);
/*!40000 ALTER TABLE `state_machine_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `id` binary(16) NOT NULL,
  `configuration_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sales_channel_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.system_config.configuration_key__sales_channel_id` (`configuration_key`,`sales_channel_id`),
  CONSTRAINT `json.system_config.configuration_value` CHECK (json_valid(`configuration_value`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES ('G��L�AZ� ޾k��','SwagPayPal.settings.ecsSubmitCart','{\"_value\":true}',NULL,'2020-04-04 21:05:47.328',NULL),('h��#o@�����á','SwagPayPal.settings.spbCheckoutEnabled','{\"_value\":true}',NULL,'2020-04-04 21:05:47.332',NULL),('�����K����W{l�','SwagPayPal.settings.intent','{\"_value\":\"sale\"}',NULL,'2020-04-04 21:05:47.277',NULL),('	���CJC��Dq�l�','SwagPayPal.settings.ecsLoginEnabled','{\"_value\":true}',NULL,'2020-04-04 21:05:47.312',NULL),('.�̆Br��W�`s�P','core.basicInformation.privacyPage','{\"_value\": \"b0dc71887ed94674b20f103f6f2c703d\"}',NULL,'2020-04-04 21:03:23.082',NULL),('�_>[B`�>W���#a','core.scheduled_indexers','{\"_value\":{\"Swag.RulePayloadIndexer\":1}}',NULL,'2020-04-28 16:30:56.767',NULL),('&b5-Hy�P[�X+�%','core.basicInformation.tosPage','{\"_value\": \"2461db19f8fd434f8650c911814e677c\"}',NULL,'2020-04-04 21:03:23.064',NULL),('W�Q/H����F�z�','core.sitemap.sitemapRefreshStrategy','{\"_value\": \"2\"}',NULL,'2020-04-04 21:03:20.189',NULL),('�:/�~N֔���Rڇ�','core.basicInformation.contactPage','{\"_value\": \"fa9b50f509ed49b9b78b195e2ea2c932\"}',NULL,'2020-04-04 21:03:23.043',NULL),('�&��XGd��1SP��k','SwagPayPal.settings.ecsDetailEnabled','{\"_value\":true}',NULL,'2020-04-04 21:05:47.299',NULL),('+Pgh�dA����;�6','SwagPayPal.settings.spbAlternativePaymentMethodsEnabled','{\"_value\":true}',NULL,'2020-04-04 21:05:47.336',NULL),('1TMR�N�D�/XVO','core.listing.allowBuyInListing','{\"_value\": true}',NULL,'2020-04-04 21:03:16.022',NULL),(':i�Da�@��K��:1�`','SwagPayPal.settings.submitCart','{\"_value\":true}',NULL,'2020-04-04 21:05:47.281',NULL),('<����\ZH<��i@��','SwagPayPal.settings.sandbox','{\"_value\":false}',NULL,'2020-04-04 21:05:47.249',NULL),('>�_S��L[��\Z��9�','core.logging.cleanupInterval','{\"_value\": \"86400\"}',NULL,'2020-04-04 21:03:15.346',NULL),('?����M��h�4�]��','core.basicInformation.shopName','{\"_value\": \"Demostore\"}',NULL,'2020-04-04 21:03:16.021',NULL),('Du�~<LO��/��)ۇ','SwagPayPal.settings.spbButtonColor','{\"_value\":\"gold\"}',NULL,'2020-04-04 21:05:47.340',NULL),('GՃ,TG<���\0z��','core.frw.completedAt','{\"_value\":\"2020-04-04T21:05:54+00:00\"}',NULL,'2020-04-04 21:05:54.697',NULL),('U�_���Iy�ɘk�\ne�','SwagPayPal.settings.ecsButtonShape','{\"_value\":\"rect\"}',NULL,'2020-04-04 21:05:47.324',NULL),('Xa��B雭�`S�C','SwagPayPal.settings.ecsOffCanvasEnabled','{\"_value\":true}',NULL,'2020-04-04 21:05:47.307',NULL),('a�K�\nI.��QHy�|)','core.basicInformation.revocationPage','{\"_value\": \"db266e42646c40b29a6715ea99036925\"}',NULL,'2020-04-04 21:03:23.073',NULL),('bY��\nL0����:N%','core.basicInformation.activeCaptchas','{\"_value\": [\"honeypot\"]}',NULL,'2020-04-28 16:30:58.170',NULL),('h\0���sEu�N��|\r��','core.basicInformation.imprintPage','{\"_value\": \"7dd556f1fa5a4f6d985ec9de0f7ef62a\"}',NULL,'2020-04-04 21:03:23.092',NULL),('n�dfyE���k����','SwagPayPal.settings.installmentBannerEnabled','{\"_value\":true}',NULL,'2020-04-04 21:05:47.353',NULL),('wp�T�NIE�Q�@Lt�','core.logging.entryLimit','{\"_value\": \"10000000\"}',NULL,'2020-04-04 21:03:15.347',NULL),('z���(lO������8-}','SwagPayPal.settings.ecsCartEnabled','{\"_value\":true}',NULL,'2020-04-04 21:05:47.303',NULL),('��R�N��?G�����','core.address.showZipcodeInFrontOfCity','{\"_value\": true}',NULL,'2020-04-04 21:03:16.019',NULL),('��[�mM��?;ڭ8$�','SwagPayPal.settings.landingPage','{\"_value\":\"Login\"}',NULL,'2020-04-04 21:05:47.286',NULL),('��-�DL����~}`�','core.sitemap.sitemapRefreshTime','{\"_value\": 3600}',NULL,'2020-04-04 21:03:20.188',NULL),('��1BĹgN\n$n\\v','core.register.minPasswordLength','{\"_value\": 8}',NULL,'2020-04-04 21:03:14.485',NULL),('��	ao�Mר�bN��','core.basicInformation.shippingPaymentInfoPage','{\"_value\": \"053a2a2051f64e10ac1c91cce095e7d6\"}',NULL,'2020-04-04 21:03:23.054',NULL),('�����NJn�ۘ�X^f�','core.listing.markAsNew','{\"_value\": \"30\"}',NULL,'2020-04-04 21:03:16.783',NULL),('�\"�o��L伋�O�- ','SwagPayPal.settings.plusCheckoutEnabled','{\"_value\":true}',NULL,'2020-04-04 21:05:47.349',NULL),('���8X�Bׁ\'���]��','SwagPayPal.settings.spbButtonShape','{\"_value\":\"rect\"}',NULL,'2020-04-04 21:05:47.345',NULL),('���%zJ��1y����','core.update.channel','{\"_value\":\"stable\"}',NULL,'2020-04-04 21:03:16.013',NULL),('�F}0�M=�.\Z\\�5��','core.basicInformation.email','{\"_value\": \"doNotReply@localhost\"}',NULL,'2020-04-04 21:03:14.484',NULL),('�a�I9�J�8��w@\r','core.cart.maxQuantity','{\"_value\": \"100\"}',NULL,'2020-04-04 21:03:16.016',NULL),('ҋ\\�(L�3����E�','SwagPayPal.settings.merchantLocation','{\"_value\":\"germany\"}',NULL,'2020-04-04 21:05:47.294',NULL),('�>�Ky�De*;�XR','core.mailerSettings.emailAgent','{\"_value\":\"local\"}',NULL,'2020-04-04 21:05:45.726',NULL),('�޳fB��0?�:/)V','core.store.apiUri','{\"_value\": \"https://api.shopware.com\"}',NULL,'2020-04-04 21:03:14.484',NULL),('�,���M�W���{�','core.update.apiUri','{\"_value\": \"https://update-api.shopware.com\"}',NULL,'2020-04-04 21:03:16.012',NULL),('��o�S�N���\'�&�D','core.mailerSettings.sendMailOptions','{\"_value\":\"-t\"}',NULL,'2020-04-04 21:05:45.732',NULL),('��$��POe���S�i�<','core.logging.entryLifetimeSeconds','{\"_value\": \"2678400\"}',NULL,'2020-04-04 21:03:15.348',NULL),('��7֬�G􂓃V>���','SwagPayPal.settings.ecsButtonColor','{\"_value\":\"gold\"}',NULL,'2020-04-04 21:05:47.320',NULL),('�|UHÑ���׎J�','SwagPayPal.settings.ecsListingEnabled','{\"_value\":true}',NULL,'2020-04-04 21:05:47.316',NULL),('����Cǽ�\r�Zu','core.loginRegistration.passwordMinLength','{\"_value\": \"8\"}',NULL,'2020-04-04 21:03:16.017',NULL),('��,��Af��Z !r','SwagPayPal.settings.sendOrderNumber','{\"_value\":true}',NULL,'2020-04-04 21:05:47.290',NULL),('��qG+�Oe�85��:�','core.newsletter.doubleOptIn','{\"_value\": true}',NULL,'2020-04-04 21:03:14.485',NULL),('��&�ەLɰS�j��','core.update.code','{\"_value\": \"\"}',NULL,'2020-04-04 21:03:16.014',NULL),('�����Iw�0i�^�1','core.newsletter.subscribeDomain','{\"_value\": \"http://localhost\"}','�C-�9�F$�2�k��M','2020-04-04 21:03:14.485',NULL);
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax` (
  `id` binary(16) NOT NULL,
  `tax_rate` decimal(10,2) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx.tax.tax` (`tax_rate`),
  CONSTRAINT `json.tax.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
INSERT INTO `tax` VALUES ('� r�O\0I�>��m',7.00,'7%',NULL,'2020-04-04 21:03:14.391',NULL),('�H0�ôF���®E�gt',19.00,'19%',NULL,'2020-04-04 21:03:14.391',NULL);
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rule`
--

DROP TABLE IF EXISTS `tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rule` (
  `id` binary(16) NOT NULL,
  `tax_id` binary(16) NOT NULL,
  `tax_rule_type_id` binary(16) NOT NULL,
  `country_id` binary(16) NOT NULL,
  `tax_rate` double(10,2) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk.tax_rule.tax_id` (`tax_id`),
  KEY `fk.tax_rule.tax_area_rule_type_id` (`tax_rule_type_id`),
  KEY `fk.tax_rule.country_id` (`country_id`),
  CONSTRAINT `fk.tax_rule.country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `fk.tax_rule.tax_area_rule_type_id` FOREIGN KEY (`tax_rule_type_id`) REFERENCES `tax_rule_type` (`id`),
  CONSTRAINT `fk.tax_rule.tax_id` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`),
  CONSTRAINT `json.tax_rule.data` CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rule`
--

LOCK TABLES `tax_rule` WRITE;
/*!40000 ALTER TABLE `tax_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rule_type`
--

DROP TABLE IF EXISTS `tax_rule_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rule_type` (
  `id` binary(16) NOT NULL,
  `technical_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.technical_name` (`technical_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rule_type`
--

LOCK TABLES `tax_rule_type` WRITE;
/*!40000 ALTER TABLE `tax_rule_type` DISABLE KEYS */;
INSERT INTO `tax_rule_type` VALUES ('�٪�KĮu-�o�[','entire_country',3,'2020-04-04 21:03:19.749',NULL),(')	��^H���gh�&','zip_code',0,'2020-04-04 21:03:19.739',NULL),('4e�w�J����c�|Ȥ','zip_code_range',1,'2020-04-04 21:03:19.743',NULL),('��Fh��<I3��','individual_states',2,'2020-04-04 21:03:19.746',NULL);
/*!40000 ALTER TABLE `tax_rule_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rule_type_translation`
--

DROP TABLE IF EXISTS `tax_rule_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rule_type_translation` (
  `tax_rule_type_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`tax_rule_type_id`,`language_id`),
  KEY `fk.tax_rule_type_translation.language_id` (`language_id`),
  CONSTRAINT `fk.tax_rule_type_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.tax_rule_type_translation.tax_rule_type_id` FOREIGN KEY (`tax_rule_type_id`) REFERENCES `tax_rule_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rule_type_translation`
--

LOCK TABLES `tax_rule_type_translation` WRITE;
/*!40000 ALTER TABLE `tax_rule_type_translation` DISABLE KEYS */;
INSERT INTO `tax_rule_type_translation` VALUES ('�٪�KĮu-�o�[','/�_��Mp�XT�|��','Entire Country','2020-04-04 21:03:19.750',NULL),('�٪�KĮu-�o�[','�/p�L���M�4�8','Gesamte Land','2020-04-04 21:03:19.750',NULL),(')	��^H���gh�&','/�_��Mp�XT�|��','Zip Code','2020-04-04 21:03:19.741',NULL),(')	��^H���gh�&','�/p�L���M�4�8','Postleitzahl','2020-04-04 21:03:19.742',NULL),('4e�w�J����c�|Ȥ','/�_��Mp�XT�|��','Zip Code Range','2020-04-04 21:03:19.745',NULL),('4e�w�J����c�|Ȥ','�/p�L���M�4�8','Postleitzahl Bereich','2020-04-04 21:03:19.745',NULL),('��Fh��<I3��','/�_��Mp�XT�|��','Individual States','2020-04-04 21:03:19.747',NULL),('��Fh��<I3��','�/p�L���M�4�8','Individuelle Bundesländer','2020-04-04 21:03:19.748',NULL);
/*!40000 ALTER TABLE `tax_rule_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme` (
  `id` binary(16) NOT NULL,
  `technical_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview_media_id` binary(16) DEFAULT NULL,
  `parent_theme_id` binary(16) DEFAULT NULL,
  `base_config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `config_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.theme.technical_name` (`technical_name`),
  CONSTRAINT `json.theme.base_config` CHECK (json_valid(`base_config`)),
  CONSTRAINT `json.theme.config_values` CHECK (json_valid(`config_values`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES ('�\0*�G�L���x�5�7','Storefront','Shopware default theme','shopware AG','��|թ�C=�a���K�',NULL,'{\"blocks\":{\"themeColors\":{\"label\":{\"en-GB\":\"Theme colours\",\"de-DE\":\"Theme-Farben\"}},\"typography\":{\"label\":{\"en-GB\":\"Typography\",\"de-DE\":\"Typografie\"}},\"eCommerce\":{\"label\":{\"en-GB\":\"E-Commerce\",\"de-DE\":\"E-Commerce\"}},\"statusColors\":{\"label\":{\"en-GB\":\"Status messages\",\"de-DE\":\"Status-Ausgaben\"}},\"media\":{\"label\":{\"en-GB\":\"Media\",\"de-DE\":\"Medien\"}},\"unordered\":{\"label\":{\"en-GB\":\"Misc\",\"de-DE\":\"Sonstige\"}}},\"fields\":{\"sw-color-brand-primary\":{\"label\":{\"en-GB\":\"Primary colour\",\"de-DE\":\"Primärfarbe\"},\"type\":\"color\",\"value\":\"#008490\",\"editable\":true,\"block\":\"themeColors\",\"order\":100},\"sw-color-brand-secondary\":{\"label\":{\"en-GB\":\"Secondary colour\",\"de-DE\":\"Sekundärfarbe\"},\"type\":\"color\",\"value\":\"#526e7f\",\"editable\":true,\"block\":\"themeColors\",\"order\":200},\"sw-border-color\":{\"label\":{\"en-GB\":\"Border\",\"de-DE\":\"Rahmen\"},\"type\":\"color\",\"value\":\"#bcc1c7\",\"editable\":true,\"block\":\"themeColors\",\"order\":300},\"sw-background-color\":{\"label\":{\"en-GB\":\"Background\",\"de-DE\":\"Hintergrund\"},\"type\":\"color\",\"value\":\"#fff\",\"editable\":true,\"block\":\"themeColors\",\"order\":400},\"sw-color-success\":{\"label\":{\"en-GB\":\"Success\",\"de-DE\":\"Erfolg\"},\"type\":\"color\",\"value\":\"#3cc261\",\"editable\":true,\"block\":\"statusColors\",\"order\":100},\"sw-color-info\":{\"label\":{\"en-GB\":\"Information\",\"de-DE\":\"Information\"},\"type\":\"color\",\"value\":\"#26b6cf\",\"editable\":true,\"block\":\"statusColors\",\"order\":200},\"sw-color-warning\":{\"label\":{\"en-GB\":\"Notice\",\"de-DE\":\"Hinweis\"},\"type\":\"color\",\"value\":\"#ffbd5d\",\"editable\":true,\"block\":\"statusColors\",\"order\":300},\"sw-color-danger\":{\"label\":{\"en-GB\":\"Error\",\"de-DE\":\"Fehler\"},\"type\":\"color\",\"value\":\"#e52427\",\"editable\":true,\"block\":\"statusColors\",\"order\":400},\"sw-font-family-base\":{\"label\":{\"en-GB\":\"Fonttype text\",\"de-DE\":\"Schriftart Text\"},\"type\":\"fontFamily\",\"value\":\"\'Inter\', sans-serif\",\"editable\":true,\"block\":\"typography\",\"order\":100},\"sw-text-color\":{\"label\":{\"en-GB\":\"Text colour\",\"de-DE\":\"Textfarbe\"},\"type\":\"color\",\"value\":\"#4a545b\",\"editable\":true,\"block\":\"typography\",\"order\":200},\"sw-font-family-headline\":{\"label\":{\"en-GB\":\"Fonttype headline\",\"de-DE\":\"Schriftart Überschrift\"},\"type\":\"fontFamily\",\"value\":\"\'Inter\', sans-serif\",\"editable\":true,\"block\":\"typography\",\"order\":300},\"sw-headline-color\":{\"label\":{\"en-GB\":\"Headline colour\",\"de-DE\":\"Überschriftfarbe\"},\"type\":\"color\",\"value\":\"#4a545b\",\"editable\":true,\"block\":\"typography\",\"order\":400},\"sw-color-price\":{\"label\":{\"en-GB\":\"Price\",\"de-DE\":\"Preis\"},\"type\":\"color\",\"value\":\"#4a545b\",\"editable\":true,\"block\":\"eCommerce\",\"order\":100},\"sw-color-buy-button\":{\"label\":{\"en-GB\":\"Buy button\",\"de-DE\":\"Kaufen-Button\"},\"type\":\"color\",\"value\":\"#008490\",\"editable\":true,\"block\":\"eCommerce\",\"order\":200},\"sw-color-buy-button-text\":{\"label\":{\"en-GB\":\"Buy button text\",\"de-DE\":\"Kaufen-Button Text\"},\"type\":\"color\",\"value\":\"#fff\",\"editable\":true,\"block\":\"eCommerce\",\"order\":300},\"sw-logo-desktop\":{\"label\":{\"en-GB\":\"Desktop\",\"de-DE\":\"Desktop\"},\"helpText\":{\"en-GB\":\"Displayed for viewports of above 991px\",\"de-DE\":\"Wird über einem Viewport von 991px angezeigt\"},\"type\":\"media\",\"value\":\"3a66dfba74974a2abca08027b2342126\",\"editable\":true,\"block\":\"media\",\"order\":100},\"sw-logo-tablet\":{\"label\":{\"en-GB\":\"Tablet\",\"de-DE\":\"Tablet\"},\"helpText\":{\"en-GB\":\"Displayed between a viewport of 767px to 991px\",\"de-DE\":\"Wird zwischen einem viewport von 767px bis 991px angezeigt\"},\"type\":\"media\",\"value\":\"3a66dfba74974a2abca08027b2342126\",\"editable\":true,\"block\":\"media\",\"order\":200},\"sw-logo-mobile\":{\"label\":{\"en-GB\":\"Mobile\",\"de-DE\":\"Mobil\"},\"helpText\":{\"en-GB\":\"Displayed up to a viewport of 767px\",\"de-DE\":\"Wird bis zu einem Viewport von 767px angezeigt\"},\"type\":\"media\",\"value\":\"3a66dfba74974a2abca08027b2342126\",\"editable\":true,\"block\":\"media\",\"order\":300},\"sw-logo-share\":{\"label\":{\"en-GB\":\"App & share icon\",\"de-DE\":\"App- & Share-Icon\"},\"type\":\"media\",\"value\":\"\",\"editable\":true,\"block\":\"media\",\"order\":400},\"sw-logo-favicon\":{\"label\":{\"en-GB\":\"Favicon\",\"de-DE\":\"Favicon\"},\"type\":\"media\",\"value\":\"7a721e99cc6c432980239d83749eb716\",\"editable\":true,\"block\":\"media\",\"order\":500}}}',NULL,1,'2020-04-04 21:03:25.171','2020-04-28 16:31:04.671');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_media`
--

DROP TABLE IF EXISTS `theme_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_media` (
  `theme_id` binary(16) NOT NULL,
  `media_id` binary(16) NOT NULL,
  PRIMARY KEY (`theme_id`,`media_id`),
  KEY `fk.theme_media.media_id` (`media_id`),
  CONSTRAINT `fk.theme_media.media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk.theme_media.theme_id` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_media`
--

LOCK TABLES `theme_media` WRITE;
/*!40000 ALTER TABLE `theme_media` DISABLE KEYS */;
INSERT INTO `theme_media` VALUES ('�\0*�G�L���x�5�7',':fߺt�J*���\'�4!&'),('�\0*�G�L���x�5�7','zr��lC)�#��t��'),('�\0*�G�L���x�5�7','��|թ�C=�a���K�');
/*!40000 ALTER TABLE `theme_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_sales_channel`
--

DROP TABLE IF EXISTS `theme_sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_sales_channel` (
  `theme_id` binary(16) NOT NULL,
  `sales_channel_id` binary(16) NOT NULL,
  PRIMARY KEY (`sales_channel_id`),
  KEY `fk.theme_sales_channel.theme_id` (`theme_id`),
  CONSTRAINT `fk.theme_sales_channel.sales_channel_id` FOREIGN KEY (`sales_channel_id`) REFERENCES `sales_channel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.theme_sales_channel.theme_id` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_sales_channel`
--

LOCK TABLES `theme_sales_channel` WRITE;
/*!40000 ALTER TABLE `theme_sales_channel` DISABLE KEYS */;
INSERT INTO `theme_sales_channel` VALUES ('�\0*�G�L���x�5�7','7�>�R�Kޚ��t�\"ð'),('�\0*�G�L���x�5�7','�C-�9�F$�2�k��M');
/*!40000 ALTER TABLE `theme_sales_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_translation`
--

DROP TABLE IF EXISTS `theme_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_translation` (
  `theme_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labels` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `help_texts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`theme_id`,`language_id`),
  KEY `fk.theme_translation.language_id` (`language_id`),
  CONSTRAINT `fk.theme_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.theme_translation.theme_id` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.theme_translation.labels` CHECK (json_valid(`labels`)),
  CONSTRAINT `json.theme_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_translation`
--

LOCK TABLES `theme_translation` WRITE;
/*!40000 ALTER TABLE `theme_translation` DISABLE KEYS */;
INSERT INTO `theme_translation` VALUES ('�\0*�G�L���x�5�7','/�_��Mp�XT�|��',NULL,'{\"blocks.themeColors\":\"Theme colours\",\"blocks.typography\":\"Typography\",\"blocks.eCommerce\":\"E-Commerce\",\"blocks.statusColors\":\"Status messages\",\"blocks.media\":\"Media\",\"blocks.unordered\":\"Misc\",\"fields.sw-color-brand-primary\":\"Primary colour\",\"fields.sw-color-brand-secondary\":\"Secondary colour\",\"fields.sw-border-color\":\"Border\",\"fields.sw-background-color\":\"Background\",\"fields.sw-color-success\":\"Success\",\"fields.sw-color-info\":\"Information\",\"fields.sw-color-warning\":\"Notice\",\"fields.sw-color-danger\":\"Error\",\"fields.sw-font-family-base\":\"Fonttype text\",\"fields.sw-text-color\":\"Text colour\",\"fields.sw-font-family-headline\":\"Fonttype headline\",\"fields.sw-headline-color\":\"Headline colour\",\"fields.sw-color-price\":\"Price\",\"fields.sw-color-buy-button\":\"Buy button\",\"fields.sw-color-buy-button-text\":\"Buy button text\",\"fields.sw-logo-desktop\":\"Desktop\",\"fields.sw-logo-tablet\":\"Tablet\",\"fields.sw-logo-mobile\":\"Mobile\",\"fields.sw-logo-share\":\"App & share icon\",\"fields.sw-logo-favicon\":\"Favicon\"}','{\"fields.sw-logo-desktop\":\"Displayed for viewports of above 991px\",\"fields.sw-logo-tablet\":\"Displayed between a viewport of 767px to 991px\",\"fields.sw-logo-mobile\":\"Displayed up to a viewport of 767px\"}',NULL,'2020-04-04 21:03:25.169','2020-04-28 16:31:04.669'),('�\0*�G�L���x�5�7','�/p�L���M�4�8',NULL,'{\"blocks.themeColors\":\"Theme-Farben\",\"blocks.typography\":\"Typografie\",\"blocks.eCommerce\":\"E-Commerce\",\"blocks.statusColors\":\"Status-Ausgaben\",\"blocks.media\":\"Medien\",\"blocks.unordered\":\"Sonstige\",\"fields.sw-color-brand-primary\":\"Primärfarbe\",\"fields.sw-color-brand-secondary\":\"Sekundärfarbe\",\"fields.sw-border-color\":\"Rahmen\",\"fields.sw-background-color\":\"Hintergrund\",\"fields.sw-color-success\":\"Erfolg\",\"fields.sw-color-info\":\"Information\",\"fields.sw-color-warning\":\"Hinweis\",\"fields.sw-color-danger\":\"Fehler\",\"fields.sw-font-family-base\":\"Schriftart Text\",\"fields.sw-text-color\":\"Textfarbe\",\"fields.sw-font-family-headline\":\"Schriftart Überschrift\",\"fields.sw-headline-color\":\"Überschriftfarbe\",\"fields.sw-color-price\":\"Preis\",\"fields.sw-color-buy-button\":\"Kaufen-Button\",\"fields.sw-color-buy-button-text\":\"Kaufen-Button Text\",\"fields.sw-logo-desktop\":\"Desktop\",\"fields.sw-logo-tablet\":\"Tablet\",\"fields.sw-logo-mobile\":\"Mobil\",\"fields.sw-logo-share\":\"App- & Share-Icon\",\"fields.sw-logo-favicon\":\"Favicon\"}','{\"fields.sw-logo-desktop\":\"Wird über einem Viewport von 991px angezeigt\",\"fields.sw-logo-tablet\":\"Wird zwischen einem viewport von 767px bis 991px angezeigt\",\"fields.sw-logo-mobile\":\"Wird bis zu einem Viewport von 767px angezeigt\"}',NULL,'2020-04-04 21:03:25.170','2020-04-28 16:31:04.670');
/*!40000 ALTER TABLE `theme_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_translation`
--

DROP TABLE IF EXISTS `unit_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_translation` (
  `unit_id` binary(16) NOT NULL,
  `language_id` binary(16) NOT NULL,
  `short_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`unit_id`,`language_id`),
  KEY `fk.unit_translation.language_id` (`language_id`),
  CONSTRAINT `fk.unit_translation.language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk.unit_translation.unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.unit_translation.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_translation`
--

LOCK TABLES `unit_translation` WRITE;
/*!40000 ALTER TABLE `unit_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` binary(16) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) DEFAULT NULL,
  `avatar_id` binary(16) DEFAULT NULL,
  `locale_id` binary(16) NOT NULL,
  `store_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq.user.email` (`email`),
  UNIQUE KEY `uniq.user.username` (`username`),
  KEY `fk.user.locale_id` (`locale_id`),
  KEY `fk.user.avatar_id` (`avatar_id`),
  CONSTRAINT `fk.user.avatar_id` FOREIGN KEY (`avatar_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk.user.locale_id` FOREIGN KEY (`locale_id`) REFERENCES `locale` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `json.user.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('+B��[Bl��5��|:�','admin','$2y$10$917L7e7RiLJTOM80bBzXzuhuqIrcW8bJdK4/kL.G7.mshojxnEj2G','','admin','info@shopware.com',1,1,NULL,'1��UAM�wJ��@�#',NULL,NULL,'2020-04-04 21:03:25.329','2020-04-04 21:05:54.928');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access_key`
--

DROP TABLE IF EXISTS `user_access_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_access_key` (
  `id` binary(16) NOT NULL,
  `user_id` binary(16) NOT NULL,
  `write_access` tinyint(1) NOT NULL,
  `access_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_access_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_usage_at` datetime(3) DEFAULT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx.user_access_key.user_id_` (`user_id`),
  KEY `idx.user_access_key.access_key` (`access_key`),
  CONSTRAINT `fk.user_access_key.user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `json.user_access_key.custom_fields` CHECK (json_valid(`custom_fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_key`
--

LOCK TABLES `user_access_key` WRITE;
/*!40000 ALTER TABLE `user_access_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_access_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_recovery`
--

DROP TABLE IF EXISTS `user_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_recovery` (
  `id` binary(16) NOT NULL,
  `user_id` binary(16) NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  UNIQUE KEY `uniq.user_recovery.user_id` (`user_id`),
  CONSTRAINT `fk.user_recovery.user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_recovery`
--

LOCK TABLES `user_recovery` WRITE;
/*!40000 ALTER TABLE `user_recovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_commit`
--

DROP TABLE IF EXISTS `version_commit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version_commit` (
  `id` binary(16) NOT NULL,
  `auto_increment` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_merge` tinyint(1) NOT NULL DEFAULT 0,
  `message` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL,
  `integration_id` binary(16) DEFAULT NULL,
  `version_id` binary(16) NOT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auto_increment` (`auto_increment`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_commit`
--

LOCK TABLES `version_commit` WRITE;
/*!40000 ALTER TABLE `version_commit` DISABLE KEYS */;
INSERT INTO `version_commit` VALUES ('	�\\\\v/M��	!rd�6',2,0,NULL,'+B��[Bl��5��|:�',NULL,'���jK¾K��u,4%','2020-04-04 21:05:17.649',NULL),(')(a�14Kʬ6���6�',1,0,NULL,'+B��[Bl��5��|:�',NULL,'���jK¾K��u,4%','2020-04-04 21:05:17.596',NULL),('8�E�kI\r�߮�u��',6,0,NULL,'+B��[Bl��5��|:�',NULL,'���jK¾K��u,4%','2020-04-04 21:05:18.991',NULL),('E�ܴ_�B^���(xq�9',7,0,NULL,'+B��[Bl��5��|:�',NULL,'���jK¾K��u,4%','2020-04-04 21:05:19.114',NULL),('\\�^�F��%�n7ܲ',8,0,NULL,'+B��[Bl��5��|:�',NULL,'���jK¾K��u,4%','2020-04-04 21:05:19.294',NULL),('`	PhDG��a|����',5,0,NULL,'+B��[Bl��5��|:�',NULL,'���jK¾K��u,4%','2020-04-04 21:05:18.900',NULL),('u��)F\\��\0�$��',4,0,NULL,'+B��[Bl��5��|:�',NULL,'���jK¾K��u,4%','2020-04-04 21:05:18.798',NULL),('�_+�� G��v�Y>��',3,0,NULL,'+B��[Bl��5��|:�',NULL,'���jK¾K��u,4%','2020-04-04 21:05:18.662',NULL);
/*!40000 ALTER TABLE `version_commit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_commit_data`
--

DROP TABLE IF EXISTS `version_commit_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version_commit_data` (
  `id` binary(16) NOT NULL,
  `auto_increment` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_commit_id` binary(16) NOT NULL,
  `entity_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` binary(16) DEFAULT NULL,
  `integration_id` binary(16) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auto_increment` (`auto_increment`),
  KEY `fk.version_commit_data.version_commit_id` (`version_commit_id`),
  CONSTRAINT `fk.version_commit_data.version_commit_id` FOREIGN KEY (`version_commit_id`) REFERENCES `version_commit` (`id`) ON DELETE CASCADE,
  CONSTRAINT `json.version_commit_data.entity_id` CHECK (json_valid(`entity_id`)),
  CONSTRAINT `json.version_commit_data.payload` CHECK (json_valid(`payload`))
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_commit_data`
--

LOCK TABLES `version_commit_data` WRITE;
/*!40000 ALTER TABLE `version_commit_data` DISABLE KEYS */;
INSERT INTO `version_commit_data` VALUES ('��;�K����m�И',9,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"19ca405790ff4f07aac8c599d4317868\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"19ca405790ff4f07aac8c599d4317868\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Bakery products\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.625000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('bu�)G��Np����',57,'8�E�kI\r�߮�u��','product_translation','{\"productId\":\"3ac014f329884b57a2cce5a29f34779c\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"3ac014f329884b57a2cce5a29f34779c\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Hauptprodukt, versandkostenfrei mit Hervorhebung\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.983000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.991',NULL),('eD\\^D��i�.�F�',74,'E�ܴ_�B^���(xq�9','product','{\"id\":\"6d339741cae547bc977c7cb8fe7c36ad\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"6d339741cae547bc977c7cb8fe7c36ad\",\"parentId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10005.3\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.101000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('�̭��I\"�W����',17,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"8de9b484c54f441c894774e5f57e485c\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"8de9b484c54f441c894774e5f57e485c\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Women\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.634000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('��*88I���+�և�G',52,'`	PhDG��a|����','product_manufacturer_translation','{\"productManufacturerId\":\"7f24e96676e944b0a0addc20d56728cb\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productManufacturerId\":\"7f24e96676e944b0a0addc20d56728cb\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Shopware Fashion\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.895000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.900',NULL),('��1w�D�.�N�!�',90,'\\�^�F��%�n7ܲ','product','{\"id\":\"f25a498992a043b89f0d3445a5ae2d7f\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"f25a498992a043b89f0d3445a5ae2d7f\",\"parentId\":\"c7bca22753c84d08b6178a50052b4146\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10007.4\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.285000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('^�Q�x@̎��r��4',22,'	�\\\\v/M��	!rd�6','category','{\"id\":\"0c8312bca2c0411d82320304db4e9f28\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','update','{\"cmsPageId\":\"695477e02ef643e5a016b83ed4cdf63a\",\"displayNestedProducts\":true,\"type\":\"page\",\"visible\":true,\"active\":true,\"updatedAt\":{\"date\":\"2020-04-04 21:05:17.619000\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"id\":\"0c8312bca2c0411d82320304db4e9f28\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('��}�7A��j�h��W',45,'u��)F\\��\0�$��','product_manufacturer','{\"id\":\"2326d67406134c88bcf80e52d9d2ecb7\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"2326d67406134c88bcf80e52d9d2ecb7\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.792000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.798',NULL),('_��g�H���o!��',10,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"48f97f432fd041388b2630184139cf0e\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"48f97f432fd041388b2630184139cf0e\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Fisch\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.627000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('\Zr�2��K��Q2-��',59,'8�E�kI\r�߮�u��','product_media','{\"id\":\"2de02991cd0548a4ac6cc35cb11773a0\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"2de02991cd0548a4ac6cc35cb11773a0\",\"productId\":\"3ac014f329884b57a2cce5a29f34779c\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"mediaId\":\"2de02991cd0548a4ac6cc35cb11773a0\",\"position\":1,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.987000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.991',NULL),('A���@+�&>i�4��',81,'\\�^�F��%�n7ܲ','product_category','{\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"categoryId\":\"2185182cbbd4462ea844abeb2a438b33\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"categoryId\":\"2185182cbbd4462ea844abeb2a438b33\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('�m�muG\r�2m��UC',78,'\\�^�F��%�n7ܲ','product_translation','{\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Hauptprodukt mit Eigenschaften\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.274000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('#*}�@i��LC\'\"��',3,')(a�14Kʬ6���6�','cms_slot','{\"id\":\"bc4efa92b65a4ef487d666b0ff632fb2\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"bc4efa92b65a4ef487d666b0ff632fb2\",\"blockId\":\"8dbb3e89bfa648edb4dbb10d0af20d25\",\"type\":\"image\",\"slot\":\"image\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.593000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.596',NULL),('\'ύ��E���-���/�',76,'E�ܴ_�B^���(xq�9','product','{\"id\":\"3821dcaa6c564b179f8eed5246799a2c\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"3821dcaa6c564b179f8eed5246799a2c\",\"parentId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10005.5\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.105000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('+މ�E�Gݔ<?�D?�',7,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Food\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.622000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('-y�\\kfA��]��r�:',20,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"251448b91bc742de85643f5fccd89051\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"251448b91bc742de85643f5fccd89051\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Freizeit & Elektro\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.640000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('.��ᒀM-�p����',25,'	�\\\\v/M��	!rd�6','category','{\"id\":\"48f97f432fd041388b2630184139cf0e\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"48f97f432fd041388b2630184139cf0e\",\"parentId\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"afterCategoryId\":\"19ca405790ff4f07aac8c599d4317868\",\"afterCategoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"cmsPageId\":\"5275dace8efd454281296eaac243a3fd\",\"displayNestedProducts\":true,\"type\":\"page\",\"visible\":true,\"active\":true,\"createdAt\":{\"date\":\"2020-04-04 21:05:17.628000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('/gvAh~D#���٪|VI',35,'�_+�� G��v�Y>��','product_manufacturer','{\"id\":\"cc1c20c365d34cfb88bfab3c3e81d350\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"cc1c20c365d34cfb88bfab3c3e81d350\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.651000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),('/�Y=|f@պ�5��wNm',80,'\\�^�F��%�n7ܲ','product_media','{\"id\":\"5808d194947f415495d9782d8fdc92ae\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"5808d194947f415495d9782d8fdc92ae\",\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"mediaId\":\"5808d194947f415495d9782d8fdc92ae\",\"position\":1,\"createdAt\":{\"date\":\"2020-04-04 21:05:19.277000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('0��A�����D�',12,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"bb22b05bff9140f3808b1cff975b75eb\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"bb22b05bff9140f3808b1cff975b75eb\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Süßes\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.629000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('1�i���O��av6��v',44,'u��)F\\��\0�$��','product_manufacturer_translation','{\"productManufacturerId\":\"2326d67406134c88bcf80e52d9d2ecb7\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productManufacturerId\":\"2326d67406134c88bcf80e52d9d2ecb7\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Shopware Food\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.792000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.798',NULL),('7(S��$@К�0�q0�',48,'u��)F\\��\0�$��','product','{\"id\":\"1901dc5e888f4b1ea4168c2c5f005540\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"1901dc5e888f4b1ea4168c2c5f005540\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"manufacturerId\":\"2326d67406134c88bcf80e52d9d2ecb7\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"taxId\":\"d9483081c3b4468c8280c2ae45ac6774\",\"coverId\":\"6968ad64888844679918c638e449ffc5\",\"active\":false,\"stock\":40,\"price\":[{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":1.6699999999999999,\"gross\":1.99,\"linked\":true,\"listPrice\":null,\"extensions\":[]}],\"productNumber\":\"SWDEMO100013\",\"isCloseout\":false,\"purchaseSteps\":1,\"minPurchase\":1,\"purchaseUnit\":250.0,\"referenceUnit\":250.0,\"shippingFree\":false,\"purchasePrice\":1.99,\"releaseDate\":{\"date\":\"2020-04-04 21:05:18.643000\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"restockTime\":3,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.795000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.798',NULL),(';6�+�A���d�l�g',36,'�_+�� G��v�Y>��','product_price','{\"id\":\"59ab52a10e6441b699325fc5acae9b59\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"59ab52a10e6441b699325fc5acae9b59\",\"productId\":\"11dc680240b04f469ccba354cbf0b967\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"price\":[{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":630.25,\"gross\":750.0,\"linked\":true,\"listPrice\":null,\"extensions\":[]}],\"quantityStart\":12,\"quantityEnd\":null,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.653000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),(';���B%��#�c�',8,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"19ca405790ff4f07aac8c599d4317868\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"19ca405790ff4f07aac8c599d4317868\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Backwaren\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.624000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('=���� KʱVa�����',2,')(a�14Kʬ6���6�','cms_slot_translation','{\"cmsSlotId\":\"bc4efa92b65a4ef487d666b0ff632fb2\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"cmsSlotId\":\"bc4efa92b65a4ef487d666b0ff632fb2\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"cmsSlotVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"config\":{\"url\":{\"value\":null,\"source\":\"static\"},\"media\":{\"value\":\"de4b7dbe9d95435092cb85ce146ced28\",\"source\":\"static\"},\"newTab\":{\"value\":false,\"source\":\"static\"},\"minHeight\":{\"value\":\"340px\",\"source\":\"static\"},\"displayMode\":{\"value\":\"standard\",\"source\":\"static\"}},\"createdAt\":{\"date\":\"2020-04-04 21:05:17.593000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.596',NULL),('=�aǞ�O�����n�:',39,'�_+�� G��v�Y>��','product_category','{\"productId\":\"11dc680240b04f469ccba354cbf0b967\",\"categoryId\":\"251448b91bc742de85643f5fccd89051\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"11dc680240b04f469ccba354cbf0b967\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"categoryId\":\"251448b91bc742de85643f5fccd89051\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),('EoV,��Fc����c�(',65,'E�ܴ_�B^���(xq�9','product_category','{\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"categoryId\":\"8de9b484c54f441c894774e5f57e485c\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"categoryId\":\"8de9b484c54f441c894774e5f57e485c\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('E��iHIʦ����=��',19,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"2185182cbbd4462ea844abeb2a438b33\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"2185182cbbd4462ea844abeb2a438b33\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Men\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.637000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('Je��]J��t���m',89,'\\�^�F��%�n7ܲ','product','{\"id\":\"8697561a7cea4ace8a6ab59ddf9931be\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"8697561a7cea4ace8a6ab59ddf9931be\",\"parentId\":\"c7bca22753c84d08b6178a50052b4146\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10007.3\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.283000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('KO�b�9D~�����I',46,'u��)F\\��\0�$��','product_media','{\"id\":\"6968ad64888844679918c638e449ffc5\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"6968ad64888844679918c638e449ffc5\",\"productId\":\"1901dc5e888f4b1ea4168c2c5f005540\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"mediaId\":\"6968ad64888844679918c638e449ffc5\",\"position\":1,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.794000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.798',NULL),('UJ �\n�Dה�iC����',16,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"8de9b484c54f441c894774e5f57e485c\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"8de9b484c54f441c894774e5f57e485c\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Damen\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.633000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('\\j�~?L�&����(',37,'�_+�� G��v�Y>��','product_price','{\"id\":\"9f5ed616c788487da5705d21920e87d4\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"9f5ed616c788487da5705d21920e87d4\",\"productId\":\"11dc680240b04f469ccba354cbf0b967\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"ruleId\":\"28caae75a5624f0d985abd0eb32aa160\",\"price\":[{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":672.26999999999998,\"gross\":800.0,\"linked\":true,\"listPrice\":null,\"extensions\":[]}],\"quantityStart\":1,\"quantityEnd\":11,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.654000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),(']�vDC,�r�b���u',71,'E�ܴ_�B^���(xq�9','product','{\"id\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"manufacturerId\":\"7f24e96676e944b0a0addc20d56728cb\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"taxId\":\"d9483081c3b4468c8280c2ae45ac6774\",\"coverId\":\"102ac62ba27347a688030a05c1790db7\",\"active\":true,\"stock\":50,\"price\":[{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":16.799999999999997,\"gross\":19.989999999999998,\"linked\":true,\"listPrice\":null,\"extensions\":[]}],\"productNumber\":\"SWDEMO10005\",\"isCloseout\":false,\"purchaseSteps\":1,\"minPurchase\":1,\"purchaseUnit\":1.0,\"referenceUnit\":1.0,\"shippingFree\":true,\"purchasePrice\":19.989999999999998,\"weight\":0.5,\"releaseDate\":{\"date\":\"2020-04-04 21:05:18.643000\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"restockTime\":3,\"createdAt\":{\"date\":\"2020-04-04 21:05:19.097000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('_p�\\�ED����o�a��',53,'`	PhDG��a|����','product_manufacturer','{\"id\":\"7f24e96676e944b0a0addc20d56728cb\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"7f24e96676e944b0a0addc20d56728cb\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.895000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.900',NULL),('b�����M[����^�',82,'\\�^�F��%�n7ܲ','product_configurator_setting','{\"id\":\"327a5f5acdbd4a80afaee03277d01ac2\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"327a5f5acdbd4a80afaee03277d01ac2\",\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"optionId\":\"acfd7586d02848f1ac801f4776efa414\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.278000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('c�h�� A���N��S',13,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"bb22b05bff9140f3808b1cff975b75eb\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"bb22b05bff9140f3808b1cff975b75eb\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Sweets\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.629000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('g�n0��F˞BAn8�\'',56,'`	PhDG��a|����','product','{\"id\":\"2a88d9b59d474c7e869d8071649be43c\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"2a88d9b59d474c7e869d8071649be43c\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"manufacturerId\":\"7f24e96676e944b0a0addc20d56728cb\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"taxId\":\"d9483081c3b4468c8280c2ae45ac6774\",\"coverId\":\"70e352200b5c45098dc65a5b47094a2a\",\"active\":true,\"stock\":10,\"price\":[{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":416.75999999999999,\"gross\":495.94999999999999,\"linked\":true,\"listPrice\":null,\"extensions\":[]}],\"productNumber\":\"SWDEMO10001\",\"isCloseout\":false,\"purchaseSteps\":1,\"minPurchase\":1,\"purchaseUnit\":1.0,\"referenceUnit\":1.0,\"shippingFree\":false,\"purchasePrice\":495.94999999999999,\"weight\":0.17000000000000001,\"releaseDate\":{\"date\":\"2020-04-04 21:05:18.643000\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"restockTime\":3,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.897000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.900',NULL),('hv%�#�A�S�`m2�',73,'E�ܴ_�B^���(xq�9','product','{\"id\":\"1221467f711947c280b5e496b4af4900\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"1221467f711947c280b5e496b4af4900\",\"parentId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10005.2\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.099000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('i�I��M��˓�PǕ',4,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"0c8312bca2c0411d82320304db4e9f28\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','update','{\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"name\":\"Katalog #1\",\"updatedAt\":{\"date\":\"2020-04-04 21:05:17.618000\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"categoryId\":\"0c8312bca2c0411d82320304db4e9f28\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('m�gv�MJ���}x����',38,'�_+�� G��v�Y>��','product_media','{\"id\":\"84356a71233d4b3e9f417dcc8850c82f\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"84356a71233d4b3e9f417dcc8850c82f\",\"productId\":\"11dc680240b04f469ccba354cbf0b967\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"mediaId\":\"84356a71233d4b3e9f417dcc8850c82f\",\"position\":1,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.655000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),('n��(�AKT����$�!t',23,'	�\\\\v/M��	!rd�6','category','{\"id\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"parentId\":\"0c8312bca2c0411d82320304db4e9f28\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"afterCategoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"cmsPageId\":\"5275dace8efd454281296eaac243a3fd\",\"displayNestedProducts\":true,\"type\":\"page\",\"visible\":true,\"active\":false,\"createdAt\":{\"date\":\"2020-04-04 21:05:17.622000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('qP���GL4��4��A',67,'E�ܴ_�B^���(xq�9','product_configurator_setting','{\"id\":\"6b301ff761b54fae8d86689a5b5a625e\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"6b301ff761b54fae8d86689a5b5a625e\",\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"mediaId\":\"6cbbdc03b43f4207be80b5f752d5a1c4\",\"optionId\":\"2bfd278e87204807a890da4a3e81dd90\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.095000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('rǀ~�BJ��N�LY�@>',85,'\\�^�F��%�n7ܲ','product_configurator_setting','{\"id\":\"5dec69a2747043a68fa64c68e2539c24\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"5dec69a2747043a68fa64c68e2539c24\",\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"optionId\":\"54147692cbfb43419a6d11e26cad44dc\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.280000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('x�(�K	Dɡ�g��2=',5,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"0c8312bca2c0411d82320304db4e9f28\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','update','{\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"name\":\"Catalogue #1\",\"updatedAt\":{\"date\":\"2020-04-04 21:05:17.619000\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"categoryId\":\"0c8312bca2c0411d82320304db4e9f28\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('}��c��BĝM	BK2��',32,'�_+�� G��v�Y>��','product_translation','{\"productId\":\"11dc680240b04f469ccba354cbf0b967\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"11dc680240b04f469ccba354cbf0b967\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Main product with advanced prices\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.648000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),('���]�K>�sZ�vI�',47,'u��)F\\��\0�$��','product_category','{\"productId\":\"1901dc5e888f4b1ea4168c2c5f005540\",\"categoryId\":\"bb22b05bff9140f3808b1cff975b75eb\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"1901dc5e888f4b1ea4168c2c5f005540\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"categoryId\":\"bb22b05bff9140f3808b1cff975b75eb\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.798',NULL),('���c�RJۇ�U��;7',1,')(a�14Kʬ6���6�','cms_slot_translation','{\"cmsSlotId\":\"bc4efa92b65a4ef487d666b0ff632fb2\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"cmsSlotId\":\"bc4efa92b65a4ef487d666b0ff632fb2\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"cmsSlotVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"config\":{\"url\":{\"value\":null,\"source\":\"static\"},\"media\":{\"value\":\"de4b7dbe9d95435092cb85ce146ced28\",\"source\":\"static\"},\"newTab\":{\"value\":false,\"source\":\"static\"},\"minHeight\":{\"value\":\"340px\",\"source\":\"static\"},\"displayMode\":{\"value\":\"standard\",\"source\":\"static\"}},\"createdAt\":{\"date\":\"2020-04-04 21:05:17.592000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.596',NULL),('��m\"~�HJ�\Zs�n',42,'u��)F\\��\0�$��','product_translation','{\"productId\":\"1901dc5e888f4b1ea4168c2c5f005540\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"1901dc5e888f4b1ea4168c2c5f005540\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Main product with reviews\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.790000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.798',NULL),('��1���OЪK���',70,'E�ܴ_�B^���(xq�9','product_configurator_setting','{\"id\":\"89808a84c4fc48ea8336ba2acd4e9061\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"89808a84c4fc48ea8336ba2acd4e9061\",\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"mediaId\":\"102ac62ba27347a688030a05c1790db7\",\"optionId\":\"ad735af1ebfb421e93e408b073c4a89a\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.096000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('�\'��K�IR�O�&h���',15,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"a515ae260223466f8e37471d279e6406\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"a515ae260223466f8e37471d279e6406\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Clothing\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.631000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('���p�I����\r��<',30,'	�\\\\v/M��	!rd�6','category','{\"id\":\"251448b91bc742de85643f5fccd89051\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"251448b91bc742de85643f5fccd89051\",\"parentId\":\"0c8312bca2c0411d82320304db4e9f28\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"afterCategoryId\":\"a515ae260223466f8e37471d279e6406\",\"afterCategoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"cmsPageId\":\"5275dace8efd454281296eaac243a3fd\",\"displayNestedProducts\":true,\"type\":\"page\",\"visible\":true,\"active\":true,\"createdAt\":{\"date\":\"2020-04-04 21:05:17.641000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('���6?A��21�s\"�\n',29,'	�\\\\v/M��	!rd�6','category','{\"id\":\"2185182cbbd4462ea844abeb2a438b33\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"2185182cbbd4462ea844abeb2a438b33\",\"parentId\":\"a515ae260223466f8e37471d279e6406\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"afterCategoryId\":\"8de9b484c54f441c894774e5f57e485c\",\"afterCategoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"cmsPageId\":\"5275dace8efd454281296eaac243a3fd\",\"displayNestedProducts\":true,\"type\":\"page\",\"visible\":true,\"active\":true,\"createdAt\":{\"date\":\"2020-04-04 21:05:17.637000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('��4Y�CHs���a���',43,'u��)F\\��\0�$��','product_manufacturer_translation','{\"productManufacturerId\":\"2326d67406134c88bcf80e52d9d2ecb7\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productManufacturerId\":\"2326d67406134c88bcf80e52d9d2ecb7\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Shopware Lebensmittel\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.791000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.798',NULL),('��;r_)NR�qXײ�',63,'E�ܴ_�B^���(xq�9','product_translation','{\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Variant product\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.091000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('���k�C؇��ǂ',24,'	�\\\\v/M��	!rd�6','category','{\"id\":\"19ca405790ff4f07aac8c599d4317868\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"19ca405790ff4f07aac8c599d4317868\",\"parentId\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"afterCategoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"cmsPageId\":\"5275dace8efd454281296eaac243a3fd\",\"displayNestedProducts\":true,\"type\":\"page\",\"visible\":true,\"active\":true,\"createdAt\":{\"date\":\"2020-04-04 21:05:17.625000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('��Ϸ:LM�(��U��z',31,'�_+�� G��v�Y>��','product_translation','{\"productId\":\"11dc680240b04f469ccba354cbf0b967\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"11dc680240b04f469ccba354cbf0b967\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Hauptprodukt mit erweiterten Preisen\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.648000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),('��<3wM������]��',34,'�_+�� G��v�Y>��','product_manufacturer_translation','{\"productManufacturerId\":\"cc1c20c365d34cfb88bfab3c3e81d350\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productManufacturerId\":\"cc1c20c365d34cfb88bfab3c3e81d350\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Shopware Freetime\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.651000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),('�LQ��C�����M@�',54,'`	PhDG��a|����','product_media','{\"id\":\"70e352200b5c45098dc65a5b47094a2a\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"70e352200b5c45098dc65a5b47094a2a\",\"productId\":\"2a88d9b59d474c7e869d8071649be43c\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"mediaId\":\"70e352200b5c45098dc65a5b47094a2a\",\"position\":1,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.896000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.900',NULL),('��1�I�=6��\"��',64,'E�ܴ_�B^���(xq�9','product_media','{\"id\":\"102ac62ba27347a688030a05c1790db7\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"102ac62ba27347a688030a05c1790db7\",\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"mediaId\":\"102ac62ba27347a688030a05c1790db7\",\"position\":1,\"createdAt\":{\"date\":\"2020-04-04 21:05:19.092000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('�EM-A]����\0�',62,'E�ܴ_�B^���(xq�9','product_translation','{\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Variantenprodukt\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.089000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('��j$.XC��_����',27,'	�\\\\v/M��	!rd�6','category','{\"id\":\"a515ae260223466f8e37471d279e6406\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"a515ae260223466f8e37471d279e6406\",\"parentId\":\"0c8312bca2c0411d82320304db4e9f28\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"afterCategoryId\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"afterCategoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"cmsPageId\":\"5275dace8efd454281296eaac243a3fd\",\"displayNestedProducts\":true,\"type\":\"page\",\"visible\":true,\"active\":true,\"createdAt\":{\"date\":\"2020-04-04 21:05:17.632000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('��\Z>7�Cr�eɤ��9',14,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"a515ae260223466f8e37471d279e6406\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"a515ae260223466f8e37471d279e6406\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Bekleidung\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.631000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('���8%�@����I[]',88,'\\�^�F��%�n7ܲ','product','{\"id\":\"70b9b4662a7143f1a80cb8ed151b4d8d\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"70b9b4662a7143f1a80cb8ed151b4d8d\",\"parentId\":\"c7bca22753c84d08b6178a50052b4146\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10007.2\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.282000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('��TEϹO0�!J�i��d',21,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"251448b91bc742de85643f5fccd89051\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"251448b91bc742de85643f5fccd89051\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Free time & electronics\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.641000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('�K����Mڣ�݈<��]',58,'8�E�kI\r�߮�u��','product_translation','{\"productId\":\"3ac014f329884b57a2cce5a29f34779c\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"3ac014f329884b57a2cce5a29f34779c\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Main product, free shipping with highlighting\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.985000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.991',NULL),('��L�M6Lذy�|#s��',26,'	�\\\\v/M��	!rd�6','category','{\"id\":\"bb22b05bff9140f3808b1cff975b75eb\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"bb22b05bff9140f3808b1cff975b75eb\",\"parentId\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"afterCategoryId\":\"48f97f432fd041388b2630184139cf0e\",\"afterCategoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"cmsPageId\":\"5275dace8efd454281296eaac243a3fd\",\"displayNestedProducts\":true,\"type\":\"page\",\"visible\":true,\"active\":true,\"createdAt\":{\"date\":\"2020-04-04 21:05:17.630000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('�PL�RC���ra7�',75,'E�ܴ_�B^���(xq�9','product','{\"id\":\"96806d658f714f71b35248d03707313e\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"96806d658f714f71b35248d03707313e\",\"parentId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10005.4\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.103000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('ȼ�?��E_��@�F\"�=',69,'E�ܴ_�B^���(xq�9','product_configurator_setting','{\"id\":\"ae5240b0f2354d259f261d5c7e9ac077\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"ae5240b0f2354d259f261d5c7e9ac077\",\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"mediaId\":\"f69ab8ae42d04e17b2bab5ec2ff0a93c\",\"optionId\":\"52454db2adf942b2ac079a296f454a10\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.096000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('�\Z�/�@������s3	',86,'\\�^�F��%�n7ܲ','product','{\"id\":\"c7bca22753c84d08b6178a50052b4146\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"c7bca22753c84d08b6178a50052b4146\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"manufacturerId\":\"7f24e96676e944b0a0addc20d56728cb\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"taxId\":\"d9483081c3b4468c8280c2ae45ac6774\",\"coverId\":\"5808d194947f415495d9782d8fdc92ae\",\"active\":true,\"stock\":50,\"price\":[{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":16.799999999999997,\"gross\":19.989999999999998,\"linked\":true,\"listPrice\":null,\"extensions\":[]}],\"productNumber\":\"SWDEMO10007\",\"isCloseout\":false,\"purchaseSteps\":1,\"minPurchase\":1,\"purchaseUnit\":1.0,\"referenceUnit\":1.0,\"shippingFree\":true,\"purchasePrice\":19.989999999999998,\"releaseDate\":{\"date\":\"2020-04-04 21:05:18.643000\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"restockTime\":3,\"createdAt\":{\"date\":\"2020-04-04 21:05:19.280000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('�gZ��L��y�P��',33,'�_+�� G��v�Y>��','product_manufacturer_translation','{\"productManufacturerId\":\"cc1c20c365d34cfb88bfab3c3e81d350\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productManufacturerId\":\"cc1c20c365d34cfb88bfab3c3e81d350\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Shopware Freizeit\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.650000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),('��H�/�Iz�����\n�',87,'\\�^�F��%�n7ܲ','product','{\"id\":\"a984f5eca8aa4c81bc9eeac8ebb10aca\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"a984f5eca8aa4c81bc9eeac8ebb10aca\",\"parentId\":\"c7bca22753c84d08b6178a50052b4146\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10007.1\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.281000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('�e�Y��L6�p��^�',49,'`	PhDG��a|����','product_translation','{\"productId\":\"2a88d9b59d474c7e869d8071649be43c\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"2a88d9b59d474c7e869d8071649be43c\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Hauptartikel\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.893000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.900',NULL),('՘���\'Ov��bQA��',18,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"2185182cbbd4462ea844abeb2a438b33\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"2185182cbbd4462ea844abeb2a438b33\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Herren\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.636000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('�U���O��#H:0��',50,'`	PhDG��a|����','product_translation','{\"productId\":\"2a88d9b59d474c7e869d8071649be43c\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"2a88d9b59d474c7e869d8071649be43c\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Main product\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.894000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.900',NULL),('�W1{(wJ��|I�ʫ�p',77,'E�ܴ_�B^���(xq�9','product','{\"id\":\"9858b0c8ec204fa3bb11cf8cfc860285\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"9858b0c8ec204fa3bb11cf8cfc860285\",\"parentId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10005.6\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.106000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('��lڻN��e1�r��',51,'`	PhDG��a|����','product_manufacturer_translation','{\"productManufacturerId\":\"7f24e96676e944b0a0addc20d56728cb\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productManufacturerId\":\"7f24e96676e944b0a0addc20d56728cb\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Shopware Kleidung\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.895000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.900',NULL),('�R�N�H)�f �L��',84,'\\�^�F��%�n7ܲ','product_configurator_setting','{\"id\":\"6d76255c8787466091348a36bc802752\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"6d76255c8787466091348a36bc802752\",\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"optionId\":\"5997d91dc0784997bdef68dfc5a08912\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.279000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('�j]�PO���G+�J��',79,'\\�^�F��%�n7ܲ','product_translation','{\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Main product with properties\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.275000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('�f6�5B��T�B��',68,'E�ܴ_�B^���(xq�9','product_configurator_setting','{\"id\":\"c19ef50d99ca4226bcd684571dfe12da\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"c19ef50d99ca4226bcd684571dfe12da\",\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"optionId\":\"5997d91dc0784997bdef68dfc5a08912\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.096000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('���䰆Gk�����z',41,'u��)F\\��\0�$��','product_translation','{\"productId\":\"1901dc5e888f4b1ea4168c2c5f005540\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"1901dc5e888f4b1ea4168c2c5f005540\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Hauptprodukt mit Bewertungen\",\"description\":\"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\",\"createdAt\":{\"date\":\"2020-04-04 21:05:18.789000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.798',NULL),('�D�}�@C�N�\\���j',40,'�_+�� G��v�Y>��','product','{\"id\":\"11dc680240b04f469ccba354cbf0b967\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"11dc680240b04f469ccba354cbf0b967\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"manufacturerId\":\"cc1c20c365d34cfb88bfab3c3e81d350\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"taxId\":\"d9483081c3b4468c8280c2ae45ac6774\",\"coverId\":\"84356a71233d4b3e9f417dcc8850c82f\",\"active\":true,\"stock\":10,\"price\":[{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":798.31999999999994,\"gross\":950.0,\"linked\":true,\"listPrice\":null,\"extensions\":[]}],\"productNumber\":\"SWDEMO10002\",\"isCloseout\":false,\"purchaseSteps\":1,\"minPurchase\":1,\"purchaseUnit\":1.0,\"referenceUnit\":1.0,\"shippingFree\":true,\"purchasePrice\":950.0,\"weight\":45.0,\"width\":590.0,\"height\":600.0,\"length\":840.0,\"releaseDate\":{\"date\":\"2020-04-04 21:05:18.643000\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"restockTime\":3,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.657000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.662',NULL),('�\"��I1���<�~�',61,'8�E�kI\r�߮�u��','product','{\"id\":\"3ac014f329884b57a2cce5a29f34779c\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"3ac014f329884b57a2cce5a29f34779c\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"manufacturerId\":\"cc1c20c365d34cfb88bfab3c3e81d350\",\"productManufacturerVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"taxId\":\"d9483081c3b4468c8280c2ae45ac6774\",\"coverId\":\"2de02991cd0548a4ac6cc35cb11773a0\",\"active\":true,\"stock\":50,\"price\":[{\"currencyId\":\"b7d2554b0ce847cd82f3ac9bd1c0dfca\",\"net\":15.0,\"gross\":20.0,\"linked\":true,\"listPrice\":null,\"extensions\":[]}],\"productNumber\":\"SWDEMO10006\",\"isCloseout\":false,\"purchaseSteps\":1,\"minPurchase\":1,\"purchaseUnit\":1.0,\"referenceUnit\":1.0,\"shippingFree\":true,\"purchasePrice\":20.0,\"weight\":0.14999999999999999,\"releaseDate\":{\"date\":\"2020-04-04 21:05:18.643000\",\"timezone_type\":3,\"timezone\":\"UTC\"},\"restockTime\":3,\"createdAt\":{\"date\":\"2020-04-04 21:05:18.988000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.991',NULL),('�ɇ\\F���Xs����',66,'E�ܴ_�B^���(xq�9','product_configurator_setting','{\"id\":\"bfb22fb2ae254c5f989dce0f71a86e63\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"bfb22fb2ae254c5f989dce0f71a86e63\",\"productId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"optionId\":\"acfd7586d02848f1ac801f4776efa414\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.094000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('��w��,@� ��X�\'�',72,'E�ܴ_�B^���(xq�9','product','{\"id\":\"1d246bc02e204be88c4b58d44b4dbf0a\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"1d246bc02e204be88c4b58d44b4dbf0a\",\"parentId\":\"43a23e0c03bf4ceabc6055a2185faa87\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"stock\":50,\"productNumber\":\"SWDEMO10005.1\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.098000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.114',NULL),('�,��ѶJ����:��o',60,'8�E�kI\r�߮�u��','product_category','{\"productId\":\"3ac014f329884b57a2cce5a29f34779c\",\"categoryId\":\"2185182cbbd4462ea844abeb2a438b33\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"3ac014f329884b57a2cce5a29f34779c\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"categoryId\":\"2185182cbbd4462ea844abeb2a438b33\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.991',NULL),('�1���K��D5S����',6,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"77b959cf66de4c1590c7f9b7da3982f3\",\"languageId\":\"8b112f70f3a14c1086859e4de334d338\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Lebensmittel\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.621000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('�9��M-m��',83,'\\�^�F��%�n7ܲ','product_configurator_setting','{\"id\":\"2fa8e6a1cdd24c80b029bee2ff315024\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"2fa8e6a1cdd24c80b029bee2ff315024\",\"productId\":\"c7bca22753c84d08b6178a50052b4146\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"optionId\":\"41e5013b67d64d3a92b7a275da8af441\",\"createdAt\":{\"date\":\"2020-04-04 21:05:19.279000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:19.294',NULL),('�u��~MI�����z�>�',55,'`	PhDG��a|����','product_category','{\"productId\":\"2a88d9b59d474c7e869d8071649be43c\",\"categoryId\":\"251448b91bc742de85643f5fccd89051\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"productId\":\"2a88d9b59d474c7e869d8071649be43c\",\"productVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"categoryId\":\"251448b91bc742de85643f5fccd89051\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:18.900',NULL),('���1E���r�o',11,'	�\\\\v/M��	!rd�6','category_translation','{\"categoryId\":\"48f97f432fd041388b2630184139cf0e\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"categoryId\":\"48f97f432fd041388b2630184139cf0e\",\"languageId\":\"2fbb5fe2e29a4d70aa5854ce7ce3e20b\",\"categoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"name\":\"Fish\",\"createdAt\":{\"date\":\"2020-04-04 21:05:17.627000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL),('��⟉�JY���c!>',28,'	�\\\\v/M��	!rd�6','category','{\"id\":\"8de9b484c54f441c894774e5f57e485c\",\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\"}','insert','{\"versionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"id\":\"8de9b484c54f441c894774e5f57e485c\",\"parentId\":\"a515ae260223466f8e37471d279e6406\",\"parentVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"afterCategoryVersionId\":\"0fa91ce3e96a4bc2be4bd9ce752c3425\",\"cmsPageId\":\"5275dace8efd454281296eaac243a3fd\",\"displayNestedProducts\":true,\"type\":\"page\",\"visible\":true,\"active\":true,\"createdAt\":{\"date\":\"2020-04-04 21:05:17.634000\",\"timezone_type\":3,\"timezone\":\"UTC\"}}','+B��[Bl��5��|:�',NULL,'2020-04-04 21:05:17.649',NULL);
/*!40000 ALTER TABLE `version_commit_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-28 16:31:25
