package com.sealinetech.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sealinetech.dao.ResultMsg;
import com.sealinetech.pojo.Employee;
import com.sealinetech.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/employees")
    @ResponseBody
    public ResultMsg getResult(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                               @RequestParam(value = "size",defaultValue = "5") Integer size){
        PageHelper.startPage(pn,size);
        List<Employee> emps=employeeService.getAllEmployees();
        PageInfo pageInfo = new PageInfo(emps,5);
        return ResultMsg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){

        PageHelper.startPage(pn,5);
        List<Employee> emps=employeeService.getAllEmployees();
        PageInfo pageInfo = new PageInfo(emps,5);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
}
