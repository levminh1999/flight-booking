
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.repository.CreditCardRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CreditCardService {
    @Autowired
    private CreditCardRepository creditCardRepository;
    
    public List<CreditCardEntity> getCreditCards (String cardName, String cardNumber) {
        return creditCardRepository.findByNameAndCardNumber(cardName, cardNumber);
    }
    
    public void saveCreditCard(CreditCardEntity creditCardEntity) {
        creditCardRepository.save(creditCardEntity);
    }
}
