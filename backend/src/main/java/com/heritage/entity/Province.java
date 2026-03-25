package com.heritage.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;

@Data
@TableName("province")
public class Province implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String provinceCode;
    private String provinceName;
    private Double longitude;
    private Double latitude;
    private Date createTime;
    private Date updateTime;
}
