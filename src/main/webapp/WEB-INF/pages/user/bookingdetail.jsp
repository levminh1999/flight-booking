<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/WEB-INF/pages/include/user/css.jsp" %>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/css/ticket.css"> 
    </head>
    <body>
        <%@include file="/WEB-INF/pages/include/user/header.jsp" %>
        <c:if test="${direction == 'oneTrip'}">
            <section class="container" style="padding-top: 5%;padding-bottom: 5%">
                <c:if test="${bookingDetailsUser.size() > 0}">
                    <div class="row">
                        <article class="card fl-left">
                        </c:if>
                        <c:forEach var="bookingDetailUser" items="${bookingDetailsUser}" varStatus="loop">
                            <section class="date" style="width: 28%">
                                <time>
                                    <span style="font-size: 15px"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${bookingDetailUser.booking.bookingDate}" /></span>
                                </time>
                            </section>
                            <section class="card-cont">
                                <h3 style="padding-top: 3px">Thông tin hành khách ${loop.count}</h3>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Tên người đặt vé : ${bookingDetailUser.booking.fullName}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Chuyến bay : từ ${bookingDetailUser.flight.flightRoute.departure.city.name} 
                                        đến ${bookingDetailUser.flight.flightRoute.destination.city.name}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Ngày khởi hành : <fmt:formatDate type = "both" 
                                                        dateStyle = "short" timeStyle = "short" value = "${bookingDetailUser.flight.depart}" />

                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Giá vé : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${bookingDetailUser.unitPrice}" /> VND
                                        
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Giảm giá : ${bookingDetailUser.discount} %
                                    </p>
                                </div>
                                <c:forEach var="service" items="${bookingDetailUser.serviceBookings}">
                                    <div class="even-info">
                                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                                        <p>
                                            Dịch vụ : ${service.service.name} - Số lượng : ${service.quantity} - Giá : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = " ${service.price}" /> VND
                                           
                                        </p>
                                    </div>
                                </c:forEach>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>

                                    <p> Hạng Ghế : ${bookingDetailUser.seatType}</p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Ghế : ${bookingDetailUser.seat.number}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Giá ghế : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = " ${bookingDetailUser.seatPrice}" /> VND
                                       
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Tên hành khách : ${bookingDetailUser.passenger.fullName}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Địa chỉ : ${bookingDetailUser.passenger.address}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Số điện thoại : ${bookingDetailUser.passenger.phoneNumber}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Email : ${bookingDetailUser.passenger.email}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Ngày sinh : <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                        value = "${bookingDetailUser.passenger.birthDate}" />
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Giới tính : ${bookingDetailUser.passenger.gender}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Số CMND : ${bookingDetailUser.passenger.idenCode}
                                    </p>
                                </div>

                            </section>
                        </article>
                        <c:if test="${bookingDetailsUser.size() > loop.count}">
                            <c:if test="${loop.count % 2 != 0}">
                                <article class="card fl-left">
                                </c:if>

                                <c:if test="${loop.count % 2 == 0}"> 
                            </div>
                            <div class="row">
                                <article class="card fl-left">
                                </c:if>

                            </c:if>
                            <c:if test="${bookingDetailsUser.size() == loop.count}">
                        </div>
                    </c:if>

                </c:forEach>
<!--
                <div class="row" style="padding-left: 43%">
                    <button onclick="location.href = '<c:url value="/payment"/>'" style="width: 200px" class="btn btn-danger">Đi tiếp</button>
                </div>-->

            </section>
        </c:if>

        <c:if test="${direction == 'towTrip'}">
            <section class="container" style="padding-top: 5%;padding-bottom: 5%">
                <c:if test="${bookingDetailsUser.size() > 0}">
                    <div class="row">
                        <article class="card fl-left">
                        </c:if>
                        <c:forEach var="bookingDetailUser" items="${bookingDetailsUser}" varStatus="loop">
                            <section class="date" style="width: 28%">
                                <time>
                                    <span style="font-size: 15px"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${bookingDetailUser.booking.bookingDate}" /></span>
                                </time>
                            </section>
                            <section class="card-cont">
                                <c:if test="${loop.count <= bookingDetailsUser.size()/2}">
                                    <h3 style="padding-top: 3px">Thông tin vé lượt đi </h3>
                                    <h3 style="padding-top: 3px">Thông tin hành khách ${loop.count}</h3>
                                </c:if>
                                <c:if test="${loop.count > bookingDetailsUser.size()/2}">
                                    <h3 style="padding-top: 3px">Thông tin vé lượt về </h3>
                                    <h3 style="padding-top: 3px">Thông tin hành khách <fmt:formatNumber value="${loop.count - bookingDetailsUser.size()/2}"/> </h3>     
                                </c:if>

                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Tên người đặt vé : ${bookingDetailUser.booking.fullName}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Chuyến bay : từ ${bookingDetailUser.flight.flightRoute.departure.city.name} 
                                        đến ${bookingDetailUser.flight.flightRoute.destination.city.name}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Ngày khởi hành : <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                        value = "${bookingDetailUser.flight.depart}" />
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Giá vé : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${bookingDetailUser.unitPrice}" /> VND
                         
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Giảm giá : ${bookingDetailUser.discount} %
                                    </p>
                                </div>
                                <c:forEach var="service" items="${bookingDetailUser.serviceBookings}">
                                    <div class="even-info">
                                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                                        <p>
                                            Dịch vụ : ${service.service.name} - Số lượng : ${service.quantity} - Giá : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${service.price}" /> VND
                                            
                                        </p>
                                    </div>
                                </c:forEach>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Hạng Ghế : ${bookingDetailUser.seatType}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Ghế : ${bookingDetailUser.seat.number}
                                    </p>
                                </div>
<!--                                    
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Giá ghế : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${bookingDetailUser.seatPrice}" /> VND
                                        
                                    </p>
                                </div>
                                        -->
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Tên hành khách : ${bookingDetailUser.passenger.fullName}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Địa chỉ : ${bookingDetailUser.passenger.address}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Số điện thoại : ${bookingDetailUser.passenger.phoneNumber}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Email : ${bookingDetailUser.passenger.email}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Ngày sinh : <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                        value = "${bookingDetailUser.passenger.birthDate}" />
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Giới tính : ${bookingDetailUser.passenger.gender}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px" class="fa fa-circle"></i>
                                    <p>
                                        Số CMND : ${bookingDetailUser.passenger.idenCode}
                                    </p>
                                </div>


                            </section>
                        </article>
                        <c:if test="${bookingDetailsUser.size() > loop.count}">
                            <c:if test="${loop.count % 2 != 0}">
                                <article class="card fl-left">
                                </c:if>

                                <c:if test="${loop.count % 2 == 0}"> 
                            </div>
                            <div class="row">
                                <article class="card fl-left">
                                </c:if>

                            </c:if>
                            <c:if test="${bookingDetailsUser.size() == loop.count}">
                        </div>
                    </c:if>

                </c:forEach>
<!--                
                                <div class="row" style="padding-left: 43%">
                                    <button onclick="location.href = '<c:url value="/export/${bookingDetailsUser.get(0).booking.id}"/>'" style="width: 200px" class="btn btn-danger"> Tải về </button>
                                </div>-->

            </section>
        </c:if>

    </body>
</html>
