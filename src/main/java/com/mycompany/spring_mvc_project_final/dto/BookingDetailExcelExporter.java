
package com.mycompany.spring_mvc_project_final.dto;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class BookingDetailExcelExporter {
    
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;

    private List<BookingDetailEntity> listBookingDetails;
    
  
    DecimalFormat formatter = new DecimalFormat("###,###,### ");

    public BookingDetailExcelExporter(List<BookingDetailEntity> listBookingDetails) {
        this.listBookingDetails = listBookingDetails;
   
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet("Chi tiết giao dịch");
    }

    private void writeHeaderRow() {
        Row row = (Row) sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeight(14);
        style.setFont(font);

        Cell cell = row.createCell(0);
        cell.setCellValue("Người đặt vé");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("Điểm khởi hành");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("Ngày khởi hành");
        cell.setCellStyle(style);
        
        cell = row.createCell(3);
        cell.setCellValue("Điểm đến");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("Giá vé");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("Giảm giá");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("Dịch vụ lượt đi");
        cell.setCellStyle(style);

        cell = row.createCell(7);
        cell.setCellValue("Hạng ghế lượt đi");
        cell.setCellStyle(style);

        cell = row.createCell(8);
        cell.setCellValue("Ghế lượt đi");
        cell.setCellStyle(style);

        cell = row.createCell(9);
        cell.setCellValue("Dịch vụ lượt về");
        cell.setCellStyle(style);

        cell = row.createCell(10);
        cell.setCellValue("Hạng ghế lượt về");
        cell.setCellStyle(style);
        
        cell = row.createCell(11);
        cell.setCellValue("Ghế lượt về");
        cell.setCellStyle(style);
        
        cell = row.createCell(12);
        cell.setCellValue("Tên hành khách");
        cell.setCellStyle(style);
        
        cell = row.createCell(13);
        cell.setCellValue("Địa chỉ");
        cell.setCellStyle(style);
        
        cell = row.createCell(14);
        cell.setCellValue("Số điện thoại");
        cell.setCellStyle(style);
        
        cell = row.createCell(15);
        cell.setCellValue("Email");
        cell.setCellStyle(style);
        
        cell = row.createCell(16);
        cell.setCellValue("Giới tính");
        cell.setCellStyle(style);

        cell = row.createCell(17);
        cell.setCellValue("Số CMND");
        cell.setCellStyle(style);
    }

    
    
    private void writeDataRow() {
        int rowCount = 1;

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(12);
        style.setFont(font);

        for (BookingDetailEntity listBookingDetail : listBookingDetails) {
            Row row = sheet.createRow(rowCount++);
            Cell cell = row.createCell(0);
            cell.setCellValue(listBookingDetail.getBooking().getFullName());
            sheet.autoSizeColumn(0);
            cell.setCellStyle(style);

            cell = row.createCell(1);
            cell.setCellValue(listBookingDetail.getFlight().getFlightRoute().getDeparture().getName());
            sheet.autoSizeColumn(1);
            cell.setCellStyle(style);

            cell = row.createCell(2);
            cell.setCellValue(listBookingDetail.getFlight().getDepart());
            sheet.autoSizeColumn(2);
            cell.setCellStyle(style);

            cell = row.createCell(3);
            cell.setCellValue(listBookingDetail.getFlight().getFlightRoute().getDestination().getName());
            sheet.autoSizeColumn(3);
            cell.setCellStyle(style);

            cell = row.createCell(4);
            cell.setCellValue(listBookingDetail.getUnitPrice());
            sheet.autoSizeColumn(4);
            cell.setCellStyle(style);

            cell = row.createCell(5);
            cell.setCellValue(listBookingDetail.getDiscount());
            sheet.autoSizeColumn(5);
            cell.setCellStyle(style);
            
            String services = "";
            for(ServiceBookingEntity service : listBookingDetail.getServiceBookings()) {
                services += " " + service.getService().getName() + " : " + service.getQuantity() + ";";
            }
            
            cell = row.createCell(6);
            cell.setCellValue(services);
            sheet.autoSizeColumn(6);
            cell.setCellStyle(style);

            cell = row.createCell(7);
            cell.setCellValue("");
            sheet.autoSizeColumn(7);
            cell.setCellStyle(style);

            
//            
            cell = row.createCell(8);
            cell.setCellValue("");
            sheet.autoSizeColumn(8);
            cell.setCellStyle(style);

            cell = row.createCell(9);
            cell.setCellValue("");
            sheet.autoSizeColumn(9);
            cell.setCellStyle(style);
            
            cell = row.createCell(10);
            cell.setCellValue("");
            sheet.autoSizeColumn(10);
            cell.setCellStyle(style);
            
            cell = row.createCell(11);
            cell.setCellValue("");
            sheet.autoSizeColumn(11);
            cell.setCellStyle(style);
            
            cell = row.createCell(12);
            cell.setCellValue(listBookingDetail.getPassenger().getFullName());
            sheet.autoSizeColumn(12);
            cell.setCellStyle(style);
            
            cell = row.createCell(13);
            cell.setCellValue(listBookingDetail.getPassenger().getAddress());
            sheet.autoSizeColumn(13);
            cell.setCellStyle(style);
            
            cell = row.createCell(14);
            cell.setCellValue(listBookingDetail.getPassenger().getPhoneNumber());
            sheet.autoSizeColumn(14);
            cell.setCellStyle(style);
            
            cell = row.createCell(15);
            cell.setCellValue(listBookingDetail.getPassenger().getEmail());
            sheet.autoSizeColumn(15);
            cell.setCellStyle(style);
            
            cell = row.createCell(16);
            cell.setCellValue(listBookingDetail.getPassenger().getGender());
            sheet.autoSizeColumn(16);
            cell.setCellStyle(style);
            
            cell = row.createCell(17);
            cell.setCellValue(listBookingDetail.getPassenger().getIdenCode());
            sheet.autoSizeColumn(17);
            cell.setCellStyle(style);
            
        }
    }

    public void export(HttpServletResponse response) throws IOException {
        writeHeaderRow();
        writeDataRow();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        //    workbook.close();
        outputStream.close();

    }

    public XSSFWorkbook getWorkbook() {
        return workbook;
    }

    public void setWorkbook(XSSFWorkbook workbook) {
        this.workbook = workbook;
    }

    public XSSFSheet getSheet() {
        return sheet;
    }

    public void setSheet(XSSFSheet sheet) {
        this.sheet = sheet;
    }

    public List<BookingDetailEntity> getListBookingDetails() {
        return listBookingDetails;
    }

    public void setListBookingDetails(List<BookingDetailEntity> listBookingDetails) {
        this.listBookingDetails = listBookingDetails;
    }

  
    public DecimalFormat getFormatter() {
        return formatter;
    }

    public void setFormatter(DecimalFormat formatter) {
        this.formatter = formatter;
    }

    

}
