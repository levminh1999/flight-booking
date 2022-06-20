/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller.user;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightRoutesEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatsService;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.CreditCardService;
import com.mycompany.spring_mvc_project_final.service.FlightRouteService;
import com.mycompany.spring_mvc_project_final.service.PassengerService;
import com.mycompany.spring_mvc_project_final.service.PaymentService;
import com.mycompany.spring_mvc_project_final.service.SeatTypesService;
import com.mycompany.spring_mvc_project_final.service.ServiceBookingService;
import com.mycompany.spring_mvc_project_final.service.ServiceService;
import com.mycompany.spring_mvc_project_final.service.UserDetailsServiceImpl;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.ws.rs.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class AjaxController {

    @Autowired
    private FlightRouteService flightRouteService;

    @Autowired
    SeatTypesService seatTypesService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private AircraftSeatsService aircraftSeatsService;

    @Autowired
    private CreditCardService creditCardService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private PassengerService passengerService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private UserDetailsServiceImpl userDetailsServiceImpl;

    @Autowired
    private ServiceService serviceService;
    
    @Autowired
    private ServiceBookingService serviceBookingService;

    @RequestMapping(value = {"/api-load"}, method = RequestMethod.GET)
    public String loadValue(Model model,
            @PathParam("depart") int depart) {
        List<FlightRoutesEntity> flightRoutes = flightRouteService.getFlightRoutes(depart);
        model.addAttribute("listOptions", flightRoutes);
        return "user/ajax/load-element";
    }

    @RequestMapping(value = {"/api-load-bookingdetail"}, method = RequestMethod.GET)
    public String loadValueDetail(Model model, HttpSession session,
            @PathParam("quantity") int quantity) {

        session.setAttribute("quantity", quantity);

        return "user/ajax/load-detail";
    }

    @RequestMapping(value = {"/api-load-price-service"}, method = RequestMethod.GET)
    public String loadPriceService(Model model, HttpSession session,
            @PathParam("quantity") int quantity,
            @PathParam("serviceId") int serviceId,
            @SessionAttribute("serviceBooking") HashMap<Integer, ServiceBookingEntity> serviceBookings
    ) {
        ServiceEntity service = serviceService.getServiceById(serviceId);
        if (quantity > 0) {
            boolean check = true;

            if (serviceBookings.size() > 0) {
                for (Map.Entry<Integer, ServiceBookingEntity> entry : serviceBookings.entrySet()) {

                    if (entry.getKey() == serviceId) {
                        ServiceBookingEntity serviceBooking = serviceBookings.get(entry.getKey());
                        serviceBooking.setQuantity(quantity);
                        serviceBooking.setPrice(service.getPrice());
                        serviceBookings.put(entry.getKey(), serviceBooking);
                        check = true;
                        break;
                    } else {
                 
                        check = false;
                    }
                }
                if (check == false) {
                 
                    ServiceBookingEntity serviceBookingLoop = new ServiceBookingEntity();
                    serviceBookingLoop.setService(service);
                    serviceBookingLoop.setQuantity(quantity);
                    serviceBookingLoop.setPrice(service.getPrice());
                    serviceBookings.put(serviceId, serviceBookingLoop);
                }
            } else {
             
                ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
                serviceBooking.setService(service);
                serviceBooking.setQuantity(quantity);
                serviceBooking.setPrice(service.getPrice());
                serviceBookings.put(serviceId, serviceBooking);
            }
           
        } else {
            serviceBookings.remove(serviceId);
            
            
        }
        double totalServiceOfBookingDetail = 0;
        for (Map.Entry<Integer, ServiceBookingEntity> entry : serviceBookings.entrySet()) {
                totalServiceOfBookingDetail += entry.getValue().getPrice() * entry.getValue().getQuantity();
                System.err.println("++++++++++" +entry.getValue().getService().getName());
                System.err.println("++++++++++" +entry.getValue().getQuantity());
            }
        model.addAttribute("totalServiceOfBookingDetail", totalServiceOfBookingDetail);
        return "user/ajax/load-price-service";
    }
    
    @RequestMapping(value = {"/api-load-price-service-arrival"}, method = RequestMethod.GET)
    public String loadPriceServiceArrival(Model model, HttpSession session,
            @PathParam("quantity") int quantity,
            @PathParam("serviceId") int serviceId,
            @SessionAttribute("serviceBookingArrival") HashMap<Integer, ServiceBookingEntity> serviceBookings
    ) {
        ServiceEntity service = serviceService.getServiceById(serviceId);
        if (quantity > 0) {
            boolean check = true;

            if (serviceBookings.size() > 0) {
                for (Map.Entry<Integer, ServiceBookingEntity> entry : serviceBookings.entrySet()) {

                    if (entry.getKey() == serviceId) {
                        ServiceBookingEntity serviceBooking = serviceBookings.get(entry.getKey());
                        serviceBooking.setQuantity(quantity);
                        serviceBooking.setPrice(service.getPrice());
                        serviceBookings.put(entry.getKey(), serviceBooking);
                        check = true;
                        break;
                    } else {
                 
                        check = false;
                    }
                }
                if (check == false) {
                 
                    ServiceBookingEntity serviceBookingLoop = new ServiceBookingEntity();
                    serviceBookingLoop.setService(service);
                    serviceBookingLoop.setQuantity(quantity);
                    serviceBookingLoop.setPrice(service.getPrice());
                    serviceBookings.put(serviceId, serviceBookingLoop);
                }
            } else {
             
                ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
                serviceBooking.setService(service);
                serviceBooking.setQuantity(quantity);
                serviceBooking.setPrice(service.getPrice());
                serviceBookings.put(serviceId, serviceBooking);
            }
           
        } else {
            serviceBookings.remove(serviceId);
            
            
        }
        double totalServiceOfBookingDetail = 0;
        for (Map.Entry<Integer, ServiceBookingEntity> entry : serviceBookings.entrySet()) {
                totalServiceOfBookingDetail += entry.getValue().getPrice() * entry.getValue().getQuantity();
                System.err.println("++++++++++" +entry.getValue().getService().getName());
                System.err.println("++++++++++" +entry.getValue().getQuantity());
            }
        model.addAttribute("totalServiceOfBookingDetail", totalServiceOfBookingDetail);
        return "user/ajax/load-price-service";
    }
    
    

    @RequestMapping(value = {"/api-load-seat"}, method = RequestMethod.GET)
    public String loadSeat(Model model, HttpSession session,
            @SessionAttribute("selectedFlight") FlightsEntity flight,
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @PathParam("seatType") String seatType) {

        List<BookingDetailEntity> seatsBookedDetail = bookingDetailService.getBookingDetails(flight.getId(), BookingStatusEnum.BOOKED);
        List<AircraftSeatsEntity> seatByTypes = aircraftSeatsService.getSeatByTypes(flight.getId(), SeatTypeEnum.valueOf(seatType));

        List<String> seatsBooked = new ArrayList<>();
        for (BookingDetailEntity bookingDetail : seatsBookedDetail) {
            seatsBooked.add(bookingDetail.getSeat().getNumber());
        }
        List<String> fullSeatByTypes = new ArrayList<>();
        for (AircraftSeatsEntity seatByType : seatByTypes) {
            fullSeatByTypes.add(seatByType.getSeats().getNumber());
        }

        if (bookingDetails.size() > 0) {
            List<String> seatNewBookingDetail = new ArrayList<>();
            for (BookingDetailEntity bookingDetailEntity : bookingDetails) {
                seatNewBookingDetail.add(bookingDetailEntity.getSeat().getNumber());
            }
            fullSeatByTypes.removeAll(seatNewBookingDetail);
        }

        fullSeatByTypes.removeAll(seatsBooked);
        model.addAttribute("seats", fullSeatByTypes);
        model.addAttribute("seatsBooked", seatsBooked);

        return "user/ajax/load-seats";
    }

    @RequestMapping(value = {"/api-load-seat-edit"}, method = RequestMethod.GET)
    public String loadSeatEdit(Model model, HttpSession session,
            @SessionAttribute("selectedFlight") FlightsEntity flight,
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @SessionAttribute("index") int index,
            @PathParam("seatType") String seatType) {

        List<BookingDetailEntity> seatsBookedDetail = bookingDetailService.getBookingDetails(flight.getId(), BookingStatusEnum.BOOKED);
        List<AircraftSeatsEntity> seatByTypes = aircraftSeatsService.getSeatByTypes(flight.getId(), SeatTypeEnum.valueOf(seatType));

        List<String> seatsBooked = new ArrayList<>();
        for (BookingDetailEntity bookingDetail : seatsBookedDetail) {
            seatsBooked.add(bookingDetail.getSeat().getNumber());
        }
        List<String> fullSeatByTypes = new ArrayList<>();
        for (AircraftSeatsEntity seatByType : seatByTypes) {
            fullSeatByTypes.add(seatByType.getSeats().getNumber());
        }

        if (bookingDetails.size() > 0) {
            List<String> seatNewBookingDetail = new ArrayList<>();
            for (int i = 0; i < bookingDetails.size(); i++) {
                if (i == index) {
                    continue;
                }
                seatNewBookingDetail.add(bookingDetails.get(i).getSeat().getNumber());
            }

            fullSeatByTypes.removeAll(seatNewBookingDetail);
        }

        fullSeatByTypes.removeAll(seatsBooked);
        model.addAttribute("seats", fullSeatByTypes);
        model.addAttribute("seatsBooked", seatsBooked);

        return "user/ajax/load-seats";
    }

    @RequestMapping(value = {"/api-load-seat-arrival"}, method = RequestMethod.GET)
    public String loadSeatArrival(Model model, HttpSession session,
            @SessionAttribute("selectedFlightArrival") FlightsEntity flightArrival,
            @SessionAttribute("bookingArrivalDetails") List<BookingDetailEntity> bookingDetails,
            @PathParam("seatTypeArrival") String seatTypeArrival) {

        List<BookingDetailEntity> seatsBookedDetail = bookingDetailService.getBookingDetails(flightArrival.getId(), BookingStatusEnum.BOOKED);
        List<AircraftSeatsEntity> seatByTypes = aircraftSeatsService.getSeatByTypes(flightArrival.getId(), SeatTypeEnum.valueOf(seatTypeArrival));
        List<String> seatsBooked = new ArrayList<>();
        for (BookingDetailEntity bookingDetail : seatsBookedDetail) {
            seatsBooked.add(bookingDetail.getSeat().getNumber());
        }
        List<String> fullSeatByTypes = new ArrayList<>();
        for (AircraftSeatsEntity seatByType : seatByTypes) {
            fullSeatByTypes.add(seatByType.getSeats().getNumber());
        }

        if (bookingDetails.size() > 0) {
            List<String> seatNewBookingDetail = new ArrayList<>();
            for (BookingDetailEntity bookingDetailEntity : bookingDetails) {
                seatNewBookingDetail.add(bookingDetailEntity.getSeat().getNumber());
            }
            fullSeatByTypes.removeAll(seatNewBookingDetail);
        }

        fullSeatByTypes.removeAll(seatsBooked);
        model.addAttribute("seats", fullSeatByTypes);
        return "user/ajax/load-seats";
    }

    @RequestMapping(value = {"/api-load-seat-arrival-edit"}, method = RequestMethod.GET)
    public String loadSeatArrivalEdit(Model model, HttpSession session,
            @SessionAttribute("selectedFlightArrival") FlightsEntity flightArrival,
            @SessionAttribute("index") int index,
            @SessionAttribute("bookingArrivalDetails") List<BookingDetailEntity> bookingDetails,
            @PathParam("seatTypeArrival") String seatTypeArrival) {

        List<BookingDetailEntity> seatsBookedDetail = bookingDetailService.getBookingDetails(flightArrival.getId(), BookingStatusEnum.BOOKED);
        List<AircraftSeatsEntity> seatByTypes = aircraftSeatsService.getSeatByTypes(flightArrival.getId(), SeatTypeEnum.valueOf(seatTypeArrival));
        List<String> seatsBooked = new ArrayList<>();
        for (BookingDetailEntity bookingDetail : seatsBookedDetail) {
            seatsBooked.add(bookingDetail.getSeat().getNumber());
        }
        List<String> fullSeatByTypes = new ArrayList<>();
        for (AircraftSeatsEntity seatByType : seatByTypes) {
            fullSeatByTypes.add(seatByType.getSeats().getNumber());
        }

        if (bookingDetails.size() > 0) {
            List<String> seatNewBookingDetail = new ArrayList<>();
            for (int i = 0; i < bookingDetails.size(); i++) {
                if (i == index) {
                    continue;
                }
                seatNewBookingDetail.add(bookingDetails.get(i).getSeat().getNumber());
            }
            fullSeatByTypes.removeAll(seatNewBookingDetail);
        }

        fullSeatByTypes.removeAll(seatsBooked);
        model.addAttribute("seats", fullSeatByTypes);
        return "user/ajax/load-seats";
    }

    @RequestMapping(value = {"/api-load-seat-price"}, method = RequestMethod.GET)
    public String loadSeatPrice(Model model, HttpSession session,
            @SessionAttribute("selectedFlight") FlightsEntity flight,
            @PathParam("seatNumber") String seatNumber) {

        List<AircraftSeatsEntity> seatByTypes = aircraftSeatsService.getSeatPrice(flight.getId(), seatNumber);

        model.addAttribute("seatByTypes", seatByTypes);
        return "user/ajax/load-seat-price";
    }

    @RequestMapping(value = {"/api-load-seat-arrival-price"}, method = RequestMethod.GET)
    public String loadSeatPriceArrival(Model model, HttpSession session,
            @SessionAttribute("selectedFlightArrival") FlightsEntity selectedFlightArrival,
            @PathParam("seatArrivalNumber") String seatArrivalNumber) {
        List<AircraftSeatsEntity> seatByTypes = aircraftSeatsService.getSeatPrice(selectedFlightArrival.getId(), seatArrivalNumber);
        model.addAttribute("seatByTypes", seatByTypes);
        return "user/ajax/load-seat-price";
    }

    @RequestMapping(value = {"/api-load-payment-message"}, method = RequestMethod.GET)
    @ResponseBody
    public String loadPaymentMessage(Model model, HttpSession session,
            @PathParam("creditCardName") String creditCardName,
            @PathParam("creditCardNumber") String creditCardNumber,
            @PathParam("creditCardMonth") int creditCardMonth,
            @PathParam("creditCardYear") int creditCardYear,
            @PathParam("creditCardCVV") String creditCardCVV,
            @SessionAttribute("booking") BookingEntity booking,
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails
    ) {
        List<CreditCardEntity> getCreditCards = creditCardService.getCreditCards(creditCardName, creditCardNumber);
        if (getCreditCards.size() > 0) {

            CreditCardEntity creditCard = getCreditCards.get(0);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(creditCard.getExpDate());
            System.out.println(calendar.get(Calendar.YEAR));
            System.out.println(calendar.get(Calendar.MONTH));
            System.out.println(creditCardMonth);
            System.out.println(creditCardYear);
            if (calendar.get(Calendar.MONTH) + 1 == creditCardMonth
                    && calendar.get(Calendar.YEAR) == creditCardYear) {

                if (creditCard.getCvvCode().equals(creditCardCVV)) {
                    System.out.println(creditCard.getExpDate().before(new Date()));
                    if (creditCard.getExpDate().before(new Date())) {
                        return "error4";
                    } else {

                        double totalPrice = 0;
                        for (BookingDetailEntity bookingDetail : bookingDetails) {
                            List<ServiceBookingEntity> serviceByBookingsId = bookingDetail.getServiceBookings();
                            double totalPriceService = 0;
                            if(serviceByBookingsId.size() > 0) {
                                for(ServiceBookingEntity serviceByBookingId : serviceByBookingsId) {
                                    totalPriceService += serviceByBookingId.getPrice() * serviceByBookingId.getQuantity();
                                }
                            } else {
                                totalPriceService = 0;
                            }
                          
                            if (bookingDetail.getDiscount() > 0) {
                                    totalPrice += bookingDetail.getUnitPrice() - bookingDetail.getUnitPrice() * bookingDetail.getDiscount() / 100 + totalPriceService;
                            } else {
                                    totalPrice += bookingDetail.getUnitPrice() - bookingDetail.getUnitPrice() * bookingDetail.getDiscount() / 100 + totalPriceService;
                            }

                        }
                        System.out.println(totalPrice);
                        if (totalPrice < creditCard.getBalance()) {
                            bookingService.saveBooking(booking);
                            for (BookingDetailEntity bookingDetail : bookingDetails) {
                                passengerService.savePassenger(bookingDetail.getPassenger());
                            }
                            PaymentEntity payment = new PaymentEntity();
                            payment.setAmount(totalPrice);
                            payment.setPaymentDate(new Date());
                            payment.setCreditCart(creditCard);
                            payment.setBooking(booking);

                            StringBuilder message = new StringBuilder();
                            message.append("Người đặt vé : ");
                            message.append(booking.getFullName());
                            message.append("\nNgày đặt vé : ");
                            message.append(new SimpleDateFormat("dd-MM-yyy").format(booking.getBookingDate()));
                            message.append("\nChuyến bay : ");
                            if (bookingDetails.get(0).getFlight().getId() != bookingDetails.get(bookingDetails.size() - 1).getFlight().getId()) {
                                message.append("Hai chiều");
                            } else {
                                message.append("Một chiều");
                            }
                            message.append("\nNơi khởi hành : ");
                            message.append(bookingDetails.get(0).getFlight().getFlightRoute().getDeparture().getName());
                            message.append("\nNơi đến : ");
                            message.append(bookingDetails.get(0).getFlight().getFlightRoute().getDestination().getName());
                            message.append("\nNgày khởi hành : ");
                            message.append(bookingDetails.get(0).getFlight().getDepart());
                            message.append("\nNgày đến : ");
                            message.append(bookingDetails.get(0).getFlight().getArrival());
                            message.append("\nSố hành khách : ");
                            if (bookingDetails.get(0).getFlight().getId() != bookingDetails.get(bookingDetails.size() - 1).getFlight().getId()) {
                                message.append((int)(bookingDetails.size() / 2));
                            } else {
                                message.append(bookingDetails.size());
                            }
                            DecimalFormat formatter = new DecimalFormat("###,###,###.##");
                            message.append("\nTổng tiền  : ");
                            message.append(formatter.format(totalPrice));
                            message.append(" VND");
                            sendEmail(booking.getEmail(), "ĐẶT VÉ THÀNH CÔNG", message.toString());
                            paymentService.savePayment(payment);
                            bookingDetailService.saveBookingDetail(bookingDetails);
                            creditCard.setBalance(creditCard.getBalance() - totalPrice);
                            creditCardService.saveCreditCard(creditCard);
                            return "success";
                        } else {
                            return "error5";
                        }

                    }

                } else {
                    return "error3";
                }
            } else {
                return "error2";
            }
        } else {
            return "error1";
        }

    }

    @RequestMapping(value = {"/user/api/change-password"}, method = RequestMethod.GET)
    @ResponseBody
    public String checkChangePasswordMessage(Model model, HttpSession session,
            @PathParam("oldPassword") String oldPassword,
            @PathParam("newPassword") String newPassword) {
        UserEntity user = userDetailsServiceImpl.getUserInfo(SecurityUtils.viewHome());
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if (encoder.matches(oldPassword, user.getPassword())) {
            user.setPassword(encoder.encode(newPassword));
            userDetailsServiceImpl.saveUser(user);
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping(value = {"/user/api/search-booking-user"}, method = RequestMethod.GET)
    public String searchBoookingUser(Model model, HttpSession session,
            @PathParam("startDate") String startDate,
            @PathParam("endDate") String endDate) {
        try {

            List<BookingEntity> listBookingUserSearch = bookingService.searchBookingUser(SecurityUtils.viewHome(), new SimpleDateFormat("yyyy-MM-dd").parse(startDate), new SimpleDateFormat("yyyy-MM-dd").parse(endDate));

            model.addAttribute("userBooking", bookingService.setTotalPriceBookings(listBookingUserSearch));

        } catch (ParseException ex) {
            Logger.getLogger(AjaxController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "user/ajax/load-search-booking-user";
    }
    
    @RequestMapping(value = {"/user/api/change-booking-user",}, method = RequestMethod.GET)
    public String changeStatusBooking(Model model, HttpSession session,
              @PathParam("bookingId") int bookingId
              
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
