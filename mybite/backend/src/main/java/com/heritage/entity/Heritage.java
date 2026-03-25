package com.heritage.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;

@Data
@TableName("heritage")
public class Heritage implements Serializable {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
    private Integer provinceId;
    private Integer categoryId;
    private String level;
    private String intro;
    private String description;
    private String imgUrl;
    private String videoUrl;
    private String inheritor;
    private Integer declarationYear;
    private String code;
    private Date createTime;
    private Date updateTime;
}
