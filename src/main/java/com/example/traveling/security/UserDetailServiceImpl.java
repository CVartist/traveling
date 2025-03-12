package com.example.traveling.security;

import com.example.traveling.mapper.UserMapper;
import com.example.traveling.pojo.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


/**
 * 该类定义SpringSecurity的校验细节
 */
@Slf4j
@Configuration
public class UserDetailServiceImpl implements UserDetailsService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 根据用户名查询用户信息
     *
     * @param username 用户输入的登录的用户名
     * @return 返回null值, 表示用户名不存在, 如果返回的是UserDetails, 该实例中会封装对应的用户信息
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // 根据用户名查询用户信息
        UserVO userVO = userMapper.selectByUserName(username);
        if (userVO != null) { // 用户名输入正确
            //封装查询到的用户信息
            /*UserDetails userDetails = User.builder()
                    .username(username)
                    .password(userVO.getPassword())
                    .disabled(false) // 账号是否被禁用
                    .accountLocked(false) // 账号是否锁定
                    .accountExpired(false) // 账号是否过期
                    .credentialsExpired(false) // 登录凭证是否过期
                    .authorities("权限名") // 授予当前登录的用户的权限
                    .build();*/
            String role = userVO.getIsAdmin() == 1 ? "ADMIN" : "USER";

            CustomUserDetails userDetails = new CustomUserDetails(
                    userVO.getId(),
                    userVO.getNickName(),
                    userVO.getIsAdmin(),
                    userVO.getImgUrl(),
                    username,
                    userVO.getPassword(),
                    AuthorityUtils.createAuthorityList(role)
            );
            return userDetails;
        }
        return null;
    }
}
