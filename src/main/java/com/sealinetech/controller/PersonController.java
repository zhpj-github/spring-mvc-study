package com.sealinetech.controller;

import com.sealinetech.dao.CustomersDao;
import com.sealinetech.dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class PersonController {
    @Autowired
    private EmployeeDao employeeDao;
    @RequestMapping("/query.do")
    public String getUrl(Map<String,Object> map){
        map.put("persons",employeeDao.selectAll());
        return "person";
    }
}
