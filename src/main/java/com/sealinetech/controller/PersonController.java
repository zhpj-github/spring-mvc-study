package com.sealinetech.controller;

import com.sealinetech.dao.DepartmentDao;
import com.sealinetech.dao.EmployeeDao;
import com.sealinetech.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

//@RequestMapping("/Employee")
@Controller
public class PersonController {
    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private DepartmentDao departmentDao;

//    @ModelAttribute
//    public void getEmployee(@RequestAttribute(value = "id", required = false) Integer id,
//                            Map<String,Object> map){
//        if(id!=null){
//            map.put("employee",employeeDao.selectByPrimaryKey(id));
//        }
//    }
    @RequestMapping(value = "/employee",method = RequestMethod.PUT)
    public String updateEmployee(Employee employee){
        employeeDao.updateByPrimaryKeySelective(employee);
        return "redirect:/employeeList";
    }

    @RequestMapping(value = "/employee/{id}",method = RequestMethod.GET)
    public String employee(@PathVariable("id")Integer id, Map<String,Object> map){
        map.put("departments",departmentDao.selectAll());
        map.put("employee",employeeDao.selectByPrimaryKey(id));
        return "employee";
    }
    @RequestMapping(value = "/employee/{id}",method = RequestMethod.DELETE)
    public String delete(@PathVariable("id") Integer id){
        employeeDao.deleteByPrimaryKey(id);
        return "redirect:/employeeList";
    }

    @RequestMapping("/query.do")
    public String getUrl(Map<String,Object> map){
        map.put("persons",employeeDao.selectAll());
        return "person";
    }
    @RequestMapping(value = "/employee",method = RequestMethod.POST)
    public String saveEmployee(Employee employee){
        employeeDao.insert(employee);
        return "redirect:/employeeList";
    }

    @RequestMapping(value = "employee",method = RequestMethod.GET)
    public String employee(Map<String,Object> map){
        map.put("departments",departmentDao.selectAll());
        map.put("employee",new Employee());
        return "employee";
    }


    @RequestMapping("/employeeList")
    public String loadEmployees(Map<String,Object> map){
        map.put("persons",employeeDao.selectAll());
        return "employeeList";
    }
}
