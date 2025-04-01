-- 删除数据库traveling
DROP DATABASE IF EXISTS `traveling`;

-- 创建数据库traveling
CREATE DATABASE IF NOT EXISTS `traveling` CHARSET UTF8;

USE `traveling`;

-- 删除  表 traveling.t_banner
DROP TABLE IF EXISTS `t_banner`;

-- 创建  表 traveling.t_banner
CREATE TABLE `t_banner`
(
    `id`          bigint(11) NOT NULL AUTO_INCREMENT,
    `img_url`     varchar(255) DEFAULT NULL,
    `sort`        int(11)    NOT NULL COMMENT '排序',
    `create_time` datetime   NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) CHARSET UTF8 COMMENT ='轮播图表';

-- 向  表 traveling.t_banner 插入数据
insert into `t_banner`(`id`, `img_url`, `sort`, `create_time`)
values (1, '/imgs/banner1.jpg', 1, '2023-02-08 14:29:44'),
       (2, '/imgs/banner2.jpg', 2, '2023-02-08 14:29:44'),
       (3, '/imgs/banner3.jpg', 3, '2023-02-08 14:29:44');

-- 删除  表 traveling.t_category
DROP TABLE IF EXISTS `t_category`;

-- 创建  表 traveling.t_category
CREATE TABLE IF NOT EXISTS `t_category`
(
    `id`          bigint(11)   NOT NULL AUTO_INCREMENT,
    `name`        varchar(255) NOT NULL COMMENT '类别名',
    `level`       int(11)      NOT NULL COMMENT '级别',
    `parent_id`   int(11)      NOT NULL COMMENT '父类级别',
    `type`        int(11)      NOT NULL COMMENT '类型',
    `sort`        int(11)      NOT NULL COMMENT '排序',
    `create_time` datetime     NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) CHARSET UTF8 COMMENT ='类别表';

-- 向  表 traveling.t_category 插入数据
INSERT INTO `t_category` (`id`, `name`, `level`, `parent_id`, `type`, `sort`, `create_time`)
VALUES (1, '游记·', 1, 0, 1, 1, '2023-02-07 13:39:05'),
       (2, '游记', 2, 1, 1, 1, '2023-02-07 13:39:05'),
       (3, '游记', 2, 1, 1, 2, '2023-02-07 13:39:05'),
       (4, '游记', 2, 1, 1, 3, '2023-02-07 13:39:05'),
       (5, '游记', 1, 0, 2, 2, '2023-02-07 13:39:05'),
       (6, '游记', 2, 5, 2, 1, '2023-02-07 13:39:05'),
       (7, '游记', 2, 5, 2, 2, '2023-02-07 13:39:05'),
       (8, '游记', 1, 0, 3, 1, '2023-02-07 13:39:05'),
       (9, '游记', 2, 8, 3, 1, '2023-02-07 13:39:05'),
       (10,'游记', 2, 8, 3, 2, '2023-02-07 13:39:05');

-- 删除  表 traveling.t_comment
DROP TABLE IF EXISTS `t_comment`;

-- 创建  表 traveling.t_comment
CREATE TABLE IF NOT EXISTS `t_comment`
(
    `id`          bigint(11)   NOT NULL AUTO_INCREMENT,
    `content`     varchar(255) NOT NULL COMMENT '评论内容',
    `user_id`     bigint(11)   NOT NULL COMMENT '评论用户ID',
    `content_id`  int(11)      NOT NULL COMMENT '评论内容ID',
    `create_time` datetime     NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) CHARSET UTF8 COMMENT ='评论表';

-- 删除  表 traveling.t_content
DROP TABLE IF EXISTS `t_content`;

-- 创建  表 traveling.t_content
CREATE TABLE IF NOT EXISTS `t_content`
(
    `id`            bigint(11)   NOT NULL AUTO_INCREMENT,
    `title`         varchar(255) NOT NULL COMMENT '标题',
    `img_url`       varchar(64)  NOT NULL COMMENT '封面图片地址',
    `video_url`     varchar(64)  DEFAULT NULL COMMENT '视频地址',
    `content`       text         DEFAULT NULL COMMENT '内容html样式',
    `type`          bigint(11)   NOT NULL COMMENT '一级类型(视频/食谱/资讯）',
    `view_count`    int(11)      DEFAULT 0 COMMENT '浏览量',
    `comment_count` int(11)      DEFAULT 0 COMMENT '评论量',
    `create_by`     bigint(11)   DEFAULT NULL COMMENT '创建者',
    `create_time`   datetime     NOT NULL COMMENT '创建时间',
    `update_by`     bigint(11)   DEFAULT NULL COMMENT '更新者',
    `update_time`   datetime     DEFAULT NULL COMMENT '更新时间',
    `brief`         varchar(255) DEFAULT NULL,
    `category_id`   bigint(11)   DEFAULT NULL COMMENT '发布的二级类别(面包小食)',
    PRIMARY KEY (`id`)
) CHARSET UTF8 COMMENT ='内容表';

INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (11, '入口即酥的超浓花生酱酥饼a', '/imgs/花生酥.jpg', '',
        '<p style="text-align: start;">花生酱+花生油=超浓郁花生香</p><p style="text-align: start;">没有糖粉，用了白砂糖</p><p style="text-align: start;">本是入口即酥</p><p style="text-align: start;">却又在酥后留下些许颗粒感</p><p style="text-align: start;">花生浓香，谁吃谁胖。。。。</p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/21/143513x25k11jnhvjw9jn5.jpg" alt="" data-href="" style=""></p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/21/143514cgrzfo2avvaa2zeu.jpg" alt="" data-href="" style=""></p><p style="text-align: start;">用料：柔滑花生酱100克，花生油55克，白砂糖45克，泡打粉1克，小苏打1克，中筋面粉180克</p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/21/143514qoq77gzrflwbgdgk.jpg" alt="" data-href="" style=""></p><p style="text-align: start;">将花生酱，油，糖倒入大碗，用刮刀画圈搅拌均匀。</p><p style="text-align: start;">面粉、泡打粉、小苏打混合，筛入碗中，用刮刀搅拌成团。</p><p style="text-align: start;">取出，放在案台上叠压几次。放在保鲜膜上，擀成0.8厘米厚的面片。</p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/21/143514iwdn333dikyfvbnt.jpg" alt="" data-href="" style=""></p><p style="text-align: start;">用饼干模切成圆片，取走圆片，将剩下的边角聚拢，再次擀片切割，直至面团用完。</p><p style="text-align: start;">烤盘垫烘培纸，把切小块的花生饼放在烤盘上。</p><p style="text-align: start;"> 放入预热好的烤箱，上下火160度，烘烤25分钟。最后10分钟调低温度10度，避免饼干底部上色太深。</p><p style="text-align: start;">出炉。放凉。</p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/21/143515vn97rmx8m8mcvdsv.jpg" alt="" data-href="" style=""></p><p style="text-align: start;">拿去送人。。。。</p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/21/143515xhgpxlgzz47od95g.jpg" alt="" data-href="" style=""></p>',
        1, 5, 0, 1, '2023-03-27 19:51:45', null, '2023-03-28 12:17:52', '花生酱+花生油=超浓郁花生香
没有糖粉，用了白砂糖
本是入口即酥
却又在酥后留下些许颗粒感
花生浓香', 3);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (12, '枣泥花式面包,好吃到爆', '/imgs/枣泥花式面包.jpeg', '',
        '<p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>之前做了枣泥馅，配上花式面包，好吃到爆。</strong></span></p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>枣泥花式面包的用料</strong></span></p><p style="text-align: start;">肉松面包面团 见肉松面包配方，枣泥适量</p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>枣泥花式面包的做法</strong></span></p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182913ut1trtss8e84ea2y.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤1</strong></span>:配方见不一样的肉松面包，揉至完全扩展阶段28度发酵1-1.5小时。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182913szk0vlg0ziiknzvx.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤2</strong></span>:面团翻面轻排气，松弛15-30分钟。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182913t044mux9umasgrrr.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤3</strong></span>:分割40克一个面团，松弛15-30分钟。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182913v4iysp1xinijow0z.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤4</strong></span>:准备自制的枣泥馅。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182913u9r0zkm1w4cgo01g.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤5</strong></span>:充分排气包入枣泥馅20-25克一个，再用刀切4道。</p><p style="text-align: start;"> <br></p>',
        1, 0, 0, 1, '2023-03-28 16:12:42', null, null, '之前做了枣泥馅，配上花式面包，好吃到爆。

枣泥花式面包的用料
肉松面包面团 见肉松面包配方，枣泥', 2);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (13, '酥脆培根吐司芝士卷，人见人爱', '/imgs/酥脆培根吐司芝士卷.jpeg', '',
        '<p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>人见人爱的培根平时一般都是放吐司里面做三文治吃今天培根要露脸啦哈哈哈哈简单快手酥脆可口的培根吐司芝士卷走起</strong></span></p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>酥脆培根吐司芝士卷的用料</strong></span></p><p style="text-align: start;">吐司，培根，芝士片， 牙签</p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>酥脆培根吐司芝士卷的做法</strong></span></p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182343hfbfpciueplcecfe.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤1</strong></span>:烤箱提前220度预热</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182343jm2qot6cbn6jmfk9.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤2</strong></span>:吐司片上放入芝士片</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182343adehzoouphsgeebe.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤3</strong></span>:吐司片从下往上卷起收紧</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182343v7x54qx4dzd9q22z.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤4</strong></span>:卷起收紧</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182343pq1j6g1fp6jkh21z.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤5</strong></span>:培根缠绕吐司一圈用牙签固定两端</p>',
        1, 0, 0, 1, '2023-03-28 16:15:43', null, null,
        '人见人爱的培根平时一般都是放吐司里面做三文治吃今天培根要露脸啦哈哈哈哈简单快手酥脆可口的培根吐司芝士', 3);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (14, '开放式三明治,一份小清新快手早餐', '/imgs/开放式三明治.jpeg', '',
        '<h1 style="line-height: 1.5;"></h1><p style="text-align: start;"><span style="color: rgb(42, 165, 59); font-family: 微软雅黑;"><strong>昨夜下了很怕人的骤雨，清晨办公桌上的薄荷微微抖动它的叶子。一份小清新快手早餐，让生活简洁不简单。</strong></span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>芒果奶昔的用料</strong></span></p><p style="text-align: start;">吐司1片，鸡蛋一个， 再制干酪 1片，芝士粉适量，芒果一个，牛奶1杯，番茄酱适量，沙拉酱适量，生菜3片</p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>芒果奶昔的做法</strong></span></p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182709a5mzmtmkyy0kmfiw.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤1</strong></span>:土司片放一片芝士</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182709lr9dzdgvvyc9o9c9.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤2</strong></span>:水煮蛋切片</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182710x8c8e4apqbeecrb3.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><br></p><p><br></p>',
        1, 0, 0, 1, '2023-03-28 16:16:24', null, null, '
昨夜下了很怕人的骤雨，清晨办公桌上的薄荷微微抖动它的叶子。一份小清新快手早餐，让生活简洁不简单。
', 4);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (15, '核桃葡萄干软欧：蔓越莓种面', '/imgs/核桃葡萄干软欧.jpeg', '',
        '<p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>干，来款核桃葡萄干软欧吧！核桃是个宝，好处太多，不一一列举啦！</strong></span></p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>蔓越莓种面的用料</strong></span></p><p style="text-align: start;">主面团， 蔓越莓种面 150克，高筋粉130克，全麦粉50克，盐4克，白砂糖10克，酵母粉2.5克，奶粉15克，水90克，黄油5克， 果馅 ，核桃25克，葡萄干60克， 果酒（用来泡葡萄干） 若干</p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>蔓越莓种面的做法</strong></span></p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181548fr22wjb3o2cgcf2u.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤1</strong></span>:蔓越莓种面的制作方法可以参照我之前的菜谱，或者用波兰种来做也可以。秤齐全部材料。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181548h1ddpzq3kq5bwy2y.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤2</strong></span>:把除黄油，核桃和葡萄干之外的材料全部倒入面包机里，稍微用刮刀搅拌下启动和面程序。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181548eeqyhyv5jc5cyycv.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤3</strong></span>:第一个和面程序完成后，加入室温软化的黄油，再来一个和面循环。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181548v7wwzc29979w2ccf.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤4</strong></span>:两个和面循环后，能拉出粗粗的膜。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181548kn616p5pmop8gqrl.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤5</strong></span>:期间准备果馅，把核桃仁轻轻捏碎，放烤箱里180度烘烤5-10分钟，熟了的核桃仁会更香一点；葡萄干用葡萄酒或者果酒浸泡一下，浸泡30分钟左右后，沥干，用剪刀剪碎一点。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181548a6xeiiepapc5cpw3.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤6</strong></span>:把面团从面包机里捞出来，把核桃仁和葡萄干手动均匀地揉进面团。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181548o2a1t1aa21mt9m27.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤7</strong></span>:把表面揉光滑，有利于锁住面团里的水分，室温发酵一小时。</p><p style="text-align: start;"> <br></p>',
        1, 1, 0, 1, '2023-03-28 16:16:56', null, null, '干，来款核桃葡萄干软欧吧！核桃是个宝，好处太多，不一一列举啦！

蔓越莓种面的用料
主面团， 蔓越', 2);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (16, '蔓越莓绿豆糕，味道还不错值得一试!', '/imgs/蔓越莓绿豆糕.jpeg', '',
        '<p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>全家都很喜欢吃绿豆糕，但楼下甜品店的绿豆糕太甜了，那就自己动手做吧。之前尝试过带皮绿豆，颜色做出来没有去皮的干净，豆味好像也更浓郁些，这次做了去皮绿豆，味道还不错，值得一试!</strong></span></p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>绿豆糕的用料</strong></span></p><p style="text-align: start;">去皮绿豆250克，牛奶60克，淡奶油60克，黄油60g， 冰糖粉 50g，蔓越莓干40g</p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>绿豆糕的做法</strong></span></p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/172540jl4l6ahuhthwbhgk.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤1</strong></span>:去皮绿豆加足水，浸泡12小时以上。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/172540n4o258nyvu4f545e.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤2</strong></span>:大火烧开，转中火蒸30分钟。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/172541y5a6ddivawt6nvir.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤3</strong></span>:蒸好的绿豆用勺子轻轻一压就会粉碎。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/172541slolhnsyy5xsdiir.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤4</strong></span>:加牛奶、淡奶油用料理机打成泥。（我分三次打的）</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/172542m98yjlog837gj34r.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤5</strong></span>:嫌麻烦，没有过筛，再过一遍筛，口感会更细腻。</p><p style="text-align: start;"> <br></p>',
        1, 1, 0, 1, '2023-03-28 16:17:35', null, null,
        '全家都很喜欢吃绿豆糕，但楼下甜品店的绿豆糕太甜了，那就自己动手做吧。之前尝试过带皮绿豆，颜色做出来没', 2);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (17, '心形火龙果椰蓉面包,任谁都抗拒不了', '/imgs/心形火龙果椰蓉面包.jpeg', '',
        '<p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>椰蓉的香味 任谁都抗拒不了吧正好还有半个红心火龙果做成了***嫩的小爱心面包可爱又好吃可以做9个。</strong></span></p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>火龙果椰蓉面包的用料</strong></span></p><p style="text-align: start;">主面团材料: ，高筋面粉240克，红心火龙果130克，全蛋液35克，盐1克，糖粉30克，奶粉20克，干酵母3克， 黄油（室温软化） 25克， 椰蓉馅儿: ，椰蓉30克，糖粉12克， 黄油（融化） 15克，全蛋液15克，牛奶18克</p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>火龙果椰蓉面包的做法</strong></span></p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182527pi9hinhpnysszt81.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤1</strong></span>:首先将火龙果切块打成汁，过滤一遍。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182527kne5m3mog8xgrox8.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤2</strong></span>:按着先液体后粉类最后放酵母的顺序，将主面团材料除了黄油外全部放入搅拌桶内。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182527t8evc6yy8amic2ul.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤3</strong></span>:揉至可以拉出粗糙膜的扩展阶段。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182527b696qze5do64ccu0.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤4</strong></span>:这时加入室温软化好的黄油，揉至可以拉出手套膜的完全扩展阶段。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182527atnx5gntm85ixwfr.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤5</strong></span>:将面团整圆，放入容器内，盖上保鲜膜进行一发，26-28度发酵一小时。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182527l07922k29dfp0uh7.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤6</strong></span>:这时来做内馅儿，将融化的黄油和其他材料全部放入容器中搅拌均匀。</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/182527ukksyyn24tt91tzq.jpg" alt="" data-href="" style="height: auto;"></p>',
        1, 8, 1, 1, '2023-03-28 16:18:12', null, null, '椰蓉的香味 任谁都抗拒不了吧正好还有半个红心火龙果做成了***嫩的小爱心面包可爱又好吃可以做9个。
', 4);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (18, '爆浆抹茶甜甜圈面包，自带幸福感的小甜甜', '/imgs/爆浆抹茶甜甜圈面包.jpeg', '',
        '<p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>爆浆抹茶甜甜圈面包好吃的起飞的爆浆抹茶甜甜圈，从里到外被抹茶包裹着，自带幸福感的小甜甜，抹茶控们完全抵抗不了的清新味道，我已经沦陷了～</strong></span></p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>爆浆抹茶甜甜圈面包的用料</strong></span></p><p style="text-align: start;"><span style="color: rgb(19, 110, 194);"><u>中种</u></span><span style="color: rgb(19, 110, 194);">面团，面包粉200g，鸡蛋46g，酵母3g，牛奶90g，主面团，面包粉80g，砂糖40g，盐3g，酵母1.5g，水25g，黄油25g， 抹茶主厨奶油馅 ，抹茶粉5g，热水10g，蛋黄2个，牛奶250毫升，砂糖20g，玉米淀粉10g，椰子油10g，淡奶油100g，表面抹茶粉 砂糖适量</span></p><p style="text-align: start;"> </p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>爆浆抹茶甜甜圈面包的做法</strong></span></p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181653o0xhzxpdqzx42oxd.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤1</strong></span>:将中种面团材料全部混合和成面团，表面光滑不粘手.</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181653n03zc89ai838o4gg.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤2</strong></span>:放入冰箱冷藏一夜8-12小时</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181654l9nyswrrp2n9npnr.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤3</strong></span>:牛奶放入锅中，煮至83度.</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181654bdhgaspzppvzlgz9.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤4</strong></span>:鸡蛋放入碗中搅散，放入砂糖，玉米淀粉.  搅匀 .</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181654hbdsdxeqt5mqe4qq.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤5</strong></span>:倒入蛋黄中，先少量到入搅匀.在慢慢全部倒入搅匀.</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181654w95ett956fr2foft.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤6</strong></span>:倒回锅中小火煮，要不停的搅防止糊底. 煮至非常粘稠的状态.</p><p style="text-align: start;"> </p><p style="text-align: start;"><img src="https://hongbeiguan.com/data/attachment/portal/202007/17/181654f4rkfu45hd25f75t.jpg" alt="" data-href="" style="height: auto;"></p><p style="text-align: start;"><span style="color: rgb(42, 165, 59);"><strong>步骤7</strong></span>:抹茶粉加热水搅匀，倒入锅中搅拌均匀.</p><p style="text-align: start;"> </p>',
        1, 21, 0, 1, '2023-03-28 16:20:26', null, null,
        '爆浆抹茶甜甜圈面包好吃的起飞的爆浆抹茶甜甜圈，从里到外被抹茶包裹着，自带幸福感的小甜甜，抹茶控们完全', 3);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (19, '[甜品] 这样做彩虹果冻太惊艳了！在废弃的饼干盒里就能做，好...', '/imgs/彩虹果冻.jpeg', '/imgs/demo.mp4', '',
        2, 0, 0, 1,
        '2023-03-28 17:11:15', null, null, '', 6);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (20, '入门级烘焙小零食，玛格丽特饼干，制作简单容易存放', '/imgs/玛格丽特饼干.jpeg', '/imgs/demo.mp4',
        '<p><br></p>', 2, 0, 0, 1,
        '2023-03-28 17:11:53', null, '2023-04-03 14:20:25', '', 6);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (21, '不用面粉不用烤箱，也能做出像模像样的披萨，拥有芝士...', '/imgs/披萨.jpeg', '/imgs/demo.mp4', '', 2, 1, 0, 1,
        '2023-03-28 17:12:18',
        null, null, '', 7);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (22, '差点以为它是漂亮的芭比娃娃，原来是牛人做的翻糖蛋糕', '/imgs/翻糖蛋糕.jpeg', '/imgs/demo.mp4', '', 2, 2, 0,
        1, '2023-03-28 17:12:41',
        null, null, '', 7);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (23, '1成都一蛋糕店遭恶意退单，一查竟是同行干的！对方回应：攻击错对象了 ...', '/imgs/蛋糕店.jpeg', '',
        '<p style="text-align: start;">五十单，导致损失数千元。</p><p style="text-align: start;">这是什么情况?</p><p style="text-align: start;"><strong>蹊跷订单一周连续遭遇四五十笔退单，损失数千元</strong></p><p style="text-align: start;">去年，王先生与朋友合伙在成都市武侯区晋阳路开了一家生日蛋糕店，同时在外卖平台上销售。由于价格适中，品质较好，生意走上了正轨，每月平均销售量1000余单，在武侯区的蛋糕外卖店中名列前茅。</p><p style="text-align: start;">今年7月3日起，蹊跷的事儿发生了。</p><p style="text-align: start;">当天，外卖平台上有十几笔订单，在下单后的十余分钟便退单了。发现情况有些异常后，工作人员试图电话联系下单客户，可没能联系上。接下来一周，几乎每天都出现了类似的情况。“<strong>一天一个时段连续下六七单，算好了时间，估摸着蛋糕快做完了就点退款。”</strong></p><p style="text-align: start;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/21/140719z2ym7cocmc67z6ee.jpg" alt="" data-href="" style=""></p><p style="text-align: center;">王先生的蛋糕店遇到的部分退单</p><p style="text-align: start;">王先生说，他们家店是做新鲜定制蛋糕，接单后便会立即进行制作和配送，订单退掉后，制作的蛋糕就只能废掉。一周以来，遇到的退单情况高达四五十单，损失数千元，实在不正常。</p><p style="text-align: start;"><span style="color: rgb(192, 80, 77);"><strong>商家质疑一退单客户为蛋糕店，遭遇同行恶意攻击?</strong></span></p><p style="text-align: start;">此事发生后，王先生等人四处查询，并没有找到原因。直到7月7日晚10点左右，10分钟左右连续接到5笔订单，之后全部进行了退单。</p><p style="text-align: start;">在查询订单详情时，王先生发现其中一笔订单的定位是一家名叫“熊猫不走”生日蛋糕店，这笔订单与其他不同的是，下单后立即进行了取消。</p><p style="text-align: start;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/21/140723mk2khe35dqe3v0ed.jpg" alt="" data-href="" style=""></p><p style="text-align: center;">退单中显示地址为熊猫不走生日蛋糕成都店</p><p style="text-align: start;">蛋糕店订蛋糕?</p><p style="text-align: start;">该笔订单引起了王先生的怀疑，“难道是遭到了同行恶意攻击?”带着猜疑，王先生以咨询购买蛋糕为名给订单的客户打了电话。</p><p style="text-align: start;">“喂，听朋友推荐你们家可以做生日蛋糕，是吗?”</p><p style="text-align: start;">“是的!”</p><p style="text-align: start;">电话那头传来肯定的回答。接着，王先生继续以购买蛋糕的名义与对方交谈，并加上了对方的微信，微信中对方给他发来了蛋糕店的位置及名字，与订单中的“熊猫不走”生日蛋糕店信息一致。</p><p style="text-align: start;">随后，合伙人又通过这名“客户”获得另一名自称熊猫不走员工的联系方式，咨询了相关信息。第二天，王先生等人来到武侯区万兴路“熊猫不走”生日蛋糕店，向店内工作人员进行求证，却遭到一一否认。“我们现场当面打了‘客户’给的电话，接电话的人正是店里的一名员工。”</p><p style="text-align: start;">尽管如此，店方并没有对此事进行解决。</p><p style="text-align: start;"><strong>同行致歉自家也是受害者，进行反击时对象搞错了</strong></p><p style="text-align: start;">7月9日，红星新闻陪同王先生及股东们来到了“熊猫不走”生日蛋糕成都总部，该蛋糕店成都负责人对此事进行了回应。</p><p style="text-align: start;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/21/140728v9cye9smrws90rz3.jpg" alt="" data-href="" style=""></p><p style="text-align: center;">王先生及股东前往熊猫不走蛋糕店寻求说法</p><p style="text-align: start;">该负责人承认对王先生的蛋糕店实施了10次以内的恶意攻击，对于实施恶意攻击的原因，该负责人解释：“我们也是受害者!”</p><p style="text-align: start;">该店负责人回应称：故意订退单确实是公司员工所为，但并非全部订退单。其实自家店也是受害者。自家店刚开业一个多月，却遭到许多退订单、差评等情况。这些异常行为，<strong>该负责人认为是同行恶意竞争，便擅自冒着违规风险对销量排名靠前的蛋糕店做出了反攻击行为。</strong></p><p style="text-align: start;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/21/140728wuga5rcbykkgrkrb.jpg" alt="" data-href="" style=""></p><p style="text-align: center;">熊猫不走蛋糕店负责人展示自家店受到的恶意差评</p><p style="text-align: start;">如今，当王先生找到公司时，才得知攻击对象错误。为此，他现场向王先生等人道歉，并表示愿意赔偿合理的损失。目前双方就赔偿一事正在协商。</p><p style="text-align: start;">对于此次遭遇，王先生及股东们认为，尽管目前市场上蛋糕店数量很多，竞争激烈，但<strong>大家都应合规合法，正常经营，别让个别不正当竞争行为影响了市场秩序。</strong></p><p style="text-align: start;">针对此类恶意攻击行为属于什么性质，是否应给予相关处罚等问题，红星新闻曾联系工商相关部门，但截至发稿，暂未获得回复。</p><p style="text-align: start;">成都商报-红星新闻记者 张肇婷 摄影报道</p>',
        3, 0, 0, 1, '2023-03-28 17:13:42', null, '2023-03-31 02:12:34', '五十单，导致损失数千元。
这是什么情况?
蹊跷订单一周连续遭遇四五十笔退单，损失数千元
去年，王先生', 9);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (24, '烘焙行业越来越难做了？并不是', '/imgs/烘焙行业难做.jpeg', '',
        '<h3 style="text-align: justify;"></h3><h3 style="text-align: justify;"><span style="color: rgb(38, 38, 38); font-size: 16px;"> 大城市市场竞争已是红海，装不下小知名品牌和个人店；而二四线下列大城市还处在大暴发前夕，非常容易创建规范保持部分垄断性。垄断性的钱才够平稳，才够舒心，才够长久。</span></h3><p style="text-align: center;"><br></p><h3 style="text-align: justify;"><span style="color: rgb(38, 38, 38); font-size: 16px;"> &nbsp; &nbsp;首先，先铺大型商场，再铺高档公寓，依据衣食住行情景合理布局，不必有局限。面包房归根结底是总流量做生意。哪儿人工流产大，我也该出現在哪儿。大型商场人工流产集中化，并且针对1个一开始打知名品牌的小企业而言，大型商场先天性就是说宣传策划知名品牌的好阵营。客观性的说，大型商场店都是最赚钱的。 &nbsp; &nbsp;关键缘故就是说房租尽管比社区超市高许多，但因为中小城市房租广泛不高，因此高就高不上哪儿去。因此，在中小城市开实体店时，能先抢大型商场店就尽量不必先弄社区超市。开实体店有次序，并不意味着就不可以开住宅小区店。 &nbsp; &nbsp;反过来，人们的逻辑性是必须要多开实体店，多布点，根据布点来保持对全部大城市重中之重总流量地区的遮盖。只能那样做，能够堵住潜在性竞争者们冒出的概率。因为有你在了，它就没必需了，它进去的成本费可就并不是你那时候的成本费了。 &nbsp; &nbsp;曾有些人过那样一段话：在我国，資源首位，机会第2位，工作能力第3位，文凭第4位，许多老总比他人做得取得成功，就取决于他所有着的社会发展資源为他造就了一部分标准。而许多老总往往做并不大，缘故就取决于他缺乏充足的社会发展資源，独挡一面或许也就孤掌难鸣。其次，做几间自营，但重中之重务必做加盟代理。</span></h3><p style="text-align: center;"><br></p><h3 style="text-align: justify;"><span style="color: rgb(38, 38, 38); font-size: 16px;"> &nbsp; &nbsp;做自营的关键是检测运营模式和方式关键点，持续调优用的。除此之外，做自营能在加盟代理前，支撑点你创建起自身的“前店后厂”方式。但做为1个有欲望的创业人，当你想干的更大，就不可以局限性在“前店后厂”方式，务必要创建起自身的中央大厨房。但创建1个中央大厨房并不易，在蛋糕烘焙行业而言，给你20联锁店创建1个中央大厨房才必须，不然各层面考量都划不来。最后，操纵和帮扶分销商。 &nbsp; &nbsp;较为关键的一点儿就是说加盟代理店面全部的资产务必走人们的三方支付平台。它是1个跟别的许多分销商十分不同的一点儿。需不需要那么干？缘故取决于人们能够剖析分销商店面的市场销售情况，来改进市场销售的商品类目，决策如何上架商品，及其如何更强的开实体店这些。 &nbsp; &nbsp;第三，死盯3个重要指标值：租金、工作人员和每日营业额。 &nbsp; &nbsp;我非常喜爱省市，缘故就取决于：蛋糕烘焙商品的价比一线城市略微低一点儿，别的各层面成本费却大幅度降低了。门店租金上，我规定人们全部的店总面积不超出65平，银行柜台、仓储货架加蛋糕烘焙间，我觉得65平早已彻底充足了。 &nbsp; &nbsp;省市人们的两万元历年的租金在一线城市是不能想像的。人工成本上，包括技术员以外，人们每一店数最多不可以超出5本人。并且單人的成本费比一线城市必须立即划算一大半。</span></h3>',
        3, 2, 0, 1, '2023-03-28 17:14:57', null, null, '
 大城市市场竞争已是红海，装不下小知名品牌和个人店；而二四线下列大城市还处在大暴发前夕，非常容易创', 10);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (25, '济南一知名品牌面包连锁店，多家门店关门，很多人充值卡还没消费完，记者调查发现... ...', '/imgs/面包连锁店.jpg',
        '',
        '<p style="text-align: start;"><span style="font-size: 15px;">18日，记者联系到面包新语品牌官方一工作人员。她表示，</span><strong>目前仅是暂时关掉多家门店，并非退出济南市场，如要退出也会妥善处理消费者的储值卡问题。</strong><span style="font-size: 15px;">然而，新时报调查发现，</span><strong>面包新语品牌加盟商山东面包新语餐饮管理有限公司已在半个多月前，被天桥区市场监督管理局列入经营异常名录，且有失信被执行人。</strong></p><p style="text-align: start;"><br></p><p style="text-align: start;"><br></p><p style="text-align: start;"><br></p><p><strong>无处消费的储值卡</strong></p><p><strong><br></strong></p><p style="text-align: start;"><br></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">“从面包新语在恒隆开第一家店起，我就一直吃他家的蛋糕，孩子也很喜欢吃店里的甜甜圈，为此我特意从店里办了卡。但今年年初，朋友跟我说这家店经营情况不是很好了，后来我就开始关注济南面包新语公众号最新动态。”市民王先生说，今年4月底时，其公众号还曾发文表示，恒隆店、世茂店关门，和谐广场店正常营业中。“我担心储值卡里的钱到时候没地方消费，就想着抓紧去和谐那家店消费出来，结果5月中旬去的时候店里已经搬空、撤柜了。”</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">王先生在面包新语的储值卡还有2000余元没有消费，为此他曾联系面包新语的济南客服热线，“对方给我的答复是面包新语即将撤离济南市场，退款的问题得6月份解决。但当我追问客服到底该怎么解决时，她却说具体不知道。”然而，5月中旬王先生再次拨打该客服热线时，已无法接通。</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">与王先生遭遇一样，济南还有不少面包新语的消费者出现储值卡无处消费及退款无门的现象。“我和身边朋友们都有面包新语的储值卡，大家少则几十元，多则上千元，一下子没办法消费让我们很难接受。另外，这些店面在关门前也从来没有跟我们沟通过，更没有人联系过我们退卡一事。”</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><br></p><p style="text-align: start;"><br></p><p><strong>“一夜关门”的店面</strong></p><p><strong><br></strong></p><p style="text-align: start;"><br></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">近日，记者走访了面包新语位于和谐广场、恒隆等多个商圈的连锁店发现，均已经出现关门停业现象。其中有店面尽管柜台和货架等设施一直摆放着，但其中已无货品，也没有工作人员。</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/21/135311frk2jjjvjl3kblaa.png" alt="" data-href="" style="width: 641px;height: 497px;"></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="color: rgb(123, 127, 131); font-size: 14px;">5月28日，面包新语和谐广场店内空无一人。</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">3月27日，济南面包新语微信公众号曾发布通知表示，面包新语济南恒隆店、世茂店、和谐店将恢复营业。但在今年4月24日，该号发布消息通知，其公司决定将关闭世茂和恒隆两家店，和谐店正常营业，同时大力发展线上渠道。其下方还附有一张微信商城二维码，并表示目前微信商城还可提前预订生日蛋糕，扫码即可下单。但记者扫描此二维码后，却显示商家账号已过期。</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">目前，通过团购软件搜索相关信息显示，面包新语恒隆广场店、世茂广场店已暂停收录，和谐广场店的面包新语显示暂停营业，凤凰山店则显示已打烊。</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">据相关可查信息，面包新语于2011年8月26日正式进驻济南泉城路恒隆广场，已经营近9年时间，且开有多家分店。如今，为何会突然关门?18日，一曾在济南面包新语工作的人士称，“和谐店面算是一夜之间关门，之前很多会员储值卡一下子来到和谐店消费，店里缺少现金流支撑只能关门。”对于面包新语店面关门一事，该人士还称，“这件事也有加盟期快到了的原因，是否还会继续也很难说。”</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><br></p><p style="text-align: start;"><br></p><p><strong>被列入异常经营的公司</strong></p><p><strong><br></strong></p><p style="text-align: start;"><br></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">入济经营近9年时间，面包新语也曾因“天价”塑料袋、团购不开发票等事件遭到媒体曝光。</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">18日，面包新语品牌官网相关工作人员称，济南面包新语连锁店面均属于山东面包新语餐饮管理有限公司，该公司为面包新语品牌加盟商。“我们还有两个月工资没有发下来，也联系不到公司。”上述人士称，他们也联系过劳动仲裁等部门。</span></p><p style="text-align: start;"><br></p><p style="text-align: start;"><span style="font-size: 15px;">经查询企查查专业软件，山东面包新语管理有限公司成立于2011年，注册地为天桥区凤凰山路一处院内。目前，该公司已被天桥区市场监督管理局列入经营异常名录，且有失信被执行人，限制高消费，企业虽显示在业状态，但提供的电话无法与对方取得联系。</span></p>',
        3, 1, 0, 1, '2023-03-28 17:15:31', null, null,
        '18日，记者联系到面包新语品牌官方一工作人员。她表示，目前仅是暂时关掉多家门店，并非退出济南市场，如', 9);
