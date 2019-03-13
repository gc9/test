package com.example.demo.login.service;

import com.example.demo.login.mapper.AdminMapper;
import com.example.demo.login.domain.Admin;
import com.example.demo.mybatis.plugin.SqlCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 */
@Service
public class AdminService implements IAdminService {


  @Autowired
  private AdminMapper adminMapper;


  @Override
  public Admin getAdmin(String name) {
    SqlCondition condition = new SqlCondition();
    condition.put(" where (admin_name=", name);
    condition.put(" or mobile=", name);
    condition.put( ") and flag=1");
    List<Admin> adminList = adminMapper.selectByCondition1(condition);
    if (!CollectionUtils.isEmpty(adminList)) {
      return adminList.get(0);
    }
    return null;
  }


}
