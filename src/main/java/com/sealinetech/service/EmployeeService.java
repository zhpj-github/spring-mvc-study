package com.sealinetech.service;

import com.sealinetech.pojo.Employee;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

public interface EmployeeService {
    List<Employee> getAllEmployees();

    int saveEmp(Employee employee);

    boolean checkNo(String empNo);

    Employee getEmployee(Integer id);

    int updateEmp(Employee employee);

    int deleteEmp(Integer id);

    int deleteEmpBatch(List<Integer> list);
}
