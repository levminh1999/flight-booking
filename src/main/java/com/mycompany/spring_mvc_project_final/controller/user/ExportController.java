
package com.mycompany.spring_mvc_project_final.controller.user;

import com.mycompany.spring_mvc_project_final.dto.BookingDetailExcelExporter;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExportController {
    
    @Autowired
    private BookingService bookingService;
    
    @Autowired
    private BookingDetailService bookingDetailService;
    
    @RequestMapping("/export/{bookingId}")
    public void exportExcel(HttpServletResponse response,
            @PathVariable("bookingId") int bookingId) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        String headerValue = "attachement; fileName=booking.xlsx";

        response.setHeader(headerKey, headerValue);

        List<BookingDetailEntity> listBookingsDetail = bookingDetailService.getBookingDetails(bookingId);
      
        BookingDetailExcelExporter excelExporter = new BookingDetailExcelExporter(listBookingsDetail);

        excelExporter.export(response);
        
        
    }
}
