package com.example.traveling.pojo.dto;

import lombok.Data;

import java.util.Date;

@Data
public class BannerDTO {
    private Long id;
    private String imgUrl;
    private Long sort;
    private Date createTime;
}
