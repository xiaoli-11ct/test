package com.heritage.service;

import com.heritage.entity.Inheritor;
import com.heritage.mapper.InheritorMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class InheritorService extends ServiceImpl<InheritorMapper, Inheritor> {
    
    public List<Map<String, Object>> getAllWithProvince() {
        return getBaseMapper().selectWithProvince();
    }
    
    public List<Map<String, Object>> getByProvinceId(Integer provinceId) {
        return getBaseMapper().selectByProvinceId(provinceId);
    }
    
    public Long getTotalCount() {
        return getBaseMapper().selectTotalCount();
    }
}
