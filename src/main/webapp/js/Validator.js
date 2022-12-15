function getButtonsByColor(color, buttons) {
    let values = [];
    buttons.forEach(function (button) {
        if (getComputedStyle(button).backgroundColor === color) {
            values.push(button.value);
        }
    })
    return values;
}

function isXValid() {
    let validationInfo = '';
    let xButtons = document.querySelectorAll(".x-button");
    let purpleColor = "rgb(147, 112, 219)";
    let valid = false;
    let xValues = getButtonsByColor(purpleColor, xButtons);

    if (xValues.length !== 1) {
        if (xValues.length === 0) {
            validationInfo += "Select X!"
        } else if (xValues.length > 1) {
            validationInfo += "One X value must be selected!"
        }
    } else {
        if (!(-5 <= parseFloat(xValues[0]) <= 3)) {
            validationInfo += "X is not in the selected range!"
        }
    }
    if (validationInfo === "") {
        valid = true;
    } else{
        addMessageToValidationPanel(validationInfo);
    }

    return valid
}

function isYValid(){
    let yValue = document.getElementById("y-value").value;
    let validationInfo = '';
    let valid = false;

    if (!(yValue.trim() === "")) {
        if (/\d+/.test(yValue)) {
            if ((parseFloat(yValue) > -3.0) && (parseFloat(yValue) < 5.0)) {
                valid = true;
            } else validationInfo += "Y value should be in the range (-3...5)!";
        } else validationInfo += "Y value must be a number!";
    } else validationInfo += "Enter Y!";

    addMessageToValidationPanel(validationInfo);

    return valid;
}

function isRValid() {
    let rValue = document.getElementById("r-value").value;
    let validationInfo = '';
    let valid = false;

    if (!(rValue.trim() === "")) {
        if (/\d+/.test(rValue)) {
            if ((parseFloat(rValue) > 2.0) && (parseFloat(rValue) < 5.0)) {
                valid = true;
            } else validationInfo += "R value should be in the range (2..5)!";
        } else validationInfo += "R value must be a number!";
    } else validationInfo += "Enter R!";

    addMessageToValidationPanel(validationInfo);

    return valid
}

function addMessageToValidationPanel(message){
    let validationInfoPanel = document.querySelector('.validationInfo');
    validationInfoPanel.innerHTML += message + "<br>";
    validationInfoPanel.classList.add("show");
}


function validateYTextField() {
    $('.y-text').on('input', function () {
        $(this).val($(this).val().replace(/[^.\d]/, ''));
    });
}

function validateRTextField() {
    $('.r-text').on('input', function () {
        $(this).val($(this).val().replace(/[^.\d]/, ''));
    });
}

function getX() {
    let xButtons = document.querySelectorAll(".x-button");
    let purpleColor = "rgb(147, 112, 219)";
    let xValues = getButtonsByColor(purpleColor, xButtons);
    return parseFloat(xValues[0])
}

function getY() {
    return parseFloat(document.getElementById("y-value").value)
}

function getR() {
    return parseFloat(document.getElementById("r-value").value)
}