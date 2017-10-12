package com.sealinetech.dao;

import com.sealinetech.pojo.Customers;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomersDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Customers record);

    int insertSelective(Customers record);

    Customers selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customers record);

    int updateByPrimaryKey(Customers record);

    List<Customers> selectAll();
}