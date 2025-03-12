package com.example.traveling.pojo.vo;

import lombok.Data;

@Data
public class ContentIndexVO {
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
     * 作者的昵称,但是这个字段需要关联t_user表获取
     */
    private String nickName;
    /**
     * 用户头像,这个字段需要关联t_user表获取
     */
    private String userImgUrl;
    /**
     * 稿件的二级类别名称,需要关联t_category表获取
     */
    private String categoryName;
}
