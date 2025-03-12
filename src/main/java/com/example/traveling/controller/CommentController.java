package com.example.traveling.controller;

import com.example.traveling.mapper.CommentMapper;
import com.example.traveling.mapper.ContentMapper;
import com.example.traveling.pojo.dto.CommentDTO;
import com.example.traveling.pojo.entity.Comment;
import com.example.traveling.response.JsonResult;
import com.example.traveling.response.StatusCode;
import com.example.traveling.security.CustomUserDetails;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/v1/comments/")
public class CommentController {

    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private ContentMapper contentMapper;

    @PostMapping("add-new")
    public JsonResult addNew(@RequestBody CommentDTO commentDTO,
                             @AuthenticationPrincipal CustomUserDetails userDetails) {
        if (userDetails == null) {
            return new JsonResult(StatusCode.NOT_LOGIN);
        }
        Comment comment = new Comment();
        BeanUtils.copyProperties(commentDTO, comment);
        comment.setCreateTime(new Date());
        commentMapper.insert(comment);
        //让评论量+1
        contentMapper.updateCommentCountById(commentDTO.getContentId());
        System.out.println(commentDTO.getContentId());
        return new JsonResult().ok();
    }

    @GetMapping("{contentId}")
    public JsonResult selectByContentId(@PathVariable Long contentId) {
        return JsonResult.ok(commentMapper.selectByContentId(contentId));
    }

}



