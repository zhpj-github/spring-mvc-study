package com.sealinetech.dao;

import com.sealinetech.pojo.Department;
import com.sealinetech.pojo.Employee;
import com.sealinetech.pojo.EmployeeExample;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface EmployeeDao {
    int deleteByPrimaryKey(Integer id);

    int deleteByExample(EmployeeExample employeeExample);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);

    List<Employee> selectAll();

    Department selectDepartment(int departmentId);
}