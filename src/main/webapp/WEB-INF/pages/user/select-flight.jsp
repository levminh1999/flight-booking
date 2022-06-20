
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <%@include file="/WEB-INF/pages/include/user/css.jsp" %>
        <style>
            .detail-booking {
                display: none
            }
            .ticket-detail {
                display: block
            }
            body {
                overflow-x:hidden;
            }
        </style>
    </head>
    <body style="background-image: url('https://www.vietjetair.com/static/media/cloud-bg-5.9b668827.png')">
        <%@include file="/WEB-INF/pages/include/user/header.jsp" %>
        <div  class="container-liquid"  style="width: 100%;background-color: yellow;padding-top: 10px; padding-left: 10px">
            <div class="row">

                <div  class="col-lg-3">
                    <c:if test="${trip != null}"> <h6>CHUYẾN BAY HAI CHIỀU</h6> </c:if>
                    <c:if test="${trip == null}"><h6>CHUYẾN BAY MỘT CHIỀU</h6></c:if>
                    </div>

                </div> 
                <div class="row">
                    <div  class="col-lg-3">
                        <p>Điểm khởi hành :<span style="color: red"> ${departure}</span></>
                </div>

                <div class="col-lg-3">
                    <p>Điểm đến : <span style="color: red"> ${destination}</span></p>
                </div>

            </div>
            <c:if test="${trip != null}">
                <div class="row">
                    <div  class="col-lg-3">
                        <p>Ngày Khởi Hành :<span style="color: red">
                                ${dateDepartSelector}</span></p>
                    </div>

                    <div class="col-lg-3">
                        <p>Ngày Về : <span style="color: red"> ${dateArrivalSelector}</span></p>
                    </div>

                </div>         
            </c:if>  
        </div>
        <div style="margin-top: 50px" class="container">
            <div  class="row">
                <div class="col-8">
                    <div class="container" style="background-color: white;height: 64px;" >
                        <div class="row">
                            <c:forEach var="c" items="${dateDepart}" varStatus="loop">
                                <c:if test="${loop.index == 1}">
                                    <div style="background-color: yellow;padding-left: 50px;height: 64px;padding-top: 20px"  class="col-4"><h5>${c}</h5></div>
                                        </c:if>
                                        <c:if test="${loop.index != 1}">
                                    <div class="col-4" style="padding-top: 20px;padding-left: 50px"><h5>${c}</h5></div>
                                        </c:if>
                                    </c:forEach>
                        </div>
                    </div>

                    <!--Begin booking-->
                    <c:if test="${direction == 'trip'}">
                        <div class="container" style="margin-top: 20px;height: 100px">
                        <div class="row">
                            <div style="background-color: white" class="col-9">
                                <div class="row">
                                    <div style="padding-top: 20px" class="col-2">
                                        <h3>${selectedFlight.flightRoute.departure.city.postCode}</h3>
                                        <p><fmt:formatDate type = "time" 
                                                                value = "${selectedFlight.depart}" /></p>
                                    </div>
                                    <div class="col-2"></div>
                                    <div class="col-4 text-center">
                                        <p style="margin-top: 10px">${selectedFlight.durationStr}</p>
                                        <p  style="margin-top: -15px"><img src="https://www.vietjetair.com/static/media/vietjet.36ac4568.svg" /></p>
                                        <p style="margin-top: -15px"><span style="border-right: 2px solid;padding-right: 5px">Bay thẳng</span><span onclick="addTicketDetail(0)" style="padding-left: 5px;cursor: pointer">Chi tiết</span></p>
                                    </div>
                                    <div class="col-2"></div>
                                    <div style="padding-top: 20px" class="col-2">
                                        <h3>${selectedFlight.flightRoute.destination.city.postCode}</h3>
                                        <p>
                                            <fmt:formatDate type = "time" 
                                                                value = "${selectedFlight.arrival}" />
                                        </p>
                                    </div>
                                </div>

                            </div>
                            <div style="height: 100px;background-color: gainsboro; padding-top: 5px; color: #08c" class="col-3 text-center">
                                <p>Số lượng vé</p>
                                <p style="margin-top: -13px"><input id="quantity" style="width: 100px" type="number" placeholder="Số lượng" value="1" min="1" max="${selectedFlight.emptySeat}"></p>
                                <p style="margin-top: -13px">Còn ${selectedFlight.emptySeat} chỗ</p>
                            </div>
                        </div>

                    </div>

                    <div id="add-detail" class="detail-booking">
                        <div class="container" style="background-color: whitesmoke;height: 240px;padding-top: 20px;padding-left: 40px">
                            <div class="row">
                                <img src="https://www.vietjetair.com/static/media/vietjet.36ac4568.svg" />
                                <span style="margin-left: 10px">Số hiệu chuyến bay : </span>
                                <span style="margin-left: 10px;color: red" > VJ ${selectedFlight.id}</span>
                            </div>
                            <div style="margin-top: 10px" class="row">
                                <div class="col-1">
                                    <p>KHỞI HÀNH</p>
                                </div>
                                <div class="col-11">
                                    <!--                                <p>17:45, 25/10/2021 (Giờ địa phương)</p>-->
                                    <!--                                    <p style="margin-top: -18px">Tp. Hồ Chí Minh - Sân bay Tân Sơn Nhất</p>-->
                                    <p > ${departure} - ${selectedFlight.flightRoute.departure.name}</p>
                                </div>
                            </div>
                            <div style="margin-top: 10px" class="row">
                                <div class="col-1">
                                    <p>ĐẾN</p>
                                </div>
                                <div class="col-11">
                                    <!--                                    <p>19:05, 25/10/2021 (Giờ địa phương)</p>
                                                                        <p style="margin-top: -18px">Đà Nẵng - Sân bay Đà Nẵng</p>-->
                                    <p > ${destination} - ${selectedFlight.flightRoute.destination.name}</p>
                                </div>
                            </div>
                            <div style="margin-top: 10px" class="row">
                                <div class="col-1">

                                </div>
                                <div class="col-11">
                                    <p>
                                        Thời gian: ${selectedFlight.durationStr} - Máy bay: ${selectedFlight.aircraft.name}
                                    </p>

                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${trip == null}">
                        <div class="container" style="margin-top: 20px">
                            <div class="row text-center" style="padding-left: 50%">
                                <button onclick="location.href = '${pageContext.request.contextPath}/bookingdetail'" class="btn btn-warning">Tiếp tục</button>
                            </div>
                        </div>                   
                    </c:if>
                    <c:if test="${trip != null}">
                        <div class="container" style="margin-top: 20px">
                            <div class="row text-center" style="padding-left: 50%">
                                <button onclick="location.href = '${pageContext.request.contextPath}/search-flight-arrival'" class="btn btn-warning">Tiếp tục</button>
                            </div>
                        </div> 
                    </c:if>

                </div>
                    </c:if>
                <c:if test="${direction != 'trip'}">
                        <div class="container" style="margin-top: 20px;height: 100px">
                        <div class="row">
                            <div style="background-color: white" class="col-9">
                                <div class="row">
                                    <div style="padding-top: 20px" class="col-2">
                                        <h3>${selectedFlightArrival.flightRoute.departure.city.postCode}</h3>
                                        <p>10:05</p>
                                    </div>
                                    <div class="col-2"></div>
                                    <div class="col-4 text-center">
                                        <p style="margin-top: 10px">${selectedFlightArrival.durationStr}</p>
                                        <p  style="margin-top: -15px"><img src="https://www.vietjetair.com/static/media/vietjet.36ac4568.svg" /></p>
                                        <p style="margin-top: -15px"><span style="border-right: 2px solid;padding-right: 5px">Bay thẳng</span><span onclick="addTicketDetail(0)" style="padding-left: 5px;cursor: pointer">Chi tiết</span></p>
                                    </div>
                                    <div class="col-2"></div>
                                    <div style="padding-top: 20px" class="col-2">
                                        <h3>${selectedFlightArrival.flightRoute.destination.city.postCode}</h3>
                                        <p>10:05</p>
                                    </div>
                                </div>

                            </div>
                            <div style="height: 100px;background-color: gainsboro; padding-top: 5px; color: #08c" class="col-3 text-center">
                                <p>Số lượng vé</p>
                                <p style="margin-top: -13px"><input id="quantity" style="width: 100px" type="number" placeholder="Số lượng" value="${quantity}" disabled></p>
                                <p style="margin-top: -13px">Còn ${selectedFlightArrival.emptySeat} chỗ</p>
                            </div>
                        </div>

                    </div>

                    <div id="add-detail" class="detail-booking">
                        <div class="container" style="background-color: whitesmoke;height: 240px;padding-top: 20px;padding-left: 40px">
                            <div class="row">
                                <img src="https://www.vietjetair.com/static/media/vietjet.36ac4568.svg" />
                                <span style="margin-left: 10px">Số hiệu chuyến bay : </span>
                                <span style="margin-left: 10px;color: red" > VJ ${selectedFlightArrival.id}</span>
                            </div>
                            <div style="margin-top: 10px" class="row">
                                <div class="col-1">
                                    <p>KHỞI HÀNH</p>
                                </div>
                                <div class="col-11">
                                    <!--                                <p>17:45, 25/10/2021 (Giờ địa phương)</p>-->
                                    <!--                                   <p style="margin-top: -18px">Tp. Hồ Chí Minh - Sân bay Tân Sơn Nhất</p>-->
                                    <p > ${destination}  - ${selectedFlightArrival.flightRoute.departure.name}</p>
                                </div>
                            </div>
                            <div style="margin-top: 10px" class="row">
                                <div class="col-1">
                                    <p>ĐẾN</p>
                                </div>
                                <div class="col-11">
                                    <!--                                    <p>19:05, 25/10/2021 (Giờ địa phương)</p>
                                                                        <p style="margin-top: -18px">Đà Nẵng - Sân bay Đà Nẵng</p>-->
                                    <p > ${departure} - ${selectedFlightArrival.flightRoute.destination.name}</p>
                                </div>
                            </div>
                            <div style="margin-top: 10px" class="row">
                                <div class="col-1">

                                </div>
                                <div class="col-11">
                                    <p>
                                        Thời gian: ${selectedFlightArrival.durationStr} - Máy bay: ${selectedFlightArrival.aircraft.name}
                                    </p>

                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${trip == null}">
                        <div class="container" style="margin-top: 20px">
                            <div class="row text-center" style="padding-left: 50%">
                                <button onclick="location.href = '${pageContext.request.contextPath}/bookingdetail'" class="btn btn-warning">Tiếp tục</button>
                            </div>
                        </div>                   
                    </c:if>
                    <c:if test="${trip != null && direction == 'trip'}">
                        <div class="container" style="margin-top: 20px">
                            <div class="row text-center" style="padding-left: 50%">
                                <button onclick="location.href = '${pageContext.request.contextPath}/search-flight-arrival'" class="btn btn-warning">Tiếp tục</button>
                            </div>
                        </div> 
                    </c:if>
                    <c:if test="${trip != null && direction != 'trip'}">
                        <div class="container" style="margin-top: 20px">
                            <div class="row text-center" style="padding-left: 50%">
                                <button onclick="location.href = '${pageContext.request.contextPath}/booking-detail-tow-trip'" class="btn btn-warning">Tiếp tục</button>
                            </div>
                        </div> 
                    </c:if>

                </div>
                    </c:if>
                    
                <c:if test="${trip == null}">
                    <div id="change-booking-detail"  class="col-4" >
                        <div class="container">
                            <div style="background-color: red;height: 56px" class="row">
                                <div style="padding-top: 15px;"  class="col-8">
                                    <h6 style="color: white">THÔNG TIN ĐẶT CHỖ</h6>
                                </div>
                                <div style="padding-top: 8px;" class="col-4"><p  style="padding-top: 5px;width: 89px;height: 39px; border: 1px solid blue; padding-left: 10px;border-radius: 50%;background-color: yellow">Chi Tiết</p></div>
                            </div>
                        </div>

                        <div class="container" style="height: 47px;background-color: rgb(201, 239, 255);padding-left: 18px;padding-top: 13px">
                            <p>Chuyến đi</p>
                        </div>
                        <div class="container" style="height: 286px;background-color: white;">
                            <div class="row" style="padding-top: 18px">
                                <div class="col-5"><p>${departure}</p></div>
                                <div class="col-2"><img src="https://www.vietjetair.com/static/media/thai-vietjet.535af1a2.svg"/></div>
                                <div class="col-5"><p>${destination}</p></div>

                            </div>
                            <div class="row" style="padding-top: 18px">
                                <div class="col-12" style="margin-left: 15px">
                                    <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                                        <div class="col-4" style="padding-top: 13px">Giá Vé</div>
                                        <div class="col-2"></div>
                                        <div class="col-6" style="padding-top: 13px">
                                            
                                            <fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "0" value = "${selectedFlight.flightRoute.satandarPrice}" />
                                            VND
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 18px">
                                <div class="col-12" style="margin-left: 15px">
                                    <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                                        <div class="col-5" style="padding-top: 13px">Số lượng vé</div>
                                        <div class="col-2"></div>
                                        <div class="col-5" style="padding-top: 13px"><p>${quantity}</p></div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="padding-top: 18px">
                                <div class="col-12" style="margin-left: 15px">
                                    <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                                        <div class="col-5" style="padding-top: 13px">Giảm giá</div>
                                        <div class="col-2"></div>
                                        <div class="col-5" style="padding-top: 13px">${selectedFlight.discountSave} %</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="container">
                            <div style="background-color: red;height: 56px" class="row">
                                <div style="padding-top: 15px;"  class="col-8">
                                    <h6 style="color: white">TỔNG TIỀN</h6>
                                </div>
                                <div style="padding-top: 15px;" class="col-4"><h6 style="color: white">
                                        <fmt:formatNumber type = "number" 
                                                          maxFractionDigits = "0" value = " ${selectedFlight.flightRoute.satandarPrice - selectedFlight.flightRoute.satandarPrice * selectedFlight.discountSave /100}" />
                                        VND
                                    </h6></div>
                            </div>
                        </div>

                    </div>
                </c:if>
                <c:if test="${trip != null}">
                    <div id="change-booking-detail"  class="col-4" >
                        <div class="container">
                            <div style="background-color: red;height: 56px" class="row">
                                <div style="padding-top: 15px;"  class="col-8">
                                    <h6 style="color: white">THÔNG TIN ĐẶT CHỖ</h6>
                                </div>
                                <div style="padding-top: 8px;" class="col-4"><p  style="padding-top: 5px;width: 89px;height: 39px; border: 1px solid blue; padding-left: 10px;border-radius: 50%;background-color: yellow">Chi Tiết</p></div>
                            </div>
                        </div>

                        <div class="container" style="height: 47px;background-color: rgb(201, 239, 255);padding-left: 18px;padding-top: 13px">
                            <p>Chuyến đi</p>
                        </div>
                        <div class="container" style="height: 286px;background-color: white;">
                            <div class="row" style="padding-top: 18px">
                                <div class="col-5"><p>${departure}</p></div>
                                <div class="col-2"><img src="https://www.vietjetair.com/static/media/thai-vietjet.535af1a2.svg"/></div>
                                <div class="col-5"><p>${destination}</p></div>

                            </div>
                            <div class="row" style="padding-top: 18px">
                                <div class="col-12" style="margin-left: 15px">
                                    <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                                        <div class="col-4" style="padding-top: 13px">Giá Vé</div>
                                        <div class="col-2"></div>
                                        <div class="col-6" style="padding-top: 13px">
                                            <fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "0" value = "${selectedFlight.flightRoute.satandarPrice}" />
                                            VND
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 18px">
                                <div class="col-12" style="margin-left: 15px">
                                    <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                                        <div class="col-5" style="padding-top: 13px">Số lượng vé</div>
                                        <div class="col-2"></div>
                                        <div class="col-5" style="padding-top: 13px"><p>${quantity}</p></div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="padding-top: 18px">
                                <div class="col-12" style="margin-left: 15px">
                                    <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                                        <div class="col-5" style="padding-top: 13px">Giảm giá</div>
                                        <div class="col-2"></div>
                                        <div class="col-5" style="padding-top: 13px">${selectedFlight.discountSave} %</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="container" style="height: 47px;background-color: rgb(201, 239, 255);padding-left: 18px;padding-top: 13px">
                            <p>Chuyến về</p>
                        </div>
                        <div class="container" style="height: 286px;background-color: white;">
                            <div class="row" style="padding-top: 18px">
                                <div class="col-5"><p>${destination}</p></div>
                                <div class="col-2"><img src="https://www.vietjetair.com/static/media/thai-vietjet.535af1a2.svg"/></div>
                                <div class="col-5"><p>${departure}</p></div>

                            </div>
                            <div class="row" style="padding-top: 18px">
                                <div class="col-12" style="margin-left: 15px">
                                    <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                                        <div class="col-4" style="padding-top: 13px">Giá Vé</div>
                                        <div class="col-2"></div>
                                        <div class="col-6" style="padding-top: 13px">
                                            <fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "0" value = "${selectedFlightArrival.flightRoute.satandarPrice}" />
                                            VND
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 18px">
                                <div class="col-12" style="margin-left: 15px">
                                    <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                                        <div class="col-5" style="padding-top: 13px">Số lượng vé</div>
                                        <div class="col-2"></div>
                                        <c:if test="${selectedFlightArrival != null}">
                                             <div class="col-5" style="padding-top: 13px"><p>${quantity}</p></div>
                                        </c:if>
                                       
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding-top: 18px">
                                <div class="col-12" style="margin-left: 15px">
                                    <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                                        <div class="col-5" style="padding-top: 13px">Giảm giá</div>
                                        <div class="col-2"></div>
                                        <c:if test="${selectedFlightArrival != null}">
                                            <div class="col-5" style="padding-top: 13px">${selectedFlightArrival.discountSave} %</div>
                                        </c:if>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div style="background-color: red;height: 56px" class="row">
                                <div style="padding-top: 15px;"  class="col-8">
                                    <h6 style="color: white">TỔNG TIỀN</h6>
                                </div>
                                <div style="padding-top: 15px;" class="col-4"><h6 style="color: white">
                                        <fmt:formatNumber type = "number" 
                                                          maxFractionDigits = "0" value = " ${selectedFlightArrival.flightRoute.satandarPrice * quantity - selectedFlightArrival.flightRoute.satandarPrice * quantity * selectedFlightArrival.discountSave / 100 + selectedFlight.flightRoute.satandarPrice * quantity - selectedFlight.flightRoute.satandarPrice * quantity * selectedFlight.discountSave / 100} " />
                                        VND
                                    </h6></div>
                            </div>
                        </div>

                    </div>
                </c:if>
            </div>
        </div>


        <script>
            function addTicketDetail(index) {
                var addDetailElement = document.querySelectorAll('.detail-booking');

                addDetailElement[index].classList.toggle('ticket-detail');
            }
        </script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/custom.js"></script>

    </body>
</html>
