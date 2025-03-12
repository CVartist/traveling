package com.example.traveling.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class ContentAdminVO {
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
     * 访问量,新发布的稿件,访问量默认为0
     */
    private Integer viewCount;
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
     * 稿件的二级类别名
     */
    private String categoryName;
}
