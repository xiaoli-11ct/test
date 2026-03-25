package com.heritage.service;

import com.heritage.entity.Heritage;
import com.heritage.mapper.HeritageMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class HeritageService extends ServiceImpl<HeritageMapper, Heritage> {
    
    public List<Map<String, Object>> getAllWithProvince() {
        return getBaseMapper().selectWithProvince();
    }
    
    public Map<String, Object> getByIdWithProvince(Long id) {
        return getBaseMapper().selectByIdWithProvince(id);
    }
    
    public List<Map<String, Object>> getByProvinceId(Integer provinceId) {
        return getBaseMapper().selectByProvinceId(provinceId);
    }
    
    public List<Map<String, Object>> getByCategoryId(Integer categoryId) {
        return getBaseMapper().selectByCategoryId(categoryId);
    }
    
    public Long getTotalCount() {
        return getBaseMapper().selectTotalCount();
    }
    
    public Long getNationalCount() {
        return getBaseMapper().selectNationalCount();
    }
}
