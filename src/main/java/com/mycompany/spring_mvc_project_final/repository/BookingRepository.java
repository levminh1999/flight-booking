/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends JpaRepository<BookingEntity, Integer>{
    
    List<BookingEntity> findByEmailOrderByBookingDateDesc(String email);
    
    List<BookingEntity> findByEmailAndBookingDateBetweenOrderByBookingDateDesc(String email,Date startDate, Date endDate);
}
