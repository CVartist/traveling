package com.example.traveling.pojo.vo;

import lombok.Data;

@Data
public class UserVO {
    private Long id;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 昵称
     */
    private String nickName;

    private String password;
    /**
     * 是否是管理员
     * 0 → 普通用户(默认值)
     * 1 → 管理员
     */
    private Integer isAdmin;
    /**
     * 头像路径
     */
    private String imgUrl;
}
