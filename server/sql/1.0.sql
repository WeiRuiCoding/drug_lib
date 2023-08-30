CREATE TABLE `urc_bean_category` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
`is_free` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否免费 0不免费 1免费',
`deduct_priority` int(10) NOT NULL DEFAULT 0 COMMENT '扣除开工豆优先级 优先级越高(数值越大) 优先扣除',
`create_uid` int(10) NOT NULL DEFAULT 0 COMMENT '后台创建用户id',
`create_user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
`edit_uid` int(10) NOT NULL DEFAULT 0 COMMENT '后台最后编辑用户id',
`edit_user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT '开工豆种类表';

CREATE TABLE `urc_bean_category` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
`is_free` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否免费 0不免费 1免费',
`deduct_priority` int(10) NOT NULL DEFAULT 0 COMMENT '扣除开工豆优先级 优先级越高(数值越大) 优先扣除',
`create_uid` int(10) NOT NULL DEFAULT 0 COMMENT '后台创建用户id',
`create_user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
`edit_uid` int(10) NOT NULL DEFAULT 0 COMMENT '后台最后编辑用户id',
`edit_user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT '开工豆种类表';

CREATE TABLE `urc_bean_type` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`desc` varchar(100) NOT NULL DEFAULT '' COMMENT '说明',
`mold` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型 1 获取 2 消耗 3 退豆',
`category_id` int(10) NOT NULL DEFAULT 0 COMMENT '种类id 只有获取类型才有该配置 类型不能修改',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间，单位(分钟)  0 永久不过期 只有获取类型和免费种类才有该配置',
`is_show_in_record` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否在记录中展示 0 不展示 1展示',
`show_text_in_record` varchar(100) NOT NULL DEFAULT '' COMMENT '记录展示文案 如:置顶招工',
`is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有效 0无效 1有效',
`create_uid` int(10) NOT NULL DEFAULT 0 COMMENT '后台创建用户id',
`create_user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
`edit_uid` int(10) NOT NULL DEFAULT 0 COMMENT '后台最后编辑用户id',
`edit_user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`)
) ENGINE=InnoDB COMMENT '开工豆类型表';

CREATE TABLE `urc_user_bean` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`free_num` int NOT NULL DEFAULT 0 COMMENT '当前用户有效的免费开工豆数量',
`buy_num` int NOT NULL DEFAULT 0 COMMENT '当前用户所有购买的开工豆数量',
`freeze_num` int NOT NULL DEFAULT 0 COMMENT '冻结数量',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
UNIQUE KEY idx_uid(`uid`)
) ENGINE=InnoDB COMMENT '用户开工豆表';

CREATE TABLE `urc_user_bean_refund_record` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`expend_record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的记录id',
`add_record_id` int(10) NOT NULL DEFAULT 0 COMMENT '退豆增加的记录id',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_expend_record_id(`expend_record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆退豆记录表';

CREATE TABLE `urc_user_bean_expired_00` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_01` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_02` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_03` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_04` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_05` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_06` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_07` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_08` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_09` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_10` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_11` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_12` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_13` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';


CREATE TABLE `urc_user_bean_expired_14` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_15` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_16` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_17` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_18` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_19` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_20` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_21` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_22` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_23` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_24` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_25` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_26` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_27` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_28` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_29` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_30` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_31` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_32` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_33` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_34` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_35` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_36` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_37` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_38` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_expired_39` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '获取开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`)
)ENGINE=InnoDB COMMENT '用户开工豆过期表';

