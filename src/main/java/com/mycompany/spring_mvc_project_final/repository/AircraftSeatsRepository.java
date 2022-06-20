
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface AircraftSeatsRepository extends JpaRepository<AircraftSeatsEntity, Integer>{
    
    List<AircraftSeatsEntity> findByAircraft_Id(int id);
   
    @Query(nativeQuery = true, value = "select* from aircraft_seats acs join seat_type stp on acs.seat_type_id = stp.id \n" +
                                       "where flight_id = ?1 group by seat_type;")
    List<AircraftSeatsEntity> getSeatTypes(int flightId);
    
    List<AircraftSeatsEntity> findByFlight_IdAndSeatType_SeatType(int filgintId, SeatTypeEnum seatType);
    
    List<AircraftSeatsEntity> findByFlight_IdAndSeats_Number(int filgintId, String seatNumber);
}
