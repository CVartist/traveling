package com.example.traveling.pojo.vo;

import lombok.Data;

@Data
public class ContentUpdateVO {
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
     * 稿件的一级分类
     * 1 → 食谱
     * 2 → 视频
     * 3 → 咨询
     * 优点: ①节省存储空间 ②查询性能优秀 ③后期维护方便
     */
    private Long type;
    /**
     * 稿件的二级类别
     */
    private Long categoryId;
    /**
     * 稿件正文(页面富文本编辑器录入的内容,实际上是html代码)
     */
    private String content;
    /**
     * 稿件作者编号(取自于t_user表id)
     */
    private Long createBy;
}