CREATE TABLE `urc_user_bean_record_00` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_01` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_02` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_03` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_04` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_05` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_06` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_07` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_08` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_09` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_10` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_11` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_12` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_13` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_14` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_15` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_16` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_17` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_18` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_19` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_20` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_21` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_22` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_23` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_24` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_25` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_26` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_27` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_28` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_29` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_30` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_31` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_32` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_33` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_34` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_35` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_36` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_37` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_38` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_record_39` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆的类型',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '开工豆数量',
`buss_id` varchar(100) NOT NULL DEFAULT '' COMMENT '预留字段 管理业务id,如订单id',
`client_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型',
`package_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包名',
`comment` varchar(100) NOT NULL DEFAULT '' COMMENT '备注 默认空',
`object` varchar(2048) NOT NULL DEFAULT '' COMMENT '扩充object_id字段不能存储的信息',
`extend` varchar(2000) NOT NULL DEFAULT '' COMMENT '扩展信息,json (免费开工豆数量，目前仅预约置顶时使用)',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid_bean_type(`uid`,`bean_type`)
)ENGINE=InnoDB COMMENT '用户开工豆记录表';

CREATE TABLE `urc_user_bean_expend_detail_00` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_01` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_02` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_03` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_04` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_05` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_06` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_07` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_08` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_09` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_10` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_11` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_12` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_13` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_14` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_15` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_16` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_17` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_18` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_19` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_20` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_21` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_22` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_23` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_24` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_25` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_26` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_27` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_28` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_29` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_30` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_31` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_32` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_33` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_34` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_35` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_36` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_37` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_38` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';

CREATE TABLE `urc_user_bean_expend_detail_39` (
`id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
`uid` int(10) NOT NULL DEFAULT 0 COMMENT 'uid',
`record_id` int(10) NOT NULL DEFAULT 0 COMMENT '消耗记录id',
`bean_type` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆的类型id',
`num` int(10) NOT NULL DEFAULT 0 COMMENT '消耗的开工豆数量',
`expire_time` int(10) NOT NULL DEFAULT 0 COMMENT '过期时间,过期那一刻的时间戳',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY idx_uid(`uid`),
KEY idx_record_id(`record_id`)
)ENGINE=InnoDB COMMENT '用户开工豆消耗详情表';


