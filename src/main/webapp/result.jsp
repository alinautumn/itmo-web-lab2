<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Web lab2</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/Validator.js"></script>
    <script src="js/Updater.js"></script>
    <script src="js/CleanTable.js"></script>
    <script src="js/xButton.js"></script>
    <script src="js/GraphHandler.js"></script>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<div id="resultsContainer">
  <table id="resultsTable">
    <tbody>
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Current Time</th>
            <th>Execution time (msec)</th>
            <th>Hit Result</th>
        </tr>
        <%--@elvariable id="shots" type="com.alinautumn.web_lab2.model.ShotCollectionManager"--%>
        <tr>
            <c:if test="${not empty shots.collection}">
                <td>${shots.last.x.toString().format("%.2f", shots.last.x)}</td>
                <td>${shots.last.y.toString().format("%.2f", shots.last.y)}</td>
                <td>${shots.last.r.toString().format("%.2f", shots.last.r)}</td>
                <td>${shots.last.time}</td>
                <td>${shots.last.scriptTime}</td>
                <td>${shots.last.status}</td>
            </c:if>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center">
                <button onClick="window.location.replace('index.jsp');" type="reset" onclick="">Main page</button>
            </td>
        </tr>
    </tbody>
  </table>
</div>
</body>
</html>