package com.sealinetech.service.impl;

import com.sealinetech.dao.EmployeeDao;
import com.sealinetech.pojo.Employee;
import com.sealinetech.pojo.EmployeeExample;
import com.sealinetech.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeDao employeeDao;
    @Override
    public List<Employee> getAllEmployees() {
        return employeeDao.selectAll();
    }

    @Override
    public int saveEmp(Employee employee) {
        return employeeDao.insertSelective(employee);
    }

    @Override
    public boolean checkNo(String empNo) {
        //Employee employee = employeeDao.selectByPrimaryKey(0);
        return false;
    }

    @Override
    public Employee getEmployee(Integer id) {
        return employeeDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateEmp(Employee employee) {
        return employeeDao.updateByPrimaryKeySelective(employee);
    }

    @Override
    public int deleteEmp(Integer id) {
        return employeeDao.deleteByPrimaryKey(id);
    }

    @Override
    public int deleteEmpBatch(List<Integer> list) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andidIn(list);
        return employeeDao.deleteByExample(example);
    }
}
