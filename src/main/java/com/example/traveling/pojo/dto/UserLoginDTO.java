package com.example.traveling.pojo.dto;

import lombok.Data;

@Data
public class UserLoginDTO {
    /**
     * 用户名
     */
    private String userName;
    /**
     * 密码
     */
    private String password;
}
