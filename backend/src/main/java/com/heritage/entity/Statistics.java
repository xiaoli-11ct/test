package com.heritage.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;

@Data
@TableName("statistics")
public class Statistics implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer provinceId;
    private Integer totalCount;
    private Integer nationalCount;
    private Integer provincialCount;
    private Date createTime;
    private Date updateTime;
}
