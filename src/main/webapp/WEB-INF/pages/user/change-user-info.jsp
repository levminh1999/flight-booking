
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
                                    <header>Thông Tin Người Thành Viên</header>
                            </div>

                                <mvc:form id="edit-booking-form" action="${pageContext.request.contextPath}/user/submit-change-user-info" method="get" modelAttribute="newUserInfo">
                                <div class="card-body row">
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="fullName" class = "mdl-textfield__input" type = "text" id = "full-name" value="${userInfo.fullName}">
                                            <label class = "mdl-textfield__label">Tên đầy đủ</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-t-20"> 
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                            <input name="gender" class="mdl-textfield__input" type="text" id="gender" value="${userInfo.gender}" readonly tabIndex="-1">
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
                                                   id = "phone-number" value="${userInfo.phoneNumber}">
                                            <label class = "mdl-textfield__label" for = "phone-number">Số điện thoại</label>

                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="birthDateStr" class = "mdl-textfield__input" type = "date" id = "birth-day" value="<fmt:formatDate pattern = "yyyy-MM-dd" 
                                              value = "${userInfo.birthDate}" />"/>
                                            <label style="padding-left: 200px" class = "mdl-textfield__label">Ngày tháng năm sinh</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 p-t-20"> 
                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                            <input name="address" class = "mdl-textfield__input" type = "text" id = "address" value="${userInfo.address}">
                                            <label class = "mdl-textfield__label">Địa Chỉ</label>
                                            <span class="form-message" style="color: #d50000;font-size: 12px"></span>
                                        </div>
                                    </div>
                                   
                                    <div class="col-lg-12 p-t-20 text-center"> 
                                        <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Cập nhật</button>
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
                    Validator.isAddress('#address')
                    
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
