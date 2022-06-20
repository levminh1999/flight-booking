
package com.mycompany.spring_mvc_project_final.controller.user;

import com.mycompany.spring_mvc_project_final.entities.AirportsEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class PaymentController {
    @RequestMapping(value = {"/payment"}, method = RequestMethod.GET)
    public String paymentPage(Model model) {
        return "user/payment";
    }
    
    @RequestMapping(value = {"/payment-tow-trip"}, method = RequestMethod.GET)
    public String paymentTowTripPage(Model model,
            @SessionAttribute("bookingDetails") List<BookingDetailEntity> bookingDetails,
            @SessionAttribute("bookingArrivalDetails") List<BookingDetailEntity> bookingArrivalDetails) {
        bookingDetails.addAll(bookingArrivalDetails);
        
        return "user/payment";
    }
}
