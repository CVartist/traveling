package com.example.traveling.controller;

import com.example.traveling.mapper.CategoryMapper;
import com.example.traveling.response.JsonResult;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "400.分类管理模块")
@RestController
@RequestMapping("/v1/categories")
public class CategoryController {
    @Autowired
    private CategoryMapper categoryMapper;

    @GetMapping("/{type}/sub")
    public JsonResult sub(@PathVariable Integer type) {
        return JsonResult.ok(categoryMapper.selectByType(type));
    }
}
