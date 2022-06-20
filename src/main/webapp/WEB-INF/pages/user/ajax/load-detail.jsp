
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${trip == null}">
    <div class="container">
        <div style="background-color: red;height: 56px" class="row">
            <div style="padding-top: 15px;"  class="col-8">
                <h6 style="color: white">THÔNG TIN ĐẶT CHỖ</h6>
            </div>
            <div style="padding-top: 8px;" class="col-4"><p  style="padding-top: 5px;width: 89px;height: 39px; border: 1px solid blue; padding-left: 10px;border-radius: 50%;background-color: yellow">Chi Tiết</p></div>
        </div>
    </div>

    <div class="container" style="height: 47px;background-color: rgb(201, 239, 255);padding-left: 18px;padding-top: 13px">
        <p>Chuyến đi</p>
    </div>
    <div class="container" style="height: 286px;background-color: white;">
        <div class="row" style="padding-top: 18px">
            <div class="col-5"><p>${departure}</p></div>
            <div class="col-2"><img src="https://www.vietjetair.com/static/media/thai-vietjet.535af1a2.svg"/></div>
            <div class="col-5"><p>${destination}</p></div>

        </div>
        <div class="row" style="padding-top: 18px">
            <div class="col-12" style="margin-left: 15px">
                <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                    <div class="col-4" style="padding-top: 13px">Giá Vé</div>
                    <div class="col-2"></div>
                    <div class="col-6" style="padding-top: 13px">
                        <fmt:formatNumber type = "number" 
                                          maxFractionDigits = "0" value = "${selectedFlight.flightRoute.satandarPrice}" />
                        VND
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 18px">
            <div class="col-12" style="margin-left: 15px">
                <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                    <div class="col-5" style="padding-top: 13px">Số lượng vé</div>
                    <div class="col-2"></div>
                    <div class="col-5" style="padding-top: 13px"><p>${quantity}</p></div>
                </div>
            </div>
        </div>

        <div class="row" style="padding-top: 18px">
            <div class="col-12" style="margin-left: 15px">
                <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                    <div class="col-5" style="padding-top: 13px">Giảm giá</div>
                    <div class="col-2"></div>
                    <div class="col-5" style="padding-top: 13px">${selectedFlight.discountSave} %</div>
                </div>
            </div>
        </div>



    </div>
    <div class="container">
        <div style="background-color: red;height: 56px" class="row">
            <div style="padding-top: 15px;"  class="col-8">
                <h6 style="color: white">TỔNG TIỀN</h6>
            </div>
            <div style="padding-top: 15px;" class="col-4"><h6 style="color: white">
                    <fmt:formatNumber type = "number" 
                                      maxFractionDigits = "0" value = "${selectedFlight.flightRoute.satandarPrice*quantity - selectedFlight.flightRoute.satandarPrice*quantity * selectedFlight.discountSave /100}" />
                    VND
                </h6></div>
        </div>
    </div>
</c:if>


