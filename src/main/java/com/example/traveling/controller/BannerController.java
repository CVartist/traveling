package com.example.traveling.controller;

import com.example.traveling.mapper.BannerMapper;
import com.example.traveling.pojo.entity.Banner;
import com.example.traveling.pojo.vo.BannerAdminVO;
import com.example.traveling.pojo.vo.BannerVO;
import com.example.traveling.response.JsonResult;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Api(tags = "300.轮播图管理模块")
@RestController
@RequestMapping("/v1/banners")
public class BannerController {
    @Autowired
    private BannerMapper bannerMapper;

    @GetMapping
    public JsonResult select() {
        List<BannerVO> list = bannerMapper.select();

        return JsonResult.ok(list);
    }

    @GetMapping("/admin")
    public JsonResult selectForAdmin() {
        List<BannerAdminVO> list = bannerMapper.selectForAdmin();
        return JsonResult.ok(list);
    }

    @PostMapping("/{id}/delete")
    public JsonResult delete(@PathVariable("id") Long id) {
        bannerMapper.deleteById(id);
        return JsonResult.ok();
    }

    @PostMapping("/add-banner")
    public JsonResult addBanner(@RequestBody String jsonStr) {
        // 使用 Jackson 解析 JSON 字符串
        // "imgUrl":"/2024/06/01/1f3a4a68-3a93-4f1e-b621-c84046d8f24e.jpg"
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = null;
        try {
            jsonNode = objectMapper.readTree(jsonStr);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        String imgUrl = jsonNode.get("imgUrl").asText();

        Banner banner = new Banner();
        banner.setImgUrl(imgUrl);
        int sort = bannerMapper.getMaxSort();
        banner.setSort(sort+1);
        banner.setCreateTime(new Date());
        bannerMapper.insert(banner);
        return JsonResult.ok();
    }
}
