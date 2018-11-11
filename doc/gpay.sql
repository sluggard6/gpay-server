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

drop table if exists `account`;

create table account (
    `id` int(10) not null AUTO_INCREMENT,
    `category` smallint(2) not null comment '账户类型,1-支付宝,2-微信',
	`username` varchar(20) not null comment '登录用户名',
	`password` varchar(20) not null comment '密码',
	`phone` varchar(20) comment '绑定手机号',
	`email` varchar(30) comment '绑定邮箱',
	`createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`modifytime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更改时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收款账户表';

drop table if exists `payment`;

create table `payment` (
    `id` int(10) not null AUTO_INCREMENT,
	`account_id` int(10) not null comment '支付账号id',
	`amount` int(10) not null comment '支付金额，单位（分），0为任意金额支付',
	`path` varchar(300) not null comment '图片地址',
	`createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`modifytime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更改时间',
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付金额表';


