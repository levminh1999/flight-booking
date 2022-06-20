/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller.user;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.AirportsEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatsService;
import com.mycompany.spring_mvc_project_final.service.AirportService;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.CreditCardService;
import com.mycompany.spring_mvc_project_final.service.PaymentService;
import com.mycompany.spring_mvc_project_final.service.UserDetailsServiceImpl;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;
    
    @Autowired
    private AirportService airportService;
    
    @Autowired
    private BookingService bookingService;
    
    @Autowired
    private BookingDetailService bookingDetailService;
    
    @Autowired
    private PaymentService paymentService;
    
    @Autowired
    private CreditCardService creditCardService;
    
    @Autowired
    private AircraftSeatsService aircraftSeatsService;
    
    @Autowired
    private MailSender mailSender;

    @RequestMapping("/home")
    public String viewUserHome(Model model, HttpSession session,
            @SessionAttribute("userInfo") UserEntity user) {
        String message = (String) session.getAttribute("message");
        if(message != null) {
            model.addAttribute("messageCancel", message);
            session.removeAttribute("message");
        }
        List<AirportsEntity> airports = airportService.getAirports();
        List<BookingEntity> userBooking = bookingService.getBookingByUser(SecurityUtils.viewHome());
       
             model.addAttribute("userBooking", bookingService.setTotalPriceBookings(userBooking));
        
       
        session.setAttribute("userInfo", userDetailsServiceImpl.getUserInfo(SecurityUtils.viewHome()));
        model.addAttribute("airports", airports);
        model.addAttribute("flight", new FlightsEntity());
        return "user/home-user";
    }

    @RequestMapping(value = {"/change-password",}, method = RequestMethod.GET)
    public String viewChangePassPage(Model model, HttpSession session) {
        return "user/change-password";
    }

    @RequestMapping(value = {"/change-user-info",}, method = RequestMethod.GET)
    public String viewChangeInfoPage(Model model, HttpSession session) {
        model.addAttribute("newUserInfo", new UserEntity());
        return "user/change-user-info";
    }

    @RequestMapping(value = {"/submit-change-user-info",}, method = RequestMethod.GET)
    public String submitChangeInfoPage(Model model, HttpSession session,
            @PathParam("birthDateStr") String birthDateStr,
            @ModelAttribute("newUserInfo") UserEntity newUserInfo) {

        try {
            UserEntity user = userDetailsServiceImpl.getUserInfo(SecurityUtils.viewHome());
            user.setFullName(newUserInfo.getFullName());
            user.setAddress(newUserInfo.getAddress());
            user.setGender(newUserInfo.getGender());
            user.setPhoneNumber(newUserInfo.getPhoneNumber());
            user.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse(birthDateStr));
            userDetailsServiceImpl.saveUser(user);
            return "redirect:/user/home";
        } catch (ParseException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
            return "Error";
        }
       
    }
    
    
    
    @RequestMapping(value = {"/booking-detail/{bookingId}/{direction}",}, method = RequestMethod.GET)
    public String viewBookingDetailPage(Model model, HttpSession session,
            @PathVariable("bookingId") int bookingId,
            @PathVariable("direction") String direction) {
        List<BookingDetailEntity> bookingDetailsUser = bookingDetailService.getBookingDetails(bookingId);
        
        model.addAttribute("direction", direction);
        model.addAttribute("bookingDetailsUser", bookingDetailService.setPriceAndSeatTypeBookingDetail(bookingDetailsUser));
        return "user/bookingdetail";
    }
    
    @RequestMapping(value = {"/change-booking-user/{bookingId}",}, method = RequestMethod.GET)
