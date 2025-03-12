package com.example.traveling.controller;

import com.example.traveling.aop.RequiredTime;
import com.example.traveling.mapper.UserMapper;
import com.example.traveling.pojo.dto.UserRegDTO;
import com.example.traveling.pojo.entity.User;
import com.example.traveling.pojo.vo.UserVO;
import com.example.traveling.response.JsonResult;
import com.example.traveling.response.StatusCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Api(tags = "600.测试模块")
@RestController
@RequestMapping("/test/")
public class TestController {
    @GetMapping("/cookie1")
    public JsonResult cookie1(HttpServletResponse response) {
        Cookie username = new Cookie("username", "keji");
        Cookie password = new Cookie("password", "123456");
        username.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(username);
        response.addCookie(password);
        return JsonResult.ok();
    }

    @GetMapping("/cookie2")
    public JsonResult cookie2(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            String name = cookie.getName();
            String value = cookie.getValue();
            System.out.println("cookie的名字:" + name + ",cookie的值为:" + value);
        }
        return JsonResult.ok();
    }

    @GetMapping("session1")
    public JsonResult session1(HttpSession session) {
        //将数据存储到session中
        session.setAttribute("name", "lds");
        session.setAttribute("gender", "boy");
        return JsonResult.ok();
    }

    @GetMapping("session2")
    public JsonResult session2(HttpSession session) {
        //从session中取出对应的数据
        String name = (String) session.getAttribute("name");
        String gender = (String) session.getAttribute("gender");
        System.out.println("name = " + name);
        System.out.println("gender = " + gender);
        return JsonResult.ok();
    }

    @GetMapping("session3")
    public JsonResult session3(HttpSession session) {
        System.out.println("session3中的session对象:" + session);
        //从session中取出对应的数据
        String name = (String) session.getAttribute("name");
        String gender = (String) session.getAttribute("gender");
        System.out.println("name = " + name);
        System.out.println("gender = " + gender);
        return JsonResult.ok();
    }

    @GetMapping("/aop1")
    public JsonResult wan1() {
        for (int i = 0; i < 10000; i++) {
            System.out.println("第" + (i + 1) + "次执行wan方法");
        }
        return JsonResult.ok("测试完成!");
    }

    @GetMapping("/aop2")
    public JsonResult wan2() {
        for (int i = 0; i < 10000; i++) {
            System.out.println("第" + (i + 1) + "次执行wan方法");
        }
        return JsonResult.ok("测试完成!");
    }

    @GetMapping("/aop3")
    public JsonResult wan3() {
        for (int i = 0; i < 10000; i++) {
            System.out.println("第" + (i + 1) + "次执行wan方法");
        }
        return JsonResult.ok("测试完成!");
    }

    @GetMapping("/aop4")
    @RequiredTime
    public JsonResult wan4() {
        for (int i = 0; i < 10000; i++) {
            System.out.println("第" + (i + 1) + "次执行wan方法");
        }
        return JsonResult.ok("测试完成!");
    }

    @GetMapping("notice")
    public JsonResult notice(){
        System.out.println("notice方法执行了");
//         int  i = 1/0;
        return JsonResult.ok();
    }

    @Autowired
    private UserMapper userMapper;

    @PostMapping("/reg")
    @ApiOperation(value = "注册功能")
    public JsonResult reg(@RequestBody UserRegDTO userRegDTO) {
        //根据用户名查询注册用户是否重名,如果重名不允许注册
        UserVO userVO = userMapper.selectByUserName(userRegDTO.getUserName());
        if (userVO != null) {
            return new JsonResult(StatusCode.USERNAME_ALREADY_EXISTS);
        }
        //接口中需要的类型是User,封装数据的类型是UserRegDTO
        User user = new User();
        BeanUtils.copyProperties(userRegDTO, user);
        //系统添加用户的注册时间
        user.setCreateTime(new Date());
        userMapper.insert(user);
        return JsonResult.ok();
    }
}
