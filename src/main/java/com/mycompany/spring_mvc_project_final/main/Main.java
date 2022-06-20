/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.main;

import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.service.PromotionService;
import com.mycompany.spring_mvc_project_final.service.SearchService;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author ASUS
 */
public class Main {
    
    

    public static void main(String[] args) {
        System.out.println("password===>" + encrytePassword("51365123"));
         BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        encoder.upgradeEncoding("$2a$10$Y08ML0nhdDfjAp7yz0eKpudaZvSMV/TgsasWMnxtemTYNttC9oEy6");
         System.out.println(encoder.matches("51365123", "$2a$10$y0MBV27IHxsUqmrcn9GLMOMTMGFTJlI6KIQ5mNsssd4LhqX6vMPe"));
    }

    public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }
    
    
  
}