INSERT INTO `jz_user_rights`.`urc_bean_category` (`id`, `name`, `is_free`, `deduct_priority`, `create_uid`, `edit_uid`, `create_time`, `update_time`, `create_user_name`, `edit_user_name`) VALUES (1, '购买类型', 0, 1, 0, 244, '2023-06-07 19:34:25', '2023-07-07 11:11:07', '', '李君');
INSERT INTO `jz_user_rights`.`urc_bean_category` (`id`, `name`, `is_free`, `deduct_priority`, `create_uid`, `edit_uid`, `create_time`, `update_time`, `create_user_name`, `edit_user_name`) VALUES (2, '免费类型', 1, 100, 0, 244, '2023-06-07 19:34:33', '2023-07-07 11:11:01', '', '李君');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (1, '购买工头找项目电话', 1, 1, 0, 0, '', 1, 0, '', '李君', 244, '2023-06-06 14:51:49', '2023-07-07 11:18:14');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (2, '购买找工人电话', 1, 1, 0, 0, '', 1, 0, '', '李君', 244, '2023-06-06 14:56:45', '2023-07-07 11:19:08');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (3, '购买工头发布招工数', 1, 1, 0, 0, '', 1, 0, '', '李君', 244, '2023-06-06 14:56:45', '2023-07-07 13:45:11');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (4, '购买工人找活电话', 1, 1, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:45', '2023-07-05 14:39:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (5, '购买班组认证', 1, 1, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:45', '2023-06-12 17:57:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (6, '购买工人认证', 1, 1, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:45', '2023-06-12 17:57:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (7, '使用工头找项目电话', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:46', '2023-06-06 14:56:46');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (8, '使用找工人电话', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:46', '2023-06-06 14:56:46');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (9, '使用工头发布招工数', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:46', '2023-06-06 14:56:46');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (10, '使用工人找活电话', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:46', '2023-06-06 14:56:46');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (11, '使用班组认证', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:46', '2023-06-06 14:56:46');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (12, '使用工人认证', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:46', '2023-06-06 14:56:46');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (13, '兑换工头找项目电话', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:46', '2023-06-06 14:56:46');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (14, '兑换找工人电话', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:46', '2023-06-06 14:56:46');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (15, '兑换工头发布招工数', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:47', '2023-06-06 14:56:47');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (16, '兑换工人找活电话', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:47', '2023-06-06 14:56:47');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (17, '兑换班组认证', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:47', '2023-06-06 14:56:47');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (18, '兑换工人认证', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:47', '2023-06-06 14:56:47');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (19, '赠送找项目电话', 1, 2, 43200, 0, '', 1, 0, '', '李君', 244, '2023-06-06 14:56:47', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (20, '赠送找工人电话', 1, 2, 43200, 0, '', 1, 0, '', '李君', 244, '2023-06-06 14:56:47', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (21, '赠送工头发布招工数', 1, 2, 43200, 0, '', 1, 0, '', '李君', 244, '2023-06-06 14:56:47', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (22, '赠送工人找活电话', 1, 2, 43200, 0, '', 1, 0, '', '李君', 244, '2023-06-06 14:56:48', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (25, '购买突击队认证', 1, 1, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:48', '2023-06-12 17:57:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (26, '购买招工找活电话', 1, 1, 0, 1, '充值开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:48', '2023-06-11 14:30:14');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (27, '使用招工找活电话', 2, 0, 0, 1, '使用开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:48', '2023-06-11 14:30:29');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (28, '兑换招工找活电话', 1, 2, 43200, 1, '兑换开工豆', 1, 0, '', '李君', 244, '2023-06-06 14:56:48', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (29, '赠送找活招工电话', 1, 2, 43200, 1, '平台赠送开工豆', 1, 0, '', '李君', 244, '2023-06-06 14:56:48', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (30, '拼图(衣服)活动兑换', 1, 2, 43200, 0, '', 1, 0, '', '李君', 244, '2023-06-06 14:56:48', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (31, '使用超级会员免费电话', 2, 0, 0, 1, '拨打电话', 1, 0, '', '', 0, '2023-06-06 14:56:48', '2023-06-06 14:56:48');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (32, '完成3次评价赠送找活招工电话', 1, 2, 43200, 1, '评价赠送开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:49', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (33, '获取自动补偿', 1, 2, 43200, 1, '举报退回开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:49', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (34, '置顶招工', 2, 0, 0, 1, '置顶招工', 1, 0, '', '', 0, '2023-06-06 14:56:49', '2023-06-06 14:56:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (35, '置顶找活', 2, 0, 0, 1, '置顶找活', 1, 0, '', '', 0, '2023-06-06 14:56:49', '2023-06-06 14:56:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (36, '拨打招工', 2, 0, 0, 1, '拨打招工电话', 1, 0, '', '', 0, '2023-06-06 14:56:49', '2023-06-06 14:56:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (37, '拨打找活(简历)', 2, 0, 0, 1, '拨打找活电话', 1, 0, '', '', 0, '2023-06-06 14:56:49', '2023-06-06 14:56:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (38, '抵扣去广告', 2, 0, 0, 1, '免广告打扰', 1, 0, '', '', 0, '2023-06-06 14:56:49', '2023-06-06 14:56:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (39, '加入官方群', 1, 2, 43200, 1, '加群', 1, 0, '', '李君', 244, '2023-06-06 14:56:49', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (40, '资料库', 2, 0, 0, 1, '下载规范与资料', 1, 0, '', '', 0, '2023-06-06 14:56:50', '2023-06-06 14:56:50');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (41, '恢复已删除记工', 2, 0, 0, 1, '恢复已删除记工', 1, 0, '', '', 0, '2023-06-06 14:56:50', '2023-06-12 17:57:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (42, '为精准招工', 2, 0, 0, 1, '精准快速招人', 1, 0, '', '', 0, '2023-06-06 14:56:50', '2023-06-06 14:56:50');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (43, '精准招工免费打电话', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:50', '2023-06-06 14:56:50');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (44, '记工分享', 1, 2, 43200, 1, '记工赠送开工豆', 1, 0, '', '李君', 244, '2023-06-06 14:56:50', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (45, '使用开工豆刷新简历', 2, 0, 0, 1, '刷新名片', 1, 0, '', '', 0, '2023-06-06 14:56:50', '2023-06-06 14:56:50');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (46, '天天领积分获取临时开工豆', 1, 2, 1440, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:50', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (47, '获取自动补偿的临时开工豆', 1, 2, 1440, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:50', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (48, '临时开工豆拨打招工', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:51', '2023-06-06 14:56:51');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (49, '临时开工豆拨打找活(简历)', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:51', '2023-06-06 14:56:51');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (50, '邀请注册赠送开工豆', 1, 2, 43200, 1, '好友邀请奖励', 1, 0, '', '', 0, '2023-06-06 14:56:51', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (51, '51首次注册登录赠送开工豆(文案同29)', 1, 2, 43200, 1, '平台赠送开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:51', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (52, '每天找活免费拨打电话', 2, 0, 0, 1, '拨打找活电话', 1, 0, '', '', 0, '2023-06-06 14:56:51', '2023-06-06 14:56:51');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (53, '免费拨打招工电话', 2, 0, 0, 1, '拨打招工电话', 1, 0, '', '', 0, '2023-06-06 14:56:51', '2023-06-06 14:56:51');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (54, '发布招工超过免费次数的扣费', 2, 0, 0, 1, '发布招工', 1, 0, '', '', 0, '2023-06-06 14:56:51', '2023-06-06 14:56:51');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (60, '新春活动获取', 1, 2, 43200, 1, '新春活动', 1, 0, '', '', 0, '2023-06-06 14:56:51', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (61, '刷新招工使用', 2, 0, 0, 1, '刷新招工使用', 1, 0, '', '', 0, '2023-06-06 14:56:51', '2023-06-06 14:56:51');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (62, '分享获取', 1, 2, 1440, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:52', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (63, '置顶信息被删除(后台)', 1, 2, 43200, 1, '后台赠送', 1, 0, '', '', 0, '2023-06-06 14:56:52', '2023-07-07 17:22:05');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (64, '招工信息虚假(后台)', 1, 2, 43200, 1, '后台赠送', 1, 0, '', '', 0, '2023-06-06 14:56:52', '2023-07-07 17:22:06');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (65, '邀请好友(后台)', 1, 2, 43200, 1, '后台赠送', 1, 0, '', '', 0, '2023-06-06 14:56:52', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (66, '系统导致获取失败(后台)', 1, 2, 43200, 1, '后台赠送', 1, 0, '', '', 0, '2023-06-06 14:56:52', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (67, '其他(后台)', 1, 2, 43200, 1, '后台赠送', 1, 0, '', '', 0, '2023-06-06 14:56:52', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (68, '举报信息人工补偿(后台项目举报)', 1, 2, 43200, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:52', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (69, '退款冻结(新后台)', 2, 0, 0, 1, '退款-冻结开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:52', '2023-07-07 14:22:53');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (70, '退款(新后台，只能从69转70)', 2, 0, 0, 1, '退款-扣除开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:53', '2023-06-06 14:56:53');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (71, '取消退款(新后台)', 3, 0, 0, 1, '取消退款返还', 1, 0, '', '', 0, '2023-06-06 14:56:53', '2023-07-07 17:22:42');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (72, '预约置顶', 2, 0, 0, 1, '预约置顶-扣除开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:53', '2023-06-06 14:56:53');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (73, '取消预约置顶', 3, 0, 0, 1, '主动取消预约置顶', 1, 0, '', '', 0, '2023-06-06 14:56:53', '2023-07-07 17:18:48');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (74, '后台审核不通过 取消预约置顶', 3, 0, 0, 1, '审核未通过退回开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:53', '2023-07-07 17:19:01');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (75, '运营活动-赠送用户开工豆', 1, 2, 43200, 1, '平台赠送开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:53', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (76, '签到奖励开工豆', 1, 2, 43200, 1, '连续签到28天奖励开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:53', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (77, '积分兑换开工豆', 1, 2, 43200, 1, '积分兑换开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:53', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (78, '获取用户自动送豆', 1, 2, 43200, 1, '系统送豆', 1, 0, '', '', 0, '2023-06-06 14:56:54', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (79, '抽奖获得开工豆', 1, 2, 43200, 1, '抽奖获得开工豆', 1, 0, '', '', 0, '2023-06-06 14:56:54', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (80, '运营活动-赠送用户开工豆回收', 2, 0, 0, 1, '开工豆赠送过期', 1, 0, '', '李君', 244, '2023-06-06 14:56:54', '2023-07-07 17:57:34');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (81, '修改招工信息超过一定次数', 2, 0, 0, 1, '修改招工信息', 1, 0, '', '李君', 244, '2023-06-06 14:56:54', '2023-07-07 17:57:18');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (82, '随心打购买抵扣', 2, 0, 0, 1, '随心打购买抵扣', 1, 0, '', '李君', 244, '2023-06-06 14:56:54', '2023-07-07 17:55:57');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (83, '招工审核通过预约置顶', 2, 0, 0, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:54', '2023-06-06 14:56:54');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (84, '未接通退豆', 3, 0, 0, 1, '未接通退豆', 1, 0, '', '李君', 244, '2023-06-06 14:56:54', '2023-07-07 17:55:23');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (85, '新后台退款失败退豆', 3, 0, 0, 1, '开工豆退款-退款失败', 1, 0, '', '李君', 244, '2023-06-06 14:56:54', '2023-07-07 17:56:16');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (86, '新人礼包送豆', 1, 2, 43200, 0, '', 1, 0, '', '', 0, '2023-06-06 14:56:55', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (87, '批量对工充值', 1, 1, 0, 1, '批量对工充值', 1, 0, '', '', 0, '2023-06-06 14:56:55', '2023-07-07 17:30:49');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (88, '群发炸弹充值', 1, 1, 0, 1, '群发炸弹充值', 1, 0, '', '', 0, '2023-06-06 14:56:55', '2023-07-07 15:59:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (89, '使用批量对工', 2, 0, 0, 1, '使用批量对工', 1, 0, '', '', 0, '2023-06-06 14:56:55', '2023-06-06 14:56:55');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (90, '使用群发炸弹', 2, 0, 0, 1, '使用群发炸弹', 1, 0, '', '', 0, '2023-06-06 14:56:55', '2023-06-06 14:57:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (91, '分享招工信息/未接通招工自动退豆', 3, 0, 0, 1, '未接通自动退豆', 1, 0, '', '李君', 244, '2023-06-06 14:56:55', '2023-07-07 17:54:17');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (92, '未接通找活自动退豆', 3, 0, 0, 1, '未接通自动退豆', 1, 0, '', '李君', 244, '2023-06-20 16:00:15', '2023-07-07 17:53:39');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (93, '用户注销', 2, 0, 0, 0, '', 1, 0, '', '李君', 244, '2023-06-20 16:24:32', '2023-07-07 17:35:57');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (94, '系统迁移免费开工豆', 1, 2, 43200, 0, '', 1, 0, '', '李君', 244, '2023-06-29 14:16:57', '2023-07-07 15:48:42');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (95, '系统迁移购买开工豆', 1, 1, 0, 0, '', 1, 0, '', '', 0, '2023-06-29 14:17:04', '2023-06-29 14:53:57');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (96, '免费开工豆过期', 2, 0, 0, 1, '免费开工豆过期', 1, 0, '', '李君', 244, '2023-06-30 14:03:15', '2023-07-25 17:31:11');
INSERT INTO `jz_user_rights`.`urc_bean_type` (`id`, `desc`, `mold`, `category_id`, `expire_time`, `is_show_in_record`, `show_text_in_record`, `is_active`, `create_uid`, `create_user_name`, `edit_user_name`, `edit_uid`, `create_time`, `update_time`) VALUES (97, '清除开工豆（后台）', 2, 0, 0, 0, '', 1, 244, '李君', '李君', 244, '2023-07-28 16:17:40', '2023-07-28 16:18:10');