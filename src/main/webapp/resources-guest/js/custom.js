$('#departure').change(function () {
    var departure = $('#departure').val();

    $.ajax({
        url: '/Spring_MVC_Project_Final/api-load',
        type: 'get',
        data: {
            depart: departure
        },
        success: function (value) {

            $('#destination').html(value);
        }
    });
});

$('#quantity').change(function () {
    var quantity = $('#quantity').val();

    $.ajax({
        url: '/Spring_MVC_Project_Final/api-load-bookingdetail',
        type: 'get',
        data: {
            quantity: quantity
        },
        success: function (value) {

            $('#change-booking-detail').html(value);
        }
    });
});

$('#seat-type').change(function () {
    var seatType = $('#seat-type').val();

    $.ajax({
        url: '/Spring_MVC_Project_Final/api-load-seat',
        type: 'get',
        data: {
            seatType: seatType
        },
        success: function (value) {

            $('#seat').html(value);
        }
    });
});

$('#seat-type-edit').change(function () {
    var seatTypeEdit = $('#seat-type-edit').val();

    $.ajax({
        url: '/Spring_MVC_Project_Final/api-load-seat-edit',
        type: 'get',
        data: {
            seatType: seatTypeEdit
        },
        success: function (value) {

            $('#seat').html(value);
        }
    });
});

$('#seat-type-arrival').change(function () {
    var seatTypeArrival = $('#seat-type-arrival').val();

    $.ajax({
        url: '/Spring_MVC_Project_Final/api-load-seat-arrival',
        type: 'get',
        data: {
            seatTypeArrival: seatTypeArrival
        },
        success: function (value) {

            $('#seat-arrival').html(value);
        }
    });
});

$('#seat-type-arrival-edit').change(function () {
    var seatTypeArrival = $('#seat-type-arrival-edit').val();

    $.ajax({
        url: '/Spring_MVC_Project_Final/api-load-seat-arrival-edit',
        type: 'get',
        data: {
            seatTypeArrival: seatTypeArrival
        },
        success: function (value) {

            $('#seat-arrival').html(value);
        }
    });
});

$('#seat').change(function () {
    var seatNumber = $('#seat').val();

    $.ajax({
        url: '/Spring_MVC_Project_Final/api-load-seat-price',
        type: 'get',
        data: {
            seatNumber: seatNumber
        },
        success: function (value) {

            $('#seat-price').html(value);
        }
    });
});

$('#seat-arrival').change(function () {
    var seatArrivalNumber = $('#seat-arrival').val();

    $.ajax({
        url: '/Spring_MVC_Project_Final/api-load-seat-arrival-price',
        type: 'get',
        data: {

            seatArrivalNumber: seatArrivalNumber
        },
        success: function (value) {
            console.log(value);
            $('#seat-price-arrival').html(value);
        }
    });
});


$('#payment-submit').click(function () {
    let creditCardName = $('#credit-card-name').val();
    let creditCardNumber = $('#credit-card-number').val();
    let creditCardMonth = $('#credit-card-month').val();
    let creditCardYear = $('#credit-cart-year').val();
    let creditCardCVV = $('#credit-card-cvv').val();
    let CreditCardNumberCheck = /^(?:[0-9]\d*|\d)$/;
    if (creditCardName != '' &&
            creditCardMonth != '' && creditCardYear != '' &&
            creditCardCVV != '' && CreditCardNumberCheck.test(creditCardNumber) &&
            creditCardNumber.length == 9) {
        $('#form-payment').submit(function (e) {
            e.preventDefault()
        });
        $.ajax({
            url: '/Spring_MVC_Project_Final/api-load-payment-message',
            type: 'get',
            data: {
                creditCardName: creditCardName,
                creditCardNumber: creditCardNumber,
                creditCardMonth: creditCardMonth,
                creditCardYear: creditCardYear,
                creditCardCVV: creditCardCVV
            },
            success: function (value) {
                if (value === 'error1') {
                    $('#message-payment').text('Tên hoặc số thẻ bị sai');
                } else if (value === 'error2') {
                    $('#message-payment').text('Hạn sử dụng thẻ không khớp với thẻ');
                } else if (value === 'error3') {
                    $('#message-payment').text('Mã cvv không hợp lệ');
                } else if (value === 'error4') {
                    $('#message-payment').text('Thẻ đã hết hạn sử dụng');
                } else if (value === 'error5') {
                    $('#message-payment').text('Số dư không đủ để thanh toán');
                } else {
                    document.querySelector('#credit-card-name').value = '';
                    document.querySelector('#credit-card-number').value = '';
                    document.querySelector('#credit-card-month').value = '';
                    document.querySelector('#credit-cart-year').value = '';
                    document.querySelector('#credit-card-cvv').value = '';
                    document.querySelector('#change-payment1').classList.remove('display-chnage-payment');
                    document.querySelector('#change-payment').classList.add('display-chnage-payment');
                    $('#message-payment').text('Thanh toán thành công');

                }

            }
        });
    }

});

$('#change-password-submit').click(function () {
    let oldPassword = $('#password').val();
    let newPassword = $('#new-password').val();
    $('#change-pass-form').submit(function (e) {
        e.preventDefault();
    });
    var inputNewpasswordConfirm = $('#new-password-confirm').val();
    var newPasswordMessage = document.querySelector('#new-password-confirm');
    if (newPassword && inputNewpasswordConfirm) {
        if (newPassword != inputNewpasswordConfirm) {
            var errorElement3 = newPasswordMessage.parentElement.querySelector('.form-message');
            errorElement3.innerText = 'Xác nhận không khớp';

        } else {
            $.ajax({
                url: '/Spring_MVC_Project_Final/user/api/change-password',
                type: 'get',
                data: {
                    oldPassword: oldPassword,
                    newPassword: newPassword
                },
                success: function (value) {
                    if (value == 'error') {
                        $('#message').text('Mật khẩu cũ không đúng');
                    } else {
                        $('#change-password-submit').addClass('unsubmit');
                        $('#message').text('Cập nhật mật khẩu thành công');
                    }

                }
            });
        }
    }
});

$('#search-booking').click(function () {
    let startDate = $('#start-date').val();
    let endDate = $('#end-date').val();
    $('#search-booking-form').submit(function (e) {
        e.preventDefault();
    });

    $.ajax({
        url: '/Spring_MVC_Project_Final/user/api/search-booking-user',
        type: 'get',
        data: {
            startDate: startDate,
            endDate: endDate
        },
        success: function (value) {
            
            $('#change-load-search-booking').html(value);
            $('#message-cancel').addClass('active-onclick');
        }
    });


});

function sendSubmitForm(index) {
    var years = [];
    for (i = 0; i <= index - 1; i++)
    {
        years.push({operator: i});
    }
    console.log(years);
}
;





