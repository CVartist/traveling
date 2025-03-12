package com.example.traveling.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class CommentVO {
    private Long id;
    /**
     * 评论内容
     */
    private String content;
    /**
     * 评论者的昵称
     */
    private String nickName;
    /**
     * 评论者的头像
     */
    private String userImgUrl;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy/MM/dd",timezone = "GMT+8")
    private Date createTime;
}
