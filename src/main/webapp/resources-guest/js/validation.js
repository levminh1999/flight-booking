
function handleClick() {
//            console.log((document.querySelector('#return-date').value);
    console.log(document.querySelector('#check-oneway').value);
    console.log(document.querySelector('#round').checked);
    console.log(document.querySelector('#check-oneway').checked);
    var arrivalElement = document.querySelector('#arrival');
    var errorElementArrival = arrivalElement.parentElement.querySelector('.form-message');
    errorElementArrival.innerText = '';
    document.getElementById('arrival').value = null;
    document.getElementById('arrival').disabled = true;

}
;

function handleClick2() {
//            console.log((document.querySelector('#return-date').value);
    console.log(document.querySelector('#round').checked);
    console.log(document.querySelector('#check-oneway').checked);
    document.getElementById('arrival').disabled = false;
}
;


function Validator(options) {
    function validate(selectElement, rule) {
        var errormessage = rule.test(selectElement.value);
        var errorElement = selectElement.parentElement.querySelector('.form-message');
        if (errormessage) {
            errorElement.innerText = errormessage;
            return errormessage;
        } else {
            errorElement.innerText = '';
        }
    }
    var formElement = document.querySelector(options.form);
    if (formElement) {
        options.rules.forEach(function (rule) {
            var selectElement = formElement.querySelector(rule.selector);

            if (selectElement) {
                selectElement.onblur = function () {
                    validate(selectElement, rule);
                };
                selectElement.onchange = function () {
                    validate(selectElement, rule);
                };

                selectElement.oninput = function () {
                    validate(selectElement, rule);
                };

            }

        });

        formElement.onsubmit = function (event) {
            check = true;
            check2 = true;
            check3 =true;
            
            options.rules.forEach(function (rule) {

                var selectElement = formElement.querySelector(rule.selector);

                if (validate(selectElement, rule)) {
                    check = false;
                    return;
                }

            });
            
            var elementIdCarts = document.querySelectorAll('.validate-id-cart');
            var inputElementCart = document.querySelector('#id-cart');
            if(elementIdCarts && inputElementCart) {
                elementIdCarts.forEach(function (elementIdCart) {
                    if (inputElementCart.value === elementIdCart.value) {
                        console.log('Số CMND/Hộ chiếu bị trùng trước đó');
                        var errorElement2 = inputElementCart.parentElement.querySelector('.form-message');
                        errorElement2.innerText = 'Số CMND/Hộ chiếu bị trùng trước đó';
                        check2 = false;
                        return;
                    } 
            });
            }
            
            console.log('kich lai ');
            if (!check || !check2 || !check3) {
                event.preventDefault();
            }
        };

    }
}
;
Validator.isDeparture = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value === 'null') {
                return 'Vui lòng chọn điểm khởi hành';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isDestination = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value === 'null') {
                return 'Vui lòng chọn điểm đến';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isDepart = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn ngày khởi hành';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isArrival = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            var valueTrip = document.querySelector('#round').checked;
            if (valueTrip == true && value == '') {
                return 'Vui lòng chọn ngày Đến';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isFullName = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập tên đầy đủ';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isGender = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn giới tính';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isPhoneNumber = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            var numberPhone = /^(?:[0-9]\d*|\d)$/;
            if (value == '') {
                return 'Vui lòng nhập số điện thoại';
            } else if (!numberPhone.test(value) || value.length != 10) {
                return 'Số điện thoại không hợp lệ';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isBirthDay = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn ngày tháng năm sinh';
            } else {
                return undefined;
            }
        }
    };
};
Validator.isEmail = function (selector) {
    
    return {
        selector: selector,
        test: function (value) {
            var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ ;
            if (value == '') {
                return 'Vui lòng nhập Email';
            } else if (!email.test(value) ) {
                return 'Địa chỉ email không hợp lệ';
            }
            else {
                return undefined;
            }
        }
    };
};

Validator.isAddress = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập địa chỉ';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isIdCart = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            
            var idCart = /^(?:[0-9]\d*|\d)$/;
            if (value == '') {
                return 'Vui lòng nhập CMND/Hộ chiếu';
            } else if (!idCart.test(value) || value.length != 9) {
                return 'Số CMND/Hộ chiếu không hợp lệ';
            } else {
                        return undefined;
                };
            }
        }
    };



Validator.isSeat = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn ghế ngồi';

            } else {
                return undefined;
            }
        }
    };
};
Validator.isSeatType = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn hạng ghế';

            } else {
                return undefined;
            }
        }
    };
};
Validator.isSeatArrival = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn ghế ngồi';

            } else {
                return undefined;
            }
        }
    };
};
Validator.isSeatTypeArrival = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn hạng ghế';

            } else {
                return undefined;
            }
        }
    };
};

Validator.isCreditCardName = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng nhập tên của bạn';

            } else {
                return undefined;
            }
        }
    };
};
Validator.isCreditCardNumber = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            var CreditCardNumber = /^(?:[0-9]\d*|\d)$/;
            if (value == '') {
                return 'Vui lòng nhập số thẻ';
            } else if (!CreditCardNumber.test(value) || value.length != 9) {
                return 'Số thẻ không hợp lệ';
            } else {
                        return undefined;
                };
        }
    };
};
Validator.isCreditCardMonth = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn tháng';

            } else {
                return undefined;
            }
        }
    };
};
Validator.isCreditCardYear = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn năm';

            } else {
                return undefined;
            }
        }
    };
};
Validator.isCreditCardCVV = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng nhập mã cvv';

            } else {
                return undefined;
            }
        }
    };
};

Validator.isUserName = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng nhập tên tài khoản';

            } else {
                return undefined;
            }
        }
    };
};
Validator.isPassword = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng nhập mật khẩu';

            } else {
                return undefined;
            }
        }
    };
};
Validator.isNewPassword = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng nhập trường này';

            } else {
                return undefined;
            }
        }
    };
};
Validator.isNewPasswordConfirm = function (selector) {

    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng nhập trường này';

            } else {
                return undefined;
            }
        }
    };
};

// begin validator onsubmit


                  

            