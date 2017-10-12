package com.sealinetech.dao;

import com.sealinetech.pojo.Mytable;

public interface MytableDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Mytable record);

    int insertSelective(Mytable record);

    Mytable selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Mytable record);

    int updateByPrimaryKey(Mytable record);
}