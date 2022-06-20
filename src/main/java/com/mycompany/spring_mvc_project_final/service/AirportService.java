/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AirportsEntity;
import com.mycompany.spring_mvc_project_final.repository.AirportRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AirportService {
    
    @Autowired
    private AirportRepository airportRepository;
    
    public AirportsEntity getAirport(int id) {
        Optional<AirportsEntity> optional = airportRepository.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        }
        return null;
    }
    
    public List<AirportsEntity> getAirports(){
        return airportRepository.findAll();
    }
}
