/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.SeatsEntity;
import com.mycompany.spring_mvc_project_final.repository.SeatsRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatsService {
    
    @Autowired
    private SeatsRepository seatsRepository;
    
    public List<SeatsEntity> getSeatsByName(String seatName) {
        return seatsRepository.findByNumber(seatName);
    }
    
    
}
