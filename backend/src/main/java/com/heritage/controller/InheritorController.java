package com.heritage.controller;

import com.heritage.common.Result;
import com.heritage.service.InheritorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/inheritor")
public class InheritorController {
    
    @Autowired
    private InheritorService inheritorService;
    
    @GetMapping("/list")
    public Result<List<Map<String, Object>>> list(
            @RequestParam(required = false) Integer provinceId) {
        List<Map<String, Object>> result;
        if (provinceId != null) {
            result = inheritorService.getByProvinceId(provinceId);
        } else {
            result = inheritorService.getAllWithProvince();
        }
        return Result.success(result);
    }
    
    @GetMapping("/stats")
    public Result<Long> getStats() {
        return Result.success(inheritorService.getTotalCount());
    }
}
