/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller.user;

import com.mycompany.spring_mvc_project_final.controller.HomeController;
import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.entities.PassengersEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatsService;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.SeatTypesService;
import com.mycompany.spring_mvc_project_final.service.SeatsService;
import com.mycompany.spring_mvc_project_final.service.ServiceService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class BookingDetailController {
    
 
    @Autowired
    private BookingDetailService bookingDetailService;
    
    @Autowired
    private AircraftSeatsService aircraftSeatsService;
    
    @Autowired 
    private SeatsService seatsService;
    
    @Autowired
    private SeatTypesService seatTypesService;
    
    @Autowired
    private ServiceService serviceService;
    
    @RequestMapping(value = {"/bookingdetail"}, method = RequestMethod.GET)
    public String mapSelectSeatPage(Model model,HttpSession session
           ) {
        session.setAttribute("loopForm", 0);
        model.addAttribute("bookingInfo", new BookingEntity());
        return "user/form-bookingdetail";
        
       
    }
    
    @RequestMapping(value = {"/booking-info"}, method = RequestMethod.GET)
    public String enterInforBookingPage(Model model,HttpSession session,
            @SessionAttribute("selectedFlight") FlightsEntity flight,
            @ModelAttribute("bookingInfo") BookingEntity bookingInfo,
            @PathParam("birthDateStr") String birthDateStr) {
        try {
            bookingInfo.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse(birthDateStr));
            bookingInfo.setBookingDate(new Date());
            bookingInfo.setBookingNumber((int) Math.floor(Math.random()*10000));
            bookingInfo.setBookingStatus(BookingStatusEnum.BOOKED);
            session.setAttribute("booking", bookingInfo);
            List<AircraftSeatsEntity> seatTypes = aircraftSeatsService.getSeatTypes(flight.getAircraft().getId());
            session.setAttribute("resultsMap", seatTypesService.getSeatTypes(seatTypes));
            session.setAttribute("loopForm", 1);
            session.setAttribute("bookingDetails", new ArrayList<BookingDetailEntity>());
            session.setAttribute("allService", serviceService.getAllService());
            session.setAttribute("serviceBooking", new HashMap<Integer,ServiceBookingEntity>());
            model.addAttribute("bookingdetail", new BookingDetailEntity());
            return "user/form-bookingdetail";
        } catch (ParseException ex) {
            Logger.getLogger(BookingDetailController.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return "Error";
       
    }
    
    @RequestMapping(value = {"/select-seat"}, method = RequestMethod.GET)
    public String selectSeatPage(Model model, HttpSession session,
            @SessionAttribute("quantity") int quantity,
            @SessionAttribute("loopForm") int loopForm,
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @SessionAttribute("booking") BookingEntity booking,
            @SessionAttribute("selectedFlight") FlightsEntity flight,
            @ModelAttribute("bookingdetail") BookingDetailEntity bookingdetail,
            @SessionAttribute("serviceBooking") HashMap<Integer, ServiceBookingEntity> serviceBookings,
            @PathParam("seatTypeName") String seatTypeName
            ) 
    {
        
        try {
            PassengersEntity passenger = bookingdetail.getPassenger();
            passenger.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse(bookingdetail.getBirthDateStr()));
            bookingdetail.setSeat(seatsService.getSeatsByName(bookingdetail.getSeat().getNumber()).get(0));
            bookingdetail.setFlight(flight);
            bookingdetail.setBooking(booking);
            bookingdetail.setSeatType(bookingDetailService.getNameSeatType(seatTypeName));
            bookingdetail.setDiscount(flight.getDiscountSave());
            bookingdetail.setUnitPrice(flight.getFlightRoute().getSatandarPrice() + aircraftSeatsService.getSeatPrice(flight.getId(), bookingdetail.getSeat().getNumber()).get(0).getPrice());
            Collection<ServiceBookingEntity> values = serviceBookings.values();
            List<ServiceBookingEntity> serviceBooking = new ArrayList<>(values);
            for(ServiceBookingEntity serviceB : serviceBooking) {
                serviceB.setBookingDetail(bookingdetail);
            }
            bookingdetail.setServiceBookings(serviceBooking);
            bookingDetails.add(bookingdetail);
        if(quantity > loopForm) {
            loopForm++;
            session.setAttribute("loopForm", loopForm);
            session.setAttribute("serviceBooking", new HashMap<Integer,ServiceBookingEntity>());
            return "user/form-bookingdetail";
        } else {
               double totalPrice = bookingDetailService.setTotalPriceBooking(bookingDetails);
                booking.setTotalPrice(totalPrice);
             return "redirect:/display-bookingdetail";
        }
       
        } catch (ParseException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            
        }
       
        return "Error";
    }
    
    @RequestMapping(value = {"/display-bookingdetail"}, method = RequestMethod.GET)
    public String displayBookingDetail(Model model, HttpSession session) {
        return "user/display-ticket-info";
    }
    
    @RequestMapping(value = {"/booking-detail-tow-trip"}, method = RequestMethod.GET)
    public String EnterBookingInfo(Model model, HttpSession session) {
        session.setAttribute("loopForm", 0);
        model.addAttribute("bookingInfo", new BookingEntity());
       
        return "user/form-bookingdetail-tow-trip";
    }
    
    @RequestMapping(value = {"/booking-info-tow-trip"}, method = RequestMethod.GET)
    public String enterInforBookingTowTripPage(Model model,HttpSession session,
            @SessionAttribute("selectedFlight") FlightsEntity flight,
            @SessionAttribute("selectedFlightArrival") FlightsEntity flightArrrival,
            @ModelAttribute("bookingInfo") BookingEntity bookingInfo,
            @PathParam("birthDateStr") String birthDateStr) {
        try {
            bookingInfo.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse(birthDateStr));
            bookingInfo.setBookingDate(new Date());
            bookingInfo.setBookingNumber((int) Math.floor(Math.random()*10000));
            bookingInfo.setBookingStatus(BookingStatusEnum.BOOKED);
            session.setAttribute("booking", bookingInfo);
            List<AircraftSeatsEntity> seatTypes = aircraftSeatsService.getSeatTypes(flight.getId());
            List<AircraftSeatsEntity> seatTypesArrival = aircraftSeatsService.getSeatTypes(flightArrrival.getId());
            model.addAttribute("test", flightArrrival.getAircraft().getId());
            session.setAttribute("resultsMap", seatTypesService.getSeatTypes(seatTypes));
            session.setAttribute("resultsMapArrival", seatTypesService.getSeatTypes(seatTypesArrival));
            session.setAttribute("loopForm", 1);
            session.setAttribute("bookingDetails", new ArrayList<BookingDetailEntity>());
            session.setAttribute("bookingArrivalDetails", new ArrayList<BookingDetailEntity>());
            session.setAttribute("allService", serviceService.getAllService());
            session.setAttribute("serviceBooking", new HashMap<Integer,ServiceBookingEntity>());
            session.setAttribute("serviceBookingArrival", new HashMap<Integer,ServiceBookingEntity>());
            model.addAttribute("bookingdetail", new BookingDetailEntity());
            return "user/form-bookingdetail-tow-trip";
            
        } catch (ParseException ex) {
            Logger.getLogger(BookingDetailController.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return "Error";
       
    }
    
    @RequestMapping(value = {"/select-seat-tow-trip"}, method = RequestMethod.GET)
    public String selectSeatTowTripPage(Model model, HttpSession session,
            @SessionAttribute("quantity") int quantity,
            @SessionAttribute("loopForm") int loopForm,
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @SessionAttribute("bookingArrivalDetails") List<BookingDetailEntity> bookingArrivalDetails,
            @PathParam("seatArrival") String seatArrival,
            @PathParam("seatTypeNameArrival") String seatTypeNameArrival,
            @PathParam("seatTypeName") String seatTypeName,
            @SessionAttribute("booking") BookingEntity booking,
            @SessionAttribute("selectedFlight") FlightsEntity flight,
            @SessionAttribute("selectedFlightArrival") FlightsEntity flightArrrival,
            @SessionAttribute("serviceBooking") HashMap<Integer, ServiceBookingEntity> serviceBookings,
            @SessionAttribute("serviceBookingArrival") HashMap<Integer, ServiceBookingEntity> serviceBookingsArrival,
            @ModelAttribute("bookingdetail") BookingDetailEntity bookingdetail
            ) 
    {
        
        try {
            PassengersEntity passenger = bookingdetail.getPassenger();
            passenger.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse(bookingdetail.getBirthDateStr()));
            bookingdetail.setSeat(seatsService.getSeatsByName(bookingdetail.getSeat().getNumber()).get(0));
            bookingdetail.setFlight(flight);
            bookingdetail.setBooking(booking);
            bookingdetail.setDiscount(flight.getDiscountSave());
            bookingdetail.setSeatType(bookingDetailService.getNameSeatType(seatTypeName));
            bookingdetail.setUnitPrice(flight.getFlightRoute().getSatandarPrice() + aircraftSeatsService.getSeatPrice(flight.getId(), bookingdetail.getSeat().getNumber()).get(0).getPrice());
        //    bookingdetail.setUnitPrice(flight.getFlightRoute().getSatandarPrice());
            Collection<ServiceBookingEntity> values = serviceBookings.values();
            List<ServiceBookingEntity> serviceBooking = new ArrayList<>(values);
            for(ServiceBookingEntity serviceB : serviceBooking) {
                serviceB.setBookingDetail(bookingdetail);
            }
            bookingdetail.setServiceBookings(serviceBooking);
            bookingDetails.add(bookingdetail);
            
            
            
            BookingDetailEntity bookingdetailArrival = (BookingDetailEntity) bookingdetail.clone();
            bookingdetailArrival.setSeat(seatsService.getSeatsByName(seatArrival).get(0));
            bookingdetailArrival.setFlight(flightArrrival);
            bookingdetailArrival.setDiscount(flightArrrival.getDiscountSave());
            bookingdetailArrival.setUnitPrice(flightArrrival.getFlightRoute().getSatandarPrice() + aircraftSeatsService.getSeatPrice(flightArrrival.getId(), bookingdetailArrival.getSeat().getNumber()).get(0).getPrice());
        //    bookingdetailArrival.setUnitPrice(flightArrrival.getFlightRoute().getSatandarPrice());
            bookingdetailArrival.setSeatType(bookingDetailService.getNameSeatType(seatTypeNameArrival));
            Collection<ServiceBookingEntity> values2 = serviceBookingsArrival.values();
            List<ServiceBookingEntity> serviceBookingArrival = new ArrayList<>(values2);
            for(ServiceBookingEntity serviceB : serviceBookingArrival) {
                serviceB.setBookingDetail(bookingdetailArrival);
            }
            bookingdetailArrival.setServiceBookings(serviceBookingArrival);
            bookingArrivalDetails.add(bookingdetailArrival);
        if(quantity > loopForm) {
            loopForm++;
            session.setAttribute("loopForm", loopForm);
            session.setAttribute("serviceBooking", new HashMap<Integer,ServiceBookingEntity>());
            session.setAttribute("serviceBookingArrival", new HashMap<Integer,ServiceBookingEntity>());
            return "user/form-bookingdetail-tow-trip";
        } else {
            double totalPrice = bookingDetailService.setTotalPriceBooking(bookingDetails);
            double totalPriceArrival = bookingDetailService.setTotalPriceBooking(bookingArrivalDetails);

             booking.setTotalPrice(totalPrice + totalPriceArrival);
             return "redirect:/display-bookingdetail-tow-trip";
        }
       
        } catch (ParseException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex); 
        } catch (CloneNotSupportedException ex) {
                Logger.getLogger(BookingDetailController.class.getName()).log(Level.SEVERE, null, ex);
            }
       
        return "Error";
    }
    
    @RequestMapping(value = {"/display-bookingdetail-tow-trip"}, method = RequestMethod.GET)
    public String displayBookingDetailTowTrip(Model model, HttpSession session) {
        return "user/display-ticket-tow-trip-info";
    }
    
    
    @RequestMapping(value = {"/edit-booking-info"}, method = RequestMethod.GET)
    public String editBookingInfo(Model model, HttpSession session  
    ) { 
        model.addAttribute("editBooking", new BookingEntity());
        return "user/edit-booking-info";
    }
    
    @RequestMapping(value = {"/edit-booking-tow-trip-info"}, method = RequestMethod.GET)
    public String editBookingTowTripInfo(Model model, HttpSession session  
    ) { 
        model.addAttribute("editBooking", new BookingEntity());
        return "user/edit-booking-tow-trip-info";
    }
    
    
    @RequestMapping(value = {"/submit-edit-booking-info"}, method = RequestMethod.GET)
    public String SubmitEditBookingInfo(Model model, HttpSession session,
            
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @PathParam("birthDateStr") String birthDateStr,
            @ModelAttribute("editBooking") BookingEntity editBooking
    ) { 
        try {
            editBooking.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse(birthDateStr));
            editBooking.setBookingDate(new Date());
            editBooking.setBookingNumber((int) Math.floor(Math.random()*10000));
            editBooking.setBookingStatus(BookingStatusEnum.BOOKED);
            for(BookingDetailEntity bookingDetail : bookingDetails) {
                bookingDetail.setBooking(editBooking);
            }
            
            session.setAttribute("booking", editBooking);
            return "redirect:/display-bookingdetail";
        } catch (ParseException ex) {
            Logger.getLogger(BookingDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Error";
    }
    
    @RequestMapping(value = {"/submit-edit-booking-tow-trip-info"}, method = RequestMethod.GET)
    public String SubmitEditBookingTowTripInfo(Model model, HttpSession session,
           
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @SessionAttribute("bookingArrivalDetails") List<BookingDetailEntity> bookingArrivalDetails,
            @PathParam("birthDateStr") String birthDateStr,
            @ModelAttribute("editBooking") BookingEntity editBooking
    ) { 
        try {
            editBooking.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse(birthDateStr));
            editBooking.setBookingDate(new Date());
            editBooking.setBookingNumber((int) Math.floor(Math.random()*10000));
            editBooking.setBookingStatus(BookingStatusEnum.BOOKED);
            for(BookingDetailEntity bookingDetail : bookingDetails) {
                bookingDetail.setBooking(editBooking);
            }
             for(BookingDetailEntity bookingArrivalDetail : bookingArrivalDetails) {
                bookingArrivalDetail.setBooking(editBooking);
            }
            
            session.setAttribute("booking", editBooking);
            return "redirect:/display-bookingdetail-tow-trip";
        } catch (ParseException ex) {
            Logger.getLogger(BookingDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Error";
    }
    
    
    @RequestMapping(value = {"/edit-bookingdetail-info/{index}"}, method = RequestMethod.GET)
    public String editBookingDetailInfo(Model model, HttpSession session,
            
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @PathVariable("index") int index
    ) { 
        session.setAttribute("index", index);
        List<AircraftSeatsEntity> seatPrices = aircraftSeatsService.getSeatPrice(bookingDetails.get(index).getFlight().getId(), bookingDetails.get(index).getSeat().getNumber());
        if(seatPrices.size() > 0) {
            model.addAttribute("priceSeat", seatPrices.get(0).getPrice());
        }
        
        List<ServiceEntity> getNewService = serviceService.getAllService();
        HashMap<Integer,ServiceEntity> mapNewService = new HashMap<>();
        HashMap<Integer,ServiceBookingEntity> serviceBooking = new HashMap<>();
        for(ServiceEntity newService : getNewService) {
            mapNewService.put(newService.getId(), newService);
        }
        List<ServiceBookingEntity> allServiceBooking = bookingDetails.get(index).getServiceBookings();
        for(ServiceBookingEntity oneServiceBooking : allServiceBooking) {
           serviceBooking.put(oneServiceBooking.getService().getId(), oneServiceBooking);
           mapNewService.remove(oneServiceBooking.getService().getId());
        }
        double totalServiceOfBookingDetail = 0;
        for (Map.Entry<Integer, ServiceBookingEntity> entry : serviceBooking.entrySet()) {
                totalServiceOfBookingDetail += entry.getValue().getPrice();
                System.err.println("++++++++++" +entry.getValue().getService().getName());
                System.err.println("++++++++++" +entry.getValue().getQuantity());
            }
        
        model.addAttribute("totalServiceOfBookingDetail", totalServiceOfBookingDetail);
        session.setAttribute("serviceBooking", serviceBooking);
        model.addAttribute("getNewService", mapNewService);
        model.addAttribute("bookingDetailEdit", bookingDetails.get(index));
         
        return "user/edit-bookingdetail-info";
    }
    
    @RequestMapping(value = {"/edit-bookingdetail-tow-trip-info/{index}"}, method = RequestMethod.GET)
    public String editBookingDetailTowTripInfo(Model model, HttpSession session,
            @SessionAttribute("bookingArrivalDetails") List<BookingDetailEntity> bookingArrivalDetails,
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @PathVariable("index") int index
    ) { 
        session.setAttribute("index", index);
        List<AircraftSeatsEntity> seatPrices = aircraftSeatsService.getSeatPrice(bookingDetails.get(index).getFlight().getId(), bookingDetails.get(index).getSeat().getNumber());
        List<AircraftSeatsEntity> seatPricesArrival = aircraftSeatsService.getSeatPrice(bookingArrivalDetails.get(index).getFlight().getId(), bookingArrivalDetails.get(index).getSeat().getNumber());
        if(seatPrices.size() > 0) {
            model.addAttribute("priceSeat", seatPrices.get(0).getPrice());
        }
        
        if(seatPricesArrival.size() > 0) {
            model.addAttribute("priceSeatArrival", seatPricesArrival.get(0).getPrice());
        }
        List<ServiceEntity> getNewService = serviceService.getAllService();
        HashMap<Integer,ServiceEntity> mapNewService = new HashMap<>();
        HashMap<Integer,ServiceBookingEntity> serviceBooking = new HashMap<>();
        for(ServiceEntity newService : getNewService) {
            mapNewService.put(newService.getId(), newService);
        }
        List<ServiceBookingEntity> allServiceBooking = bookingDetails.get(index).getServiceBookings();
        for(ServiceBookingEntity oneServiceBooking : allServiceBooking) {
           serviceBooking.put(oneServiceBooking.getService().getId(), oneServiceBooking);
           mapNewService.remove(oneServiceBooking.getService().getId());
        }
        double totalServiceOfBookingDetail = 0;
        for (Map.Entry<Integer, ServiceBookingEntity> entry : serviceBooking.entrySet()) {
                totalServiceOfBookingDetail += entry.getValue().getPrice();
                System.err.println("++++++++++" +entry.getValue().getService().getName());
                System.err.println("++++++++++" +entry.getValue().getQuantity());
            }
        
        List<ServiceEntity> getNewServiceArrival = serviceService.getAllService();
        HashMap<Integer,ServiceEntity> mapNewServiceArrival = new HashMap<>();
        HashMap<Integer,ServiceBookingEntity> serviceBookingArrival = new HashMap<>();
        for(ServiceEntity newService : getNewServiceArrival) {
            mapNewServiceArrival.put(newService.getId(), newService);
        }
        List<ServiceBookingEntity> allServiceBookingArrival = bookingArrivalDetails.get(index).getServiceBookings();
        for(ServiceBookingEntity oneServiceBooking : allServiceBookingArrival) {
           serviceBookingArrival.put(oneServiceBooking.getService().getId(), oneServiceBooking);
           mapNewServiceArrival.remove(oneServiceBooking.getService().getId());
        }
        double totalServiceOfBookingDetailArrival = 0;
        for (Map.Entry<Integer, ServiceBookingEntity> entry : serviceBookingArrival.entrySet()) {
                totalServiceOfBookingDetailArrival += entry.getValue().getPrice();
                System.err.println("++++++++++" +entry.getValue().getService().getName());
                System.err.println("++++++++++" +entry.getValue().getQuantity());
            }
        
        
        model.addAttribute("getNewService", mapNewService);
        model.addAttribute("getNewServiceArrival", mapNewServiceArrival);
        model.addAttribute("totalServiceOfBookingDetail", totalServiceOfBookingDetail);
        model.addAttribute("totalServiceOfBookingDetailArrival", totalServiceOfBookingDetailArrival);
        model.addAttribute("bookingDetailEdit", bookingDetails.get(index));
        model.addAttribute("bookingArrivalDetailEdit", bookingArrivalDetails.get(index));
        session.setAttribute("serviceBooking", serviceBooking);
        session.setAttribute("serviceBookingArrival", serviceBookingArrival);
        return "user/edit-bookingdetail-tow-trip-info";
    }
    
    @RequestMapping(value = {"/submit-edit-bookingdetail-info"}, method = RequestMethod.GET)
    public String SubmitEditBookingDetailInfo(Model model, HttpSession session,
            @SessionAttribute("booking") BookingEntity booking,
            @PathParam("birthDateStr") String birthDateStr,
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @SessionAttribute("index") int index,
            @SessionAttribute("selectedFlight") FlightsEntity flight,
            @PathParam("seatTypeName") String seatTypeName,
            @SessionAttribute("serviceBooking") HashMap<Integer, ServiceBookingEntity> serviceBookings,
            @ModelAttribute("bookingDetailEdit") BookingDetailEntity bookingDetailEdit
    ) { 
        try {
            PassengersEntity passenger = bookingDetailEdit.getPassenger();
            passenger.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse(bookingDetailEdit.getBirthDateStr()));
            bookingDetailEdit.setBooking(booking);
            bookingDetailEdit.setPassenger(passenger);
            bookingDetailEdit.setFlight(flight);
            bookingDetailEdit.setDiscount(flight.getDiscountSave());
            bookingDetailEdit.setUnitPrice(flight.getFlightRoute().getSatandarPrice() + aircraftSeatsService.getSeatPrice(flight.getId(), bookingDetailEdit.getSeat().getNumber()).get(0).getPrice());
        //    bookingDetailEdit.setUnitPrice(flight.getFlightRoute().getSatandarPrice());
            Collection<ServiceBookingEntity> values = serviceBookings.values();
            List<ServiceBookingEntity> serviceBooking = new ArrayList<>(values);
            for(ServiceBookingEntity serviceB : serviceBooking) {
                serviceB.setBookingDetail(bookingDetailEdit);
            }
            bookingDetailEdit.setServiceBookings(serviceBooking);
            bookingDetailEdit.setSeat(seatsService.getSeatsByName(bookingDetailEdit.getSeat().getNumber()).get(0));
            bookingDetailEdit.setSeatType(bookingDetailService.getNameSeatType(seatTypeName));
            bookingDetails.set(index, bookingDetailEdit);
            double totalPrice = bookingDetailService.setTotalPriceBooking(bookingDetails);
            booking.setTotalPrice(totalPrice);
            return "redirect:/display-bookingdetail";
        } catch (ParseException ex) {
            Logger.getLogger(BookingDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Error";
    }
    
    
    @RequestMapping(value = {"/submit-edit-bookingdetail-tow-trip-info"}, method = RequestMethod.GET)
    public String SubmitEditBookingDetailTowTripInfo(Model model, HttpSession session,
            @SessionAttribute("booking") BookingEntity booking,
            @PathParam("birthDateStr") String birthDateStr,
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @SessionAttribute("index") int index,
            @SessionAttribute("selectedFlight") FlightsEntity flight,
            @PathParam("seatTypeName") String seatTypeName,
            @PathParam("seatArrival") String seatArrival,
            @PathParam("seatTypeNameArrival") String seatTypeNameArrival,
            @SessionAttribute("bookingArrivalDetails") List<BookingDetailEntity> bookingArrivalDetails,
            @SessionAttribute("selectedFlightArrival") FlightsEntity flightArrrival,
            @SessionAttribute("serviceBooking") HashMap<Integer, ServiceBookingEntity> serviceBookings,
            @SessionAttribute("serviceBookingArrival") HashMap<Integer, ServiceBookingEntity> serviceBookingArrival,
            @ModelAttribute("bookingDetailEdit") BookingDetailEntity bookingDetailEdit
    ) { 
        try {
           PassengersEntity passenger = bookingDetailEdit.getPassenger();
            passenger.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse(bookingDetailEdit.getBirthDateStr()));
            bookingDetailEdit.setSeat(seatsService.getSeatsByName(bookingDetailEdit.getSeat().getNumber()).get(0));
            bookingDetailEdit.setFlight(flight);
            bookingDetailEdit.setBooking(booking);
            bookingDetailEdit.setDiscount(flight.getDiscountSave());
            bookingDetailEdit.setSeatType(bookingDetailService.getNameSeatType(seatTypeName));
            bookingDetailEdit.setUnitPrice(flight.getFlightRoute().getSatandarPrice() + aircraftSeatsService.getSeatPrice(flight.getId(), bookingDetailEdit.getSeat().getNumber()).get(0).getPrice());
        //    bookingDetailEdit.setUnitPrice(flight.getFlightRoute().getSatandarPrice());
            Collection<ServiceBookingEntity> values = serviceBookings.values();
            List<ServiceBookingEntity> serviceBooking = new ArrayList<>(values);
            for(ServiceBookingEntity serviceB : serviceBooking) {
                serviceB.setBookingDetail(bookingDetailEdit);
            }
            bookingDetailEdit.setServiceBookings(serviceBooking);
            bookingDetails.set(index, bookingDetailEdit);
            BookingDetailEntity bookingdetailArrival;
            bookingdetailArrival = (BookingDetailEntity) bookingDetailEdit.clone();
            bookingdetailArrival.setSeat(seatsService.getSeatsByName(seatArrival).get(0));
            bookingdetailArrival.setFlight(flightArrrival);
            bookingdetailArrival.setUnitPrice(flightArrrival.getFlightRoute().getSatandarPrice() + aircraftSeatsService.getSeatPrice(flightArrrival.getId(), bookingdetailArrival.getSeat().getNumber()).get(0).getPrice());
        //    bookingdetailArrival.setUnitPrice(flightArrrival.getFlightRoute().getSatandarPrice());
            bookingdetailArrival.setSeatType(bookingDetailService.getNameSeatType(seatTypeNameArrival));
            bookingdetailArrival.setDiscount(flightArrrival.getDiscountSave());
            Collection<ServiceBookingEntity> valuesArrival = serviceBookingArrival.values();
            List<ServiceBookingEntity> serviceBookingsArrival = new ArrayList<>(valuesArrival);
            for(ServiceBookingEntity serviceB : serviceBookingsArrival) {
                serviceB.setBookingDetail(bookingdetailArrival);
            }
            bookingdetailArrival.setServiceBookings(serviceBookingsArrival);
            bookingArrivalDetails.set(index, bookingdetailArrival);
            double totalPrice = bookingDetailService.setTotalPriceBooking(bookingDetails);
            double totalPriceArrival = bookingDetailService.setTotalPriceBooking(bookingArrivalDetails);
            booking.setTotalPrice(totalPrice + totalPriceArrival);
            return "redirect:/display-bookingdetail-tow-trip";
        } catch (ParseException | CloneNotSupportedException ex) {
            Logger.getLogger(BookingDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Error";
    }
    
}
