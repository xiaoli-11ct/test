package com.heritage.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.heritage.entity.Inheritor;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

@Mapper
public interface InheritorMapper extends BaseMapper<Inheritor> {
    List<Map<String, Object>> selectWithProvince();
    List<Map<String, Object>> selectByProvinceId(Integer provinceId);
    Long selectTotalCount();
}
