<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources-guest/css/style-login.css">
    </head>
    <body>
         <%@include file="/WEB-INF/pages/include/user/header.jsp" %>
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card" style="height: 440px">
                    <div class="card-header">
                        <h3>Cập nhật mật khẩu</h3>

                    </div>
                    <div class="card-body">
                        <mvc:form id="change-pass-form">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input disabled name="username" id="user-name" type="text" class="form-control" placeholder="Tên tài khoản" value="<%=SecurityUtils.viewHome() %>">

                                <p class="form-message" style="color: #d50000;font-size: 12px;position: absolute; padding-top: 45px"></p>
                            </div>
                            <div class="input-group form-group" style="padding-top: 20px">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input name="password" id="password" type="password" class="form-control" placeholder="Mật khẩu cũ">

                                <p class="form-message" style="color: #d50000;font-size: 12px;position: absolute; padding-top: 45px"></p>
                            </div>

                            <div class="input-group form-group" style="padding-top: 20px">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input name="password" id="new-password" type="password" class="form-control" placeholder="Mật khẩu mới">

                                <p class="form-message" style="color: #d50000;font-size: 12px;position: absolute; padding-top: 45px"></p>
                            </div>

                            <div class="input-group form-group" style="padding-top: 20px">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input name="password" id="new-password-confirm" type="password" class="form-control" placeholder="Xác nhận lại mật khẩu">

                                <p id="message" class="form-message" style="color: #d50000;font-size: 12px;position: absolute; padding-top: 45px"></p>
                            </div>   

                            <div class="form-group">
                                <input id="change-password-submit" type="submit" value="Cập nhật" class="btn float-right login_btn">
                            </div>
                        </mvc:form>
                    </div>

                </div>
            </div>
        </div>
    </body>
     
    <script src="${pageContext.request.contextPath}/resources-guest/js/validation.js"></script>                        
    <script>

        Validator({
            form: '#change-pass-form',
            rules: [
                Validator.isUserName('#user-name'),
                Validator.isPassword('#password'),
                Validator.isNewPassword('#new-password'),
                Validator.isNewPasswordConfirm('#new-password-confirm')
            ]
        });



    </script>
    <script src="${pageContext.request.contextPath}/resources-guest/js/custom.js"></script>  
</html>

