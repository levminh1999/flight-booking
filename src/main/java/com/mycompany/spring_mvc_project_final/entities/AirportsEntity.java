/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "airport")
public class AirportsEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(length = 100)
    private String name;
    
    @ManyToOne
    @JoinColumn(name = "city_id")
    private CityEntity city;
    
    @OneToMany(mappedBy = "departure",fetch = FetchType.LAZY)
    private List<FlightRoutesEntity> departures;
    
    @OneToMany(mappedBy = "destination",fetch = FetchType.LAZY)
    private List<FlightRoutesEntity> destinations;
    
    @OneToMany(mappedBy = "airport", cascade = CascadeType.ALL)
    private List<ImageEntity> images;
    
    public AirportsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CityEntity getCity() {
        return city;
    }

    public void setCity(CityEntity city) {
        this.city = city;
    }

    public List<FlightRoutesEntity> getDepartures() {
        return departures;
    }

    public void setDepartures(List<FlightRoutesEntity> departures) {
        this.departures = departures;
    }

    public List<FlightRoutesEntity> getDestinations() {
        return destinations;
    }

    public void setDestinations(List<FlightRoutesEntity> destinations) {
        this.destinations = destinations;
    }

    public List<ImageEntity> getImages() {
        return images;
    }

    public void setImages(List<ImageEntity> images) {
        this.images = images;
    }
    
    
}
