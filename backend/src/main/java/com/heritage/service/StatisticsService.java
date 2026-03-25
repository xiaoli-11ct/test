package com.heritage.service;

import com.heritage.entity.Statistics;
import com.heritage.mapper.StatisticsMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class StatisticsService extends ServiceImpl<StatisticsMapper, Statistics> {
    
    public List<Map<String, Object>> getAllWithProvince() {
        return getBaseMapper().selectAllWithProvince();
    }
    
    public Map<String, Object> getNationalStats() {
        return getBaseMapper().selectNationalStats();
    }
}
