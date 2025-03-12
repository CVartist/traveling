package com.example.traveling.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public enum StatusCode {
    /**
     * 所有的枚举实例都在最上面
     */
    SUCCESS(1, "OK"),
    NOT_LOGIN(1000, "未登录"),
    LOGIN_SUCCESS(1001, "登录成功"),
    PASSWORD_ERROR(1002, "密码错误"),
    USERNAME_ERROR(1003, "用户名错误"),
    USERNAME_ALREADY_EXISTS(1004, "用户名已存在"),
    FORBIDDEN_ERROR(1005, "无权访问"),
    OPERATION_SUCCESS(2001, "操作成功"),
    OPERATION_FAILED(2002, "操作失败"),
    VALIDATE_ERROR(3002, "参数校验失败");
    private Integer code;
    private String msg;
}
