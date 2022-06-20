
package com.mycompany.spring_mvc_project_final.service;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import java.util.Comparator;

public class SearchService implements Comparator<FlightsEntity> {
    @Override
    public int compare(FlightsEntity o1, FlightsEntity o2) {
       int discount = o1.getDiscountSave() - o2.getDiscountSave();
       if(discount == 0) {
           return o1.getDepart().compareTo(o2.getDepart());
       }
       return o2.getDiscountSave() - o1.getDiscountSave();
       
    
    }
}
