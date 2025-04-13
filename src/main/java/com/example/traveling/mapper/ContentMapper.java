package com.example.traveling.mapper;

import com.example.traveling.pojo.entity.Content;
import com.example.traveling.pojo.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

@Mapper
public interface ContentMapper {
    /**
     * 发布稿件
     *
     * @param content 稿件具体信息
     */
    Integer insert(Content content);

    /**
     * 查询当前用户的各类型稿件信息
     *
     * @param type 稿件类型 1 → jingd 2 → 视频 3 → 咨询
     * @param id   用户id
     * @return 稿件集合
     */
//    List<ContentManagementVO> selectByType(Integer type, Long id);
    List<ContentManagementVO> selectByType(Integer type, Long id, int size, int offset);
    int countByType(Integer type, Long id);
    /**
     * 编辑稿件时,根据稿件的id查询稿件信息
     *
     * @param id 稿件id
     * @return 稿件信息
     */
    ContentUpdateVO selectByIdForUpdate(Long id);

    /**
     * 根据id修改稿件信息
     *
     * @param content 要修改的稿件内容
     * @return 影响的行数
     */
    Integer update(Content content);

    /**
     * 根据稿件编号删除稿件
     *
     * @param id 稿件编号
     * @return
     */
    Integer deleteById(Long id);

    /**
     * 根据一级分类和二级分类查询稿件信息
     *
     * @param type       一级分类
     * @param categoryId 二级分类
     * @return 对应的稿件信息
     */
    List<ContentIndexVO> selectByTypeAndCategoryId(Integer type, Long categoryId);

    /**
     * 根据稿件的id查询稿件详细内容
     *
     * @param id 稿件id
     * @return 稿件详细内容
     */
    ContentDetailVO selectByIdForDetail(Long id);

    /**
     * 根据稿件id修改稿件的浏览量
     *
     * @param id 稿件id
     * @return 修改的记录数
     */
    int updateViewCountById(Long id);

    /**
     * 根据作者id查询作者的其他稿件
     *
     * @param userId    作者id
     * @param contentId 稿件id
     * @return 其他稿件信息
     */
    List<ContentSimpleVO> selectByUserId(Long userId, Long contentId);

    /**
     * 查询热门稿件(访问量最高的前4条)
     *
     * @return 稿件信息
     */
    List<ContentSimpleVO> selectHot();

    /**
     * 首页根据一级分类查询该分类下的所有稿件
     *
     * @param type 一级分类
     * @return 稿件信息
     */
    @Cacheable(value = "contentListCache",  key = "#type + '_' + #offset + '_' + #limit")
    List<ContentIndexVO> selectListByType(@Param("type") Integer type, @Param("offset") int offset, @Param("limit") int limit);

    int getCountByType(@Param("type") Integer type);

    /**
     * 根据关键字查询稿件信息
     *
     * @param wd 关键字
     * @return
     */
    List<ContentIndexVO> selectByWd(String wd);

    /**
     * 管理员界面根据一级分类查询稿件信息
     *
     * @param type 一级分类
     * @return 稿件信息
     */
//    List<ContentAdminVO> selectByTypeForAdmin(Integer type);
    List<ContentAdminVO> selectByTypeForAdmin(Integer type, int offset, int limit);
    /**
     * 根据稿件id修改稿件的评论量
     *
     * @param contentId 稿件id
     * @return 影响的记录数
     */
    int updateCommentCountById(Long contentId);
}
