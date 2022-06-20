package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AirportsEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatsService;
import com.mycompany.spring_mvc_project_final.service.AirportService;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.FlightRouteService;
import com.mycompany.spring_mvc_project_final.service.FlightService;
import com.mycompany.spring_mvc_project_final.service.PromotionService;
import com.mycompany.spring_mvc_project_final.service.SeatTypesService;
import com.mycompany.spring_mvc_project_final.service.UserDetailsServiceImpl;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
    
    @Autowired
    private PromotionService promotionService;

    @Autowired
    private AirportService airportService;
  
    @Autowired
    SeatTypesService seatTypesService;
    
    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;

    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public String viewHomePage(Model model,HttpSession session) {
        
       
        if(session.getAttribute("selectedFlightArrival")!= null) {
            session.removeAttribute("selectedFlightArrival");
        }
        
        if(userDetailsServiceImpl.getUserInfo(SecurityUtils.viewHome()) != null) {
             session.setAttribute("userInfo", userDetailsServiceImpl.getUserInfo(SecurityUtils.viewHome()));
        } else {
            if(session.getAttribute("userInfo")!= null) {
               session.removeAttribute("userInfo");
            }
        }
        
        List<AirportsEntity> airports = airportService.getAirports();
        model.addAttribute("airports", airports);
        model.addAttribute("flight", new FlightsEntity());
      
      return "user/home";
    }

    
   
    @RequestMapping(value = {"/test"}, method = RequestMethod.GET)
    public String searchBookingPage() {
   
          return "user/uy-dep-trai";
    }
    
    
    
    
}
