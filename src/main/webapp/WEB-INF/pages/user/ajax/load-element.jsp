
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <option value="null">Điểm đến</option>
    <c:forEach var="c" items="${listOptions}">
        <option value="${c.destination.id}">${c.destination.city.name}</option> 
    </c:forEach>

