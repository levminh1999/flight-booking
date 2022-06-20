
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/pages/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/css/hero-slider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/css/tooplate-style.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/css/style.css">
        <script src="${pageContext.request.contextPath}/resources-guest/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/css/owl-carousel.css"> 
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/css/datepicker.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources-guest/css/tooplate-style.css">
        <%@include file="/WEB-INF/pages/include/user/css.jsp" %>
    </head>
    <body >
        <%@include file="/WEB-INF/pages/include/user/header.jsp" %>
     
        <section class="banner" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="left-side">
                            <div class="logo">
                                <img src="${pageContext.request.contextPath}/resources-guest/img/logo.png" alt="Flight Template">
                            </div>
                            <div class="tabs-content">
                                <h4>Kết nối với chúng tôi</h4>
                                <ul class="social-links">
                                    <li><a href="https://www.facebook.com/H.Quoc.Uy"><em>Facebook</em><i
                                                class="fa fa-facebook"></i></a></li>

                                </ul>
                            </div>
                            <div class="page-direction-button">
                                <a href="#"><i class="fa fa-phone"></i> 0968348489</a>
                            </div>
                        </div>
                    </div>
                            
<!--                    search form-->
                    <div class="col-md-5 col-md-offset-1">
                        <section id="first-tab-group" class="tabgroup">
                            <div id="tab1">
                                <div class="submit-form">
                                    <h4 class="text-center">Đặt vé <em>máy bay</h4>
                                
                                    <mvc:form id="search-form"  action="${pageContext.request.contextPath}/search-flight" method="get" modelAttribute="flight">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label for="departure">Địa điểm khởi hành</label>
                                                    <select name="flightRoute.departure.id" id="departure">
                                                        <option value="null">Điểm Khởi Hành</option>
                                                        <c:forEach var="airport" items="${airports}">
                                                            <option value="${airport.id}">${airport.city.name}</option>
                                                        </c:forEach>
            
                                                    </select>
                                                    <span class="form-message" style="color: red"></span>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label >Điểm đến</label>
                                                    <select id="destination"  name="flightRoute.destination.id">
                                                        <option value="null">Điểm đến</option>
                                                    </select>
                                                    <span class="form-message" style="color: red"></span>
                                                </fieldset>
                                            </div>
                                            
                                            
                                           <div class="col-md-6">
                                                <fieldset>
                                                    <label for="">Ngày đi</label>
                                                    <input id="depart"  name="departStr" type="date" class="form-control date"
                                                            placeholder="Select date..." 
                                                           >
                                                    <span class="form-message" style="color: red"></span>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-6">
                                                <fieldset>
                                                    <label for="arrival" >Ngày về</label>
                                                    <input disabled="true" id="arrival" name="arrivalStr"  type="date" class="form-control date" 
                                                           placeholder="Select date..." >
                                                    <span class="form-message" style="color: red"></span>
                                                </fieldset>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <div class="radio-select">
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                                            <label style="font-size: 10px" for="round">Khứ hồi</label>
                                                            <input onclick="handleClick2()" type="radio"  id="round" value="kh" name="trip">
                                                        </div>
                                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                                            <label style="font-size: 10px" for="oneway">Một chiều</label>
                                                            <input checked="true" id="check-oneway" onclick="handleClick()" type="radio"  value="ow" name="trip">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <button class="btn" type="submit">Tìm chuyến bay</button></a>
                                            </div>
                                        </div>
                                    </mvc:form>
         
                                </div>
                            </div>
                        </section>
                    </div>
