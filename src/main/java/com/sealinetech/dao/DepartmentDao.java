package com.sealinetech.dao;

import com.sealinetech.pojo.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface DepartmentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

    List<Department> selectAll();
}