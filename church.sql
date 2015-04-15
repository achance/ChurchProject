-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.16 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for church
CREATE DATABASE IF NOT EXISTS `church` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `church`;


-- Dumping structure for table church.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table church.admin: ~2 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`adminid`, `admin_name`, `admin_password`) VALUES
	(1, 'admin', 'fcea920f7412b5da7be0cf42b8c93759'),
	(2, 'admin13453453', 'e277dd1e05688a22e377e25a3dae5de1'),
	(30, 'binhlt', '25d55ad283aa400af464c76d713c07ad');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- Dumping structure for table church.contact
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table church.contact: ~17 rows (approximately)
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` (`id`, `name`, `email`, `website`, `message`, `created_time`, `status`) VALUES
	(18, 'binhlt', 'binhlt', 'binhlt', 'binhlt', '2015-04-04 11:58:14', 0),
	(23, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 1),
	(24, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(25, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(26, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(27, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(28, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(29, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(30, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(31, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(33, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(34, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(35, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(36, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(37, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(38, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0),
	(39, '345345', '345', '345', '345435', '2015-04-04 11:55:54', 0);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;


-- Dumping structure for table church.newsandevent
CREATE TABLE IF NOT EXISTS `newsandevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL,
  `published_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table church.newsandevent: ~27 rows (approximately)
/*!40000 ALTER TABLE `newsandevent` DISABLE KEYS */;
INSERT INTO `newsandevent` (`id`, `title`, `description`, `created_time`, `updated_time`, `published_time`, `status`) VALUES
	(1, 'new1', '<p>new1 test thử xem n&agrave;o</p>', '2015-04-13 22:12:27', '2015-04-14 00:08:34', '2015-04-13 00:00:00', 1),
	(2, 'new2', '<p>new1</p>', '2015-04-13 22:12:27', '2015-04-14 00:19:50', '2015-03-13 00:00:00', 1),
	(3, 'new3', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-02-13 22:12:27', 1),
	(4, 'new4', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-01-13 22:12:27', 1),
	(5, 'new5', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2014-12-13 22:12:27', 1),
	(6, 'new6', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2014-11-13 22:12:27', 1),
	(7, 'new7', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2014-10-13 22:12:27', 1),
	(8, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2014-09-13 22:12:27', 1),
	(9, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-03-13 22:12:27', 1),
	(10, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-02-13 22:12:27', 1),
	(11, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-01-13 22:12:27', 1),
	(12, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-04-13 22:12:27', 1),
	(13, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-03-13 22:12:27', 1),
	(14, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-02-13 22:12:27', 1),
	(15, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-01-13 22:12:27', 1),
	(16, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-04-13 22:12:27', 1),
	(17, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-03-13 22:12:27', 1),
	(18, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-02-13 22:12:27', 1),
	(19, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-01-13 22:12:27', 1),
	(20, 'new1', 'new1', '2015-04-13 22:12:27', '2015-04-13 22:12:27', '2015-04-13 22:12:27', 1),
	(21, 'test', '<p>test</p>', '2015-04-13 22:55:51', '2015-04-13 22:55:51', '2015-04-13 00:00:00', 1),
	(22, 'test description dài', '<p>test description d&agrave;i&nbsp;test description d&agrave;i&nbsp;test description d&agrave;i&nbsp;test description d&agrave;i&nbsp;test description d&agrave;i</p>', '2015-04-13 23:19:25', '2015-04-13 23:19:25', '2015-04-13 00:00:00', 1),
	(23, 'Lastest News', '<p class="pad_bot1">\r\n                                            Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.\r\n                                        </p>\r\n                                        <p class="pad_bot2">\r\n                                            Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur.\r\n                                        </p>', '2015-04-13 23:45:09', '2015-04-13 23:49:14', '2015-04-30 00:00:00', 1),
	(24, 'binhlt', '<p>binhlt</p>', '2015-04-14 00:16:15', '2015-04-14 00:16:15', '2015-04-16 00:00:00', 1),
	(25, 'gfhfhg', '<p>fghfgh</p>', '2015-04-14 00:17:27', '2015-04-14 00:17:27', '2015-04-21 00:00:00', 1),
	(26, '3345', '<p>3453453434</p>', '2015-04-14 00:22:11', '2015-04-14 00:22:11', '2015-04-28 00:00:00', 1),
	(27, 'rêtrt', '<p>rêtrt</p>', '2015-04-14 00:22:35', '2015-04-14 00:22:35', '2015-04-22 00:00:00', 1),
	(28, 'test insert', '<p>da update nh&eacute;</p>', '2015-04-13 23:45:09', '2015-04-13 23:49:14', '2015-03-30 00:00:00', 1),
	(29, '3345', '<p>3453453434</p>', '2015-04-14 00:22:11', '2015-04-14 00:22:11', '2015-02-28 00:00:00', 1),
	(30, 'rêtrt', '<p>rêtrt</p>', '2015-04-14 00:22:35', '2015-04-14 00:22:35', '2015-01-22 00:00:00', 1);
/*!40000 ALTER TABLE `newsandevent` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
