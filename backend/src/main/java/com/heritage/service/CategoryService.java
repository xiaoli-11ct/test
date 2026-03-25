package com.heritage.service;

import com.heritage.entity.Category;
import com.heritage.mapper.CategoryMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CategoryService extends ServiceImpl<CategoryMapper, Category> {
    public List<Category> getAllCategories() {
        return list();
    }
}
