package com.heritage.controller;

import com.heritage.common.Result;
import com.heritage.entity.Province;
import com.heritage.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/province")
public class ProvinceController {
    
    @Autowired
    private ProvinceService provinceService;
    
    @GetMapping("/list")
    public Result<List<Province>> list() {
        return Result.success(provinceService.getAllProvinces());
    }
    
    @GetMapping("/{id}")
    public Result<Province> getById(@PathVariable Integer id) {
        return Result.success(provinceService.getProvinceById(id));
    }
}
