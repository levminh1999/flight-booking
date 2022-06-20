
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<PaymentEntity, Integer>{
   
//    PaymentEntity findByBooking_IdAndBooking_BookingStatus(int bookingId, BookingStatusEnum name);
    
     List<PaymentEntity> findByBooking_Id(int bookingId);
    
}
