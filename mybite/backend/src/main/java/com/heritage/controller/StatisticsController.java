package com.heritage.controller;

import com.heritage.common.Result;
import com.heritage.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/statistics")
public class StatisticsController {
    
    @Autowired
    private StatisticsService statisticsService;
    
    @GetMapping("/national")
    public Result<Map<String, Object>> getNational() {
        return Result.success(statisticsService.getNationalStats());
    }
    
    @GetMapping("/provinces")
    public Result<List<Map<String, Object>>> getProvinces() {
        return Result.success(statisticsService.getAllWithProvince());
    }
}
