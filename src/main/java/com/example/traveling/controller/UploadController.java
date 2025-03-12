package com.example.traveling.controller;

import com.example.traveling.response.JsonResult;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Api(tags = "200.上传管理模块")
@RestController
@RequestMapping("/v1/")
public class UploadController {

    private String dirPath = "D:/file";

    @PostMapping("/upload")
    public JsonResult upload(MultipartFile file) throws IOException {
        //=============修改上传文件信息====================
        //获取上传文件的原始名 hds.jpeg
        String fileName = file.getOriginalFilename();
        System.out.println("原始名:" + fileName);
        //获取后缀名 hds.jpeg → .jpeg → 随机数.jpeg
        //substring 基于索引截取字符串
        //lastIndexOf 获取指定字符的索引值
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        System.out.println("后缀名:" + suffix);
        //生成新的文件名
        //UUID.randomUUID() 生成一个随机数 101010101010101.jpeg
        fileName = UUID.randomUUID() + suffix;
        System.out.println("新文件名:" + fileName);
        //==============进行存储=========================

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("/yyyy/MM/dd/");
        //System.out.println(new Date());
        String dataPath = simpleDateFormat.format(new Date());
        //System.out.println(dataPath);
        File dirFile = new File(dirPath + dataPath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        file.transferTo(new File(dirPath + dataPath + fileName));
        return JsonResult.ok(dataPath + fileName);
    }

    @PostMapping("/remove")
    public JsonResult remove(String url) {
        new File(dirPath + url).delete();
        return JsonResult.ok();
    }
}