<!--                    end search form-->
                </div>
            </div>
        </section>
     

        <div class="tabs-content" id="weather">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Chuyến Bay giá Rẻ Trong Ngày</h2>
                        </div>
                    </div>
                    <div class="wrapper">
                        <section class="py-5">
                            <div class="container px-4 px-lg-5 mt-5">
                                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Product image-->
                                            <img class="card-img-top" src="https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/49vn-1621505158847.png" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">Từ Hà Nội</h5>
                                                    <!-- Product price-->
                                                    <h5 class="text-muted text-decoration-line-through">Đến Đà Lạt</h5>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Xem chi tiết</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Sale badge-->
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem"></div>
                                            <!-- Product image-->
                                            <img class="card-img-top" src="https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/39vn-1621505224345.png" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">Từ Hà Nội</h5>
                                                    <!-- Product price-->
                                                    <h5 class="text-muted text-decoration-line-through">Đến Nha Trang</h5>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Xem chi tiết</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Sale badge-->
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem"></div>
                                            <!-- Product image-->
                                            <img class="card-img-top" src="https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/99vn-1621505224342.png" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">Từ Hà Nội</h5>
                                                    <!-- Product price-->
                                                    <h5 class="text-muted text-decoration-line-through">Đến TP.Hồ Chí Minh</h5>

                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Xem chi tiết</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Product image-->
                                            <img class="card-img-top" src="https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/49vn-1621505158847.png" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">Từ TP.Hồ Chí Minh</h5>
                                                    <!-- Product reviews-->
                                                    <h5 class="text-muted text-decoration-line-through">Đến Đà Lạt</h5>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Xem chi tiết</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Sale badge-->
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                            <!-- Product image-->
                                            <img class="card-img-top" src="https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/49vn-1621505158847.png" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">Từ TP.Hồ Chí Minh</h5>
                                                    <!-- Product price-->
                                                    <h5 class="text-muted text-decoration-line-through">Đến Đà Nẵng</h5>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Xem chi tiết</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Product image-->
                                            <img class="card-img-top" src="https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/49vn-1621505158847.png" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <h5 class="fw-bolder">Từ TP.Hồ Chí Minh</h5>
                                                    <!-- Product price-->
                                                    <h5 class="text-muted text-decoration-line-through">Đến Huế</h5>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Xem chi tiết</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Sale badge-->
                                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                            <!-- Product image-->
                                            <img class="card-img-top" src="https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/49vn-1621505158847.png" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">Từ Hà Nội</h5>
                                                    <!-- Product price-->
                                                    <h5 class="text-muted text-decoration-line-through">Đến Huế</h5>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Xem chi tiết</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col mb-5">
                                        <div class="card h-100">
                                            <!-- Product image-->
                                            <img class="card-img-top" src="https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/49vn-1621505158847.png" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <!-- Product name-->
                                                    <!-- Product name-->
                                                    <h5 class="fw-bolder">Từ Huế</h5>
                                                    <!-- Product price-->
                                                    <h5 class="text-muted text-decoration-line-through">Đến Đà Lạt</h5>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Xem chi tiết</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>

        <section id="most-visited">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>ĐIỂM ĐẾN CÓ CÁC KHU DU LỊCH NỔI TIẾNG</h2>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="owl-mostvisited" class="owl-carousel owl-theme">
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img style="width: 248px; height: 210px" src="https://dulichkhampha24.com/wp-content/uploads/2021/03/hoi-an-thanh-pho-lang-man-nhat-the-gioi.jpg" alt="">
                                    <div class="text-content text-center">
                                        <h4>Hội An</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img style="width: 248px; height: 210px" src="http://divui.com/blog/wp-content/uploads/2018/10/111111.jpg" alt="">
                                    <div class="text-content text-center">
                                        <h4>Bà Nà Hills</h4>

                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12 ">
                                <div class="visited-item">
                                    <img style="width: 248px; height: 210px" src="https://i1.wp.com/www.dulichvietnam.com.vn/data/sai-gon(3).jpg?resize=482%2C301pg" alt="">
                                    <div class="text-content text-center">
                                        <h4>Sài gòn</h4>

                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img style="width: 248px; height: 210px" src="https://motogo.vn/wp-content/uploads/2020/02/Imperial-4.jpg" alt="">
                                    <div class="text-content text-center">
                                        <h4>Huế</h4>

                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img style="width: 248px; height: 210px" src="https://tuyensinh24h.org/wp-content/uploads/03252020082945892-xenhatrangdalat1.jpg" alt="">
                                    <div class="text-content text-center">
                                        <h4>Đà Lạt</h4>

                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img style="width: 248px; height: 210px" src="https://img.thuthuattinhoc.vn/uploads/2019/04/10/hinh-anh-chua-tran-quoc-dep_112844111.jpg" alt="">
                                    <div class="text-content text-center">
                                        <h4>Hà Nội</h4>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>



            <footer>
                <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="primary-button">
                            <a href="#" class="scroll-top">Back To Top</a>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <ul class="social-icons">
                            <li><a href="https://www.facebook.com/Share-Source-Code-Website-189970988225280/"><i
                                        class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <p>Copyright &copy; 2018 Flight Tour and Travel Company</p>
                    </div>
                </div>
            </div>
            </footer>

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
            </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/custom.js"></script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/vendor/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/datepicker.js"></script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/resources-guest/js/main.js"></script>
        
       
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
    <script src="${pageContext.request.contextPath}/resources-guest/js/vendor/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources-guest/js/datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources-guest/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/resources-guest/js/main.js"></script>
   
    <script type="text/javascript">
    $(document).ready(function() {

        

        // navigation click actions 
        $('.scroll-link').on('click', function(event){
            event.preventDefault();
            var sectionID = $(this).attr("data-id");
            scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function(event) {
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 'slow');         
        });
        // mobile nav toggle
        $('#nav-toggle').on('click', function (event) {
            event.preventDefault();
            $('#main-nav').toggleClass("open");
        });
    });
    // scroll function
    function scrollToID(id, speed){
        var offSet = 0;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop:targetOffset}, speed);
        if (mainNav.hasClass("open")) {
            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
            mainNav.removeClass("open");
        }
    }
    if (typeof console === "undefined") {
        console = {
            log: function() { }
        };
    }
    </script>

    </body>
</html>
