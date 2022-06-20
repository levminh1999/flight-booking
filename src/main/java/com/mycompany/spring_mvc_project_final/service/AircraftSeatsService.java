
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;
import com.mycompany.spring_mvc_project_final.repository.AircraftSeatsRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AircraftSeatsService {
    
    @Autowired
    private AircraftSeatsRepository aircraftSeatsRepository;
    
    public List<AircraftSeatsEntity> getSeats(int id) {
        return aircraftSeatsRepository.findByAircraft_Id(id);
    }
    
    public List<AircraftSeatsEntity> getSeatTypes(int flightId) {
        return aircraftSeatsRepository.getSeatTypes(flightId);
    }
    
    public List<AircraftSeatsEntity> getSeatByTypes(int flightId, SeatTypeEnum seatType) {
        return aircraftSeatsRepository.findByFlight_IdAndSeatType_SeatType(flightId, seatType);
    }
    
    public List<AircraftSeatsEntity> getSeatPrice(int flightId, String seatNumber) {
        return aircraftSeatsRepository.findByFlight_IdAndSeats_Number(flightId, seatNumber);
    }
}
