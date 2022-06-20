<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${seats.size() > 0}">
    <option value=""></option>
</c:if>
<c:if test="${seats.size() == 0}">
    <option value=""></option>
    <option value="">Đã hết chỗ</option>
</c:if>

<c:forEach var="c" items="${seats}">
    <option value="${c}">${c}</option> 
</c:forEach>