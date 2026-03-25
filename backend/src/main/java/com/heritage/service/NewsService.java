package com.heritage.service;

import com.heritage.entity.News;
import com.heritage.mapper.NewsMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class NewsService extends ServiceImpl<NewsMapper, News> {
    
    public List<Map<String, Object>> getAllWithDetails() {
        return getBaseMapper().selectAllWithDetails();
    }
}
