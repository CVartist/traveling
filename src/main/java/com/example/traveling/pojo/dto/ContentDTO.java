package com.example.traveling.pojo.dto;

import lombok.Data;

@Data
public class ContentDTO {
    private Long id;
    private String title;
    private String imgUrl;
    private String videoUrl;
    private String brief;
    private Long type;
    private Long categoryId;
    private Long createBy;
    private String content;
}
