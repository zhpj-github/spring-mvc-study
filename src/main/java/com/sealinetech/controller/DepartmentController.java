package com.sealinetech.controller;

import com.sealinetech.pojo.ResultMsg;
import com.sealinetech.pojo.Department;
import com.sealinetech.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public ResultMsg getDepts(){
        List<Department> depts = departmentService.getAllDepartment();
        return ResultMsg.success().add("depts",depts);
    }
}
