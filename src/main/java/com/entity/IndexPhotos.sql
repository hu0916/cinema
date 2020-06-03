-- auto Generated on 2020-04-24
-- DROP TABLE IF EXISTS index_photos;
CREATE TABLE index_photos(
	id INT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	src VARCHAR (50) NOT NULL DEFAULT '' COMMENT '图片地址',
	`year` INT (11) DEFAULT -1 COMMENT '年份',
	`type` INT (11) NOT NULL DEFAULT -1 COMMENT '热映中 即将上映 老片推荐 特别推荐',
	movie_id INT (11) NOT NULL DEFAULT -1 COMMENT '对应电影id',
	stars DOUBLE (16,4) NOT NULL DEFAULT -1.0 COMMENT '星级',
	`name` VARCHAR (50) NOT NULL DEFAULT '' COMMENT 'name',
	story_line VARCHAR (50) COMMENT 'storyLine',
	realese_tiem VARCHAR (50) COMMENT 'realeseTiem',
	genre VARCHAR (50) COMMENT 'genre',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT 'index_photos';