INSERT INTO traveling.t_content (id, title, img_url, video_url, content, type, view_count, comment_count, create_by,
                              create_time, update_by, update_time, brief, category_id)
VALUES (26, '85度C又出事了，饮品里喝出“订书针”，店员的一波操作让女子直接曝光！', '/imgs/85度C.jpeg', '',
        '<h2 style="text-align: start;"><span style="color: rgb(0, 0, 0); font-size: 15px;">海峡消费报报道，福州一3岁小孩在85度C奶茶里喝出订书钉，卖家否认来源。</span></h2><p style="text-align: start;"><br></p><p><span style="color: rgb(0, 0, 0); font-size: 15px;">近日，福州的郑女士在85度C门店里购买了一款名叫爆粒葡萄的饮品进行外带。在食用过程中，3岁的儿子从葡萄粒中吃出了一颗订书钉。</span></p><p><br></p><p><span style="color: rgb(0, 0, 0); font-size: 15px;">幸运的是，孩子当时并未吞食。郑女士为此找到店里讨说法，但店员的处置让她非常生气。</span></p><p style="text-align: center;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/17/172300kx1nb4xrxjz1i6ex.jpg" alt="" data-href="" style="width: 545px;height: 378px;"></p><p style="text-align: center;"><br></p><p><br></p><p style="text-align: center;"><span style="color: rgb(123, 12, 0);"><strong>奶茶里出现订书钉</strong></span><br></p><p style="text-align: start;"><span style="font-size: 15px;">前几天，郑女士带孩子在85度c福州福新永辉店，买了一款名叫爆粒葡萄的新品奶茶带走食用。</span></p><p style="text-align: start;"><br></p><p><span style="font-size: 15px;">饮用的过程中，孩子说，里面好像有鱼骨头一样的东西，随后吐出了一个订书钉。郑女士大吃一惊，如果孩子咽了下去，后果不堪设想。郑女士到店里讨说法，但店员否认了这件事，但可以给郑女士重做一杯。</span></p><p style="text-align: center;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/17/172301i404uo022nb08ocj.jpg" alt="" data-href="" style=""></p><p style="text-align: center;"><br></p><p><br></p><p><span style="font-size: 15px;">郑女士让对方拿出店里的订书钉看一看，店员拿了一个最大号的订书钉，但郑女士在门店的员工区域里发现了与奶茶里同样型号的订书钉。</span></p><p style="text-align: center;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/17/172302ey5pi7g7n55nn39a.jpg" alt="" data-href="" style=""></p><p style="text-align: center;"><br></p><p style="text-align: center;"><span style="color: rgb(123, 12, 0);"><strong>钉子是怎么来的？</strong></span><br></p><p style="text-align: center;"><span style="font-size: 15px;">店员的态度让郑女士非常不满，随后她把这件事曝光给海峡消费报记者。</span></p><p style="text-align: center;"><br></p><p><span style="font-size: 15px;">记者来到门店，问店长，爆粒葡萄是怎么制作出来的，原材料是统一供货还是现料做的。店长说，公司没有授权他回答问题，让记者留下联系方式，会有相关的工作人员进行回复。</span></p><p><br></p><p style="text-align: center;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/17/172302mzuuay1xqhddt7bl.jpg" alt="" data-href="" style=""></p><p style="text-align: center;"><br></p><p><br></p><p><span style="font-size: 15px;">有当天的目击者说，在地板上确实曾看到小型书钉。后来记者找到新福市场监管所反映此事，工作人员组织双方沟通协调。</span></p><p><span style="font-size: 15px;">饮品店负责人说，出事之后查过店内的监控录像，也查看了员工制作饮品的流程，没有发现问题，但是监控记录不能给记者和消费者看。郑女士说，接下来有可能通过法律途径处理此事。</span></p><p><br></p><p><span style="font-size: 15px;">钉子到底是怎么来的？真相有待进一步调查。</span></p><p style="text-align: center;"><span style="color: rgb(123, 12, 0);"><strong>门店的危机公关值得商榷</strong></span></p><p style="text-align: center;"><br></p><p style="text-align: center;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/17/172302d42yqt3cddd41v9x.jpg" alt="" data-href="" style=""></p><p><strong>虽然事实并未最终确认，但业内人士认为，门店的危机公关值得商榷：</strong></p><p><br></p><p><span style="font-size: 15px;"><strong>1. 作为餐饮行业的经营者，一定要关注食品安全，这是最重要的。出了问题，要第一时间确定事实，而不是推卸责任。即便责任一时无法落定，也要向消费者反馈自己的正向的积极做法：我们高度重视，已经召开了会议，正在积极进行调查。这也能有效消解消费者的应激情绪。</strong></span></p><p><br></p><p><span style="font-size: 15px;">2. 事发门店应该及时上报总部，总部应及时召开专门会议，制定具体的应对策略。</span></p><p><br></p><p><span style="font-size: 15px;">3. 拟定一份专用的话术，以告诉事发门店和公关部门如何应对有关部门、媒体和消费者有可能存在的任何询问。</span></p><p style="text-align: center;"><img src="https://www.hongbeiguan.com/data/attachment/portal/202007/17/172302yyajygjnea4bvlxv.jpg" alt="" data-href="" style=""></p>',
        3, 4, 1, 1, '2023-03-28 17:16:00', null, null, '海峡消费报报道，福州一3岁小孩在85度C奶茶里喝出订书钉，卖家否认来源。

近日，福州的郑女士在85', 10);

-- 删除  表 traveling.t_user
DROP TABLE IF EXISTS `t_user`;

-- 创建  表 traveling.t_user
CREATE TABLE IF NOT EXISTS `t_user`
(
    `id`          bigint(11)   NOT NULL AUTO_INCREMENT,
    `user_name`   varchar(255) NOT NULL COMMENT '用户名',
    `nick_name`   varchar(255) NOT NULL COMMENT '昵称',
    `password`    varchar(64)  NOT NULL COMMENT '密码',
    `is_admin`    int(11)      DEFAULT NULL COMMENT '是否是管理员',
    `create_time` datetime     NOT NULL COMMENT '创建时间',
    `img_url`     varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `un_user_name` (`user_name`)
) CHARSET UTF8 COMMENT ='用户表';

-- 向  表 traveling.t_user 插入数据
INSERT INTO `t_user` (`id`, `user_name`, `nick_name`, `password`, `is_admin`, `create_time`, `img_url`)
VALUES (1, '柯基', 'admin', '$2a$10$7suuXVHcwg9TAB0CiUUuwuJDd.1TcP7NgbSygoyoyjbKER0xtMqDu', 1, '2023-09-30 08:15:27',
        '/imgs/dog.gif');
INSERT INTO `t_user` (`id`, `user_name`, `nick_name`, `password`, `is_admin`, `create_time`, `img_url`)
VALUES (2, 'tom', '汤姆', 'admin', 1, '2023-03-31 00:43:52', '/imgs/1.jpg');
INSERT INTO `t_user` (`id`, `user_name`, `nick_name`, `password`, `is_admin`, `create_time`, `img_url`)
VALUES (3, 'jerry', '杰瑞鼠', '123', 0, '2023-03-25 15:03:08', '/imgs/2.jpg');
INSERT INTO `t_user` (`id`, `user_name`, `nick_name`, `password`, `is_admin`, `create_time`, `img_url`)
VALUES (4, 'swk', '孙悟空', '111', 0, '2023-04-03 14:39:09', '/imgs/3.jpg');


USE `traveling`;

DROP TABLE IF EXISTS `t_log`;

CREATE TABLE `t_log`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `username`     varchar(50)   DEFAULT NULL COMMENT '用户名',
    `operation`    varchar(50)   DEFAULT NULL COMMENT '用户操作',
    `method`       varchar(200)  DEFAULT NULL COMMENT '请求方法',
    `params`       varchar(5000) DEFAULT NULL COMMENT '请求参数',
    `time`         bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
    `ip`           varchar(64)   DEFAULT NULL COMMENT 'IP地址',
    `created_time` datetime      DEFAULT NULL COMMENT '创建时间',
    `status`       int(11)       DEFAULT 1,
    `error`        varchar(500)  DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8 COMMENT ='用户日志';