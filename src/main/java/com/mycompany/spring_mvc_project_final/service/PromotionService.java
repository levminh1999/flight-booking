/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.repository.PromotionRepository;
import java.util.Date;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PromotionService {
    
    @Autowired
    private PromotionRepository promotionRepository;
    
    public  Set<PromotionEntity> getPromotions(int flightId,Date newDate) {
        return promotionRepository.findByFlights_IdAndEndDateAfter(flightId, newDate);
    }
    
    public int getDiscount(int flightId,Date newDate) {
        int discountSave = 0;
        for(PromotionEntity promotion : promotionRepository.findByFlights_IdAndEndDateAfter(flightId, newDate)) {
            discountSave += promotion.getDiscount();
        }
        return discountSave;
    }

}
