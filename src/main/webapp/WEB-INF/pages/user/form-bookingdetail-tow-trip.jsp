
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .seat-daigram{
                display: none
            }

        </style>
        <!-- icons -->
        <link href="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!--bootstrap -->
        <link href="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Material Design Lite CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/material/material.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/form/assets/css/material_style.css">
        <!-- animation -->
        <link href="${pageContext.request.contextPath}/resources-guest/form/assets/css/pages/animate_page.css" rel="stylesheet">
        <!-- Template Styles -->
        <link href="${pageContext.request.contextPath}/resources-guest/form/assets/css/style.css" rel="stylesheet" type="text/css" />

        <link href="${pageContext.request.contextPath}/resources-guest/form/assets/css/responsive.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources-guest/form/assets/css/theme-color.css" rel="stylesheet" type="text/css" />
        <!-- dropzone -->
        <link href="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/dropzone/dropzone.css" rel="stylesheet" media="screen">
        <!-- Date Time item CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.css" />
        <!-- favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources-guest/form/assets/img/favicon.ico" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
         <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/resources-user/js/item-quantity-dropdown.min.css"
            />
        <link
            rel="stylesheet"
            href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700"
            />
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <%@include file="/WEB-INF/pages/include/user/header.jsp" %>

        <!-- start page content -->
        <div class="container page-content-wrapper">
            <div class="page-content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box">
                            <div class="card-head">
                                <c:if test="${loopForm == 0}">
                                    <header>Nh???p Th??ng Tin Ng?????i ?????t V??</header>
                                    
                                </c:if>
                                <c:if test="${loopForm != 0}">
                                    <header>Nh???p Th??ng Tin H??nh Kh??ch ${loopForm}</header>
                                </c:if>
                                    <input style="display: none" id="loop-form" value="${loopForm}"/>
                                    <c:forEach var="bookingDetail" items="${bookingDetails}">
                                        <input type="text" class="validate-id-cart" style="display: none" id="loop-form" value="${bookingDetail.passenger.idenCode}"/>
                                    </c:forEach>
                                    <span onclick="displaySeatDiagram()" style="float: right; padding-right: 50px;cursor: pointer">Xem s?? ????? gh???</span>
                            </div>
                          
                            <div id="seat-daigram" class="seat-daigram" style="padding-bottom: 100px;padding-right: 50px;padding-left: 50px">
                                <div class="col-lg-6 p-t-20">
                                    <img style="width: 300px;height: 950px" src="https://vietjet.net/includes/uploads/2017/11/so-do-cho-ngoi-may-bay-vietjet.png">
                                </div>
                                <div class="col-lg-6 p-t-20">
                                   
                                    <p >
                                        S?? ????? ch??? ng???i tr??n m??y bay h??ng Vietjet Air 
                                        <br/>
                                        Hi???n t???i, m???i m??y bay c???a Vietjet Air s??? bao g???m kho???ng 93 ch??? ng???i,
                                        v?? ???????c b??? tr?? th??nh 2 d??y ch??? ng???i l???n c??ch nhau b???i l???i ??i ch??nh ??? gi???a.
                                        M???i d??y l???n s??? c?? 3 d??y nh??? ???????c ????nh s??? th??? t??? l?? A ??? B ??? C (3 d??y n??y n???m ngay g???n l???i
                                        l??n xu???ng c???a m??y bay) v?? D ??? E ??? F (n???m b??n ph??a c??n l???i).
                                        93 ch??? ng???i ???????c chia th??nh 31 h??ng gh??? ???????c ????nh s??? th??? t??? t??? 1 ?????n 31,
                                        b???n c?? th??? tham kh???o v??? s?? ????? ch??? ng???i tr??n m??y bay h??ng Vietjet Air ???????c chia l??m 3 ph???n nh?? sau:
                                        Khu v???c ch??? ng???i ph??a tr?????c.
                                        ????y l?? khu v???c h??ng gh??? ????? (nh?? h??nh) bao g???m c??c h??ng gh??? ???????c ????nh s??? t??? 1 ?????n 5.

                                        Nh???ng h??ng gh??? n??y ?????c bi???t ??? ??i???m c?? ch??? ng???i r???t r???ng v?? tho??i m??i, y??n t??nh.
                                        C??c h??ng gh??? ?????u n??y th?????ng ???????c r???t nhi???u h??nh
                                        kh??ch l???a ch???n b???i ?????m b???o ???????c t???i ??a s??? tho???i m??i h??n.

                                        N???u b???n mu???n c?? ch??? ng???i r???ng r??i, tho???i m??i th?? b???n n??n l???a ch???n khu v???c n??y.

                                        Khu v???c h??ng gh??? th??ng th?????ng.
                                        ????y l?? khu v???c h??ng gh??? m??u xanh l?? c??y (nh?? h??nh) bao g???m c??c h??ng gh??? ???????c ????nh s??? t??? 6 ??? 11 v?? 15 ??? 31.

                                        H??ng gh??? t??? 6 ??? 12 l?? nh???ng h??ng gh??? th??ng th?????ng, c?? khu v???c ????? ch??n gi???i h???n, kh??ng ???????c tho???i m??i nh?? h??ng gh??? t??? 1 ??? 5.

                                        N???u b???n l?? ng?????i d??? b??? say m??y bay, ho???c s???c kh???e kh??ng ???n ?????nh,
                                        hay b??? m???t m???i th?? ch??ng t??i khuy??n b???n kh??ng n??n ch???n nh???ng h??ng gh??? ph??a sau c??nh m??y bay,
                                        ?????c bi???t l?? c??c v??? tr?? t??? h??ng 25 ??? 31. ????y l?? khu v???c ti???p x??c g???n nh???t v???i ?????ng c??, do ???? kh?? ???n ??o trong qu?? tr??nh c???t c??nh v?? h??? c??nh. ?????ng th???i, ????y c??ng l?? v??? tr?? d??? b??? rung l???c nh???t v?? v???i c?????ng ????? nhi???u h??n so v???i c??c v??? tr?? b??n tr??n.

                                        Khu v???c h??ng gh??? c???nh c???a tho??t hi???m.
                                        ????y l?? khu v???c h??ng gh??? ???????c ????nh s??? th??? t??? l?? 12 v?? 14 v?? c?? m??u xanh d????ng (nh?? h??nh).
                                        Nh???ng h??ng gh??? n??y n???m ngay c???nh khu v???c c???a tho??t hi???m, do ???? khu v???c ????? ch??n ph??a tr?????c kh?? r???ng r??i v?? tho???i m??i (ch??? ????? ch???n c?? kho???ng c??ch r???ng h??n h??ng gh??? t??? s??? 1 ??? 5).

                                        Ngo??i ra, nh???ng gh??? ngay s??t c???a s??? ho???c l???i ??i c??ng ???????c r???t nhi???u h??nh kh??ch l???a ch???n v?? d??? d??ng di chuy???n c??ng nh?? ng???m khung c???nh b??n ngo??i khi m??y bay c???t c??nh v?? h??? c??nh.
                                    </p>
                                </div>
                            </div>
                            <c:if test="${loopForm == 0}">
                                <mvc:form id="add-bookingdetail-form-arrival" action="${pageContext.request.contextPath}/booking-info-tow-trip" method="get" modelAttribute="bookingInfo">
                                <div class="card-body row">
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="fullName" class = "mdl-textfield__input" type = "text" id = "full-name" value="${userInfo.fullName}">
                                            <label class = "mdl-textfield__label">T??n ?????y ?????</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                            <input name="gender" class="mdl-textfield__input" type="text" id="gender" value="${userInfo.gender}" readonly tabIndex="-1">
                                            <label for="gender" class="pull-right margin-0">
                                                <i class="mdl-icon-toggle__label material-icons" style="color: black;font-size: 18px">keyboard_arrow_down</i>
                                            </label>
                                            <label for="gender" class="mdl-textfield__label">Gi???i t??nh</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                            <ul data-mdl-for="gender" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
                                                <li class="mdl-menu__item" data-val="1">Nam</li>
                                                <li class="mdl-menu__item" data-val="2">N???</li>
                                                <li class="mdl-menu__item" data-val="3">Kh??c</li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20">
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="phoneNumber" class = "mdl-textfield__input" type = "text" value="${userInfo.phoneNumber}"
                                                   id = "phone-number">
                                            <label class = "mdl-textfield__label" for = "phone-number">S??? ??i???n tho???i</label>

                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="birthDateStr" class = "mdl-textfield__input" type = "date" id = "birth-day" value="<fmt:formatDate pattern = "yyyy-MM-dd" 
                                              value = "${userInfo.birthDate}" />">
                                            <label style="padding-left: 200px" class = "mdl-textfield__label">Ng??y th??ng n??m sinh</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="address" class = "mdl-textfield__input" type = "text" id = "address" value="${userInfo.address}">
                                            <label class = "mdl-textfield__label">?????a Ch???</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="email" class = "mdl-textfield__input" type = "text" id = "email" value="${userInfo.email}">
                                            <label class = "mdl-textfield__label">Email</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12 p-t-20 text-center"> 
                                        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">??i ti???p</button>
                                    </div>
                                </div>
                            </mvc:form>
                            </c:if>
                            <c:if test="${loopForm != 0}">
                                
                                <mvc:form id="add-bookingdetail-form-arrival" action="${pageContext.request.contextPath}/select-seat-tow-trip" method="get" modelAttribute="bookingdetail">
                                <div class="card-body row">
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="passenger.fullName" class = "mdl-textfield__input" type = "text" id = "full-name">
                                            <label class = "mdl-textfield__label">T??n ?????y ?????</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                            <input name="passenger.gender" class="mdl-textfield__input" type="text" id="gender" value="" readonly tabIndex="-1">
                                            <label for="gender" class="pull-right margin-0">
                                                <i class="mdl-icon-toggle__label material-icons" style="color: black;font-size: 18px">keyboard_arrow_down</i>
                                            </label>
                                            <label for="gender" class="mdl-textfield__label">Gi???i t??nh</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                            <ul data-mdl-for="gender" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
                                                <li class="mdl-menu__item" data-val="1">Nam</li>
                                                <li class="mdl-menu__item" data-val="2">N???</li>
                                                <li class="mdl-menu__item" data-val="3">Kh??c</li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20">
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="passenger.phoneNumber" class = "mdl-textfield__input" type = "text" 
                                                   id = "phone-number">
                                            <label class = "mdl-textfield__label" for = "phone-number">S??? ??i???n tho???i</label>

                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="birthDateStr" class = "mdl-textfield__input" type = "date" id = "birth-day">
                                            <label style="padding-left: 200px" class = "mdl-textfield__label">Ng??y th??ng n??m sinh</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="passenger.address" class = "mdl-textfield__input" type = "text" id = "address">
                                            <label class = "mdl-textfield__label">?????a Ch???</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20">
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="passenger.idenCode" class = "mdl-textfield__input" type = "text" 
                                                   id = "id-cart">
                                            <label class = "mdl-textfield__label" for = "id-cart">S??? CMND/H??? Chi???u</label>                                   
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12 p-t-20">
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="passenger.email" class = "mdl-textfield__input" type = "text" 
                                                   id = "email">
                                            <label class = "mdl-textfield__label" for = "email">Email</label>                                   
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12 p-t-20">

                                            <div class="custom iqdropdown mdl-textfield__input" style="border: none;padding-left: 0px">
                                                <p style="font-size: 13px;color:#AAAAAA ;" class="iqdropdown-selection "></p>
                                                <div class="iqdropdown-menu" style="overflow-y: auto;height: 250px">
                                                    <c:forEach var="service" items="${allService}">

                                                        <div
                                                            class="iqdropdown-menu-option"
                                                            data-id="${service.id}"
                                                            data-defaultcount="0"
                                                            data-mincount="0"
                                                            >
                                                            <div>
                                                                <p class="iqdropdown-item">${service.name} - <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${service.price}" /> VND</p>

                                                            </div>
                                                        </div>

                                                    </c:forEach>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-lg-12 p-t-20">
                                            <div id = "price-service" class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input  class = "mdl-textfield__input" type = "text" >
                                                <label class = "mdl-textfield__label" for = "price-service">Gi?? d???ch v???</label>                                   
                                                <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                            </div>
                                        </div>
                                    
                                        <div class="col-lg-6 p-t-20"> 
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                            <select name="seatTypeName" id="seat-type" class="mdl-textfield__input" >
                                                <option></option>
                                                <c:forEach var="resultsMap" items="${resultsMap}">
                                                    <option value="${resultsMap.value}">${resultsMap.key}</option>
                                                </c:forEach>
                                            </select>
                                            <label style="margin-top: -15px" for="seat" class="mdl-textfield__label">H???ng gh??? L?????t ??i</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>                                      
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                            <select id="seat" name="seat.number" class="mdl-textfield__input" >
                                                <option></option>
                                                
                                            </select>
                                            <label for="seat" style="margin-top: -15px" class="mdl-textfield__label">Gh??? l?????t ??i</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 p-t-20">
                                        <div id="seat-price" class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input id="id-price" disabled style="color: black" class = "mdl-textfield__input" type = "text" value="" >
                                            <label class = "mdl-textfield__label" for = "id-price">Gi?? gh??? l?????t ??i</label>                                   
                                        
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12 p-t-20">

                                            <div class="custom2 iqdropdown mdl-textfield__input" style="border: none;padding-left: 0px">
                                                <p style="font-size: 13px;color:#AAAAAA ;" class="iqdropdown-selection "></p>
                                                <div class="iqdropdown-menu" style="overflow-y: auto;height: 250px">
                                                    <c:forEach var="service2" items="${allService}">

                                                        <div
                                                            class="iqdropdown-menu-option"
                                                            data-id="${service2.id}"
                                                            data-defaultcount="0"
                                                            data-mincount="0"
                                                            >
                                                            <div>
                                                                <p class="iqdropdown-item">${service2.name} - <fmt:formatNumber type = "number" 
                                                                   maxFractionDigits = "0" value = "${service2.price}" /> VND</p>

                                                            </div>
                                                        </div>

                                                    </c:forEach>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="col-lg-12 p-t-20">
                                            <div id = "price-service-arrival" class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                <input  class = "mdl-textfield__input" type = "text" >
                                                <label class = "mdl-textfield__label" for = "price-service">Gi?? d???ch v???</label>                                   
                                                <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                            </div>
                                        </div>
                                    
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                            <select name="seatTypeNameArrival" id="seat-type-arrival" class="mdl-textfield__input" >
                                                <option></option>
                                                <c:forEach var="resultsMapArrival" items="${resultsMapArrival}">
                                                    <option value="${resultsMapArrival.value}">${resultsMapArrival.key}</option>
                                                </c:forEach>
                                            </select>
                                            <label style="margin-top: -15px" for="seat-type-arrival" class="mdl-textfield__label">H???ng gh??? L?????t v???</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>                                      
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                            <select id="seat-arrival" name="seatArrival" class="mdl-textfield__input" >
                                                <option></option>
                                                
                                            </select>
                                            <label for="seat-arrival" style="margin-top: -15px" class="mdl-textfield__label">Gh??? l?????t v???</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 p-t-20">
                                        <div id="seat-price-arrival" class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input id="id-price-arrival" disabled style="color: black" class = "mdl-textfield__input" type = "text" value="" >
                                            <label class = "mdl-textfield__label" for = "id-price-arrival">Gi?? gh??? l?????t v???</label>                                   
                                        
                                        </div>
                                    </div>
                               
                                    <div class="col-lg-12 p-t-20 text-center"> 
                                        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">??i ti???p</button>
                                    </div>
                                </div>
                            </mvc:form>
                                    </c:if>
                            
                        </div>
                    </div>
                </div> 
            </div>

        </div>
        <script src="${pageContext.request.contextPath}/resources-guest/js/validation.js"></script>                        
        <script>
            var loopForm = document.querySelector('#loop-form');
            
            if(loopForm.value == 0) {
                Validator({
                form: '#add-bookingdetail-form-arrival',
                rules: [
                    Validator.isFullName('#full-name'),
                    Validator.isGender('#gender'),
                    Validator.isPhoneNumber('#phone-number'),
                    Validator.isBirthDay('#birth-day'),
                    Validator.isAddress('#address'),
                    Validator.isEmail('#email')
               
                ]
            });
            } else {
                Validator({
                form: '#add-bookingdetail-form-arrival',
                rules: [
                    Validator.isFullName('#full-name'),
                    Validator.isGender('#gender'),
                    Validator.isPhoneNumber('#phone-number'),
                    Validator.isBirthDay('#birth-day'),
                    Validator.isAddress('#address'),
                    Validator.isIdCart('#id-cart'),
                    Validator.isSeat('#seat'),
                    Validator.isSeatType('#seat-type'),
                    Validator.isSeatArrival('#seat-arrival'),
                    Validator.isSeatTypeArrival('#seat-type-arrival'),
                    Validator.isEmail('#email')
                ]
            });
            }
            
            function displaySeatDiagram() {
                var elementSeatDiagram = document.querySelector('#seat-daigram');
                elementSeatDiagram.classList.toggle('row');
            }
        </script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/custom.js"></script>

         <script
            src="https://code.jquery.com/jquery-3.0.0.min.js"
            integrity="sha256-JmvOoLtYsmqlsWxa7mDSLMwa6dZ9rrIdtrrVYRnDRH0="
            crossorigin="anonymous"
        ></script>

        <script type="text/javascript">
                                    $(document).ready(function () {

                                        $(".custom").iqDropdown({
                                            minItems: 0,
                                            maxItems: 20,
                                            selectionText: "d???ch v???",
                                            textPlural: "d???ch v???",
                                            onChange: function (id, count, totalItems) {
                                                $.ajax({
                                                    url: '/Spring_MVC_Project_Final/api-load-price-service',
                                                    type: 'get',
                                                    data: {
                                                        serviceId: id,
                                                        quantity: count
                                                    },
                                                    success: function (value) {
                                                    console.log(value);
                                                    $('#price-service').html(value);
                                                    }
                                                });
                                                console.log(id, count, totalItems);
                                            },
                                            beforeDecrement: function (id, itemCount) {
                                                if (id === "adult") {
                                                    return itemCount.adult > itemCount.infant;
                                                }
                                                return true;
                                            },
                                            beforeIncrement: function (id, itemCount) {
                                                if (id === "infant") {
                                                    return itemCount.adult > itemCount.infant;
                                                }
                                                return true;
                                            }
                                        });
                                        $(".custom2").iqDropdown({
                                            minItems: 0,
                                            maxItems: 20,
                                            selectionText: "d???ch v???",
                                            textPlural: "d???ch v???",
                                            onChange: function (id, count, totalItems) {
                                                $.ajax({
                                                    url: '/Spring_MVC_Project_Final/api-load-price-service-arrival',
                                                    type: 'get',
                                                    data: {
                                                        serviceId: id,
                                                        quantity: count
                                                    },
                                                    success: function (value) {
                                                    console.log(value);
                                                    $('#price-service-arrival').html(value);
                                                    }
                                                });
                                                console.log(id, count, totalItems);
                                            },
                                            beforeDecrement: function (id, itemCount) {
                                                if (id === "adult") {
                                                    return itemCount.adult > itemCount.infant;
                                                }
                                                return true;
                                            },
                                            beforeIncrement: function (id, itemCount) {
                                                if (id === "infant") {
                                                    return itemCount.adult > itemCount.infant;
                                                }
                                                return true;
                                            }
                                        });
                                        
                                    });
        </script>
        <script src="${pageContext.request.contextPath}/resources-user/js/item-quantity-dropdown.min.js"></script>

        <!-- start js include path -->
    
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/popper/popper.min.js" ></script>
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/jquery-blockui/jquery.blockui.min.js" ></script>
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- bootstrap -->
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/bootstrap/js/bootstrap.min.js" ></script>
        <!-- Common js-->
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/js/app.js" ></script>
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/js/layout.js" ></script>
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/js/theme-color.js" ></script>
        <!-- Material -->
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/material/material.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/js/pages/material_select/getmdl-select.js" ></script>
        <script  src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/material-datetimepicker/moment-with-locales.min.js"></script>
        <script  src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/material-datetimepicker/bootstrap-material-datetimepicker.js"></script>
        <script  src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/material-datetimepicker/datetimepicker.js"></script>
        <!-- dropzone -->
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/dropzone/dropzone.js" ></script>
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/dropzone/dropzone-call.js" ></script>
        <!-- animation -->
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/js/pages/ui/animations.js" ></script>
        <!-- end js include path -->
    </body>
</html>
