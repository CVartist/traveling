package com.example.traveling.mapper;

import com.example.traveling.pojo.entity.User;
import com.example.traveling.pojo.vo.UserAdminVO;
import com.example.traveling.pojo.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    /**
     * 注册用户
     *
     * @param user 注册的用户信息
     * @return 影响的记录数
     */
    int insert(User user);

    /**
     * 基于用户名查询用户信息
     *
     * @param userName 用户名
     * @return 用户信息(包含id 、 user_name 、 nickname 、 is_admin和img_url)
     */
    UserVO selectByUserName(String userName);

    /**
     * 根据id修改用户信息
     *
     * @param user 要更改的用户信息
     * @return 影响的记录数
     */
    int update(User user);

    /**
     * 根据id查询用户的头像路径
     *
     * @param id 用户id
     * @return 头像路径(有值, 有头像 ; 无值, 无头像)
     */
    String selectImgUrlById(Long id);

    /**
     * 查询所有用户信息
     *
     * @return 封装所有用户信息的集合(不包含密码)
     */
    List<UserAdminVO> select();

    /**
     * 根据id删除指定的用户记录
     *
     * @param id 用户id
     * @return 影响的记录数
     */
    int deleteById(Long id);
}
