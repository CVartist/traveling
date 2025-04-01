DROP DATABASE IF EXISTS `tourism_db`;

-- 创建数据库traveling
CREATE DATABASE IF NOT EXISTS `tourism_db` CHARSET UTF8;

delete
from tourism_db.traveldata;


select count(1)
from tourism_db.traveldata;

select count(1)
from tourism_db.poi_data;

select count(1)
from tourism_db.food_data;

SELECT poiid, COUNT(*) AS cnt
FROM tourism_db.poi_data
GROUP BY poiid
HAVING cnt > 1;

DELETE f1
FROM tourism_db.food_data f1
         INNER JOIN tourism_db.food_data f2
WHERE f1.name = f2.name;

select *
from tourism_db.poi_data
where poiid in ('10758992', '10759130', '78410', '79715', '88096');

select *
from tourism_db.poi_data
where poi_data.openstatus like '%开园%';
-- 创建一个临时表，存储唯一的记录
CREATE TABLE temp_food_data AS
SELECT DISTINCT *
FROM tourism_db.food_data;

-- 删除原始表中的所有数据
DELETE
FROM tourism_db.food_data;

-- 将唯一记录插入回原始表
INSERT INTO tourism_db.food_data
SELECT *
FROM temp_food_data;

-- 删除临时表
DROP TABLE temp_food_data;


-- 创建一个临时表，存储唯一的记录
CREATE TABLE temp_travel_data AS
SELECT DISTINCT *
FROM tourism_db.traveldata;

-- 删除原始表中的所有数据
DELETE
FROM tourism_db.traveldata;

-- 将唯一记录插入回原始表
INSERT INTO tourism_db.traveldata
SELECT *
FROM temp_travel_data;

-- 删除临时表
DROP TABLE temp_travel_data;

-- 创建一个临时表，存储唯一的记录
CREATE TABLE temp_poi_data AS
SELECT DISTINCT *
FROM tourism_db.poi_data;

-- 删除原始表中的所有数据
DELETE
FROM tourism_db.poi_data;

-- 将唯一记录插入回原始表
INSERT INTO tourism_db.poi_data
SELECT *
FROM temp_poi_data;

-- 删除临时表
DROP TABLE temp_poi_data;

create table t_content
(
    id            bigint(11) auto_increment primary key,
    title         varchar(1000) null comment '标题',
    img_url       varchar(1000) null comment '封面图片地址',
    video_url     varchar(1000) null comment '视频地址',
    content       text          null comment '内容(可html样式)',
    type          bigint(11)    not null comment '一级类型(景点/美食/游记）',
    view_count    int default 0 null comment '浏览量',
    comment_count int default 0 null comment '评论量',
    like_count    int default 0 null comment '点赞量',
    create_by     varchar(1000) null comment '创建者',
    create_time   datetime      null comment '创建时间',
    update_by     varchar(1000) null comment '更新者',
    update_time   datetime      null comment '更新时间',
    brief         varchar(1000) null comment '摘要',
    category_id   bigint(11)    null comment '发布的二级类别',
    detail        varchar(1000) null comment '详情链接',
    place         varchar(1000) null comment '地点',
    address       varchar(1000) null comment '地址',
    comment_score varchar(1000) null comment '评分',
    sight_level   varchar(1000) null comment '级别',
    price_type    varchar(1000) null comment '收费类型',
    market_price  varchar(1000) null comment '市场价',
    discount      varchar(1000) null comment '优惠力度',
    price         varchar(1000) null comment '价格',
    open_time     varchar(1000) null comment '开放时间',
    open_status   varchar(1000) null comment '是否营业'
) comment '内容表';

# STR_TO_DATE(source_time_column, '%Y-%m-%d %H:%i:%s')  -- 按源数据格式解析
-- 转换为有符号整数
# INSERT INTO target_table (int_column)
# SELECT CAST(varchar_column AS SIGNED);
#
# -- 转换为无符号整数
# INSERT INTO target_table (int_column)
# SELECT CAST(varchar_column AS UNSIGNED);


insert into t_content(title, img_url, video_url, content, type, view_count, comment_count, like_count, create_by,
                      create_time, update_by, update_time, brief, category_id, detail, place, address, comment_score,
                      sight_level, price_type, market_price, discount, price, open_time, open_status)
