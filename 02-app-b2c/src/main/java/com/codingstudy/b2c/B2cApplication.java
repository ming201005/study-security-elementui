package com.codingstudy.b2c;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan("com.codingstudy.b2c.dao")
@EnableTransactionManagement //开启事务控制
public class B2cApplication {

    public static void main(String[] args) {
        SpringApplication.run(B2cApplication.class, args);
    }

}
