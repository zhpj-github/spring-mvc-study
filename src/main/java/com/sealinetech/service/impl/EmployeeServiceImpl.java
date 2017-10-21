package com.sealinetech.service.impl;

import com.sealinetech.dao.EmployeeDao;
import com.sealinetech.pojo.Employee;
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
}
