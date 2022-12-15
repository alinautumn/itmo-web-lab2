function cleanTable() {
    let data2 = "clean_status=true";
    let xhr2 = new XMLHttpRequest();
    xhr2.open("GET", document.URL + "controller-servlet?" + data2, true);
    xhr2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr2.send();
    xhr2.onreadystatechange = function () {
        if (xhr2.readyState === 4) {
            if (xhr2.status === 200) {
                window.location.reload();
            }
        }
    }
}
