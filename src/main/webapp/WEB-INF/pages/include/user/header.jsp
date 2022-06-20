
<%@page import="com.mycompany.spring_mvc_project_final.utils.SecurityUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<nav style="height: 50px; font-size: 15px;" class="navbar navbar-expand-xl navbar-light bg-light">
    <a href="#" class="navbar-brand"><i class="fa fa-cube"></i>Brand<b>Name</b></a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- Collection of nav links, forms, and other content for toggling -->
    <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
        <div class="navbar-nav">
            <a href="${pageContext.request.contextPath}/home" class="nav-item nav-link active">Trang chủ</a>
            <a href="#" class="nav-item nav-link">Tin tức</a>
            <a data-toggle="modal" data-target="#exampleModal" class="nav-item nav-link">Dịch vụ</a>
            <a href="${pageContext.request.contextPath}/search-booking" class="nav-item nav-link">Chuyến bay của tôi</a>

        </div>

        <div class="navbar-nav ml-auto">
            <security:authorize access="isAnonymous()">
                <a class="nav-item nav-link" data-toggle="modal" >Đăng ký</a>
                 <a href="${pageContext.request.contextPath}/login" class="nav-item nav-link">Đăng nhập</a>
            
            </security:authorize>
            <security:authorize access="isAuthenticated()">
                <a href="${pageContext.request.contextPath}/user/home"  class="nav-item nav-link">${userInfo.fullName}</a>
                <a href="${pageContext.request.contextPath}/logout" class="nav-item nav-link">Thoát</a>
            </security:authorize>
           
        </div>
    </div>
</nav>
<div style=" margin-top: 60px; margin-left:-150px" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div style="width: 800px"  class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div  class="col-md-6">
                        <div>
                            <h5>Mua hành lý, suất ăn, chọn chỗ ngồi và hơn thế nữa... </h5>
                        </div>
                        <hr/>
                        <div>
                            <h5>Sẵn sàng cho chuyến bay vui vẻ, thoải mái, bạn có thể mua trước dịch vụ “Ưu tiên làm thủ tục nhanh”</h5>
                        </div>
                        <hr/>
                        <div>
                            <h5>Sẵn sàng cho chuyến bay vui vẻ, thoải mái, bạn có thể mua trước dịch vụ “Ưu tiên làm thủ tục nhanh”</h5>
                        </div>
                         <hr/>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <h5>Mua hành lý, suất ăn, chọn chỗ ngồi và hơn thế nữa... </h5>
                        </div>
                        <hr/>
                        <div>
                            <h5>Sẵn sàng cho chuyến bay vui vẻ, thoải mái, bạn có thể mua trước dịch vụ “Ưu tiên làm thủ tục nhanh”</h5>
                        </div>
                        <hr/>
                        <div>
                            <h5>Sẵn sàng cho chuyến bay vui vẻ, thoải mái, bạn có thể mua trước dịch vụ “Ưu tiên làm thủ tục nhanh”</h5>
                        </div>
                    </div>
                </div>
            </div>




        </div>
    </div>
</div>
