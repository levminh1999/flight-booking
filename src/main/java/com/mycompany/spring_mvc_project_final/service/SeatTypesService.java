
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.SeatTypesEntity;
import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;
import com.mycompany.spring_mvc_project_final.repository.SeatTypesRepository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatTypesService {
    
    @Autowired
    private SeatTypesRepository seatTypesRepository;
    
   
    public Map<String, String> getSeatTypes(List<AircraftSeatsEntity> seatTypes) {
        Map<String, String> resultsMap = new HashMap<>();
        for(AircraftSeatsEntity seatType : seatTypes) {
             if(SeatTypeEnum.BUSINESS.toString().equals(seatType.getSeatType().getSeatType().name())) {
                resultsMap.put("Hạng thương gia", SeatTypeEnum.BUSINESS.toString());
        }
             else if(seatType.getSeatType().getSeatType().name().equals(SeatTypeEnum.ECONOMY.toString())) {
            resultsMap.put("Hạng phổ thông", SeatTypeEnum.ECONOMY.toString());
        }
             else {
            resultsMap.put("Hạng nhất", SeatTypeEnum.FIRST_CLASS.toString());
        }
        }
        return resultsMap;
    }
    
}
