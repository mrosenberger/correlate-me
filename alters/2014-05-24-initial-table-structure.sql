
use correlateme;

SET AUTOCOMMIT = 0;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
	`id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
	`prompt` VARCHAR(256) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
	`id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` double NOT NULL,
  `question_id` INT(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
	`id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `unit_type`;
CREATE TABLE `unit_type` (
	`id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`id` INT(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(256) NOT NULL, 
  `first_name` VARCHAR(256) NOT NULL,
  `last_name` VARCHAR(256) NOT NULL,
  `hashed_password` VARCHAR(256) NOT NULL,

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET AUTOCOMMIT = 1;
SET FOREIGN_KEY_CHECKS = 1;

COMMIT;
