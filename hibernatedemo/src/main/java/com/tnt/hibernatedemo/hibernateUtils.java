/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tnt.hibernatedemo;

import com.tnt.pojo.Category;
import com.tnt.pojo.Product;
import com.tnt.pojo.Tag;
import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;



/**
 *
 * @author admin
 */
public class hibernateUtils {
    private final static SessionFactory factoty;
    
    static {
        Configuration conf = new Configuration();
        Properties pro = new Properties();
        pro.put(Environment.DIALECT, "org.hibernate.dialect.MySQLDialect");
        pro.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
        pro.put(Environment.URL, "jdbc:mysql://localhost/saledb");
        pro.put(Environment.USER, "root");
        pro.put(Environment.PASS, "Admin@123");
        pro.put(Environment.SHOW_SQL, "true");
        conf.setProperties(pro);
        
        conf.addAnnotatedClass(Category.class);
        conf.addAnnotatedClass(Product.class);
        conf.addAnnotatedClass(Tag.class);
        
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(conf.getProperties()).build();
        factoty = conf.buildSessionFactory(serviceRegistry);
    }

    /**
     * @return the factoty
     */
    public static SessionFactory getFactoty() {
        return factoty;
    }


}
