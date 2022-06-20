
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
        <div  class="container-liquid"  style="width: 100%; background-color: yellow;padding-top: 10px; padding-left: 10px">
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
                        <p>Ngày Khởi Hành :<span style="color: red"> ${dateDepartSelector}</span></>
                    </div>

                    <div class="col-lg-3">
                        <p>Ngày Về : <span style="color: red"> ${dateArrivalSelector}</span></p>
                    </div>

                </div>         
            </c:if>    

        </div>
        <div style="margin-top: 20px" class="container">
            <div class="row">
                <div class="col-12">
                    <c:if test="${direction == 'trip'}"><h6>Chiều đi</h6></c:if>
                    <c:if test="${direction != 'trip'}"><h6>Chiều Về</h6></c:if>
                    </div>

                </div>
            </div>

            <div style="margin-top: 30px" class="container">
                <div id="change-select-flight"  class="row">
                    <div class="col-12">
                        <div class="container" style="background-color: white;height: 64px;" >
                            <div class="row">
                            <c:forEach var="c" items="${dateDepart}" varStatus="loop">
                                <c:if test="${loop.index == 1}">
                                    <div style="background-color: yellow;padding-left: 130px;height: 64px;padding-top: 20px"  class="col-4"><h5>${c}</h5></div>
                                        </c:if>
                                        <c:if test="${loop.index != 1}">
                                    <div class="col-4" style="padding-top: 20px;padding-left: 130px"><h5>${c}</h5></div>
                                        </c:if>
                                    </c:forEach>

                        </div>
                    </div>

                    <!--Begin booking-->
                    <c:if test="${direction == 'trip'}">
                        <c:if test="${flights.size() == 0}">
                            <div style="margin-top: 20px;" class="alert alert-danger" role="alert">
                                Không có chuyến bay nào phù hợp với tìm kiếm của bạn
                            </div>
                        </c:if>
                        <c:forEach var="flight" items="${flights}" varStatus="loop">
                            <div class="container" style="margin-top: 20px;height: 100px">
                                <div class="row">
                                    <div style="background-color: white" class="col-9">
                                        <div class="row">
                                            <div style="padding-top: 20px;padding-left: 50px" class="col-2">
                                                <h3>${flight.flightRoute.departure.city.postCode}</h3>
                                                <p><fmt:formatDate type = "time" 
                                                                value = "${flight.depart}" /></p>
                                            </div>
                                            <div class="col-2"></div>
                                            <div class="col-4 text-center">
                                                <p style="margin-top: 10px">${flight.durationStr}</p>
                                                <p  style="margin-top: -15px"><img src="https://www.vietjetair.com/static/media/vietjet.36ac4568.svg" /></p>
                                                <p style="margin-top: -15px"><span style="border-right: 2px solid;padding-right: 5px">Bay thẳng</span><span onclick="addTicketDetail(${loop.index})" style="padding-left: 5px;cursor: pointer">Chi tiết</span></p>
                                            </div>
                                            <div class="col-2"></div>
                                            <div style="padding-top: 20px" class="col-2">
                                                <h3>${flight.flightRoute.destination.city.postCode}</h3>
                                                <p><fmt:formatDate type = "time" 
                                                                value = "${flight.arrival}" /></p>
                                            </div>
                                        </div>

                                    </div>
                                    <div style="height: 100px;background-color: greenyellow; padding-top: 20px; color: #08c" class="col-3 text-center">

                                        <c:if test="${flight.discountSave > 0}">
                                            <div class="row">
                                                <div class="col-3"><p style="margin-top: -10px">Giảm giá : ${flight.discountSave} %</p></div>
                                                <div class="col-6"><p><button onclick="location.href = '${pageContext.request.contextPath}/select-flight/${loop.index}'" style="background: yellow;margin-top: 10px" class="btn warning">Chọn vé</button></p></div>
                                                <div class="col-2"><p style="margin-top: -10px">Còn ${flight.emptySeat} chỗ</p></div>
                                            </div>
                                        </c:if>
                                        <c:if test="${flight.discountSave == 0}">
                                            <div ><p><button onclick="location.href = '${pageContext.request.contextPath}/select-flight/${loop.index}'" style="background: yellow" class="btn warning">Chọn vé</button></p></div>
                                            <div><p style="margin-top: -10px">Còn ${flight.emptySeat} chỗ</p></div>
                                        </c:if>




                                    </div>
                                </div>

                            </div>

                            <div id="add-detail" class="detail-booking">
                                <div class="container" style="background-color: whitesmoke;height: 240px;padding-top: 20px;padding-left: 40px">
                                    <div class="row">
                                        <img src="https://www.vietjetair.com/static/media/vietjet.36ac4568.svg" />
                                        <span style="margin-left: 10px">Số hiệu chuyến bay : </span>
                                        <span style="margin-left: 10px;color: red" > VJ ${flight.id}</span>
                                    </div>
                                    <div style="margin-top: 10px" class="row">
                                        <div class="col-1">
                                            <p>KHỞI HÀNH</p>
                                        </div>
                                        <div class="col-11">
                                            <!--                                <p>17:45, 25/10/2021 (Giờ địa phương)</p>-->
                                            <!--                                    <p style="margin-top: -18px">Tp. Hồ Chí Minh - Sân bay Tân Sơn Nhất</p>-->
                                            <p > ${departure} - ${flight.flightRoute.departure.name}</p>
                                        </div>
                                    </div>
                                    <div style="margin-top: 10px" class="row">
                                        <div class="col-1">
                                            <p>ĐẾN</p>
                                        </div>
                                        <div class="col-11">
                                            <!--                                    <p>19:05, 25/10/2021 (Giờ địa phương)</p>
                                                                                <p style="margin-top: -18px">Đà Nẵng - Sân bay Đà Nẵng</p>-->
                                            <p > ${destination} - ${flight.flightRoute.destination.name}</p>
                                        </div>
                                    </div>
                                    <div style="margin-top: 10px" class="row">
                                        <div class="col-1">

                                        </div>
                                        <div class="col-11">
                                            <p>
                                                Thời gian: ${flight.durationStr} - Máy bay: ${flight.aircraft.name}
                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${direction != 'trip'}">
                         <c:if test="${flightsArrival.size() == 0}">
                            <div style="margin-top: 20px;" class="alert alert-danger" role="alert">
                                Không có chuyến bay nào phù hợp với tìm kiếm của bạn
                            </div>
                        </c:if>
                        <c:forEach var="flight" items="${flightsArrival}" varStatus="loop">
                            <div class="container" style="margin-top: 20px;height: 100px">
                                <div class="row">
                                    <div style="background-color: white" class="col-9">
                                        <div class="row">
                                            <div style="padding-top: 20px;padding-left: 50px" class="col-2">
                                                <h3>${flight.flightRoute.departure.city.postCode}</h3>
                                                <p>10:05</p> 
                                            </div>
                                            <div class="col-2"></div>
                                            <div class="col-4 text-center">
                                                <p style="margin-top: 10px">${flight.durationStr}</p>
                                                <p  style="margin-top: -15px"><img src="https://www.vietjetair.com/static/media/vietjet.36ac4568.svg" /></p>
                                                <p style="margin-top: -15px"><span style="border-right: 2px solid;padding-right: 5px">Bay thẳng</span><span onclick="addTicketDetail(${loop.index})" style="padding-left: 5px;cursor: pointer">Chi tiết</span></p>
                                            </div>
                                            <div class="col-2"></div>
                                            <div style="padding-top: 20px" class="col-2">
                                                <h3>${flight.flightRoute.destination.city.postCode}</h3>
                                                <p>10:05</p>
                                            </div>
                                        </div>

                                    </div>
                                    <div style="height: 100px;background-color: greenyellow; padding-top: 20px; color: #08c" class="col-3 text-center">
                                        <p><button onclick="location.href = '${pageContext.request.contextPath}/select-flight-arrival/${loop.index}'" style="background: yellow" class="btn warning">Chọn vé</button></p>
                                        <p style="margin-top: -10px">Còn ${flight.emptySeat} chỗ</p>
                                    </div>
                                </div>

                            </div>

                            <div id="add-detail" class="detail-booking">
                                <div class="container" style="background-color: whitesmoke;height: 240px;padding-top: 20px;padding-left: 40px">
                                    <div class="row">
                                        <img src="https://www.vietjetair.com/static/media/vietjet.36ac4568.svg" />
                                        <span style="margin-left: 10px">Số hiệu chuyến bay : </span>
                                        <span style="margin-left: 10px;color: red" > VJ ${flight.id}</span>
                                    </div>
                                    <div style="margin-top: 10px" class="row">
                                        <div class="col-1">
                                            <p>KHỞI HÀNH</p>
                                        </div>
                                        <div class="col-11">
                                            <!--                                <p>17:45, 25/10/2021 (Giờ địa phương)</p>-->
                                            <!--                                    <p style="margin-top: -18px">Tp. Hồ Chí Minh - Sân bay Tân Sơn Nhất</p>-->

                                            <p > ${destination}  - ${flight.flightRoute.departure.name}</p>
                                        </div>
                                    </div>
                                    <div style="margin-top: 10px" class="row">
                                        <div class="col-1">
                                            <p>ĐẾN</p>
                                        </div>
                                        <div class="col-11">
                                            <!--                                    <p>19:05, 25/10/2021 (Giờ địa phương)</p>
                                                                                <p style="margin-top: -18px">Đà Nẵng - Sân bay Đà Nẵng</p>-->
                                            <p > ${departure}  - ${flight.flightRoute.destination.name}</p>
                                        </div>
                                    </div>
                                    <div style="margin-top: 10px" class="row">
                                        <div class="col-1">

                                        </div>
                                        <div class="col-11">
                                            <p>
                                                Thời gian: ${flight.durationStr} - Máy bay: ${flight.aircraft.name}
                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>


                    <!--                End booking-->

                </div>

            </div>
        </div>


        <script>
            function addTicketDetail(index) {
                var addDetailElement = document.querySelectorAll('.detail-booking');

                addDetailElement[index].classList.toggle('ticket-detail');
            }
        </script>

    </body>
</html>
