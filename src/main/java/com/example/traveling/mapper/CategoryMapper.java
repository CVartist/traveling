package com.example.traveling.mapper;

import com.example.traveling.pojo.vo.CategoryVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {
    /**
     * 根据类别类型查询类别信息
     *
     * @param type 类别类型 1 → 食谱 2 → 视频 3 → 咨询
     * @return 对应类型的类别信息
     */
    public List<CategoryVO> selectByType(Integer type);
}
