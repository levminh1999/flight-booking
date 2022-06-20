
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;
import com.mycompany.spring_mvc_project_final.repository.BookingDetailRepository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingDetailService {
    
    @Autowired
    private BookingDetailRepository bookingDetailRepository;
    
    @Autowired
    private AircraftSeatsService aircraftSeatsService;
    
    public List<BookingDetailEntity> getBookingDetails(int flightId,BookingStatusEnum statusBooking) {
        return bookingDetailRepository.
                findByFlight_IdAndBooking_BookingStatus
                (flightId ,statusBooking);
    }
    
   public String getNameSeatType(String keySeatType) {
       if(keySeatType.equals(SeatTypeEnum.BUSINESS.toString())) {
           return "Hạng thương gia";
       } else if(keySeatType.equals(SeatTypeEnum.ECONOMY.toString())) {
           return "Hạng phổ thông";
       } else {
            return "Hạng nhất";
       }
   }
   
   public List<BookingDetailEntity> getBookingDetails(int bookingId) {
       return bookingDetailRepository.findByBooking_Id(bookingId);
   }
   
   public void saveBookingDetail(List<BookingDetailEntity> bookingDetails) {
       bookingDetailRepository.saveAll(bookingDetails);    
   }
   
   public List<BookingDetailEntity> setPriceAndSeatTypeBookingDetail(List<BookingDetailEntity> bookingDetails) {
       for(BookingDetailEntity bookingDetail : bookingDetails) {
           List<AircraftSeatsEntity> aircraftSeats =
                   aircraftSeatsService.getSeatPrice(bookingDetail.getFlight().getId(), bookingDetail.getSeat().getNumber());
           if(aircraftSeats.size() > 0) {
               String seatType = "";
               if(aircraftSeats.get(0).getSeatType().getSeatType() == SeatTypeEnum.ECONOMY) {
                   seatType = "phổ thông";
               } else if (aircraftSeats.get(0).getSeatType().getSeatType() == SeatTypeEnum.BUSINESS) {
                   seatType = "thương gia";
               } else {
                   seatType ="hạng nhất";
               }
               bookingDetail.setSeatType(seatType);
               bookingDetail.setSeatPrice(aircraftSeats.get(0).getPrice());
           }
       }
       return bookingDetails;
   }
    
   
   public double setTotalPriceBooking (List<BookingDetailEntity> bookingDetails) {
       double totalPrice = 0;
            for(BookingDetailEntity bookingDetail : bookingDetails) {
                            List<ServiceBookingEntity> serviceByBookingsId = bookingDetail.getServiceBookings();
                            double totalPriceService = 0;
                            if(serviceByBookingsId.size() > 0) {
                                for(ServiceBookingEntity serviceByBookingId : serviceByBookingsId) {
                                    totalPriceService += serviceByBookingId.getPrice() * serviceByBookingId.getQuantity();
                                }
                            } else {
                                totalPriceService = 0;
                            }
                       
                            if(bookingDetail.getDiscount() > 0) {
                                totalPrice += bookingDetail.getUnitPrice() - bookingDetail.getUnitPrice()* bookingDetail.getDiscount()/100 + totalPriceService;
                            } else {
                                 totalPrice += bookingDetail.getUnitPrice() + totalPriceService;
                            }
                        }
            return totalPrice;
   }
    
}
