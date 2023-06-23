/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tnt.respository;

import com.tnt.hibernatedemo.hibernateUtils;
import com.tnt.pojo.Product;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import org.hibernate.Session;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
        /**
         *
         * @author admin
         */

public class ProductRepository {

    public List<Product> getProducts(Map<String, String> parmas) {
        try ( Session session = hibernateUtils.getFactoty().openSession()) {
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Product> q = cb.createQuery(Product.class);
            Root root = q.from(Product.class);
            q.select(root);
            
            if(parmas != null){
                String kw = parmas.get("kw");
                if(kw != null && !kw.isEmpty()){
                    Predicate pre = cb.like(root.get("name"), String.format("%%%s%%", kw));  
                     q.where(pre);
                }
                
               
            }
            
           q.orderBy(cb.desc(root));
            
            Query query = session.createQuery(q);
            
            return query.getResultList();
            
        }
    }
}
