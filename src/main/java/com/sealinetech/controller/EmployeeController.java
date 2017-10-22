package com.sealinetech.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sealinetech.pojo.ResultMsg;
import com.sealinetech.pojo.Department;
import com.sealinetech.pojo.Employee;
import com.sealinetech.service.DepartmentService;
import com.sealinetech.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    @Autowired
    DepartmentService departmentService;

    /**
     *
     * @param ids 段横线 "-" 分割
     * @return
     */
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public ResultMsg deleteEmp(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            String[] strs = ids.split("-");
            List<Integer> list=new ArrayList<>();
            for (String id: strs) {
                list.add(Integer.parseInt(id));
            }
            employeeService.deleteEmpBatch(list);
            return ResultMsg.success();
        }else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
            return ResultMsg.success();
        }
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public ResultMsg putEmp(Employee employee){
        employeeService.updateEmp(employee);
        return ResultMsg.success();
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public ResultMsg getEmp(@PathVariable("id") Integer id){

        Employee employee = employeeService.getEmployee(id);
        return ResultMsg.success().add("emp",employee);
    }

    @RequestMapping("/checkUser")
    @ResponseBody
    public ResultMsg checkUser(@RequestParam("empNo") String empNo){
        String regex="^[a-zA-Z0-9_-]{6,16}$";
        if(!empNo.matches(regex)){
            return ResultMsg.fail().add("va-msg","校验失败");
        }
        boolean b = employeeService.checkNo(empNo);
        if(b){
            return ResultMsg.success();
        }else {
            return ResultMsg.fail();
        }
    }

    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError err : errors) {
                map.put(err.getField(),err.getDefaultMessage());
            }
            return ResultMsg.fail().add("errors",map);
        }else {
            int res = employeeService.saveEmp(employee);
            if(res>0){
                return ResultMsg.success();
            }else {
                return ResultMsg.fail();
            }
        }
    }

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
        List<Department> depts =departmentService.getAllDepartment();
        model.addAttribute("depts",depts);
        return "list";
    }
}
