
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "aircraft")
public class AircraftsEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String name;
    
    private int number;
    
    private int roww;
    
    private int colum;
    
    @Column(length = 25)
    private String status;
    
    @OneToMany(mappedBy = "aircraft", cascade = CascadeType.ALL)
    private List<AircraftSeatsEntity> aircraftSeats;
    
    @OneToMany(mappedBy = "aircraft", cascade = CascadeType.ALL)
    private List<FlightsEntity> flights;
    
    @OneToMany(mappedBy = "aircraft", cascade = CascadeType.ALL)
    private List<ImageEntity> images;

    public AircraftsEntity() {
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    

    public int getColum() {
        return colum;
    }

    public void setColum(int colum) {
        this.colum = colum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<AircraftSeatsEntity> getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(List<AircraftSeatsEntity> aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }

    public int getRoww() {
        return roww;
    }

    public void setRoww(int roww) {
        this.roww = roww;
    }

    public List<FlightsEntity> getFlights() {
        return flights;
    }

    public void setFlights(List<FlightsEntity> flights) {
        this.flights = flights;
    }

    public List<ImageEntity> getImages() {
        return images;
    }

    public void setImages(List<ImageEntity> images) {
        this.images = images;
    }

   
    
}
