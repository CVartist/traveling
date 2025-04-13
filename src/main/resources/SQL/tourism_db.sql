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
       marketdiscountprice, price, openstatusclose, openstatus from poi_data;


UPDATE t_content AS c
    JOIN poi_data AS u ON c.title = u.poiname
SET
    c.price = u.price
where type = 1;

select * from t_content where type = 1;

# lxj

UPDATE t_content
SET category_id = CASE
                      WHEN price_type = '4' AND type = 1 THEN 2
                      WHEN price_type = '2' AND type = 1 THEN 3
                      WHEN type = 1 THEN 4
    END where type = 1;


SELECT create_by, COUNT(*) AS post_count
FROM t_content
GROUP BY create_by
ORDER BY post_count DESC;

90,268
11,208

select * from t_content where type = 1  order by comment_count desc limit 10;
793
1253



SELECT create_by, COUNT(*) AS post_count, SUM(CAST(view_count AS UNSIGNED)) AS total_views, SUM(CAST(comment_count AS UNSIGNED)) AS total_comments, SUM(CAST(like_count AS UNSIGNED)) AS total_likes
FROM t_content group by create_by order by total_likes desc;

select * from t_user where id in ('793','1096');

-- radar.json
SELECT u.user_name,
       COUNT(*) AS post_count,
       SUM(CAST(c.view_count AS UNSIGNED)) AS total_views,
       SUM(CAST(c.comment_count AS UNSIGNED)) AS total_comments,
       SUM(CAST(c.like_count AS UNSIGNED)) AS total_likes
FROM t_content c
         JOIN t_user u ON c.create_by = u.id
GROUP BY u.user_name
ORDER BY total_likes DESC;

-- rank.json
select title,comment_score from t_content where type = 1  order by comment_count desc limit 10;

-- hotScore
SELECT * FROM (
                  (
                      SELECT title, comment_score, '免费' AS type
                      FROM t_content
                      WHERE type = 1 and price_type = 4
                      ORDER BY comment_count DESC
                      LIMIT 20
                  )

                  UNION ALL

                  (
                      SELECT title, comment_score, '优惠' AS type
                      FROM t_content
                      WHERE type = 1 and price_type = 2
                      ORDER BY comment_count DESC
                      LIMIT 20
                  )

                  UNION ALL

                  (
                      SELECT title, comment_score, '原价' AS type
                      FROM t_content
                      WHERE type = 1 and price_type = 3
                      ORDER BY comment_count DESC
                      LIMIT 20
                  )
              ) AS combined
ORDER BY type DESC
LIMIT 60;

-- rankPrice.json
SELECT title, discount
FROM t_content where type = 1 and price_type = 2
ORDER BY CAST(REPLACE(discount, '￥', '') AS DECIMAL(10, 2)) DESC limit 10;

-- map.json
select * from  t_content where type = 1 and place like '%武汉%' order by comment_count desc;
select * from  t_content where type = 1 and place like '%吉林%' order by comment_count desc;
select * from  t_content where type = 1 and place like '%厦门%' order by comment_count desc;
select * from  t_content where type = 1 and place like '%重庆%' order by comment_count desc;
select * from  t_content where type = 1 and place like '%北京%' order by comment_count desc;
select * from  t_content where type = 1 and place like '%成都%' order by comment_count desc;
select * from  t_content where type = 1 and t_content.address like '%山东%' order by comment_count desc;
select * from  t_content where type = 1 and t_content.address like '%上海%' order by comment_count desc;
select * from  t_content where type = 1 and t_content.address like '%云南%' order by comment_count desc;
select * from  t_content where type = 1 and t_content.address like '%天津%' order by comment_count desc;

--
select * from  t_content where type = 3 and content like '%时间：1 月%';
select * from  t_content where type = 3 and content like '%天数：5555 天%';

-- tripMonth.json
SELECT
    SUBSTRING_INDEX(SUBSTRING_INDEX(content, '时间：', -1), '月', 1) AS month,
#     SUM(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(content, '人均：', -1), '元', 1) AS DECIMAL)) AS total_amount,
    COUNT(*) AS trip_count
FROM
    t_content where type = 3 and content like '%时间%'
GROUP BY
    month
ORDER BY
    month;

-- tripDay.json
SELECT
    SUBSTRING_INDEX(SUBSTRING_INDEX(content, '天数：', -1), '天', 1) AS day,
    COUNT(*) AS trip_count
FROM
    t_content where type = 3 and content like '%天数%'
GROUP BY
    day
ORDER BY
    day;

-- efsc.json
select title, price,comment_count,comment_score from  t_content where type = 2 order by CAST(REPLACE(price, '￥', '') AS DECIMAL(10, 2)) DESC  ;

select title, price,comment_count,comment_score from  t_content where type = 2 order by CAST(REPLACE(price, '￥', '') AS DECIMAL(10, 2)) DESC  ;
select title, price,comment_count,comment_score from  t_content where type = 1 order by CAST(REPLACE(price, '￥', '') AS DECIMAL(10, 2)) DESC  ;


select title,comment_score from t_content where type = 1;


create table t_comment
(
    id          bigint(11) auto_increment
        primary key,
    content     varchar(255) not null comment '评论内容',
    user_id     bigint(11)   not null comment '评论用户ID',
    content_id  int          not null comment '评论内容ID',
    create_time datetime     not null comment '创建时间'
)
    comment '评论表';

create table t_log
(
    id           bigint auto_increment
        primary key,
    username     varchar(50)   null comment '用户名',
    operation    varchar(50)   null comment '用户操作',
    method       varchar(200)  null comment '请求方法',
    params       varchar(5000) null comment '请求参数',
    time         bigint        not null comment '执行时长(毫秒)',
    ip           varchar(64)   null comment 'IP地址',
    created_time datetime      null comment '创建时间',
    status       int default 1 null,
    error        varchar(500)  null
)
    comment '用户日志';

SELECT id, user_name, nick_name, is_admin, img_url, password FROM t_user WHERE user_name = 'lxj'

SELECT con.id,
       con.title,
       con.img_url,
       con.type,
       con.view_count,
       con.comment_count,
       con.brief,
       con.create_time,
       cat.name categoryName
FROM t_content con
         INNER JOIN t_category cat ON con.category_id = cat.id
WHERE con.type = 1 AND con.create_by = 1
LIMIT 10 OFFSET 10;


create table t_banner
(
    id          bigint(11) auto_increment
        primary key,
    img_url     varchar(255) null,
    sort        int          not null comment '排序',
    create_time datetime     not null comment '创建时间'
)
    comment '轮播图表';



333
