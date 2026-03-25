package com.heritage.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;

@Data
@TableName("category")
public class Category implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String name;
    private String code;
    private Integer sortOrder;
}
