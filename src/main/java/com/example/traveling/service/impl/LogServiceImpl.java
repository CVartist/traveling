package com.example.traveling.service.impl;

import com.example.traveling.mapper.LogMapper;
import com.example.traveling.pojo.entity.Log;
import com.example.traveling.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logMapper;

    @Override
    public void insert(Log log) {
        logMapper.insert(log);
    }
}
