package com.example.traveling.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class ContentDetailVO {
    private Long id;
    /**
     * 稿件标题
     */
    private String title;
    /**
     * 视频(存储的是视频的路径)
     */
    private String imgUrl;


    private String videoUrl;
    /**
     * 稿件正文(页面富文本编辑器录入的内容,实际上是html代码)
     */
    private String content;
    /**
     * 稿件的一级分类
     * 前端页面需要根据一级分类,展示不同的页面
     */
    private Long type;
    /**
     * 访问量,新发布的稿件,访问量默认为0
     */
    private Integer viewCount;
    /**
     * 点赞量,评论量默认为0
     */
    private Integer likeCount;
    /**
     * 评论量,新发布的稿件,评论量默认为0
     */
    private Integer commentCount;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy/MM/dd",timezone = "GMT+8")
    private Date createTime;
    /**
     * 摘要
     * 截取文章的前部分内容(无须考虑)
     */
    private String brief;
    /**
     * 作者昵称
     */
    private String nickName;
    /**
     * 作者头像
     */
    private String userImgUrl;
    /**
     * 稿件所属id
     * 为了后面方便查询作者的其他文章
     */
    private Long userId;

    private String place;

    private String address;

    private String commentScore;

    private String sightLevel;

    private String marketPrice;

    private String discount;

    private String price;

    private String openTime;

    private String openStatus;




}
