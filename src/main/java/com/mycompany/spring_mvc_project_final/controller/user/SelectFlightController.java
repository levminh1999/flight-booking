/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller.user;

import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class SelectFlightController {
    
    @RequestMapping(value = {"/select-flight/{index}"}, method = RequestMethod.GET)
     public String selectFlightPage(Model model,HttpSession session,
            @SessionAttribute("flights") List<FlightsEntity> flights,
            @PathVariable("index") int index) {
        
        session.setAttribute("selectedFlight", flights.get(index));
        session.setAttribute("quantity", 1);
        return "user/select-flight";
    }
     
     @RequestMapping(value = {"/select-flight-arrival/{index}"}, method = RequestMethod.GET)
     public String selectFlightArrivalPage(Model model,HttpSession session,
            @SessionAttribute("flightsArrival") List<FlightsEntity> flightsArrival,
            @PathVariable("index") int index) {
        session.setAttribute("selectedFlightArrival", flightsArrival.get(index));
        
        return "user/select-flight";
    }
     
    
     
    
    
     
}
