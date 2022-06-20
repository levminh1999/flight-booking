
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

        <section class="container" style="padding-top: 5%;padding-bottom: 5%">
            <div class="row" >
                <article class="card1 fl-left">
                    <section class="date" style="width: 31.5%">
                        <time>
                            <span style="font-size: 15px"><fmt:formatDate pattern = "dd-MM-yyyy" 
                                                                          value = "${booking.bookingDate}" /></span>
                        </time>
                    </section>
                    <section class="card-cont">
                        <h3 style="padding-top: 3px">THÔNG TIN NGƯỜI ĐẶT VÉ</h3>

                        <div class="even-info">
                            <i style="padding-right: 10px" class="fa fa-circle"></i>
                            <p>
                                Họ Tên : ${booking.fullName}
                            </p>
                        </div>
                        <div class="even-info">
                            <i class="fa fa-circle"></i>
                            <p>
                                Địa chỉ : ${booking.address}
                            </p>
                        </div>
                        <div class="even-info">
                            <i class="fa fa-circle"></i>
                            <p>
                                Số Điện thoại : ${booking.phoneNumber}
                            </p>
                        </div>
                        <div class="even-info">
                            <i class="fa fa-circle"></i>
                            <p>
                                Email : ${booking.email}
                            </p>
                        </div>
                        <div class="even-info">
                            <i class="fa fa-circle"></i>
                            <p>
                                Ngày Sinh : <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                        value = "${booking.birthDate}" /> 
                            </p>
                        </div>
                        <div class="even-info">
                            <i class="fa fa-circle"></i>
                            <p>
                                Giới Tính : ${booking.gender}
                            </p>
                        </div>
                            
                        <div class="even-info">
                            <i style="padding-right: 10px" class="fa fa-circle"></i>
                            <p>
                                Tổng tiền  : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${booking.totalPrice}" /> VND
                                
                                
                            </p>
                        </div>

                        <a href="${pageContext.request.contextPath}/edit-booking-tow-trip-info">Chỉnh sửa thông tin</a>
                    </section>
                </article>
            </div>
            
            <c:if test="${bookingDetails.size() > 0}">
                <div class="row">
                    <c:if test="${bookingDetails.size() == 1}">
                        <article class="card1 fl-left">
                    </c:if>
                    <c:if test="${loop.count != 1}">
                        <article class="card fl-left">
                    </c:if>
            </c:if>
            <c:forEach var="bookingDetail" items="${bookingDetails}" varStatus="loop">
                <section class="date" style="width: 28%">
                    <time>
                        <span style="font-size: 15px"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${booking.bookingDate}" /></span>
                    </time>
                </section>
                <section class="card-cont">
                    <h3 style="padding-top: 3px">Thông tin hành khách ${loop.count}</h3>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Tên người đặt vé : ${bookingDetail.booking.fullName}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Chuyến Bay lượt đi : từ ${bookingDetail.flight.flightRoute.departure.city.name} 
                            đến ${bookingDetail.flight.flightRoute.destination.city.name}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Chuyến Bay lượt về : từ ${bookingDetail.flight.flightRoute.destination.city.name} 
                            đến : ${bookingDetail.flight.flightRoute.departure.city.name}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Ngày đi : <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                         value = "${bookingDetail.flight.depart}" />
                        </p>
                    </div>
                     <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Ngày về : <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                         value = "${bookingArrivalDetails.get(loop.index).flight.depart}" />
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Tên hành khách : ${bookingDetail.passenger.fullName}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Địa chỉ : ${bookingDetail.passenger.address}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Số điện thoại : ${bookingDetail.passenger.phoneNumber}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Email : ${bookingDetail.passenger.email}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Ngày sinh : <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                    value = "${bookingDetail.passenger.birthDate}" />
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Giới tính : ${bookingDetail.passenger.gender}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Số CMND : ${bookingDetail.passenger.idenCode}
                        </p>
                    </div>
                        
                     <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Giá vé lượt đi : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${bookingDetail.unitPrice}" /> VND
                            
                        </p>
                    </div>
                        
                   <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Giảm giá lượt đi : ${bookingDetail.discount} %
                        </p>
                    </div>
                    
                    <c:forEach var="sv" items="${bookingDetail.serviceBookings}">
                                    <div class="even-info">
                                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                                        <p>
                                            Dịch vụ lượt đi : ${sv.service.name} - Số lượng : ${sv.quantity} - Giá : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${sv.price}" /> VND
                                            
                                        </p>
                                    </div>
                    </c:forEach>
                        
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Giá vé lượt về : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${bookingArrivalDetails.get(loop.index).unitPrice}" /> VND
                            
                        </p>
                    </div>
                        
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Giảm giá lượt về : ${bookingArrivalDetails.get(loop.index).discount} %
                        </p>
                    </div>
                        
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Hạng Ghế lượt đi : ${bookingDetail.seatType}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Ghế lượt đi : ${bookingDetail.seat.number}
                        </p>
                    </div>
                    
                    <c:forEach var="svarrival" items="${bookingArrivalDetails.get(loop.index).serviceBookings}">
                                    <div class="even-info">
                                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                                        <p>
                                            Dịch vụ lượt về : ${svarrival.service.name} - Số lượng : ${svarrival.quantity} - Giá : <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${svarrival.price}" /> VND
                                            
                                        </p>
                                    </div>
                    </c:forEach>
                        
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Hạng Ghế lượt về : ${bookingArrivalDetails.get(loop.index).seatType}
                        </p>
                    </div>
                    <div class="even-info">
                        <i style="padding-right: 10px" class="fa fa-circle"></i>
                        <p>
                            Ghế lượt về : ${bookingArrivalDetails.get(loop.index).seat.number}
                        </p>
                    </div>
                    <a href="${pageContext.request.contextPath}/edit-bookingdetail-tow-trip-info/${loop.index}">Chỉnh sửa thông tin</a>
                </section>
                </article>
                <c:if test="${bookingDetails.size() > loop.count}">
                    <c:if test="${loop.count % 2 != 0}">
                        <article class="card fl-left">
                    </c:if>

                    <c:if test="${loop.count % 2 == 0}"> 
                        </div>
                        <div class="row">
                            <article class="card fl-left">
                                </c:if>

                                </c:if>
                                <c:if test="${bookingDetails.size() == loop.count}">
                                    </div>
                                </c:if>

                                </c:forEach>

                                <div class="row" style="padding-left: 43%">
                                    <button onclick="location.href = '<c:url value="/payment-tow-trip"/>'" style="width: 200px" class="btn btn-danger">Đi tiếp</button>
                                </div>


                                </section>
        </body>
</html>
