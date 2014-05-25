
use correlateme;

SET AUTOCOMMIT = 0;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `unit_type_id` INT(10) UNSIGNED NOT NULL COMMENT 'Type of unit that response should be in (mass, time, etc.).', 
  `default_unit_id` INT(10) UNSIGNED NOT NULL COMMENT 'Unit that question and display should default to.',
	`prompt` VARCHAR(256) NOT NULL COMMENT 'Question to ask the user.',
	PRIMARY KEY (`id`),
  FOREIGN KEY (`unit_type_id`) REFERENCES `unit_type` (`id`),
  FOREIGN KEY (`default_unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `question_id` INT(10) UNSIGNED NOT NULL COMMENT 'Reference to question that this is an answer to.',
  `user_id` INT(10) UNSIGNED NOT NULL COMMENT 'Reference to user who answered the question.',
  `unit_id` INT(10) UNSIGNED NOT NULL COMMENT 'Unit that answer is in.',
  `value` DOUBLE NOT NULL COMMENT 'Numeric value of the response.',
  `answered_at` TIMESTAMP NOT NULL 'Timestamp at which the answer was created.',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `unit_type_id` INT(10) UNSIGNED,
  `value_in_canonical_unit` DOUBLE NOT NULL COMMENT 'Conversion factor from canonical unit (for this unit_type) to this unit.',
  `canonical_p` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1 if this is the canonical unit for this unit_type, 0 otherwise.',
  `name_singular` VARCHAR(256) NOT NULL COMMENT 'Singular version of name.',
  `name_plural` VARCHAR(256) NOT NULL COMMENT 'Plural version of name.',
  `abbreviation` VARCHAR(256) NOT NULL COMMENT 'Abbreviation of unit.',
  `display_p` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 if should be displayed to users, 0 otherwise.',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`unit_type_id`) REFERENCES `unit_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `unit_type`;
CREATE TABLE `unit_type` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `name` VARCHAR(256) NOT NULL COMMENT 'Name of unit type (mass, etc.).',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `email` VARCHAR(512) NOT NULL COMMENT 'User email.', 
  `first_name` VARCHAR(256) NOT NULL COMMENT 'User first name.',
  `last_name` VARCHAR(256) NOT NULL COMMENT 'User last name.',
  `hashed_password` VARCHAR(256) NOT NULL COMMENT 'Salted hashed user password.',
  `signup_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of user signup.'
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET AUTOCOMMIT = 1;
SET FOREIGN_KEY_CHECKS = 1;

COMMIT;
