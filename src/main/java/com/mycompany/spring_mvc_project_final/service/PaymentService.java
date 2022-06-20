/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import com.mycompany.spring_mvc_project_final.repository.PaymentRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
    
    @Autowired
    private PaymentRepository paymentRepository;
    
    public void savePayment(PaymentEntity payment) {
        paymentRepository.save(payment);
    }
    
//    public PaymentEntity getPaymentUser(int bookingId, BookingStatusEnum name) {
//        return paymentRepository.findByBooking_IdAndBooking_BookingStatus(bookingId, name);
//    }
    
    public List<PaymentEntity> getPaymentUser(int bookingId) {
        return paymentRepository.findByBooking_Id(bookingId);
    }
    
    
}