//    @RequestMapping(value = {"/change-booking-user",}, method = RequestMethod.GET)
    public String changeStatusBooking(Model model, HttpSession session,
            @PathVariable("bookingId") int bookingId
        //      @PathParam("bookingId:") int bookingId
              
    ) {
        BookingEntity bookingChange = bookingService.getBookingById(bookingId);
        List<PaymentEntity> getPaymentByBookingId = paymentService.getPaymentUser(bookingId);
        CreditCardEntity creditCard = getPaymentByBookingId.get(0).getCreditCart();
        List<BookingDetailEntity> bookingDetailsByBooking = bookingDetailService.getBookingDetails(bookingId);
        double totalUnitPrice = 0;
    //    double totalePriceSeat = 0;
        double totalPriceService = 0;
        double totalPriceDiscount = 0;
        for(BookingDetailEntity bookingDetailByBooking : bookingDetailsByBooking) {
           
            totalUnitPrice += bookingDetailByBooking.getUnitPrice();
            
            if(bookingDetailByBooking.getDiscount() == 0) {
                totalPriceDiscount += bookingDetailByBooking.getUnitPrice();
            } else {
                totalPriceDiscount += bookingDetailByBooking.getUnitPrice() - bookingDetailByBooking.getUnitPrice() * bookingDetailByBooking.getDiscount()/100;
            }
        //    List<AircraftSeatsEntity> getPriceSeats = aircraftSeatsService.getSeatPrice(bookingDetailByBooking.getFlight().getId(), bookingDetailByBooking.getSeat().getNumber());
            List<ServiceBookingEntity> serviceByBookingsId = bookingDetailByBooking.getServiceBookings();
            double PriceServiceBybookingDetail = 0;
                            if(serviceByBookingsId.size() > 0) {
                                for(ServiceBookingEntity serviceByBookingId : serviceByBookingsId) {
                                    PriceServiceBybookingDetail += serviceByBookingId.getPrice() * serviceByBookingId.getQuantity();
                                }
                            } else {
                                PriceServiceBybookingDetail = 0;
                            }
        //    totalePriceSeat += getPriceSeats.get(0).getPrice();
            totalPriceService+= PriceServiceBybookingDetail;
            
        }
        double minus = totalUnitPrice * 1/10;
        double refunds = totalPriceDiscount - minus + totalPriceService;
        
        PaymentEntity newPaymentByBookingId = new PaymentEntity();
        newPaymentByBookingId.setAmount(minus);
        newPaymentByBookingId.setBooking(bookingChange);
        newPaymentByBookingId.setCreditCart(creditCard);
        newPaymentByBookingId.setPaymentDate(new Date());
        newPaymentByBookingId.setDescription("Trừ phí 10 % hủy vé");
        getPaymentByBookingId.add(newPaymentByBookingId);
        creditCard.setBalance(creditCard.getBalance() + refunds);
        bookingChange.setBookingStatus(BookingStatusEnum.CANCEL);
        bookingChange.setPayments(getPaymentByBookingId);
        DecimalFormat formatter = new DecimalFormat("###,###,###.##");
        SimpleDateFormat formatterDate = new SimpleDateFormat("dd/MM/yyyy");
        StringBuilder message = new StringBuilder();
                            message.append("Người hủy vé : ");
                            message.append(bookingChange.getFullName());
                            message.append("\nNgày hủy vé : ");
                            message.append(formatterDate.format(new Date()));
                            message.append("\nBạn đã hủy chuyến bay số : ");
                            message.append(bookingChange.getBookingNumber());
                            message.append("\n Số tiền hoàn trả : ");
                            message.append(formatter.format(refunds));
                            message.append(" VND");
                            message.append("\nĐã được hoàn trả qua số thẻ : ");
                            message.append(creditCard.getCardNumber());
                            message.append("\n Số tiền thu phí hủy vé : ");
                            message.append(formatter.format(minus));
                            message.append(" VND");
        sendEmail(bookingChange.getEmail(), "HỦY VÉ THÀNH CÔNG", message.toString());
        creditCardService.saveCreditCard(creditCard);
        bookingService.saveBooking(bookingChange);
        List<BookingEntity> userBooking = bookingService.getBookingByUser(SecurityUtils.viewHome());
        model.addAttribute("userBooking", bookingService.setTotalPriceBookings(userBooking));
        session.setAttribute("message", "message");
        return "user/ajax/load-search-booking-user";
    }
public void sendEmail(String to, String subject, String text) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setSubject(subject);
        mailMessage.setTo(to);
        mailMessage.setText(text);
        mailSender.send(mailMessage);
    }
}
