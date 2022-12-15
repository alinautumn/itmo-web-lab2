function svgHandler(event) {
    const svg = document.querySelector('svg');
    const rect = svg.getBoundingClientRect();
    updateValidationPanel();
    let r = getR();
    if (isRValid(r)) {
        let x = ((event.clientX - rect.left - 150 * 1.2) * (r / 2) / (50 * 1.2)).toFixed(2);
        let y = (((-1) * (event.clientY - rect.top - 150 * 1.2)) * (r / 2) / (50 * 1.2)).toFixed(2);
        sendData(x, y, r);
    }
}


