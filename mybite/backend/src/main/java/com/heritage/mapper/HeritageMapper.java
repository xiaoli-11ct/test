package com.heritage.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.heritage.entity.Heritage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

@Mapper
public interface HeritageMapper extends BaseMapper<Heritage> {
    List<Map<String, Object>> selectWithProvince();
    
    Map<String, Object> selectByIdWithProvince(@Param("id") Long id);
    
    List<Map<String, Object>> selectByProvinceId(@Param("provinceId") Integer provinceId);
    
    List<Map<String, Object>> selectByCategoryId(@Param("categoryId") Integer categoryId);
    
    Long selectTotalCount();
    
    Long selectNationalCount();
}
