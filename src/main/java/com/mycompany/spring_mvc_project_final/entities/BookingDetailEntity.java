
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
import javax.persistence.Transient;

@Entity
@Table(name = "booking_detail")
public class BookingDetailEntity implements Serializable,Cloneable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "unit_price")
    private double unitPrice;
    
    private int discount;
    
    @Transient
    private String birthDateStr;
    
    @Transient
    private String seatType;
    
    @Transient double seatPrice;
    
   
    @ManyToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity booking;
    
    @ManyToOne
    @JoinColumn(name = "passenger_id")
    private PassengersEntity passenger;
    
    @ManyToOne
    @JoinColumn(name = "flight_id")
    private FlightsEntity flight;
    
    @ManyToOne
    @JoinColumn(name = "seat_id")
    private SeatsEntity seat;
    
    @OneToMany(mappedBy = "bookingDetail", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<ServiceBookingEntity> serviceBookings;
    
    public BookingDetailEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }

    public PassengersEntity getPassenger() {
        return passenger;
    }

    public void setPassenger(PassengersEntity passenger) {
        this.passenger = passenger;
    }

    public List<ServiceBookingEntity> getServiceBookings() {
        return serviceBookings;
    }

    public void setServiceBookings(List<ServiceBookingEntity> serviceBookings) {
        this.serviceBookings = serviceBookings;
    }

    public FlightsEntity getFlight() {
        return flight;
    }

    public void setFlight(FlightsEntity flight) {
        this.flight = flight;
    }

    public String getBirthDateStr() {
        return birthDateStr;
    }

    public void setBirthDateStr(String birthDateStr) {
        this.birthDateStr = birthDateStr;
    }

    public SeatsEntity getSeat() {
        return seat;
    }

    public void setSeat(SeatsEntity seat) {
        this.seat = seat;
    }

    @Override
    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public double getSeatPrice() {
        return seatPrice;
    }

    public void setSeatPrice(double seatPrice) {
        this.seatPrice = seatPrice;
    }

  
    
}
