ALTER TABLE `users`
	ADD COLUMN `name` VARCHAR(50) NULL DEFAULT '' AFTER `money`,
	ADD COLUMN `skin` LONGTEXT NULL AFTER `name`,
	ADD COLUMN `job` varchar(50) NULL DEFAULT 'unemployed' AFTER `skin`,
	ADD COLUMN `job_grade` INT NULL DEFAULT 0 AFTER `job`,
	ADD COLUMN `job2` varchar(50) NULL DEFAULT 'unemployed2' AFTER `skin`,
	ADD COLUMN `job2_grade` INT NULL DEFAULT 0 AFTER `job2`,
	ADD COLUMN `job3` varchar(50) NULL DEFAULT 'unemployed3' AFTER `skin`,
	ADD COLUMN `job3_grade` INT NULL DEFAULT 0 AFTER `job3`,
	ADD COLUMN `loadout` LONGTEXT NULL AFTER `job_grade`,
	ADD COLUMN `position` VARCHAR(255) NULL AFTER `loadout`
;

CREATE TABLE `job_grades` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`job_name` varchar(50) DEFAULT NULL,
	`grade` int(11) NOT NULL,
	`name` varchar(50) NOT NULL,
	`label` varchar(50) NOT NULL,
	`salary` int(11) NOT NULL,
	`skin_male` longtext NOT NULL,
	`skin_female` longtext NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `job2_grades` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`job2_name` varchar(50) DEFAULT NULL,
	`grade` int(11) NOT NULL,
	`name` varchar(50) NOT NULL,
	`label` varchar(50) NOT NULL,
	`salary` int(11) NOT NULL,
	`skin_male` longtext NOT NULL,
	`skin_female` longtext NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `job3_grades` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`job3_name` varchar(50) DEFAULT NULL,
	`grade` int(11) NOT NULL,
	`name` varchar(50) NOT NULL,
	`label` varchar(50) NOT NULL,
	`salary` int(11) NOT NULL,
	`skin_male` longtext NOT NULL,
	`skin_female` longtext NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `jobs` (
	`name` varchar(50) NOT NULL,
	`label` varchar(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
);

CREATE TABLE `jobs2` (
	`name` varchar(50) NOT NULL,
	`label` varchar(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
);

CREATE TABLE `jobs3` (
	`name` varchar(50) NOT NULL,
	`label` varchar(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
);
INSERT INTO `jobs` VALUES ('unemployed','Job');
INSERT INTO `jobs` VALUES ('unemployed2','Job.2');
INSERT INTO `jobs` VALUES ('unemployed3','Job.3');
INSERT INTO `jobs2` VALUES ('unemployed','Job');
INSERT INTO `jobs2` VALUES ('unemployed2','Job.2');
INSERT INTO `jobs2` VALUES ('unemployed3','Job.3');
INSERT INTO `jobs3` VALUES ('unemployed','Job');
INSERT INTO `jobs3` VALUES ('unemployed2','Job.2');
INSERT INTO `jobs3` VALUES ('unemployed3','Job.3');
INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Chomeur',200,'{}','{}');
INSERT INTO `job_grades` VALUES (1,'unemployed2',0,'unemployed2','R.S.A',200,'{}','{}');
INSERT INTO `job_grades` VALUES (1,'unemployed3',0,'unemployed3','Organisation',200,'{}','{}');
INSERT INTO `job2_grades` VALUES (1,'unemployed',0,'unemployed','Chomeur',200,'{}','{}');
INSERT INTO `job2_grades` VALUES (1,'unemployed2',0,'unemployed2','R.S.A',200,'{}','{}');
INSERT INTO `job2_grades` VALUES (1,'unemployed3',0,'unemployed3','Organisation',200,'{}','{}');
INSERT INTO `job3_grades` VALUES (1,'unemployed',0,'unemployed','Chomeur',200,'{}','{}');
INSERT INTO `job3_grades` VALUES (1,'unemployed2',0,'unemployed2','R.S.A',200,'{}','{}');
INSERT INTO `job3_grades` VALUES (1,'unemployed3',0,'unemployed3','Organisation',200,'{}','{}');
