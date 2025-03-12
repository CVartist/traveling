package com.example.traveling.mapper;

import com.example.traveling.pojo.entity.Log;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LogMapper {
    @Insert("INSERT INTO t_log(ip,username,created_time,operation,method,params,time,status,error) VALUES (#{ip},#{username},#{createdTime},#{operation},#{method},#{params},#{time},#{status},#{error})")
    int insert(Log log);
}
