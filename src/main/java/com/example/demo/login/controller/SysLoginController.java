package com.example.demo.login.controller;

import com.example.demo.login.domain.Admin;
import com.example.demo.login.service.IAdminService;
import com.example.demo.mybatis.SecurityConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 */
@Controller
@RequestMapping
public class SysLoginController  {

    @Autowired
    private IAdminService adminService;

    @RequestMapping(value = "/toLogin")
    public ModelAndView toLogin() {
        ModelAndView mav = new ModelAndView();
//        mav.addObject("jys", CoreConfigConstant.sysNameEn);
        Admin admin = adminService.getAdmin("admin");
        String sysName = SecurityConstant.SYSNAME;
        mav.addObject("jys", "test");

        mav.addObject("admin", admin);
        mav.setViewName("/login_cs");
        return mav;
    }

    @RequestMapping(value = "/")
    public ModelAndView toLogin2() {
        ModelAndView mav = new ModelAndView();
//        mav.addObject("jys", CoreConfigConstant.sysNameEn);
        String sysName = SecurityConstant.SYSNAME;
        mav.addObject("jys", "test");
        mav.setViewName("/login");
        return mav;
    }


    public static void main(String[] args) {
//        System.out.println(CipherHelper.encryptPassword("123456",SecurityConstant.SOLT));
        String a="member:assetFrozen";
        System.out.println(a.contains("Frozen"));
    }
}
