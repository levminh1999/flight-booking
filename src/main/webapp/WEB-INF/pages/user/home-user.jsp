
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-user/css/table.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-user/css/menu.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/css/ticket.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
        <!-- jQuery library -->
        <link rel="canonical" href="http://www.demo.freshdesignweb.com/web-hosting-templates-css3.html" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources-user/css/style.css" media="all"/>

        <style>
            #cancel:hover {
                background: none
            }
        </style>

    </head>
    <body style="background-color: #dadde6;overflow-x:hidden;">

        <%@include file="/WEB-INF/pages/include/user/header.jsp" %>

        <div class="sidebar-container" style="margin-top: 20px">
            <div class="sidebar-logo">
                <h6>${userInfo.fullName}</h6>

            </div>
            <ul class="sidebar-navigation">

                <li id="info11">
                    <a id="info1" class="active-li-a" href="#">
                        <i class="fa fa-user-circle" aria-hidden="true"></i> Thông tin tài khoản
                    </a>
                </li>
                <li id="info12">
                    <a id="info2" href="#">
                        <i class="fa fa-info-circle" aria-hidden="true"></i> Thông tin cá nhân
                    </a>
                </li>
                <li id="info13">
                    <a id="info3" href="#">
                        <i class="fa fa-plane" aria-hidden="true"></i> Lịch sử chuyến bay
                    </a>
                </li>

                <li id="info14">
                    <a id="info4" href="#">
                        <i class="fa fa-history" aria-hidden="true"></i> Lịch sử giao dịch
                    </a>
                </li>

            </ul>
        </div>

        <div class="content-container">

            <div class="container-fluid" >

                <!-- Main component for a primary marketing message or call to action -->
                <div class="jumbotron">
                    <div class="flight-engine" style="width: 114%;margin-top: -85px;margin-left: -68px">
                        <mvc:form id="search-form"  action="${pageContext.request.contextPath}/search-flight" method="get" modelAttribute="flight">
                            <div class="container">
                                <div class="tabing">
                                    <ul>
                                        <li> <input checked="true" id="check-oneway" onclick="handleClick()" type="radio"  value="ow" name="trip"> Một chiều
                                        </li>
                                        <li><input onclick="handleClick2()" type="radio"  id="round" value="kh" name="trip"> Khứ hồi
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="1" class="tab1 active">
                                            <div class="flight-tab row">
                                                <div class="persent-one">
                                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                    <select name="flightRoute.departure.id" id="departure" class="textboxstyle">
                                                        <option value="null">Điểm Khởi Hành</option>
                                                        <c:forEach var="airport" items="${airports}">
                                                            <option value="${airport.id}">${airport.city.name}</option>
                                                        </c:forEach>

                                                    </select>
                                                    <span class="form-message" style="color: red;font-size: 12px"></span>
                                                </div>
                                                <div class="persent-one">
                                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                    <select class="textboxstyle" id="destination"  name="flightRoute.destination.id">
                                                        <option value="null">Điểm đến</option>
                                                    </select>
                                                    <span class="form-message" style="color: red;font-size: 12px"></span>
                                                </div>
                                                <div class="persent-one less-per">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                    <input id="depart"  name="departStr" type="text"class="textboxstyle" placeholder= "Ngày đi" onfocus="(this.type = 'date')" onblur="(this.type = 'text')">
                                                    <span class="form-message" style="color: red;font-size: 12px"></span>
                                                </div>
                                                <div class="persent-one less-per">
                                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                                    <input disabled="true" id="arrival" name="arrivalStr" type="text" class="textboxstyle" placeholder="Ngày về" onfocus="(this.type = 'date')" onblur="(this.type = 'text')">
                                                    <span class="form-message" style="color: red;font-size: 12px"></span>
                                                </div>

                                                <div class="persent-one less-btn">
                                                    <input type="Submit" name="submit" value="Tìm kiếm" class="btn btn-info cst-btn" id="srch">
                                                </div>
                                            </div>
                                            <!-- flight tab -->
                                        </div>


                                    </div>
                                </div>
                                <!-- tab content -->
                            </div>
                        </mvc:form>
                        <!-- tabbing -->
                    </div>





                </div>


            </div>
        </div>
        <div class="content-container" style="padding-left: 200px">
            <div class="container-fluid" >
                <section id="info-account" class="container" style="padding-top: 10px;width: 102%">
                    <div class="row">
                        <article class="card1 fl-left">
                            <section class="date" style="width: 38%">
                                <time datetime="23th feb">
                                    <span style="font-size: 20px"><fmt:formatDate pattern = "dd-MM-yyyy" 
                                                    value = "${now}" /></span>
                                </time>
                            </section>
                            <section class="card-cont">

                                <h3>Thông tin tài khoản</h3>
                                <div class="even-info">
                                    <i style="padding-right: 10px;" class="fa fa-envelope"></i>
                                    <p>
                                        Email : <%=SecurityUtils.viewHome()%>
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px;font-size: 20px" class="fa fa-lock"></i>
                                    <p>
                                        Mật Khẩu :  *_*_*_*_*_*_*_*_*_*_*_*
                                    </p>
                                </div>

                                <a href="${pageContext.request.contextPath}/user/change-password">Thay đổi mật khẩu</a>
                            </section>
                        </article>
                    </div>



                </section>

                <section id="info-user" class="container active-onclick" style="padding-top: 10px;width: 102%">
                    <div class="row">
                        <article class="card1 fl-left">
                            <section class="date" style="width: 40%">
                                <time datetime="23th feb">
                                    <span style="font-size: 20px"><fmt:formatDate pattern = "dd-MM-yyyy" 
                                                    value = "${now}" /></span>
                                </time>
                            </section>
                            <section class="card-cont">

                                <h3>Thông tin cá nhân</h3>
                                <div class="even-info">
                                    <i style="padding-right: 10px;" class="fa fa-circle"></i>
                                    <p>
                                        Họ và tên : ${userInfo.fullName}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px;" class="fa fa-circle"></i>
                                    <p>
                                        Giới tính : ${userInfo.gender}
                                    </p>
                                </div>

                                <div class="even-info">
                                    <i style="padding-right: 10px;" class="fa fa-circle"></i>
                                    <p>
                                        Ngày Sinh : <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                        value = "${userInfo.birthDate}" />
                                    </p>
                                </div>

                                <div class="even-info">
                                    <i style="padding-right: 10px;" class="fa fa-circle"></i>
                                    <p>
                                        Số điện thoại :  ${userInfo.phoneNumber}
                                    </p>
                                </div>
                                <div class="even-info">
                                    <i style="padding-right: 10px;" class="fa fa-circle"></i>
                                    <p>
                                        Địa chỉ :  ${userInfo.address}
                                    </p>
                                </div>

                                <a style="" href="${pageContext.request.contextPath}/user/change-user-info">Thay đổi thông tin</a>
                            </section>
                        </article>
                    </div>

                </section>


            </div>
        </div>

        <div id="list-booking" class="content-container active-onclick" style="padding-left: 260px;padding-right: 30px">
            <div class="container-fluid" >
                <div style="text-align:center;">

                    <form id="search-booking-form" style="padding-top: 30px; padding-left: 20%" class="form-inline" action="">
                        <div class="row">

                            <div class="col-12">
                                <div class="row">
                                    <div class="col-4"><input id="start-date" type="text" class="form-control" placeholder="Từ ngày" id="" onfocus="(this.type = 'date')" onblur="(this.type = 'text')"></div>
                                    <div class="col-1"></div>
                                    <div class="col-4"><input id="end-date" type="text" class="form-control" placeholder="Đến ngày" id="pwd" onfocus="(this.type = 'date')" onblur="(this.type = 'text')"></div>

                                    <div class="col-3"><button id="search-booking" style="margin-left: 5%" type="submit" class="btn btn-primary">Tìm kiếm</button></div>
                                </div>
                            </div>

                        </div> 

                    </form>
                </div>
                <c:if test="${userBooking.size() == 0}">
                    <div style="margin-top: 30px" class="alert alert-danger" role="alert">
                        Chưa có giao dịch nào !
                    </div>
                </c:if>

                
                <div id="message-cancel" style="margin-top: 30px" class="alert alert-danger active-onclick" role="alert">
                        Hủy vé thành công
                    </div>
              
                <!--             bigin test-->

                <div class="main-content">
                    <div class="container mt-7">
                        <!-- Table -->

                        <div class="row mt-5" style="width: 2130px; margin-left: -90px; padding-bottom: 50px;">
                            <div class="col">
                                <div class="card bg-default shadow">
                                    <div class="card-header bg-transparent border-0">
                                        <h3 class="text-white mb-0">Lịch sử giao dịch</h3>

                                    </div>
                                    <div class="table-responsive">
                                        <table class="table align-items-center table-dark table-flush">
                                            <thead class="thead-dark">

                                                <tr>
                                                    <th scope="col">Chuyến bay</th>
                                                    <th scope="col">Mã vé</th>
                                                    <th scope="col">Ngày đặt vé</th>
                                                    <th scope="col">Người đặt vé</th>
                                                    <th scope="col">Số hành khách</th>
                                                    <th scope="col" class="">Giá</th>
                                                    <th scope="col">Trạng thái</th>
                                                    <th scope="col">Điểm khởi hành</th>
                                                    <th scope="col">Điểm đến</th>
                                                    <th scope="col">Ngày khởi hành</th>
                                                    <th scope="col">Ngày về</th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody id="change-load-search-booking">
                                                <c:forEach var="uBooking" items="${userBooking}" varStatus="loop">

                                                    <tr>
                                                        <th scope="row">
                                                            <div class="media align-items-center">
                                                                <a href="#" class="avatar rounded-circle mr-3">
                                                                    <img alt="Image placeholder"
                                                                         src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/VietJet_Air_Airbus_A320_-_F-WWBR_-_MSN_5822_%2810512810046%29.jpg/1280px-VietJet_Air_Airbus_A320_-_F-WWBR_-_MSN_5822_%2810512810046%29.jpg">
                                                                </a>
                                                                <div class="media-body">
                                                                    <c:if test="${uBooking.direction == 'towTrip'}">
                                                                        <span class="mb-0 text-sm">Hai chiều</span>
                                                                    </c:if>
                                                                    <c:if test="${uBooking.direction != 'towTrip'}">
                                                                        <span class="mb-0 text-sm">Một chiều</span>
                                                                    </c:if>

                                                                </div>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            ${uBooking.bookingNumber}
                                                        </td>
                                                        <td>
                                                            <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                                            value = "${uBooking.bookingDate}" />
                                                        </td>
                                                        <td>
                                                            ${uBooking.fullName}
                                                        </td>
                                                        <td class="text-center">
                                                            <c:if test="${uBooking.direction == 'towTrip'}">
                                                                <fmt:formatNumber value="${uBooking.bookingDetail.size()/2}" />

                                                            </c:if>
                                                            <c:if test="${uBooking.direction != 'towTrip'}">
                                                                ${uBooking.bookingDetail.size()}
                                                            </c:if>
                                                        </td>
                                                        <td>
                                                            <fmt:formatNumber type = "number" 
                                                                              maxFractionDigits = "0" value = "${uBooking.totalPrice}" /> VND

                                                        </td>

                                                        <td>
                                                            <c:if test="${uBooking.direction != 'towTrip' && uBooking.bookingStatus != 'CANCEL' && now > uBooking.bookingDetail.get(0).flight.depart}">
                                                                Đã hoàn thành
                                                            </c:if>
                                                            <c:if test="${uBooking.direction == 'towTrip' && uBooking.bookingStatus != 'CANCEL' && now > uBooking.bookingDetail.get(uBooking.bookingDetail.size()-1).flight.depart}">
                                                                Đã hoàn thành
                                                            </c:if>
                                                            <c:if test="${uBooking.bookingStatus == 'BOOKED'&& now < uBooking.bookingDetail.get(0).flight.depart}">
                                                                Đã thanh toán
                                                            </c:if>
                                                            <c:if test="${uBooking.bookingStatus == 'CANCEL'}">
                                                                Đã hủy vé
                                                            </c:if>
                                                        </td>

                                                        <td>
                                                            ${uBooking.bookingDetail.get(0).flight.flightRoute.departure.name}
                                                        </td>

                                                        <td>
                                                            ${uBooking.bookingDetail.get(0).flight.flightRoute.destination.name}
                                                        </td>

                                                        <td>
                                                            <fmt:formatDate type = "both" 
                                                                            dateStyle = "short" timeStyle = "short" value = "${uBooking.bookingDetail.get(0).flight.depart}" />
                                                        </td>


                                                        <td>
                                                            <c:if test="${uBooking.direction == 'towTrip'}">
                                                                <fmt:formatDate type = "both" 
                                                                                dateStyle = "short" timeStyle = "short" value = "${uBooking.bookingDetail.get(uBooking.bookingDetail.size()-1).flight.depart}" />
                                                            </c:if>


                                                        </td>

                                                        <td class="text-right">
                                                            <div class="dropdown">
                                                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button"
                                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                    <i class="fas fa-ellipsis-v"></i>
                                                                </a>
                                                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/booking-detail/${uBooking.id}/${uBooking.direction}">Xem chi tiết</a>

                                                                    <c:if test="${now < uBooking.bookingDetail.get(0).flight.depart && uBooking.bookingStatus != 'CANCEL'}">
                                                                        <a data-toggle="modal" data-target="#myModal${uBooking.id}" class="dropdown-item" href="#">Hủy vé</a>

                                                                    </c:if>


                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <!--                                                    Begin Modal -->
                                                <div class="modal fade" id="myModal${uBooking.id}" role="dialog">
                                                    <div class="modal-dialog modal-sm">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <p class="modal-title text-center" > Sau khi bạn hủy vé sẽ bị mất 10% số tiền tiền vé ! Bạn có đồng ý </p>

                                                            </div>

                                                            <div class="modal-footer">
                                                                <button style="margin-left: 180px; position: absolute" type="button" class="btn btn-success" data-dismiss="modal" >Đóng</button>
                                                                <a data-dismiss="modal" id="cancel" onclick="cancelTicket(${uBooking.id})"><button style="margin-right: 190px" type="button" class="btn btn-danger" >Hủy Vé</button></a>
