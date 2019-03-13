package com.example.demo.mybatis;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

/**
 * Created by zhangzp on 2018/8/27.
 */
@Configuration
public class MyBatisConfig {
  private static final String MAPPER_LOCATION = "classpath:com/example/**/*Mapper.xml";

  @Bean
  @ConfigurationProperties(prefix = "spring.datasource")
  public DataSource dataSource() {
    return new DruidDataSource();
  }

  @Bean(name = "sqlSessionFactory")
  public SqlSessionFactory sqlSessionFactory() throws Exception {
    final SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
    sqlSessionFactoryBean.setDataSource(dataSource());
    sqlSessionFactoryBean.setMapperLocations(
        new PathMatchingResourcePatternResolver()
            .getResources(MAPPER_LOCATION));

    // 插件
//    Interceptor[] plugins = {new PagePlugin("mysql",".*listPage.*"),new ExecutorInterceptor()};
//    Properties p = new Properties();
//    p.setProperty("dialect", "MySQL");
//    PagePlugin pagePlugin = new PagePlugin();
//    pagePlugin.setProperties(p);
//    ResultPlugin resultPlugin = new ResultPlugin();
//    resultPlugin.setProperties(p);
//    sqlSessionFactoryBean.setPlugins(new Interceptor[]{pagePlugin,resultPlugin});
//    sqlSessionFactoryBean.setConfigLocation(new DefaultResourceLoader().getResource("classpath:mybatis-config.xml"));
    return sqlSessionFactoryBean.getObject();
  }
}
