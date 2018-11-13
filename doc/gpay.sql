DROP database IF EXISTS `gpay`;

CREATE SCHEMA `gpay` DEFAULT CHARACTER SET utf8 ;

use gpay;

DROP TABLE IF EXISTS `device`;

create table device (
	`id` int(10) not null AUTO_INCREMENT,
	`imei` varchar(20) not null comment '设备imei号',
	`mac` varchar(16) not null comment 'mac地址',
	`model_number` varchar(20) not null comment '设备型号',
	`status` smallint not null default 0 comment '状态,0-新建，1-可用，2-停用，3-就绪',
	`createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`modifytime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更改时间',
	PRIMARY KEY (`id`),
	UNIQUE KEY `imei` (`imei`),
	UNIQUE KEY `mac` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备信息表';

drop table if exists `account`;

create table `account` (
    `id` int(10) not null AUTO_INCREMENT,
    `category` smallint(2) not null comment '账户类型,1-支付宝,2-微信',
	`username` varchar(20) not null comment '登录用户名',
	`password` varchar(20) not null comment '密码',
	`phone` varchar(20) comment '绑定手机号',
	`email` varchar(30) comment '绑定邮箱',
	`status` smallint not null default 0 comment '状态，0-新建，1-可用，2-停用，3-就绪，4-使用中，5-冷却中',
	`status_desc` varchar(200) comment '状态说明',
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
	`status` smallint not null default 0 comment '状态, 0-停用，1-可用',
	`createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`modifytime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更改时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付金额表';

drop table if exists `channel`;

create table `channel` (
	`id` int(10) not null AUTO_INCREMENT,
	`name` varchar(50) not null comment '渠道名称',
	`parent` int(10) comment '上级渠道id',
	`security_key` varchar(20) not null comment '渠道密钥',
	`status` smallint not null default 0 comment '状态，0-停用，1-启用',
	`createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`modifytime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更改时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='渠道信息表';

drop table if exists `charge`;

create table `charge` (
	`id` int(10) not null AUTO_INCREMENT,
	`account_id` int(10) not null comment '收款账号id',
	`payment_id` int(10) not null comment '收款金额id',
	`amount` int(10) not null comment '提交充值金额（分）',
	`channel_id` int(10) not null comment '渠道id',
	`order_id` varchar(50) not null comment '支付订单号',
	`status` smallint not null default 0 comment '状态，0-提交，1-支付中，2-支付完成，3-支付失败',
	`createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`modifytime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更改时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值表';

drop table if exists `notification`;

create table `notification` (
	`id` int(10) not null AUTO_INCREMENT,
	`device_id` int(10) not null comment '设备id',
	`account_id` int(10) not null comment '收款账号id',
	`amount` int(10) not null comment '充值金额',
	`match_charge_id` int(10) comment '匹配的冲值表id',
	`createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`modifytime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更改时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知表';
