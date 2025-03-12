package com.example.traveling.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Comment {
    private Long id;
    /**
     * 评论内容
     */
    private String content;
    /**
     * 评论者编号
     */
    private Long userId;
    /**
     * 评论所属稿件编号
     */
    private Long contentId;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy/MM/dd",timezone = "GMT+8")
    private Date createTime;
}
