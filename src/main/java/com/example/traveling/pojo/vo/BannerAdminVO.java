package com.example.traveling.pojo.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class BannerAdminVO {
    private Long id;
    /**
     * 轮播图的存储路径
     */
    private String imgUrl;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT=8")
    private Date createTime;
}
