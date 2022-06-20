
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FlightRepository extends JpaRepository<FlightsEntity, Integer>{
    

    List<FlightsEntity> findByDepartAndFlightRoute_Departure_IdAndFlightRoute_Destination_Id(Date depart,int departureId, int destinationId);
    
    @Query(nativeQuery = true, value = "select * from flights f join flight_routes fr on f.flight_route_id = fr.id where date(f.depart) = ?1 and fr.departure_id = ?2 and fr.destination_id = ?3")
    List<FlightsEntity> getFlightsByDate(String depart,int departureId, int destinationId);
    
    
     
}
