
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.CityEntity;
import com.mycompany.spring_mvc_project_final.repository.CityRepository;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CityService {
    
    @Autowired
    private CityRepository cityRepository;
    
    public List<CityEntity> getCitys() {
        return cityRepository.findAll();
    }
}
