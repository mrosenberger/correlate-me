use correlateme;

SET AUTOCOMMIT = 0;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `user_question_assoc`;
CREATE TABLE `user_question_assoc` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `user_id` INT(10) UNSIGNED NOT NULL COMMENT 'User of this assoc.', 
  `question_id` INT(10) UNSIGNED NOT NULL COMMENT 'Question of this assoc.',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of assoc entry creation.',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET AUTOCOMMIT = 1;
SET FOREIGN_KEY_CHECKS = 1;

COMMIT;
