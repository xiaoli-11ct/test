package com.heritage.controller;

import com.heritage.common.Result;
import com.heritage.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/news")
public class NewsController {
    
    @Autowired
    private NewsService newsService;
    
    @GetMapping("/list")
    public Result<List<Map<String, Object>>> list() {
        return Result.success(newsService.getAllWithDetails());
    }
}
