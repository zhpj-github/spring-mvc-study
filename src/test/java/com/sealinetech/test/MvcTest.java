package com.sealinetech.test;

import com.github.pagehelper.PageInfo;
import com.sealinetech.pojo.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springMvc.xml"})
public class MvcTest {
    MockMvc mockMvc;
    @Autowired
    WebApplicationContext context;

    @Before
    public void initParam(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testMvc() throws Exception {
        MvcResult result = mockMvc.perform(
                MockMvcRequestBuilders.get("/emps")
                        .param("pn","1")
                        .param("size","10")
        ).andReturn();

        System.out.println(result);
        return;
//        PageInfo pageInfo = (PageInfo) result.getRequest().getAttribute("pageInfo");
//        System.out.println("pn:"+pageInfo.getPageNum());
//        System.out.println("pages:"+pageInfo.getPages());
//        System.out.println("total:"+pageInfo.getTotal());
//
//        List<Employee> list = pageInfo.getList();
//        for (Employee emp: list ) {
//            System.out.println("Name:"+emp.getName()+"==>No:"+emp.getNo());
//        }
    }
}
