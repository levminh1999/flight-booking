
package com.mycompany.spring_mvc_project_final.controller.user;

import com.mycompany.spring_mvc_project_final.controller.HomeController;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.service.AirportService;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.FlightService;
import com.mycompany.spring_mvc_project_final.service.SearchService;
import com.mycompany.spring_mvc_project_final.service.SeatTypesService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class SearchFlightController {
    
    @Autowired
    private AirportService airportService;


    @Autowired
    private FlightService flightService;
    
    @Autowired
    private BookingDetailService bookingDetailService;
    
    @Autowired
    SeatTypesService seatTypesService;
    
    @RequestMapping(value = {"/search-flight"}, method = RequestMethod.GET)
    public String searchFlightPage(Model model,HttpSession session,
            @ModelAttribute FlightsEntity flight) {
         
        try {
            session.setAttribute("trip", null);
            String departure = airportService.getAirport(flight.getFlightRoute().getDeparture().getId()).getCity().getName();
            String destination = airportService.getAirport(flight.getFlightRoute().getDestination().getId()).getCity().getName();
            Date dt = new SimpleDateFormat("yyyy-MM-dd").parse(flight.getDepartStr());
            if (flight.getTrip().equals("kh")) {
                flight.setArrival(new SimpleDateFormat("yyyy-MM-dd").parse(flight.getArrivalStr()));
                List<FlightsEntity> flightsArrival = flightService.getFlightsDipart(flight.getArrivalStr(), flight.getFlightRoute().getDestination().getId(), flight.getFlightRoute().getDeparture().getId());
                session.setAttribute("trip", "trip");
                session.setAttribute("dateDepartSelector", flight.getDepartStr());
                session.setAttribute("dateArrivalSelector", flight.getArrivalStr());
                session.setAttribute("flightsArrival", flightsArrival);
            } 
            List< FlightsEntity> flights = flightService.getFlightsDipart(flight.getDepartStr(), flight.getFlightRoute().getDeparture().getId(), flight.getFlightRoute().getDestination().getId());
            flights = flightService.flights(flights, bookingDetailService);
            Collections.sort(flights, new SearchService());
            
            session.setAttribute("direction", "trip");
            session.setAttribute("departure", departure);
            session.setAttribute("destination", destination);
            session.setAttribute("dateDepart", flightService.getThreeDate(dt));
            session.setAttribute("flights", flights);
            
            return "user/search-flight";
        
        } catch (ParseException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            return "Error";
        }
         
    }
    
    
    @RequestMapping(value = {"/search-flight-arrival"}, method = RequestMethod.GET)
    public String searchFlightArrivalPage(Model model,HttpSession session,
            @SessionAttribute("flightsArrival") List<FlightsEntity> flightsArrival,
            @ModelAttribute FlightsEntity flight) {
        session.setAttribute("direction", "returnTrip");
        if(flightsArrival.size() > 0) {
            session.setAttribute("dateDepart", flightService.getThreeDate(flightsArrival.get(0).getArrival()));
            flightsArrival = flightService.flights(flightsArrival, bookingDetailService);
        }
        return "user/search-flight";
    }
    
    
}
