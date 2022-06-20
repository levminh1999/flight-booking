/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.repository.FlightRepository;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FlightService {
    
    @Autowired
    private FlightRepository flightRepository;
    
    @Autowired
    private PromotionService promotionService;
   
    public List<FlightsEntity> getFlightsDipart(String depart,int departureId, int destinationId) {
    //    return flightRepository.findByDepartAndFlightRoute_Departure_IdAndFlightRoute_Destination_Id(depart,departureId, destinationId);
        return flightRepository.getFlightsByDate(depart, departureId, destinationId);
    }
    
    
    public List<String> getThreeDate(Date date) {
        List<String> dateStr = new ArrayList<>();
            for (int i = 0; i < 3; i++) {
                Calendar c = Calendar.getInstance();
                c.setTime(date);
                if (i == 0) {
                    c.add(Calendar.DATE, -1);
                } else {
                    c.add(Calendar.DATE, 1);
                }
                date = c.getTime();
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                String strDate = formatter.format(date);
                dateStr.add(strDate);
            }
            return dateStr;
    }
    
    public List<FlightsEntity> flights (List< FlightsEntity> flights, BookingDetailService bookingDetailService) {
        for (FlightsEntity fs : flights) {
                fs.setDurationStr(fs.getFlightRoute().getDuration().getHours() + " giờ " + fs.getFlightRoute().getDuration().getMinutes() + " phút");
                fs.setEmptySeat(fs.getAircraft().getColum()*fs.getAircraft().getRoww() - bookingDetailService.getBookingDetails(fs.getId(), BookingStatusEnum.BOOKED).size());
                fs.setDiscountSave(promotionService.getDiscount(fs.getId(), new Date()));
            }
        return flights;
    }
    
    
}
