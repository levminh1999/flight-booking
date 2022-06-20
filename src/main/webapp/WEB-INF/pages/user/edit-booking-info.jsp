
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
                               
                                    <header>Thông Tin Người Đặt Vé</header>
                                    <c:forEach var="bookingDetail" items="${bookingDetails}">
                                        <input type="text" class="validate-id-cart" style="display: none" id="loop-form" value="${bookingDetail.passenger.idenCode}"/>
                                    </c:forEach>
                                    <span onclick="displaySeatDiagram()" style="float: right; padding-right: 50px;cursor: pointer">Xem sơ đồ ghế</span>
                            </div>
                          
                            <div id="seat-daigram" class="seat-daigram" style="padding-bottom: 100px;padding-right: 50px;padding-left: 50px">
                                <div class="col-lg-6 p-t-20">
                                    <img style="width: 300px;height: 950px" src="https://vietjet.net/includes/uploads/2017/11/so-do-cho-ngoi-may-bay-vietjet.png">
                                </div>
                                <div class="col-lg-6 p-t-20">
                                   
                                    <p >
                                        Sơ đồ chỗ ngồi trên máy bay hãng Vietjet Air 
                                        <br/>
                                        Hiện tại, mỗi máy bay của Vietjet Air sẽ bao gồm khoảng 93 chỗ ngồi,
                                        và được bố trí thành 2 dãy chỗ ngồi lớn cách nhau bởi lối đi chính ở giữa.
                                        Mỗi dãy lớn sẽ có 3 dãy nhỏ được đánh số thứ tự là A – B – C (3 dãy này nằm ngay gần lối
                                        lên xuống của máy bay) và D – E – F (nằm bên phía còn lại).
                                        93 chỗ ngồi được chia thành 31 hàng ghế được đánh số thứ tự từ 1 đến 31,
                                        bạn có thể tham khảo về sơ đồ chỗ ngồi trên máy bay hãng Vietjet Air được chia làm 3 phần như sau:
                                        Khu vực chỗ ngồi phía trước.
                                        Đây là khu vực hàng ghế đỏ (như hình) bao gồm các hàng ghế được đánh số từ 1 đến 5.

                                        Những hàng ghế này đặc biệt ở điểm có chỗ ngồi rất rộng và thoái mái, yên tĩnh.
                                        Các hàng ghế đầu này thường được rất nhiều hành
                                        khách lựa chọn bởi đảm bảo được tối đa sự thoải mái hơn.

                                        Nếu bạn muốn có chỗ ngồi rộng rãi, thoải mái thì bạn nên lựa chọn khu vực này.

                                        Khu vực hàng ghế thông thường.
                                        Đây là khu vực hàng ghế màu xanh lá cây (như hình) bao gồm các hàng ghế được đánh số từ 6 – 11 và 15 – 31.

                                        Hàng ghế từ 6 – 12 là những hàng ghế thông thường, có khu vực để chân giới hạn, không được thoải mái như hàng ghế từ 1 – 5.

                                        Nếu bạn là người dễ bị say máy bay, hoặc sức khỏe không ổn định,
                                        hay bị mệt mỏi thì chúng tôi khuyên bạn không nên chọn những hàng ghế phía sau cánh máy bay,
                                        đặc biệt là các vị trí từ hàng 25 – 31. Đây là khu vực tiếp xúc gần nhất với động cơ, do đó khá ồn ào trong quá trình cất cánh và hạ cánh. Đồng thời, đây cũng là vị trí dễ bị rung lắc nhất và với cường độ nhiều hơn so với các vị trí bên trên.

                                        Khu vực hàng ghế cạnh cửa thoát hiểm.
                                        Đây là khu vực hàng ghế được đánh số thứ tự là 12 và 14 và có màu xanh dương (như hình).
                                        Những hàng ghế này nằm ngay cạnh khu vực cửa thoát hiểm, do đó khu vực để chân phía trước khá rộng rãi và thoải mái (chỗ để chấn có khoảng cách rộng hơn hàng ghế từ số 1 – 5).

                                        Ngoài ra, những ghế ngay sát cửa sổ hoặc lối đi cũng được rất nhiều hành khách lựa chọn vì dễ dàng di chuyển cũng như ngắm khung cảnh bên ngoài khi máy bay cất cánh và hạ cánh.
                                    </p>
                                </div>
                            </div>
                           
                                <mvc:form id="edit-booking-form" action="${pageContext.request.contextPath}/submit-edit-booking-info" method="get" modelAttribute="editBooking">
                                <div class="card-body row">
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="fullName" class = "mdl-textfield__input" type = "text" id = "full-name" value="${booking.fullName}">
                                            <label class = "mdl-textfield__label">Tên đầy đủ</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                            <input name="gender" class="mdl-textfield__input" type="text" id="gender" value="${booking.gender}" readonly tabIndex="-1">
                                            <label for="gender" class="pull-right margin-0">
                                                <i class="mdl-icon-toggle__label material-icons" style="color: black;font-size: 18px">keyboard_arrow_down</i>
                                            </label>
                                            <label for="gender" class="mdl-textfield__label">Giới tính</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                            <ul data-mdl-for="gender" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
                                                <li class="mdl-menu__item" data-val="1">Nam</li>
                                                <li class="mdl-menu__item" data-val="2">Nữ</li>
                                                <li class="mdl-menu__item" data-val="3">Khác</li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20">
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="phoneNumber" class = "mdl-textfield__input" type = "text" 
                                                   id = "phone-number" value="${booking.phoneNumber}">
                                            <label class = "mdl-textfield__label" for = "phone-number">Số điện thoại</label>

                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="birthDateStr" class = "mdl-textfield__input" type = "date" id = "birth-day" value="<fmt:formatDate pattern = "yyyy-MM-dd" 
                                              value = "${booking.birthDate}" />"/>
                                            <label style="padding-left: 200px" class = "mdl-textfield__label">Ngày tháng năm sinh</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="address" class = "mdl-textfield__input" type = "text" id = "address" value="${booking.address}">
                                            <label class = "mdl-textfield__label">Địa Chỉ</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="email" class = "mdl-textfield__input" type = "text" id = "email" value="${booking.email}">
                                            <label class = "mdl-textfield__label">Địa Chỉ</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-12 p-t-20 text-center"> 
                                        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Đi tiếp</button>
                                    </div>
                                </div>
                            </mvc:form>
                         
                            
                            
                        </div>
                    </div>
                </div> 
            </div>

        </div>
        <script src="${pageContext.request.contextPath}/resources-guest/js/validation.js"></script>                        
        <script>
        
                Validator({
                form: '#edit-booking-form',
                rules: [
                    Validator.isFullName('#full-name'),
                    Validator.isGender('#gender'),
                    Validator.isPhoneNumber('#phone-number'),
                    Validator.isBirthDay('#birth-day'),
                    Validator.isAddress('#address'),
                    Validator.isEmail('#email')
                    
                ]
            });
            
            
            function displaySeatDiagram() {
                var elementSeatDiagram = document.querySelector('#seat-daigram');
                elementSeatDiagram.classList.toggle('row');
            }
        </script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/custom.js"></script>



        <!-- start js include path -->
        <script src="${pageContext.request.contextPath}/resources-guest/form/assets/plugins/jquery/jquery.min.js" ></script>
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
