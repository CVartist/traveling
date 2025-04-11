package com.example.traveling.controller;

import com.example.traveling.mapper.ContentMapper;
import com.example.traveling.pojo.dto.ContentDTO;
import com.example.traveling.pojo.entity.Content;
import com.example.traveling.pojo.vo.ContentAdminVO;
import com.example.traveling.pojo.vo.ContentIndexVO;
import com.example.traveling.pojo.vo.ContentManagementVO;
import com.example.traveling.pojo.vo.ContentUpdateVO;
import com.example.traveling.response.JsonResult;
import com.example.traveling.security.CustomUserDetails;
import io.swagger.annotations.Api;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.Date;
import java.util.List;

@Api(tags = "500.稿件管理模块")
@RestController
@RequestMapping("/v1/contents")
public class ContentController {
    @Autowired
    private ContentMapper contentMapper;

    /*@PostMapping("/add-new")
    public JsonResult addNew(@RequestBody ContentDTO contentDTO,
                             @AuthenticationPrincipal CustomUserDetails details) {
        Content content = new Content();
        BeanUtils.copyProperties(contentDTO, content);
        if (content.getId() != null) {
            content.setUpdateTime(new Date());
            content.setUpdateBy(details.getId());
            contentMapper.insert(content);
        } else {
            content.setCreateTime(new Date());
            contentMapper.insert(content);
        }
        return JsonResult.ok();
    }*/
    @PostMapping("/add-new")
    public JsonResult addNew(@RequestBody ContentDTO contentDTO,
                             @AuthenticationPrincipal CustomUserDetails details) {
        Content content = new Content();
        BeanUtils.copyProperties(contentDTO, content);
        if (content.getId() != null) {
            //走进该分支,说明用户提交的数据,包含id,所以一定是修改
            content.setUpdateTime(new Date());
            content.setUpdateBy(details.getId());
            contentMapper.update(content);
        } else {
            content.setCreateTime(new Date());
            contentMapper.insert(content);
        }
        return JsonResult.ok();
    }

    @GetMapping("{type}/management")
    public JsonResult management(@PathVariable Integer type,
                                 @AuthenticationPrincipal CustomUserDetails details) {
        return JsonResult.ok(contentMapper.selectByType(type, details.getId()));
    }

    @GetMapping("{type}/{categoryId}/index")
    public JsonResult selectIndex(@PathVariable Integer type,
                                  @PathVariable Long categoryId) {
        return JsonResult.ok(contentMapper.selectByTypeAndCategoryId(type, categoryId));
    }

    @GetMapping("{id}/update")
    public JsonResult update(@PathVariable Long id) {
        return JsonResult.ok(contentMapper.selectByIdForUpdate(id));
    }

    @GetMapping("/hot")
    public JsonResult selectHot() {
        return JsonResult.ok(contentMapper.selectHot());
    }

    @GetMapping("{type}/list")
    public JsonResult selectList(@PathVariable Integer type,
                                 @RequestParam(defaultValue = "1") int page,
                                 @RequestParam(defaultValue = "20") int size) {
        int offset = (page - 1) * size;
        List<ContentIndexVO> contentList = contentMapper.selectListByType(type, offset, size);

        // 获取总数
        Long totalCount = (long) contentMapper.getCountByType(type); // 新增方法获取总数
        return JsonResult.ok(contentList, totalCount); // 返回内容和总数
    }

    @GetMapping("/{wd}/search")
    public JsonResult search(@PathVariable String wd) {
        return JsonResult.ok(contentMapper.selectByWd(wd));
    }

    @GetMapping("/{type}/admin")
    public JsonResult selectForAdmin(@PathVariable Integer type,
                                     @RequestParam(defaultValue = "1") int page,
                                     @RequestParam(defaultValue = "10") int size) {
        int offset = (page - 1) * size;
        List<ContentAdminVO> contentList = contentMapper.selectByTypeForAdmin(type, offset, size);
        long totalCount = contentMapper.getCountByType(type); // 获取总数
        return JsonResult.ok(contentList, totalCount); // 返回内容和总数
    }

    @GetMapping("{id}/detail")
    public JsonResult selectDetail(@PathVariable Long id) {
        contentMapper.updateViewCountById(id);
        return JsonResult.ok(contentMapper.selectByIdForDetail(id));
    }

    @GetMapping("{userId}/{contentId}/other")
    public JsonResult selectOther(@PathVariable Long userId,
                                  @PathVariable Long contentId) {
        return JsonResult.ok(contentMapper.selectByUserId(userId, contentId));
    }

    @PostMapping("{id}/delete")
    public JsonResult delete(@PathVariable Long id) {
        // 得到封面图片路径并删除
        ContentUpdateVO contentUpdateVO = contentMapper.selectByIdForUpdate(id);
        new File("d:/file" + contentUpdateVO.getImgUrl()).delete();
        // 判断如果是视频，则删除视频文件
        if (contentUpdateVO.getType() == 2) {
            new File("d:/file" + contentUpdateVO.getVideoUrl()).delete();
        }
        contentMapper.deleteById(id);
        return JsonResult.ok();
    }
}
