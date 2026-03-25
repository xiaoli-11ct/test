package com.heritage.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.heritage.entity.Statistics;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

@Mapper
public interface StatisticsMapper extends BaseMapper<Statistics> {
    List<Map<String, Object>> selectAllWithProvince();
    Map<String, Object> selectNationalStats();
}