select title, pic, null, info, 3, cast(viewnumber as unsigned), cast(replynumber as unsigned ), cast(likenumber as unsigned ),
       authorname, STR_TO_DATE(createtime, '%Y-%m-%d %H:%i:%s'), authorname, STR_TO_DATE(createtime, '%Y-%m-%d %H:%i:%s'),
       info, 8 , detail, city, null, null, null, null, null, null, null,null, null from traveldata;


UPDATE t_content
SET category_id = CASE
          WHEN content = '无攻略信息' THEN 10
          ELSE 9
END WHERE type = 3;

select * from t_content where title = '携程网终身VIP会员卡';

SELECT c.id, c.title, c.img_url, u.img_url userImgUrl, u.nick_name, cat.name categoryName
FROM t_content c INNER JOIN t_user u ON c.create_by = u.id INNER JOIN t_category cat ON c.category_id = cat.id
WHERE c.type = 3 ORDER BY c.create_time DESC;

INSERT INTO t_user (user_name, nick_name, password, is_admin, create_time, img_url)
SELECT DISTINCT authorname, authorname, '123456', 0, NOW(), '/imgs/icon.png'
FROM traveldata;

UPDATE t_content AS c
    JOIN t_user AS u ON c.create_by = u.user_name
SET
    c.create_by = u.id,
    c.update_by = u.id;

update t_content set img_url = '/imgs/default_cover.png'
                 where img_url = 'https://webresource.c-ctrip.com/resgswebonline/R1//travels/img/default_cover.png'
                or img_url = '//webresource.c-ctrip.com/resgswebonline/R1//travels/img/default_cover.png';

update t_content set img_url = '/imgs/icon.png'
where img_url = '/imgs/defaultCover.png';

select * from t_content where title like '%泉州住宿%';
select * from t_content where t_content.img_url = '/imgs/default_cover.png';

select *
from t_content
where type = '3'
  and (img_url IS null or create_by is null);

SELECT c.id, c.title, c.img_url, u.img_url userImgUrl, u.nick_name, cat.name categoryName FROM t_content c
    INNER JOIN t_user u ON c.create_by = u.id INNER JOIN t_category cat ON c.category_id = cat.id WHERE c.type = 3 ORDER BY c.create_time DESC;



insert into t_content(title, img_url, video_url, content, type, view_count, comment_count, like_count, create_by,
                      create_time, update_by, update_time, brief, category_id, detail, place, address, comment_score,
                      sight_level, price_type, market_price, discount, price, open_time, open_status)
select name, pic, null, foods, 2, null, cast(recomment as unsigned ), null,
       1, null, 1, null,
       foods, 6 , null, address, address, score, null, null, null, null, price,null, null from food_data;

select * from t_content where img_url = 'https://dimg04.c-ctrip.com/images/';

UPDATE t_content
SET category_id = CASE
                      WHEN content like '%咖啡%' THEN 7
                      ELSE 6
    END where type = 2;

update t_content set img_url = '/imgs/hyky.jpg'
where img_url = 'https://dimg04.c-ctrip.com/images/';

insert into t_content(title, img_url, video_url, content, type, view_count, comment_count, like_count, create_by,
                      create_time, update_by, update_time, brief, category_id, detail, place, address, comment_score,
                      sight_level, price_type, market_price, discount, price, open_time, open_status)
select poiname, coverimageurl, null, title, 1, null, cast(commentcount as unsigned ), null,
       1, STR_TO_DATE('2025-01-01', '%Y-%m-%d %H:%i:%s'), 1, STR_TO_DATE('2025-01-01', '%Y-%m-%d %H:%i:%s'),
       sightcategoryinfo, 1 , null, place, address, commentscore, sightlevelstr, pricetype, marketprice,
       marketdiscountprice, pricetype, openstatusclose, openstatus from poi_data;

select * from t_content where type = 1;

# lxj

UPDATE t_content
SET category_id = CASE
                      WHEN price_type = '4' AND type = 1 THEN 2
                      WHEN price_type = '2' AND type = 1 THEN 3
                      WHEN type = 1 THEN 4
    END where type = 1;
