package com.example.traveling.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Content {
    private Long id;
    /**
     * 稿件标题
     */
    private String title;
    /**
     * 稿件封面(存储的是图片的路径)
     */
    private String imgUrl;
    /**
     * 视频(存储的是视频的路径)
     */
    private String videoUrl;
    /**
     * 稿件正文(页面富文本编辑器录入的内容,实际上是html代码)
     */
    private String content;
    /**
     * 稿件的一级分类
     * 1 → 食谱
     * 2 → 视频
     * 3 → 咨询
     * 优点: ①节省存储空间 ②查询性能优秀 ③后期维护方便
     */
    private Long type;
    /**
     * 访问量,新发布的稿件,访问量默认为0
     */
    private Integer viewCount;
    /**
     * 评论量,新发布的稿件,评论量默认为0
     */
    private Integer commentCount;
    /**
     * 稿件作者编号(取自于t_user表id)
     */
    private Long createBy;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy/MM/dd",timezone = "GMT+8")
    private Date createTime;
    /**
     * 修改稿件的用户编号(取自于t_user表id)
     */
    private Long updateBy;
    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy/MM/dd",timezone = "GMT+8")
    private Date updateTime;
    /**
     * 摘要
     * 截取文章的前部分内容(无须考虑)
     */
    private String brief;
    /**
     * 稿件的二级类别
     */
    private Long categoryId;
}
