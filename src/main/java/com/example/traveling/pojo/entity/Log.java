package com.example.traveling.pojo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Log {
    private Long id;
    private String ip;
    private String username;
    @JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
    private Date createdTime;
    private String operation;
    private String method;
    private String params;
    private Long time;
    private Integer status;
    private String error;
}
