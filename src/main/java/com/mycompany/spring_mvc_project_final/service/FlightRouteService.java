
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FlightRoutesEntity;
import com.mycompany.spring_mvc_project_final.repository.FlightRouteRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FlightRouteService {
    
    @Autowired
    private FlightRouteRepository flightRouteRepository;
    
    public List<FlightRoutesEntity> getFlightRoutes(int id) {
       return flightRouteRepository.findByDeparture_Id(id);
    }
    
}
