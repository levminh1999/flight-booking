
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
        <div  class="container-liquid"  style="width: 100%; height: 80px; background-color: yellow;padding-top: 10px; padding-left: 10px">
            <div class="row">
                <div  class="col-lg-3">
                    <h6>CHUYẾN BAY MỘT CHIỀU</h6>
                </div>

                <div class="col-lg-2">
                    <h6>1 Người lớn</h6>
                </div>
            </div> 
            <div class="row">
                <div  class="col-lg-3">
                    <p>Điểm khởi hành :<span style="color: red"> Tp. Hồ Chí Minh</span></>
                </div>

                <div class="col-lg-3">
                    <p>Điểm đến : <span style="color: red"> Đà Nẵng</span></p>
                </div>

            </div> 
        </div>
        <div style="margin-top: 50px" class="container">
            <div  class="row">
                <!--begin select chair-->
                <div class="col-8">
                    <div class="container" style="background-image: url('https://cdn.pixabay.com/photo/2017/07/08/12/36/background-2484300_1280.png');height: 800px" >
                        <div style="height: 100%" class="row">
                            <div class="col-3"></div>
                            <div style="background-color: white;height: 100%" class="col-6">
                                <div style="padding-top: 20px" class="row text-center">
                                    <div class="col-12">
                                        <h5>TÙY CHỌN CHỖ NGỒI</h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-5">
                                        <div class="row">

                                            <div class="col-8" style="padding-top: 20px">
                                                <p>Hạng thương gia trống</p>
                                            </div>
                                            <div style="padding-top: 30px;padding-left: 0" class="col-4">
                                                <div style="width: 50px;height: 60px; background-color: yellow"></div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="col-2"></div>
                                    <div class="col-5">
                                        <div class="row">
                                            <div style="padding-top: 30px;padding-left: 0px" class="col-4">
                                                <div style="width: 50px;height: 60px; background-color: blue"></div>
                                            </div>
                                            <div class="col-8" style="padding-top: 20px">
                                                <p>Hạng phổ thông trống</p>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-5">
                                        <div class="row">

                                            <div class="col-8" style="padding-top: 30px">
                                                <p>Đã chọn</p>
                                            </div>
                                            <div style="padding-top: 30px;padding-left: 0" class="col-4">
                                                <div style="width: 50px;height: 60px; background-color: red"></div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="col-2"></div>
                                    <div class="col-5">
                                        <div class="row">
                                            <div style="padding-top: 30px;padding-left: 0px" class="col-4">
                                                <div style="width: 50px;height: 60px; background-color: #08c"></div>
                                            </div>
                                            <div class="col-8" style="padding-top: 30px">
                                                <p>Đã có người</p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                 <!--            begin icon element -->
                                 <div class="row" style="padding-top: 30px">
                                     <div class="col-5" >
                                         <div style="background-color: gainsboro;width: 138px;height: 90px">
                                             <img width="100%" height="100%" src="${pageContext.request.contextPath}/resources-guest/img/toilet.png">
                                         </div>
                                    </div>
                                    <div class="col-2"></div>
                                    <div class="col-5" style="padding-right: 15px">
                                        <div style="background-color: gainsboro;width: 138px;height: 90px;margin-left: -15px">
                                            <img width="100%" height="100%" src="${pageContext.request.contextPath}/resources-guest/img/toilet.png">
                                        </div>
                                    </div>
                                </div>

                                <!--            end icon element -->
                               
                                <!--            begin select element -->
                                <div class="row">
                                    <div class="col-12" style="padding-top: 30px">
                                        <div class="row" style="height: 40px">
                                        <div class="col-6">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                      
                                        <div class="col-6">
                                            <div class="row">
                                             <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="row" style="margin-top: 30px;height: 40px">
                                        <div class="col-6">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                      
                                        <div class="col-6">
                                            <div class="row">
                                             <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="row" style="margin-top: 30px;height: 40px">
                                        <div class="col-6">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                      
                                        <div class="col-6">
                                            <div class="row">
                                             <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                        
                                    </div>
                                    
                                </div>
                                    
                                
                                
                                
                                    
                                

                                <!--            end select element -->
                                <!--            begin select element -->
                                <div class="row">
                                    <div class="col-12" style="padding-top: 30px">
                                        <div class="row" style="height: 40px">
                                        <div class="col-6">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                      
                                        <div class="col-6">
                                            <div class="row">
                                             <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="row" style="margin-top: 30px;height: 40px">
                                        <div class="col-6">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                      
                                        <div class="col-6">
                                            <div class="row">
                                             <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                               <div class="col-6">
                                                    <div class="text-center" style="width: 100%;height: 50px;background-color: yellow; padding-top: 10px"><p>1</p></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                        
                                        
                                    </div>
                                    
                                </div>
         
                                <!--            end select element -->

                            </div> 
                            <div class="col-3"></div> 
                        </div>
                    </div>
                    
                    <div class="container" style="margin-top: 20px">
                        <div class="row text-center" style="padding-left: 50%">
                            <button class="btn btn-warning">Tiếp tục</button>
                        </div>
                    </div>

                </div>
                <!--End select chair-->

                <div  class="col-4">
                    <div class="container">
                        <div style="background-color: red;height: 56px" class="row">
                            <div style="padding-top: 15px;"  class="col-8">
                                <h6 style="color: white">THÔNG TIN ĐẶT CHỖ</h6>
                            </div>
                            <div style="padding-top: 8px;" class="col-4"><p  style="padding-top: 5px;width: 89px;height: 39px; border: 1px solid blue; padding-left: 10px;border-radius: 50%;background-color: yellow">Chi Tiết</p></div>
                        </div>
                    </div>

                    <div style="background-color: white;height: 86px;padding: 18px" class="container">
                        <input disabled style="height: 50px;width: 315px;background-color: whitesmoke;padding-left: 15px" type="text" value="Thông tin hành khách" />
                    </div>
                    <div class="container" style="height: 47px;background-color: rgb(201, 239, 255);padding-left: 18px;padding-top: 13px">
                        <p>Chuyến đi</p>
                    </div>
                    <div class="container" style="height: 286px;background-color: white;">
                        <div class="row" style="padding-top: 18px">
                            <div class="col-5"><p>Tp. Hồ Chí Minh</p></div>
                            <div class="col-2"><img src="https://www.vietjetair.com/static/media/thai-vietjet.535af1a2.svg"/></div>
                            <div class="col-5"><p>Đà Nẵng</p></div>

                        </div>
                        <div class="row" style="padding-top: 18px">
                            <div class="col-12">
                                <input disabled style="height: 50px;width: 315px;background-color: whitesmoke;padding-left: 15px" type="text" value="Thông tin hành khách" />
                            </div>
                        </div>
                        <div class="row" style="padding-top: 18px">
                            <div class="col-12">
                                <input disabled style="height: 50px;width: 315px;background-color: whitesmoke;padding-left: 15px" type="text" value="Thông tin hành khách" />
                            </div>
                        </div>
                        <div class="row" style="padding-top: 18px">
                            <div class="col-12">
                                <input disabled style="height: 50px;width: 315px;background-color: whitesmoke;padding-left: 15px" type="text" value="Thông tin hành khách" />
                            </div>
                        </div>

                    </div>
                    <div class="container">
                        <div style="background-color: red;height: 56px" class="row">
                            <div style="padding-top: 15px;"  class="col-8">
                                <h6 style="color: white">TỔNG TIỀN</h6>
                            </div>
                            <div style="padding-top: 15px;" class="col-4"><h6 style="color: white"> 0 VND</h6></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>



    </body>
</html>
