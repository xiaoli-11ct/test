package com.heritage.controller;

import com.heritage.common.Result;
import com.heritage.service.HeritageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/heritage")
public class HeritageController {
    
    @Autowired
    private HeritageService heritageService;
    
    @GetMapping("/list")
    public Result<List<Map<String, Object>>> list(
            @RequestParam(required = false) Integer provinceId,
            @RequestParam(required = false) Integer categoryId) {
        List<Map<String, Object>> result;
        if (provinceId != null) {
            result = heritageService.getByProvinceId(provinceId);
        } else if (categoryId != null) {
            result = heritageService.getByCategoryId(categoryId);
        } else {
            result = heritageService.getAllWithProvince();
        }
        return Result.success(result);
    }
    
    @GetMapping("/{id}")
    public Result<Map<String, Object>> getById(@PathVariable Long id) {
        return Result.success(heritageService.getByIdWithProvince(id));
    }
    
    @GetMapping("/stats")
    public Result<Map<String, Object>> getStats() {
        Long total = heritageService.getTotalCount();
        Long national = heritageService.getNationalCount();
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalCount", total);
        stats.put("nationalCount", national);
        return Result.success(stats);
    }
}