<!--                                                                <a id="cancel"  href="${pageContext.request.contextPath}/user/change-booking-user/${uBooking.id}" ><button style="margin-right: 190px" type="button" class="btn btn-danger" >Hủy Vé</button></a>-->

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--                                                End Modal -->

                                            </c:forEach> 
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>

                <!--                 end test-->



            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="${pageContext.request.contextPath}/resources-guest/js/validation.js"></script>
        <script>
                                        Validator({
                                            form: '#search-form',
                                            rules: [
                                                Validator.isDeparture('#departure'),
                                                Validator.isDestination('#destination'),
                                                Validator.isDepart('#depart'),
                                                Validator.isArrival('#arrival')
                                            ]
                                        });

                                        function cancelTicket(bookingId) {
                                            $.ajax({
                                                url: '/Spring_MVC_Project_Final/user/api/change-booking-user',
                                                type: 'get',
                                                data: {
                                                    bookingId: bookingId
                   
                                                },
                                                success: function (value) {
                                                    $('#message-cancel').removeClass('active-onclick');
                                                    $('#change-load-search-booking').html(value);
                                                }
                                            });
                                        }
        </script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/custom.js"></script>
        <script src="${pageContext.request.contextPath}/resources-user/js/jquery-click.js"></script>


        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </body>
</html>
