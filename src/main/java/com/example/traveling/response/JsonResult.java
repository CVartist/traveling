package com.example.traveling.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class JsonResult {
    /**
     * 响应状态码(业务状态码)
     */
    private Integer code;
    /**
     * 状态码的含义(比如:用户名被占用...)
     */
    private String msg;
    /**
     * 服务端返回给客户端的具体数据(可能是VO对象,也可能是List集合...)
     */
    private Object data;

    /**
     * 构造方法1:适用于不需要返回具体数据的Controller方法
     */
    public JsonResult(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    /**
     * 构造方法2:适用于不需要返回具体数据的Controller方法,使用自定义枚举类StatusCode
     */
    public JsonResult(StatusCode statusCode) {
        this.code = statusCode.getCode();
        this.msg = statusCode.getMsg();
    }

    /**
     * 构造方法3:适用于需要返回具体数据的Controller方法,使用自定义枚举类StatusCode
     */
    public JsonResult(StatusCode statusCode, Object data) {
        this.code = statusCode.getCode();
        this.msg = statusCode.getMsg();
        this.data = data;
    }

    /**
     * 构造方法4:用于快速构建JsonResult对象,初始化3个属性:code msg data
     */
    public JsonResult(Object data) {
        this.code = StatusCode.SUCCESS.getCode();
        this.msg = StatusCode.SUCCESS.getMsg();
        this.data = data;
    }

    /**
     * 2个静态方法,用于快速创建JsonResult对象
     * 一种是有返回数据data的;
     * 一种是无返回数据data的;
     */
    public static JsonResult ok(Object data) {
        return new JsonResult(data);
    }

    public static JsonResult ok() {
        return ok(null);
    }
}
