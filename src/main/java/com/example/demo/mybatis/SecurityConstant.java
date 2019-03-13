package com.example.demo.mybatis;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 */
@Component
public class SecurityConstant {

    public final static String WALLET_IP_SYS_CONF_KEY = "wallet_id";

    public static String SOLT;
    @Value("${sysfile.solt}")
    public void setSolt(String solt) {
        SOLT = solt;
    }

    public static String SYSNAME;
    @Value("${sysfile.sysName}")
    public void setSysName(String sysName) {
        SYSNAME = sysName;
    }

//    public static String CODELIST;
//    @Value("${sysfile.code_list}")
//    public void setCodeList(String codeList) {
//        CODELIST = codeList;
//    }

    public static int LOGINLIMITCOUNT;
    @Value("${sysfile.loginLimitCount}")
    public void setLoginLimitCount(int loginLimitCount) {
        LOGINLIMITCOUNT = loginLimitCount;
    }

//    public static String LOGISTICSKEY;
//    @Value("${logistics.key}")
//    public void setLogisticsKey(String logisticsKey) {
//        LOGISTICSKEY = logisticsKey;
//    }
//
//    public static String LOGISTICSPOSTURL;
//    @Value("${logistics.postUrl}")
//    public void setLogisticsPostUrl(String logisticsPostUrl) {
//        LOGISTICSPOSTURL = logisticsPostUrl;
//    }
    public static String ISTEST;
    @Value("${spring.profiles.active}")
    public void setIstest(String env)  {
        if ("dev".equals(env) || "test".equals(env)) {
            ISTEST = "test";
        } else {
            ISTEST = "active";
        }
    }

    int a =1;
}
