package com.heritage.service;

import com.heritage.entity.Province;
import com.heritage.mapper.ProvinceMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProvinceService extends ServiceImpl<ProvinceMapper, Province> {
    public List<Province> getAllProvinces() {
        return list();
    }
    
    public Province getProvinceById(Integer id) {
        return getById(id);
    }
}