<c:if test="${trip != null}">

    <div class="container">
        <div style="background-color: red;height: 56px" class="row">
            <div style="padding-top: 15px;"  class="col-8">
                <h6 style="color: white">THÔNG TIN ĐẶT CHỖ</h6>
            </div>
            <div style="padding-top: 8px;" class="col-4"><p  style="padding-top: 5px;width: 89px;height: 39px; border: 1px solid blue; padding-left: 10px;border-radius: 50%;background-color: yellow">Chi Tiết</p></div>
        </div>
    </div>

    <div class="container" style="height: 47px;background-color: rgb(201, 239, 255);padding-left: 18px;padding-top: 13px">
        <p>Chuyến đi</p>
    </div>
    <div class="container" style="height: 286px;background-color: white;">
        <div class="row" style="padding-top: 18px">
            <div class="col-5"><p>${departure}</p></div>
            <div class="col-2"><img src="https://www.vietjetair.com/static/media/thai-vietjet.535af1a2.svg"/></div>
            <div class="col-5"><p>${destination}</p></div>

        </div>
        <div class="row" style="padding-top: 18px">
            <div class="col-12" style="margin-left: 15px">
                <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                    <div class="col-4" style="padding-top: 13px">Giá Vé</div>
                    <div class="col-2"></div>
                    <div class="col-6" style="padding-top: 13px">
                        <fmt:formatNumber type = "number" 
                                          maxFractionDigits = "0" value = "${selectedFlight.flightRoute.satandarPrice}" />
                        VND
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 18px">
            <div class="col-12" style="margin-left: 15px">
                <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                    <div class="col-5" style="padding-top: 13px">Số lượng vé</div>
                    <div class="col-2"></div>
                    <div class="col-5" style="padding-top: 13px"><p>${quantity}</p></div>
                </div>
            </div>
        </div>

        <div class="row" style="padding-top: 18px">
            <div class="col-12" style="margin-left: 15px">
                <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                    <div class="col-5" style="padding-top: 13px">Giảm giá</div>
                    <div class="col-2"></div>
                    <div class="col-5" style="padding-top: 13px">${selectedFlight.discountSave} %</div>
                </div>
            </div>
        </div>

    </div>
    <div class="container" style="height: 47px;background-color: rgb(201, 239, 255);padding-left: 18px;padding-top: 13px">
        <p>Chuyến về</p>
    </div>
    <div class="container" style="height: 286px;background-color: white;">
        <div class="row" style="padding-top: 18px">
            <div class="col-5"><p>${destination}</p></div>
            <div class="col-2"><img src="https://www.vietjetair.com/static/media/thai-vietjet.535af1a2.svg"/></div>
            <div class="col-5"><p>${departure}</p></div>
        
        </div>
        <div class="row" style="padding-top: 18px">
            <div class="col-12" style="margin-left: 15px">
                <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                    <div class="col-4" style="padding-top: 13px">Giá Vé</div>
                    <div class="col-2"></div>
                    <div class="col-6" style="padding-top: 13px">
                        <fmt:formatNumber type = "number" 
                                          maxFractionDigits = "0" value = "${selectedFlightArrival.flightRoute.satandarPrice}" />
                        VND
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 18px">
            <div class="col-12" style="margin-left: 15px">
                <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                    <div class="col-5" style="padding-top: 13px">Số lượng vé</div>
                    <div class="col-2"></div>
                    <c:if test="${selectedFlightArrival != null}">
                        <div class="col-5" style="padding-top: 13px"><p>${quantity}</p></div>
                    </c:if>
                    
                </div>
            </div>
        </div>
        <div class="row" style="padding-top: 18px">
            <div class="col-12" style="margin-left: 15px">
                <div class="row" style="height: 50px;width: 315px;background-color: whitesmoke;">
                    <div class="col-5" style="padding-top: 13px">Giảm giá</div>
                    <div class="col-2"></div>
                    <c:if test="${selectedFlightArrival != null}">
                        <div class="col-5" style="padding-top: 13px">${selectedFlightArrival.discountSave} %</div>
                    </c:if>
                    
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div style="background-color: red;height: 56px" class="row">
            <div style="padding-top: 15px;"  class="col-8">
                <h6 style="color: white">TỔNG TIỀN</h6>
            </div>
            <div style="padding-top: 15px;" class="col-4"><h6 style="color: white">
                    <fmt:formatNumber type = "number" 
                                      maxFractionDigits = "0" 
                                      value = " ${selectedFlightArrival.flightRoute.satandarPrice * quantity - selectedFlightArrival.flightRoute.satandarPrice * quantity * selectedFlightArrival.discountSave / 100 + selectedFlight.flightRoute.satandarPrice * quantity - selectedFlight.flightRoute.satandarPrice * quantity * selectedFlight.discountSave / 100} " />
                    VND
                </h6></div>
        </div>
    </div>

</c:if>