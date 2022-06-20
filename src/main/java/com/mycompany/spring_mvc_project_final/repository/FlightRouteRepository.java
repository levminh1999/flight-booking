
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.FlightRoutesEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FlightRouteRepository extends JpaRepository<FlightRoutesEntity, Integer>{
    
    List<FlightRoutesEntity> findByDeparture_Id(int id);
    
    
    
}
