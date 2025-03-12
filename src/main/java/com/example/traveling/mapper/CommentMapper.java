package com.example.traveling.mapper;

import com.example.traveling.pojo.entity.Comment;
import com.example.traveling.pojo.vo.CommentVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    /**
     * 发表评论
     *
     * @param comment 评论内容
     * @return 影响的记录数
     */
    int insert(Comment comment);

    /**
     * 基于稿件id查询评论内容
     *
     * @param contentId 稿件id
     * @return
     */
    List<CommentVO> selectByContentId(Long contentId);
}
