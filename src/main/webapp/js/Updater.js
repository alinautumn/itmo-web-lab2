function updateValidationPanel() {
    let validationInfoPanel = document.querySelector('.validationInfo');
    validationInfoPanel.innerHTML = '';
    validationInfoPanel.classList.remove("show");
}

function getDataFromForm() {
    updateValidationPanel();

    if (isXValid(getX()) && isYValid(getY()) && isRValid(getR())) {
        let x = getX();
        let y = getY();
        let r = getR();
        sendData(x, y, r);
    }
    else {
        console.log("something gone wrong! check values!");
    }
}


function sendData(x, y, r) {
    updateValidationPanel();
    let timezone = new Date().getTimezoneOffset();
    console.log(timezone);
    let data = "r=" + encodeURIComponent(r) + "&x=" + encodeURIComponent(x) + "&y=" + encodeURIComponent(y) + "&timezone=" + encodeURIComponent(timezone);
    let xhr = new XMLHttpRequest();
    xhr.open("GET", document.URL + "controller-servlet?" + data, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                // let table = document.querySelector('#result_table').getElementsByTagName('tbody')[0];
                // let newRow = table.insertRow(table.rows.length-1);
                // newRow.className = "results";
                // if (x == parseInt(x)) newRow.insertCell().outerHTML = "<th>" + parseInt(x) + ".00" + "</th>";
                // else newRow.insertCell().outerHTML = "<th>" + x + "</th>";
                // if (y == parseInt(y)) newRow.insertCell().outerHTML = "<th>"+ parseInt(y)  + ".00" + "</th>";
                // else newRow.insertCell().outerHTML = "<th>"+ y +"</th>";
                // if (r == parseInt(r))  newRow.insertCell().outerHTML = "<th>" + parseInt(r)  + ".00" + "</th>";
                // else newRow.insertCell().outerHTML = "<th>"+ r +"</th>";
                // console.log(xhr.response);
                // if (xhr.response.trim() == "true") newRow.insertCell().outerHTML = "<th style = 'color: green'>" + xhr.response.toUpperCase() +"</th>";
                // else newRow.insertCell().outerHTML = "<th style = 'color: red'>" + xhr.response.toUpperCase() +"</th>";
                makeDot();
                moveDot(r);
                window.location = document.URL + 'result.jsp';
            }
        }
    }
}