package com.example.demo.login.mapper;

import com.example.demo.login.domain.Admin;
import com.example.demo.mybatis.DefaultMapper;
import com.example.demo.mybatis.plugin.SqlCondition;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper extends DefaultMapper {


    List<Admin> selectByCondition1(@Param("map") SqlCondition param);

}
