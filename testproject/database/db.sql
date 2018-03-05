-- --------------------------------------------------------
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table webd.webd_log_backend
CREATE TABLE IF NOT EXISTS `webd_log_backend` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` mediumtext NOT NULL,
  `ip` varchar(15) NOT NULL,
  `user` bigint(20) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table webd.webd_log_backend: ~0 rows (approximately)
/*!40000 ALTER TABLE `webd_log_backend` DISABLE KEYS */;
/*!40000 ALTER TABLE `webd_log_backend` ENABLE KEYS */;

-- Dumping structure for table webd.webd_modules
CREATE TABLE IF NOT EXISTS `webd_modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `cssClasses` varchar(128) NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `updateUser` bigint(20) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table webd.webd_modules: ~1 rows (approximately)
/*!40000 ALTER TABLE `webd_modules` DISABLE KEYS */;
INSERT INTO `webd_modules` (`id`, `name`, `cssClasses`, `disabled`, `deleted`, `updateUser`, `timestamp`) VALUES
	(1, 'test', '', 0, 0, 1, '2018-03-05 21:06:25');
/*!40000 ALTER TABLE `webd_modules` ENABLE KEYS */;

-- Dumping structure for table webd.webd_websites
CREATE TABLE IF NOT EXISTS `webd_websites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `language` varchar(12) NOT NULL,
  `updateUser` bigint(20) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table webd.webd_websites: ~1 rows (approximately)
/*!40000 ALTER TABLE `webd_websites` DISABLE KEYS */;
INSERT INTO `webd_websites` (`id`, `name`, `language`, `updateUser`, `timestamp`) VALUES
	(1, 'webd', 'en', 1, '2018-03-03 00:30:20');
/*!40000 ALTER TABLE `webd_websites` ENABLE KEYS */;

-- Dumping structure for table webd.webd_web_itementries
CREATE TABLE IF NOT EXISTS `webd_web_itementries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemId` bigint(20) unsigned NOT NULL,
  `parentValue` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `textValue` longtext NOT NULL,
  `numericValue` bigint(20) NOT NULL,
  `floatValue` double NOT NULL,
  `datetimeValue` datetime NOT NULL,
  `booleanValue` tinyint(1) unsigned NOT NULL,
  `type` enum('text','longText','number','decimalNumber','datetime','date','time','boolean','image','html','values') NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `updateUser` bigint(20) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table webd.webd_web_itementries: ~10 rows (approximately)
/*!40000 ALTER TABLE `webd_web_itementries` DISABLE KEYS */;
INSERT INTO `webd_web_itementries` (`id`, `itemId`, `parentValue`, `name`, `textValue`, `numericValue`, `floatValue`, `datetimeValue`, `booleanValue`, `type`, `deleted`, `updateUser`, `timestamp`) VALUES
	(1, 1, NULL, 'Hello', '', 0, 0, '0000-00-00 00:00:00', 0, 'text', 0, 1, '2018-03-04 14:48:54'),
	(2, 1, NULL, 'Number', '', 0, 0, '0000-00-00 00:00:00', 0, 'number', 0, 1, '2018-03-04 14:49:22'),
	(3, 1, NULL, 'PersonalDetails', '', 0, 0, '0000-00-00 00:00:00', 0, 'values', 0, 1, '2018-03-04 21:58:14'),
	(4, 2, 8, 'Name', 'Jacob', 0, 0, '0000-00-00 00:00:00', 0, 'text', 0, 1, '2018-03-04 21:59:24'),
	(5, 2, 8, 'Age', '', 25, 0, '0000-00-00 00:00:00', 0, 'number', 0, 1, '2018-03-04 21:59:24'),
	(6, 2, NULL, 'Hello', 'There', 0, 0, '0000-00-00 00:00:00', 0, 'text', 0, 1, '2018-03-04 14:48:54'),
	(7, 2, NULL, 'Number', '', 1337, 0, '0000-00-00 00:00:00', 0, 'number', 0, 1, '2018-03-04 14:49:22'),
	(8, 2, NULL, 'PersonalDetails', '', 0, 0, '0000-00-00 00:00:00', 0, 'values', 0, 1, '2018-03-04 21:58:14'),
	(9, 3, NULL, 'MMMM', '', 0, 0, '0000-00-00 00:00:00', 0, 'text', 0, 1, '2018-03-04 21:58:14'),
	(10, 4, NULL, 'MMMM', 'Yes', 0, 0, '0000-00-00 00:00:00', 0, 'text', 0, 1, '2018-03-04 21:58:14');
/*!40000 ALTER TABLE `webd_web_itementries` ENABLE KEYS */;

-- Dumping structure for table webd.webd_web_itemlists
CREATE TABLE IF NOT EXISTS `webd_web_itemlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pageId` bigint(20) unsigned NOT NULL,
  `includeSubPages` tinyint(1) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `cssClasses` varchar(128) NOT NULL,
  `cssClassesItem` varchar(128) NOT NULL,
  `templateView` varchar(128) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `updateUser` bigint(20) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table webd.webd_web_itemlists: ~1 rows (approximately)
/*!40000 ALTER TABLE `webd_web_itemlists` DISABLE KEYS */;
INSERT INTO `webd_web_itemlists` (`id`, `pageId`, `includeSubPages`, `name`, `cssClasses`, `cssClassesItem`, `templateView`, `deleted`, `updateUser`, `timestamp`) VALUES
	(3, 1, 1, 'testlist', 'testlistcls', 'testlistitemcls', 'item_listitem', 0, 1, '2018-03-05 08:25:43');
/*!40000 ALTER TABLE `webd_web_itemlists` ENABLE KEYS */;

-- Dumping structure for table webd.webd_web_items
CREATE TABLE IF NOT EXISTS `webd_web_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parentItem` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `cssClasses` varchar(128) NOT NULL,
  `templateView` varchar(128) NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `updateUser` bigint(20) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table webd.webd_web_items: ~4 rows (approximately)
/*!40000 ALTER TABLE `webd_web_items` DISABLE KEYS */;
INSERT INTO `webd_web_items` (`id`, `parentItem`, `name`, `cssClasses`, `templateView`, `disabled`, `deleted`, `updateUser`, `timestamp`) VALUES
	(1, NULL, 'Test Item', '', 'item_details', 0, 0, 1, '2018-03-04 14:41:39'),
	(2, 1, 'Test Item', '', 'item_details', 0, 0, 1, '2018-03-04 14:42:03'),
	(3, NULL, 'This is another item', '', 'item_details', 0, 0, 1, '2018-03-05 19:18:28'),
	(4, 3, 'This is another item', '', 'item_details', 0, 0, 1, '2018-03-05 19:18:28');
/*!40000 ALTER TABLE `webd_web_items` ENABLE KEYS */;

-- Dumping structure for table webd.webd_web_pages
CREATE TABLE IF NOT EXISTS `webd_web_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `website` bigint(20) unsigned NOT NULL,
  `parentPage` bigint(20) unsigned DEFAULT NULL,
  `sortOrder` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `route` varchar(128) DEFAULT NULL,
  `cssClasses` varchar(128) NOT NULL,
  `navigationHide` tinyint(1) unsigned NOT NULL,
  `redirectTo` varchar(128) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `keywords` text,
  `description` text,
  `searchable` tinyint(1) unsigned NOT NULL,
  `published` tinyint(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `updateUser` bigint(20) unsigned NOT NULL,
  `itemId` bigint(20) unsigned NOT NULL,
  `itemListId` bigint(20) unsigned NOT NULL,
  `moduleId` bigint(20) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table webd.webd_web_pages: ~3 rows (approximately)
/*!40000 ALTER TABLE `webd_web_pages` DISABLE KEYS */;
INSERT INTO `webd_web_pages` (`id`, `website`, `parentPage`, `sortOrder`, `name`, `route`, `cssClasses`, `navigationHide`, `redirectTo`, `title`, `keywords`, `description`, `searchable`, `published`, `deleted`, `updateUser`, `itemId`, `itemListId`, `moduleId`, `timestamp`) VALUES
	(1, 1, NULL, 1, 'home', 'home', '', 0, NULL, 'Home', NULL, NULL, 1, 1, 0, 1, 2, 0, 0, '2018-03-03 00:58:41'),
	(2, 1, NULL, 2, 'home2', 'home2', '', 0, NULL, 'Home2', NULL, NULL, 1, 1, 0, 1, 0, 0, 0, '2018-03-03 00:58:41'),
	(3, 1, 1, 3, 'test3', 'testme', '', 1, NULL, 'Home2', NULL, NULL, 1, 1, 0, 1, 4, 0, 0, '2018-03-03 00:58:41'),
	(4, 1, NULL, 4, 'home3', 'home3', '', 0, NULL, 'Home', NULL, NULL, 1, 1, 0, 1, 0, 0, 1, '2018-03-03 00:58:41');
/*!40000 ALTER TABLE `webd_web_pages` ENABLE KEYS */;

-- Dumping structure for table webd.webd_web_paragraphs
CREATE TABLE IF NOT EXISTS `webd_web_paragraphs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `cssClasses` varchar(128) NOT NULL,
  `pageId` bigint(20) unsigned NOT NULL,
  `itemId` bigint(20) unsigned NOT NULL,
  `itemListId` bigint(20) unsigned NOT NULL,
  `moduleId` bigint(20) unsigned NOT NULL,
  `sortOrder` bigint(20) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `templateView` varchar(128) NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `updateUser` bigint(20) unsigned NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table webd.webd_web_paragraphs: ~2 rows (approximately)
/*!40000 ALTER TABLE `webd_web_paragraphs` DISABLE KEYS */;
INSERT INTO `webd_web_paragraphs` (`id`, `name`, `cssClasses`, `pageId`, `itemId`, `itemListId`, `moduleId`, `sortOrder`, `content`, `templateView`, `disabled`, `deleted`, `updateUser`, `timestamp`) VALUES
	(1, 'test', 'testCls', 2, 0, 0, 0, 1, '<p>Hello Paragraph!</p>', '__paragraph', 0, 0, 1, '2018-03-05 07:35:46'),
	(2, 'testlist', 'testlistcls', 2, 0, 3, 0, 2, '', '', 0, 0, 1, '2018-03-05 08:24:45');
/*!40000 ALTER TABLE `webd_web_paragraphs` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
