package com.heritage.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.heritage.entity.News;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

@Mapper
public interface NewsMapper extends BaseMapper<News> {
    List<Map<String, Object>> selectAllWithDetails();
}
