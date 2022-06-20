
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     
        <%@include file="/WEB-INF/pages/include/user/css.jsp" %>
    </head>
    <body style="background-image: url('https://www.vietjetair.com/static/media/cloud-bg-5.9b668827.png')">
        <%@include file="/WEB-INF/pages/include/user/header.jsp" %>
        <div class="container" style="margin-top: 40px">
            <div class="row">
            <div class="col-5" style="background-color: rgba(255,255,255,0.6); padding-top: 50px">
                    <h3 >CHUYẾN BAY CỦA TÔI</h3>
                    <p >
                        Bạn muốn xem chuyến bay đã đặt, đổi lịch trình bay
                        hay mua thêm dịch vụ hành lý, chỗ ngồi, suất ăn..., vui
                        lòng điền thông tin bên dưới
                    </p>
                    <form>
                        <div class="form-group row" class="text-center">
                            
                            <div class="col-sm-10">
                                <input placeholder="Mã đặt chỗ" type="text" class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="form-group row">
                            
                            <div class="col-sm-10">
                                <input placeholder="Họ" type="text" class="form-control" id="inputPassword3">
                            </div>
                        </div>
                        
                         <div class="form-group row">
                            
                            <div class="col-sm-10">
                                <input placeholder="Tên đệm và tên" type="text" class="form-control" id="inputPassword3">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <button style="width: 100%" type="submit" class="btn btn-warning">Tìm kiếm</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-7">
                    <img style="width: 100%; height: 100%" src="https://www.vietjetair.com/static/media/auth-img-2.cf33a22b.jpg" />
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/resources-guest/js/vendor/bootstrap.min.js"></script>

        <script src="${pageContext.request.contextPath}/resources-guest/js/datepicker.js"></script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/main.js"></script>
    </body>
</html>
