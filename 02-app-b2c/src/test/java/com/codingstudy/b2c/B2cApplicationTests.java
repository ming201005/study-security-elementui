package com.codingstudy.b2c;

import com.codingstudy.b2c.entity.Product;
import com.codingstudy.b2c.service.ProductService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;


@SpringBootTest
class B2cApplicationTests {

    @Resource
    private ProductService productService;

    @Test
    void contextLoads() {
        Product product = new Product();

        boolean rs = this.productService.save(product);
    }

}
