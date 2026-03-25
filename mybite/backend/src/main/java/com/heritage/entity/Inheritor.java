package com.heritage.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;

@Data
@TableName("inheritor")
public class Inheritor implements Serializable {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
    private String gender;
    private Integer provinceId;
    private Integer categoryId;
    private String level;
    private String birthday;
    private String intro;
    private String imgUrl;
    private Date createTime;
}
