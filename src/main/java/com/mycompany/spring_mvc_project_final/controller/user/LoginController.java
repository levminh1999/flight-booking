
package com.mycompany.spring_mvc_project_final.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
    
     @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String displayLoginPage(Model model) {
        return "user/login";
    }
}
