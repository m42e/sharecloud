SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_ID` int(11) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `alias` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `file` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hashes` text COLLATE utf8_unicode_ci,
  `downloads` int(11) DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `file_permissions_ID` int(11) NOT NULL,
  PRIMARY KEY (`_id`,`folder_ID`,`user_ID`,`file_permissions_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `file_permissions`;
CREATE TABLE `file_permissions` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` text COLLATE utf8_unicode_ci,
  `salt` text COLLATE utf8_unicode_ci,
  `permission` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `folders`;
CREATE TABLE `folders` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `user_ID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`_id`,`user_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `globalpreferences`;
CREATE TABLE `globalpreferences` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `errlevel` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `errmsg` text COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) NOT NULL,
  `sender` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `counter` int(11) unsigned DEFAULT NULL,
  `log` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `lostpw`;
CREATE TABLE `lostpw` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ID` int(11) NOT NULL,
  `hash` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`,`user_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `browser` text COLLATE utf8_unicode_ci,
  `lastactivity` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT '0',
  `data` text COLLATE utf8_unicode_ci,
  UNIQUE KEY `sid_UNIQUE` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `admin` varchar(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `quota` bigint(20) DEFAULT '0',
  `design` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'dynamic',
  `last_login` int(11) DEFAULT NULL,
  `lang` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*
 * INSERT
 */

INSERT INTO `globalpreferences` (`_id`, `key`, `value`, `type`) VALUES
(1, 'DOWNLOAD_VIA_SERVER', 'true', 'bool'),
(2, 'PASSWORD_MIN_LENGTH', '6', 'numeric'),
(3, 'USERNAME_MIN_LENGTH', '6', 'numeric'),
(4, 'SUPPORTED_FILE_HASHES', 'md5,sha1,sha512,crc32', 'string'),
(5, 'DEFAULT_FILE_PERMISSION', '3', 'numeric'),
(6, 'SESSION_NAME', 'SESSIONID', 'string');
