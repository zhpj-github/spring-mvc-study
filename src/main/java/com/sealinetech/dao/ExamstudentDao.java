package com.sealinetech.dao;

import com.sealinetech.pojo.Examstudent;

public interface ExamstudentDao {
    int deleteByPrimaryKey(Integer flowid);

    int insert(Examstudent record);

    int insertSelective(Examstudent record);

    Examstudent selectByPrimaryKey(Integer flowid);

    int updateByPrimaryKeySelective(Examstudent record);

    int updateByPrimaryKey(Examstudent record);
}