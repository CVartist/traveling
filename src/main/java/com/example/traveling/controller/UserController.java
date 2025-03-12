package com.example.traveling.controller;

import com.example.traveling.aop.RequiredLog;
import com.example.traveling.mapper.UserMapper;
import com.example.traveling.pojo.dto.UserLoginDTO;
import com.example.traveling.pojo.dto.UserRegDTO;
import com.example.traveling.pojo.dto.UserUpdateDTO;
import com.example.traveling.pojo.entity.User;
import com.example.traveling.pojo.vo.UserVO;
import com.example.traveling.response.JsonResult;
import com.example.traveling.response.StatusCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;

@Api(tags = "100.用户管理模块")
@RestController
@RequestMapping("/v1/users")
public class UserController {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PasswordEncoder Encoder;

    @PostMapping("/reg")
    @ApiOperation(value = "注册功能")
    public JsonResult reg(@RequestBody UserRegDTO userRegDTO) {
        UserVO userVO = userMapper.selectByUserName(userRegDTO.getUserName());
        if (userVO != null) {
            return new JsonResult(StatusCode.USERNAME_ALREADY_EXISTS);
        }
        User user = new User();
        BeanUtils.copyProperties(userRegDTO, user);
        user.setCreateTime(new Date());
        user.setPassword(Encoder.encode(userRegDTO.getPassword()));
        userMapper.insert(user);
        return JsonResult.ok();
    }

    @Autowired
    private AuthenticationManager manager;

    @PostMapping("/login")
    @ApiOperation(value = "登录功能")
    public JsonResult login(@RequestBody UserLoginDTO userLoginDTO, HttpSession session) {
        try {
            // 通过用户名和密码校验是否正确
            Authentication result = manager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            userLoginDTO.getUserName(), // 用户输入的用户名
                            userLoginDTO.getPassword() // 用户输入的密码
                    )
            );
            // 把认证结果保存到Security框架的上下文中(将认证的结果共享)
            SecurityContextHolder.getContext().setAuthentication(result);
            System.out.println("用户信息:" + result.getPrincipal());
            return JsonResult.ok(result.getPrincipal());
        } catch (InternalAuthenticationServiceException e) {
            System.out.println("用户名不存在!");
            return new JsonResult(StatusCode.USERNAME_ERROR);
        }
        /*catch (BadCredentialsException e) {
            System.out.println("密码错误!");
            return new JsonResult(StatusCode.PASSWORD_ERROR);
        }*/

    }

    /*@PostMapping("/login")
    public JsonResult login(@RequestBody UserLoginDTO userLoginDTO, HttpSession session) {
        UserVO userVO = userMapper.selectByUserName(userLoginDTO.getUserName());
        if (userVO == null) {
            return new JsonResult(StatusCode.USERNAME_ERROR);
        }
        if (!userVO.getPassword().equals(userLoginDTO.getPassword())) {
            return new JsonResult(StatusCode.PASSWORD_ERROR);
        }
        session.setAttribute("user", userVO);
        return JsonResult.ok(userVO);
    }*/

    @GetMapping("/logout")
    @ApiOperation(value = "登出功能")
    public JsonResult logout() {
        /*session.removeAttribute("user");*/
        // 清空登录信息
        SecurityContextHolder.clearContext();
        return JsonResult.ok();
    }

    @PostMapping("/update")
    @ApiOperation(value = "更新用户信息")
    public JsonResult update(@RequestBody UserUpdateDTO userUpdateDTO) {
        // 判断用户是否已有头像
        if (userUpdateDTO.getImgUrl() != null) {
            String imgUrl = userMapper.selectImgUrlById(userUpdateDTO.getId());
            new File("d:/file" + imgUrl).delete();
        }
        User user = new User();
        BeanUtils.copyProperties(userUpdateDTO, user);
        userMapper.update(user);
        return JsonResult.ok();
    }

    @GetMapping("")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @ApiOperation(value = "获取管理员列表")
    @RequiredLog("查看用户列表")
    public JsonResult list() {
        return JsonResult.ok(userMapper.select());
    }

    @PostMapping("{id}/{isAdmin}/change")
    @ApiOperation(value = "修改管理员功能")
    @ApiImplicitParams(value = {
            @ApiImplicitParam(name = "id", value = "用户id", dataType = "long"),
            @ApiImplicitParam(name = "isAdmin", value = "是否是管理员", dataType = "int")})
    @RequiredLog("修改管理")
    public JsonResult change(@PathVariable Long id,
                             @PathVariable Integer isAdmin) {
        User user = new User();
        user.setId(id);
        user.setIsAdmin(isAdmin);
        userMapper.update(user);
        return JsonResult.ok();
    }

    //TODO 作业: 删除指定用户
    @ApiOperation(value = "删除指定用户功能")
    @PostMapping("{id}/delete")
    @ApiImplicitParam(name = "id", value = "用户id", dataType = "long")
    public JsonResult delete(@PathVariable Long id) {
        userMapper.deleteById(id);
        return JsonResult.ok();
    }
}
