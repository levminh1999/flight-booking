<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${seatByTypes.size() != 0}">
    
        <input id="id-price" disabled style="color: black" class = "mdl-textfield__input" type = "text" value="<fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${seatByTypes.get(0).price}" /> VND" >
        <label style="margin-top: -20px" class = "mdl-textfield__label" for = "id-price">Giá ghế</label>   
   
</c:if>
<c:if test="${seatByTypes.size() == 0}">
    <input id="id-price" disabled style="color: black" class = "mdl-textfield__input" type = "text" value="" >
    <label style="margin-top: -20px" class = "mdl-textfield__label" for = "id-price">Giá ghế</label>
</c:if>


