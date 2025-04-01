package com.example.traveling.pojo.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class UserRegDTO {
    /**
     * 用户名
     */
    @ApiModelProperty(value = "用户名", required = true, example = "cvArtist")
    private String userName;
    /**
     * 密码
     */
    @ApiModelProperty(value = "密码",required = true)
    private String password;
    /**
     * 昵称
     */
    @ApiModelProperty(value = "昵称",required = true)
    private String nickName;
}
