drop table if exists `test`;

create table `test`
(
    `id`       bigint not null comment 'id',
    `name`     varchar(50) comment '名称',
    `password` varchar(50) comment '密码',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4 comment ='测试';

select *
from test;


insert into `test` (id, name, password)
VALUES (1, 'noah', password('password'));


create table `demo`
(
    `id`   bigint not null comment 'id',
    `name` varchar(50) comment '名称',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4 comment ='测试';

insert into `demo` (id, name)
VALUES (1, 'starry');



drop table if exists `ebook`;

create table `ebook`
(
    `id`           bigint not null comment 'id',
    `name`         varchar(50) comment '名称',
    `category1_id` bigint comment '分类1',
    `category2_id` bigint comment '分类2',
    `description`  varchar(200) comment '描述',
    `cover`        varchar(200) comment '封面',
    `doc_count`    int comment '文档数',
    `view_count`   int comment '阅读数',
    `vote_count`   int comment '点赞数',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4 comment ='电子书';

insert into `ebook`(id, name, description)
values (1, '信息论', '香农不出谁与争锋');
insert into `ebook`(id, name, description)
values (2, '信号与系统', '奥本海默大巧不工');
insert into `ebook`(id, name, description)
values (3, '哥德堡变奏曲', '巴赫统领江湖');
insert into `ebook`(id, name, description)
values (4, '巴仁博伊姆', '贝多芬当代诠释者');


drop table if exists `music`;

create table `music`
(
    `id`           bigint not null comment 'id',
    `name`         varchar(50) comment '名称',
    `author`       varchar(100) comment '作者',
    `category1_id` bigint comment '分类1',
    `category2_id` bigint comment '分类2',
    `description`  varchar(200) comment '描述',
    `cover`        varchar(200) comment '封面',
    `doc_count`    int comment '文档数',
    `listen_count` int comment '听歌数',
    `vote_count`   int comment '点赞数',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4 comment ='音乐';

insert into `music`(id, name, author)
values (1, '哥德堡变奏曲', '巴赫');
insert into `music`(id, name, author)
values (2, '贝多芬第三钢协', '贝多芬');
insert into `music`(id, name, author)
values (3, '柴钢协', '柴可夫斯基');
insert into `music`(id, name, author)
values (4, '柴小协', '柴可夫斯基');
insert into `music`(id, name, author)
values (5, '图画展览会', '穆索尔斯基');
insert into `music`(id, name, author)
values (6, '1812序曲', '柴可夫斯基');

drop table if exists `category`;
create table `category`
(
    `id`     bigint      not null comment 'id',
    `parent` bigint      not null default 0 comment '父id',
    `name`   varchar(50) not null comment '名称',
    `sort`   int comment '顺序',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4 comment '分类';

insert into `category`(id, parent, name, sort)
VALUES (100, 000, '古典音乐', 100);
insert into `category`(id, parent, name, sort)
VALUES (101, 100, '中世纪', 101);
insert into `category`(id, parent, name, sort)
VALUES (102, 100, '文艺复兴', 102);
insert into `category`(id, parent, name, sort)
VALUES (103, 100, '巴洛克', 103);
insert into `category`(id, parent, name, sort)
VALUES (104, 100, '古典主义', 104);
insert into `category`(id, parent, name, sort)
VALUES (105, 100, '浪漫主义', 105);
insert into `category`(id, parent, name, sort)
VALUES (106, 100, '现代音乐', 106);

insert into `category`(id, parent, name, sort)
VALUES (200, 000, '流行音乐', 200);

drop table if exists `doc`;
create table `doc`
(
    `id`         bigint      not null comment 'id',
    `music_id`   bigint      not null default 0 comment '电子书id',
    `parent`     bigint      not null default 0 comment '父id',
    `name`       varchar(50) not null comment '名称',
    `sort`       int comment '顺序',
    `view_count` int                  default 0 comment '阅读数',
    `vote_count` int                  default 0 comment '阅读数',
    primary key (`id`)
) engine = innodb
  default charset = utf8mb4 comment '文档';

insert into `doc`(id, music_id, parent, name, sort, view_count, vote_count)
VALUES (1, 1, 0, '文档1', 1, 0, 0);
insert into `doc`(id, music_id, parent, name, sort, view_count, vote_count)
VALUES (2, 1, 1, '文档1.1', 1, 0, 0);
insert into `doc`(id, music_id, parent, name, sort, view_count, vote_count)
VALUES (3, 1, 0, '文档2', 2, 0, 0);
insert into `doc`(id, music_id, parent, name, sort, view_count, vote_count)
VALUES (4, 1, 3, '文档2.1', 1, 0, 0);
insert into `doc`(id, music_id, parent, name, sort, view_count, vote_count)
VALUES (5, 1, 3, '文档2.2', 2, 0, 0);
insert into `doc`(id, music_id, parent, name, sort, view_count, vote_count)
VALUES (6, 1, 5, '文档2.2.1', 1, 0, 0);


drop table if exists `content`;
CREATE TABLE `content`
(
    `id`      bigint     NOT NULL AUTO_INCREMENT COMMENT '文档id',
    `content` mediumtext NOT NULL COMMENT '内容',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4 comment '文档内容';

drop table if exists `user`;

create table `user`
(
    `id`         bigint      not null AUTO_INCREMENT comment 'id',
    `login_name` varchar(50) not null comment '登录名',
    `name`       varchar(50) comment '昵称',
    `password`   char(32)    not null comment '密码',
    primary key (`id`),
    unique key `login_name_unique` (`login_name`)
) engine = innodb
  default charset = utf8mb4 comment ='用户';

insert into `user`(id, login_name, name, password)
VALUES (1, 'text', '测试', 'test');



drop table if exists `music_snapshot`;

create table `music_snapshot`
(
    `id`              bigint  auto_increment not null comment 'id',
    `music_id`        bigint not null comment '电子书id',
    `date`            date   not null comment '快照日期',
    `listen_count`    int    not null comment '听歌数',
    `vote_count`      int    not null comment '点赞数',
    `listen_increase` int    not null comment '听歌数增长',
    `vote_increase`   int    not null comment '点赞数增长',
    primary key (`id`),
    unique key `music_id_data_unique` (`music_id`,`date`)
) engine = innodb
  default charset = utf8mb4 comment ='音乐快照表';

update music t1,(select music_id, count(1) doc_count, sum(view_count) view_count, sum(vote_count) vote_count
                 from doc
                 group by music_id) t2
set t1.doc_count= t2.doc_count,
    t1.listen_count = t2.view_count,
    t1.vote_count=t2.vote_count
where t1.id = t2.music_id;


insert into music_snapshot(music_id, `date`, listen_count, vote_count, listen_increase, vote_increase)
select id, curdate(), 0, 0, 0, 0
from music t1
where not exists(select 1
                 from music_snapshot t2
                 where t1.id = t2.music_id
                   and t2.`date` = curdate());

update music_snapshot t1, music t2
set t1.listen_count=t2.listen_count,
    t1.vote_count=t2.vote_count
where t1.`date` = curdate()
  and t1.music_id = t2.id;

select t1.music_id, t1.listen_count, t1.vote_count
from music_snapshot t1
where t1.`date` = date_sub(curdate(), interval 1 day);

update music_snapshot t1 left join (select music_id, listen_count, vote_count
                                    from music_snapshot
                                    where `date` = date_sub(curdate(), interval 1 day)) t2
    on t1.music_id=t2.music_id
set t1.listen_increase=(t1.listen_count-ifnull(t2.listen_count,0)),
    t1.vote_increase=(t1.vote_count-ifnull(t2.vote_count,0))
where  `date`=curdate();
