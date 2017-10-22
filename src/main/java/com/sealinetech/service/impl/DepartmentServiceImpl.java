package com.sealinetech.service.impl;

import com.sealinetech.dao.DepartmentDao;
import com.sealinetech.pojo.Department;
import com.sealinetech.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentDao departmentDao;

    @Override
    public List<Department> getAllDepartment() {
        return departmentDao.selectAll();
    }
}
