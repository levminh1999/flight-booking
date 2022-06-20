/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.repository.ServiceBookingRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceBookingService {
    @Autowired
    private ServiceBookingRepository serviceBookingRepository;
    
    public List<ServiceBookingEntity> getServiceBookingByBookingDetail(int bookingDetailId) {
        return serviceBookingRepository.findByBookingDetail_Id(bookingDetailId);
    }
    
}
