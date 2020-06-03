-- auto Generated on 2020-04-16
-- DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
	`uid` INT (11) NOT NULL AUTO_INCREMENT COMMENT 'Uid',
	`status` INT (11) NOT NULL DEFAULT -1 COMMENT '状态-1正常，0banned,123 管理员权限',
	username VARCHAR (50) NOT NULL DEFAULT '' COMMENT 'username',
	`password` VARCHAR (50) NOT NULL DEFAULT '' COMMENT 'password',
	nickname VARCHAR (50) NOT NULL DEFAULT '' COMMENT '昵称/员工姓名',
	phone VARCHAR (50) NOT NULL DEFAULT '' COMMENT '电话',
	email VARCHAR (50) DEFAULT '' COMMENT '预留',
	PRIMARY KEY (`uid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT 'user';
