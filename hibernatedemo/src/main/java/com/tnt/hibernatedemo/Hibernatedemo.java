/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.tnt.hibernatedemo;

import com.tnt.pojo.Category;
import com.tnt.pojo.Product;
import com.tnt.respository.ProductRepository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author admin
 */
public class Hibernatedemo {

    public static void main(String[] args) {
        ProductRepository pr = new ProductRepository();
        Map<String, String> params = new HashMap<>();
        params.put("kw", "Galaxy");
        List<Product> list = pr.getProducts(params);
        list.forEach(c -> System.out.printf("%d - %s\n", c.getId(), c.getName()));
    }
}
