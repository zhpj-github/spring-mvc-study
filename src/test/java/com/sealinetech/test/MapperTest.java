package com.sealinetech.test;

import com.sealinetech.dao.DepartmentDao;
import com.sealinetech.dao.EmployeeDao;
import com.sealinetech.pojo.Department;
import com.sealinetech.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentDao departmentDao;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void testDepartmentDao(){
        System.out.println(departmentDao);
        //departmentDao.insertSelective(new Department("A","A"));
//        EmployeeDao employeeDao = sqlSession.getMapper(EmployeeDao.class);
//        for (int i = 0; i < 1000; i++) {
//            String uuid = UUID.randomUUID().toString();//.substring(0,5)+i;
//            String name=uuid.substring(0,5)+i;
//            String no =uuid.substring(0,8)+i;
//
//            employeeDao.insertSelective(new Employee(name,no,uuid,3));
//        }
//        System.out.println("insert ok");
    }
}
