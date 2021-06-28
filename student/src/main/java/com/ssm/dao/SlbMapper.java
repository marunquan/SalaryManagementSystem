package com.ssm.dao;

import com.ssm.entity.Slb;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SlbMapper {
    List<Slb> list();
    int updateByPrimaryKey(Slb record);
    Slb selectByPrimaryKey(@Param("id") int id);
}
