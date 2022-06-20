package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.repository.BookingRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;
    
    @Autowired
    BookingDetailService bookingDetailService;

    @Autowired
    private PaymentService paymentService;
    
    @Autowired
    private ServiceBookingService serviceBookingService;
    
    @Autowired
    private AircraftSeatsService aircraftSeatsService;

    public void saveBooking(BookingEntity booking) {
        bookingRepository.save(booking);
    }

    public List<BookingEntity> getBookingByUser(String email) {
        return bookingRepository.findByEmailOrderByBookingDateDesc(email);
    }

    public List<BookingEntity> setTotalPriceBookings(List<BookingEntity> bookingUsers) {
        for (BookingEntity bookingUser : bookingUsers) {
            
                if (bookingUser.getBookingDetail().get(0).getFlight().getDepart().equals(bookingUser.getBookingDetail().get(bookingUser.getBookingDetail().size() - 1).getFlight().getDepart())) {
                    bookingUser.setDirection("oneTrip");
                } else {
                    bookingUser.setDirection("towTrip");
                }
            List<BookingDetailEntity> bookingDetails = bookingDetailService.getBookingDetails(bookingUser.getId());
            double totalPrice = 0;
            for(BookingDetailEntity bookingDetail : bookingDetails) {
                            List<ServiceBookingEntity> serviceByBookingsId = serviceBookingService.getServiceBookingByBookingDetail(bookingDetail.getId());
                            double totalPriceService = 0;
                            if(serviceByBookingsId.size() > 0) {
                                for(ServiceBookingEntity serviceByBookingId : serviceByBookingsId) {
                                    totalPriceService += serviceByBookingId.getPrice() * serviceByBookingId.getQuantity();
                                }
                            } else {
                                totalPriceService = 0;
                            }
                        //    List<AircraftSeatsEntity> getPriceSeats = aircraftSeatsService.getSeatPrice(bookingDetail.getFlight().getId(), bookingDetail.getSeat().getNumber());
                            if(bookingDetail.getDiscount() > 0) {
                                totalPrice += bookingDetail.getUnitPrice() - bookingDetail.getUnitPrice()* bookingDetail.getDiscount()/100 + totalPriceService;
                            } else {
                                 totalPrice += bookingDetail.getUnitPrice() + totalPriceService;
                            }
                        }
            
                bookingUser.setTotalPrice(totalPrice);
        }

        return bookingUsers;
    }
    
    public BookingEntity getBookingById(int bookingId) {
        Optional<BookingEntity> optional = bookingRepository.findById(bookingId);
        if(optional.isPresent()) {
            return (BookingEntity) optional.get();
        } 
        return null;
    }
    
    public List<BookingEntity> searchBookingUser(String email,Date startDate, Date endDate){
        return bookingRepository.findByEmailAndBookingDateBetweenOrderByBookingDateDesc(email, startDate, endDate);
    }
}
