
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingDetailRepository extends JpaRepository<BookingDetailEntity, Integer>{
    
    List<BookingDetailEntity>findByFlight_IdAndBooking_BookingStatus(int flightId ,BookingStatusEnum name);
    
    List<BookingDetailEntity> findByBooking_Id(int bookingId);

  
}
