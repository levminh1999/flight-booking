
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<c:forEach var="uBooking" items="${userBooking}" varStatus="loop">
    <fmt:formatDate pattern = "dd-MM-yyyy" 
                    value = "${now}" var="userNow" />
    <fmt:formatDate pattern = "dd-MM-yyyy" 
                    value = "${uBooking.bookingDetail.get(0).flight.depart}" var="userBooking" />
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
                              groupingUsed = "false" value = "${uBooking.totalPrice}" /> VND
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
            <fmt:formatDate type = "both" 
                            dateStyle = "short" timeStyle = "short" value = "${uBooking.bookingDetail.get(uBooking.bookingDetail.size()-1).flight.depart}" />
        </td>

        <td class="text-right">
            <div class="dropdown">
                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-ellipsis-v"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/user/booking-detail/${uBooking.id}/${uBooking.direction}">Xem chi tiết</a>
                    <c:if test="${ userBooking > userNow && uBooking.bookingStatus != 'CANCEL'}">
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
                    <p class="modal-title text-center" > Sau khi bạn hủy vé sẽ bị mất 10% số tiền vé ! Bạn có đồng ý </p>

                </div>

                <div class="modal-footer">

                    <button style="float: right" type="button" class="btn btn-success" data-dismiss="modal" >Đóng</button>
                    <a data-dismiss="modal" id="cancel" onclick="cancelTicket(${uBooking.id})"><button style="margin-right: 190px" type="button" class="btn btn-danger" >Hủy Vé</button></a>
<!--                                                                <a id="cancel"  href="${pageContext.request.contextPath}/user/change-booking-user/${uBooking.id}" ><button style="margin-right: 190px" type="button" class="btn btn-danger" >Hủy Vé</button></a>-->
                </div>
            </div>
        </div>
    </div>
    <!--                                                End Modal -->

</c:forEach> 