DROP database IF EXISTS `gpay`;

CREATE SCHEMA `gpay` DEFAULT CHARACTER SET utf8 ;

use gpay;

DROP TABLE IF EXISTS `device`;

create table device (
	`id` int(10) not null AUTO_INCREMENT,
	`imei` varchar(20) not null comment '设备imei号',
	`mac` varchar not null comment 'mac地址',
	`model_number` not null comment '设备型号',
	`createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`modifytime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更改时间',
	PRIMARY KEY (`id`),
	UNIQUE KEY `imei` (`imei`),
	UNIQUE KEY `mac` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备信息表';

drop table if exists `account`