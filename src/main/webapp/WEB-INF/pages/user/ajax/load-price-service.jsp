<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
              
        <input id="id-price-service" disabled style="color: black" class = "mdl-textfield__input" type = "text" value="<fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${totalServiceOfBookingDetail}" /> VND" >
        <label style="margin-top: -20px" class = "mdl-textfield__label" for = "id-price-service">Giá dịch vụ</label>   